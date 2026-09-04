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

struct EntropyMetrics
    len::Int
    unique_symbols::Int
    shannon_entropy::Float64
    max_entropy::Float64
    negentropy::Float64
    redundancy::Float64
    renyi2::Float64
    min_entropy::Float64
end

function calculate_metrics(seq::AbstractString, base_alphabet_size::Int)::EntropyMetrics
    len = length(seq)
    counts = Dict{Char, Int}()
    for c in seq
        counts[c] = get(counts, c, 0) + 1
    end
    k = length(counts)
    probs = [v / len for v in values(counts)]
    
    H = -sum(p * log2(p) for p in probs)
    H_max = log2(base_alphabet_size)
    N = H_max - H
    R = 1.0 - (H / H_max)
    H_renyi2 = -log2(sum(p^2 for p in probs))
    H_min = -log2(maximum(probs))
    
    return EntropyMetrics(len, k, H, H_max, N, R, H_renyi2, H_min)
end

function main()
    println("="^75)
    println("KOMPLEX RENDSZERELEMZÉS: SHANNON-ENTRÓPIA, NEGENTRÓPIA ÉS MORFOLÓGIA")
    println("="^75)
    
    # 1. Teljes rendszer
    m_all = calculate_metrics(RAW_TEXT, 51)
    
    # 2. Részrendszerek izolációja
    lines = split(RAW_TEXT, "\n")
    cmd_str = lines[1]
    hdr_str = join([l for l in lines if startswith(strip(l), "===")], "\n")
    
    meta_parts = String[]
    hash_parts = String[]
    sha1_list = String[]
    sha256_list = String[]
    sha512_list = String[]
    
    for l in lines[2:end]
        s = strip(l)
        if !startswith(s, "===") && contains(s, "=")
            p = split(s, "=")
            push!(meta_parts, p[1] * "=")
            h = strip(p[2])
            push!(hash_parts, h)
            if startswith(s, "SHA1")
                push!(sha1_list, h)
            elseif startswith(s, "SHA2-256")
                push!(sha256_list, h)
            elseif startswith(s, "SHA2-512")
                push!(sha512_list, h)
            end
        end
    end
    
    meta_str = join(meta_parts, "\n")
    all_hash_str = join(hash_parts, "")
    sha1_str = join(sha1_list, "")
    sha256_str = join(sha256_list, "")
    sha512_str = join(sha512_list, "")
    
    m_cmd = calculate_metrics(cmd_str, 51)
    m_hdr = calculate_metrics(hdr_str, 51)
    m_meta = calculate_metrics(meta_str, 51)
    m_hash = calculate_metrics(all_hash_str, 16)
    m_sha1 = calculate_metrics(sha1_str, 16)
    m_sha256 = calculate_metrics(sha256_str, 16)
    m_sha512 = calculate_metrics(sha512_str, 16)
    
    systems = [
        ("Teljes Szöveges Rendszer", m_all, "Integrált globális leíró állapot"),
        ("Morfológiai Héj (Bash / Shell)", m_cmd, "Determinisztikus programozási szintaxis"),
        ("Szakaszfejlécek (=== sha... ===)", m_hdr, "Makroszintű ciklikus határoló morfológia"),
        ("Fájlnév & Algoritmus Címkék", m_meta, "Strukturált leíró metaadat-morféma"),
        ("Összesített Kriptográfiai Hash", m_hash, "Maximális entrópiájú pszeudovéletlen blokk"),
        ("  ├─ SHA-1 Hash Digest (160-bit)", m_sha1, "40 hex karakteres fix alaktani blokk"),
        ("  ├─ SHA2-256 Hash Digest (256-bit)", m_sha256, "64 hex karakteres fix alaktani blokk"),
        ("  └─ SHA2-512 Hash Digest (512-bit)", m_sha512, "128 hex karakteres fix alaktani blokk")
    ]
    
    @printf("| %-36s | %4s | %2s | %7s | %7s | %6s | %7s |\n",
            "Rendszerkomponens", "Len", "|V|", "Shannon", "Negentr", "Redund", "Min-Ent")
    @printf("|%s|%s|%s|%s|%s|%s|%s|\n",
            "-"^38, "-"^6, "-"^4, "-"^9, "-"^9, "-"^8, "-"^9)
    for (name, m, _) in systems
        @printf("| %-36s | %4d | %2d | %5.3f b | %5.3f b | %5.2f%% | %5.3f b |\n",
                name, m.len, m.unique_symbols, m.shannon_entropy, m.negentropy, m.redundancy*100, m.min_entropy)
    end
end

main()
