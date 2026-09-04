using LinearAlgebra
using Printf
using Statistics

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

    text_chars = collect(RAW_TEXT)
    
    # 1. Adjacency Matrix A
    A = zeros(Float64, V, V)
    for i in 1:length(text_chars)-1
        u = char_to_idx[text_chars[i]]
        v = char_to_idx[text_chars[i+1]]
        A[u, v] += 1.0
        A[v, u] += 1.0
    end

    d = vec(sum(A, dims=2))
    D = Diagonal(d)
    L = D - A

    # Eigendecomposition of Laplacian
    eig_L = eigen(Hermitian(L))
    evals = eig_L.values
    evecs = eig_L.vectors

    println("="^75)
    println("TOPOLÓGIAI MÁTRIX-POLITIKA: SPEKTRÁLIS GRÁFELMÉLET ÉS HATALMI DINAMIKA")
    println("="^75)
    @printf("• Hálózati csomópontok száma (Államszimbólumok): %d\n", V)
    @printf("• Diplomáciai tranzakciók (Élek összsúlya):     %.0f\n", sum(A)/2)
    @printf("• Fiedler-sajátérték (Algebrai összefüggőség):   %.6f\n", evals[2])
    @printf("• Spektrális rés (Spectral Gap):                %.6f\n", evals[2] - evals[1])

    # Fiedler vector polarizáció
    fiedler_vec = evecs[:, 2]
    sorted_order = sortperm(fiedler_vec)

    println("\nPOLARIZÁCIÓS SKIZMA (A SZÖVETSÉG KÉT POLÁRIS TÖMBRE SZAKADÁSA):")
    west_chars = [idx_to_char[i] for i in sorted_order if fiedler_vec[i] < -0.05]
    east_chars = [idx_to_char[i] for i in reverse(sorted_order) if fiedler_vec[i] > 0.05]
    println("◄ Nyugati Blokk (Strukturális héj / Parancssori szuverenitás):")
    println("  ", join(["'$(c == '\n' ? "\\n" : c)'" for c in west_chars], ", "))
    println("► Kriptográfiai Blokk (Zéró-bizalmi mag / Maximális entrópia):")
    println("  ", join(["'$(c == '\n' ? "\\n" : c)'" for c in east_chars], ", "))

    # Perron-Frobenius hegemónia
    eig_A = eigen(Hermitian(A))
    max_idx = argmax(eig_A.values)
    lambda_max = eig_A.values[max_idx]
    centrality = abs.(eig_A.vectors[:, max_idx])

    println("\nPERRON-FROBENIUS HEGEMÓNIA-INDEX (A LEGNAGYOBB HATALMÚ CSOMÓPONTOK):")
    top_central = sortperm(centrality, rev=true)[1:8]
    for (r, idx) in enumerate(top_central)
        c = idx_to_char[idx]
        disp_c = c == ' ' ? "[szóköz]" : c == '\n' ? "[sortörés]" : string(c)
        @printf("  %d. Hely: '%s' | Hatalmi Súly: %.4f | Szövetségi fokszám: %.0f él\n",
                r, disp_c, centrality[idx], d[idx])
    end

    # Betti-számok
    beta_0 = count(x -> abs(x) < 1e-10, evals)
    num_edges = count(A .> 0) / 2
    beta_1 = Int(num_edges - V + beta_0)
    println("\nSZIMPLICIÁLIS TOPOLÓGIA:")
    @printf("• Betti-0 (Szuverén komponensek száma): %d\n", beta_0)
    @printf("• Betti-1 (Nem összehúzható hatalmi hurkok): %d\n", beta_1)
    @printf("• Euler-karakterisztika (chi): %d (Genus: %d)\n", beta_0 - beta_1, (2 - (beta_0 - beta_1)) ÷ 2)
end

main()
