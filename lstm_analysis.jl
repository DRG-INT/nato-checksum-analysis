using Flux
using Statistics
using Printf
using Random
using LinearAlgebra

Random.seed!(42)

const RAW_TEXT = """  peter@ALMA Intercom •refract % for alg in sha1 sha256 sha512; do echo "=== \$alg ==="; openssl dgst -\$alg NATO-logo-files-2021.zip NATO-logo-files-2021..zip; cat NATO-logo-files-2021.zip NATO-logo-files-2021..zip | openssl dgst -\$alg; done
  === sha1 ===
  SHA1(NATO-logo-files-2021.zip)= 27cee2652aaf19eac8cc7b24ec64bc2a0abd3086
  SHA1(NATO-logo-files-2021..zip)= 27cee2652aaf19eac8cc7b24ec64bc2a0abd3086
  SHA1(stdin)= e0a6bb2b3eec4bb8076fb07cfec39c9a504a4ada
  === sha256 ===
  SHA2-256(NATO-logo-files-2021.zip)= eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042
  SHA2-256(NATO-logo-files-2021..zip)= eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042
  SHA2-256(stdin)= 5e8f6f20603c5a8ebaf8772314820aa5ad6c2033b4bb8f8a9f97f0655b9824b1
  === sha512 ===
  SHA2-512(NATO-logo-files-2021.zip)= 10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1
  SHA2-512(NATO-logo-files-2021..zip)= 10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1
  SHA2-512(stdin)= 4376e28a0ce1198b2463b0b8d01caecfcf8ce435af59ae3f46cfa52a1abffa8443749dac4d83e873be0edbcaa1271cb190ac6fbc97fe1cbaa9f0dfa45e742221"""

function main()
    chars = sort(unique(collect(RAW_TEXT)))
    V = length(chars)
    char_to_idx = Dict(c => i for (i, c) in enumerate(chars))
    idx_to_char = Dict(i => c for (i, c) in enumerate(chars))

    indices = [char_to_idx[c] for c in RAW_TEXT]
    T = length(indices) - 1

    X_indices = indices[1:T]
    Y_indices = indices[2:T+1]

    X_oh = reshape(Float32.(Flux.onehotbatch(X_indices, 1:V)), V, 1, T)
    Y_oh = Float32.(Flux.onehotbatch(Y_indices, 1:V))

    H = 64
    lstm_layer = LSTM(V => H)
    dense_layer = Dense(H => V)
    model = Chain(lstm_layer, dense_layer)

    loss(m, x, y) = Flux.logitcrossentropy(reshape(m(x), V, :), y)
    opt = Flux.setup(Adam(0.01f0), model)

    println("Training Character-level LSTM (V=$V, H=$H, Total params=33,011)...")
    for ep in 1:200
        Flux.reset!(model)
        grads = Flux.gradient(m -> loss(m, X_oh, Y_oh), model)
        Flux.update!(opt, model, grads[1])
        if ep % 50 == 0 || ep == 1
            Flux.reset!(model)
            l = loss(model, X_oh, Y_oh)
            @printf("Epoch %3d | Loss: %.4f nats | Perplexity: %.2f\n", ep, l, exp(l))
        end
    end

    Flux.reset!(model)
    logits = reshape(model(X_oh), V, T)
    probs = Flux.softmax(logits, dims=1)

    surprisals = [-log(max(probs[Y_indices[t], t], 1f-12)) for t in 1:T]

    println("\nSurprisal Evaluation Summary:")
    println("Average overall sequence cross-entropy: $(round(mean(surprisals), digits=3)) nats")
    println("Average sequence perplexity: $(round(exp(mean(surprisals)), digits=2))")
end

main()
