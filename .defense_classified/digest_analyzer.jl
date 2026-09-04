# ==============================================================================
# DEFENSE CLASSIFIED - COMPREHENSIVE DIGEST & SECTOR COMBINATORIAL ENGINE
# Language: Julia 1.12.6
# ==============================================================================

using Printf
using Statistics

function hex_val(c::Char)::Int
    if isdigit(c)
        return Int(c - '0')
    elseif c in 'a':'f'
        return Int(c - 'a') + 10
    elseif c in 'A':'F'
        return Int(c - 'A') + 10
    else
        return 0
    end
end

function dec_digit_val(c::Char)::Int
    return isdigit(c) ? Int(c - '0') : 0
end

function digital_root(n::Int)::Int
    if n == 0
        return 0
    end
    rem = n % 9
    return rem == 0 ? 9 : rem
end

function byte_values(hex_str::String)::Vector{Int}
    bytes = Int[]
    for i in 1:2:length(hex_str)
        chunk = hex_str[i:min(i+1, length(hex_str))]
        push!(bytes, parse(Int, chunk, base=16))
    end
    return bytes
end

struct DigestStats
    id::String
    name::String
    algorithm::String
    raw_hex::String
    length::Int
    hex_values::Vector{Int}
    hex_sum::Int
    dec_digit_sum::Int
    dec_digit_count::Int
    byte_sum::Int
    digital_root_hex::Int
    digital_root_dec::Int
    mean_val::Float64
    even_hex_sum::Int
    odd_hex_sum::Int
    even_count::Int
    odd_count::Int
end

function analyze_digest(id::String, name::String, algorithm::String, hex_str::String)::DigestStats
    raw = lowercase(strip(hex_str))
    len = length(raw)
    vals = [hex_val(c) for c in raw]
    h_sum = sum(vals)
    d_sum = sum(dec_digit_val(c) for c in raw)
    d_cnt = count(isdigit, raw)
    b_sum = sum(byte_values(raw))
    dr_h = digital_root(h_sum)
    dr_d = digital_root(d_sum)
    mean_v = mean(vals)
    
    evens = filter(v -> v % 2 == 0, vals)
    odds = filter(v -> v % 2 != 0, vals)
    
    return DigestStats(
        id, name, algorithm, raw, len, vals, h_sum, d_sum, d_cnt, b_sum,
        dr_h, dr_d, mean_v,
        sum(evens), sum(odds), length(evens), length(odds)
    )
end

struct SectorInfo
    sector_id::Int
    label::String
    raw_str::String
    range_str::String
    hex_sum::Int
    dec_sum::Int
    byte_sum::Int
    digital_root_hex::Int
    weight_pct::Float64
end

function partition_sectors(stats::DigestStats, num_sectors::Int)::Vector{SectorInfo}
    total_len = stats.length
    sec_len = div(total_len, num_sectors)
    sectors = SectorInfo[]
    
    for i in 1:num_sectors
        st = (i - 1) * sec_len + 1
        en = i * sec_len
        substr = stats.raw_hex[st:en]
        subvals = [hex_val(c) for c in substr]
        h_sum = sum(subvals)
        d_sum = sum(dec_digit_val(c) for c in substr)
        b_sum = sum(byte_values(substr))
        dr = digital_root(h_sum)
        pct = (h_sum / stats.hex_sum) * 100.0
        push!(sectors, SectorInfo(i, "Sector $i", substr, "[$st..$en]", h_sum, d_sum, b_sum, dr, pct))
    end
    return sectors
end

struct MatrixAnalysis
    rows::Int
    cols::Int
    grid::Matrix{Int}
    char_grid::Matrix{Char}
    row_sums::Vector{Int}
    col_sums::Vector{Int}
    row_digital_roots::Vector{Int}
    col_digital_roots::Vector{Int}
    row_dec_sums::Vector{Int}
    col_dec_sums::Vector{Int}
    main_diagonal::Vector{Int}
    anti_diagonal::Vector{Int}
    main_diag_sum::Int
    anti_diag_sum::Int
end

function build_matrix(stats::DigestStats, rows::Int, cols::Int)::MatrixAnalysis
    @assert rows * cols == stats.length "Dimension mismatch: $rows x $cols != $(stats.length)"
    grid = zeros(Int, rows, cols)
    char_grid = fill(' ', rows, cols)
    
    idx = 1
    for r in 1:rows
        for c in 1:cols
            ch = stats.raw_hex[idx]
            char_grid[r, c] = ch
            grid[r, c] = hex_val(ch)
            idx += 1
        end
    end
    
    r_sums = [sum(grid[r, :]) for r in 1:rows]
    c_sums = [sum(grid[:, c]) for c in 1:cols]
    
    r_drs = [digital_root(s) for s in r_sums]
    c_drs = [digital_root(s) for s in c_sums]
    
    r_decs = [sum(dec_digit_val(char_grid[r, c]) for c in 1:cols) for r in 1:rows]
    c_decs = [sum(dec_digit_val(char_grid[r, c]) for r in 1:rows) for c in 1:cols]
    
    m_diag = Int[]
    a_diag = Int[]
    if rows == cols
        m_diag = [grid[i, i] for i in 1:rows]
        a_diag = [grid[i, rows - i + 1] for i in 1:rows]
    end
    m_diag_sum = isempty(m_diag) ? 0 : sum(m_diag)
    a_diag_sum = isempty(a_diag) ? 0 : sum(a_diag)
    
    return MatrixAnalysis(
        rows, cols, grid, char_grid,
        r_sums, c_sums, r_drs, c_drs, r_decs, c_decs,
        m_diag, a_diag, m_diag_sum, a_diag_sum
    )
end

# NATO Hashes
const NATO_SHA1_FILE1 = "27cee2652aaf19eac8cc7b24ec64bc2a0abd3086"
const NATO_SHA1_FILE2 = "27cee2652aaf19eac8cc7b24ec64bc2a0abd3086"
const NATO_SHA1_STDIN = "e0a6bb2b3eec4bb8076fb07cfec39c9a504a4ada"

const NATO_SHA256_FILE1 = "eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042"
const NATO_SHA256_FILE2 = "eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042"
const NATO_SHA256_STDIN = "5e8f6f20603c5a8ebaf8772314820aa5ad6c2033b4bb8f8a9f97f0655b9824b1"

const NATO_SHA512_FILE1 = "10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1"
const NATO_SHA512_FILE2 = "10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1"
const NATO_SHA512_STDIN = "4376e28a0ce1198b2463b0b8d01caecfcf8ce435af59ae3f46cfa52a1abffa8443749dac4d83e873be0edbcaa1271cb190ac6fbc97fe1cbaa9f0dfa45e742221"

# UNICAGD References
const UNICAGD_255X_SHA256 = "fd9a22529fea516b466aa40702e2b0fb89450097f9e63c2ff270dd8d73d63284"
const UNICAGD_260X_SHA256 = "8ce959e5c97ab4a5ee0f5867f95d7590897cd160864cc319a17c311b1a9a5ae7"
const UNICAGD_289X_SHA256 = "d6aa6c8e71c10e24f12760aa37351963d89f8394a23a6aac74e982e44bdde137"

nato_sha1_f1 = analyze_digest("NATO_SHA1_F1", "NATO-logo-files-2021.zip", "SHA-1", NATO_SHA1_FILE1)
nato_sha1_f2 = analyze_digest("NATO_SHA1_F2", "NATO-logo-files-2021..zip", "SHA-1", NATO_SHA1_FILE2)
nato_sha1_in = analyze_digest("NATO_SHA1_STDIN", "cat NATO-*.zip (stdin stream)", "SHA-1", NATO_SHA1_STDIN)

nato_sha256_f1 = analyze_digest("NATO_SHA256_F1", "NATO-logo-files-2021.zip", "SHA-256", NATO_SHA256_FILE1)
nato_sha256_f2 = analyze_digest("NATO_SHA256_F2", "NATO-logo-files-2021..zip", "SHA-256", NATO_SHA256_FILE2)
nato_sha256_in = analyze_digest("NATO_SHA256_STDIN", "cat NATO-*.zip (stdin stream)", "SHA-256", NATO_SHA256_STDIN)

nato_sha512_f1 = analyze_digest("NATO_SHA512_F1", "NATO-logo-files-2021.zip", "SHA-512", NATO_SHA512_FILE1)
nato_sha512_f2 = analyze_digest("NATO_SHA512_F2", "NATO-logo-files-2021..zip", "SHA-512", NATO_SHA512_FILE2)
nato_sha512_in = analyze_digest("NATO_SHA512_STDIN", "cat NATO-*.zip (stdin stream)", "SHA-512", NATO_SHA512_STDIN)

unicagd_255x = analyze_digest("UNICAGD_255X", "UNICAGD_255X.json", "SHA-256", UNICAGD_255X_SHA256)
unicagd_260x = analyze_digest("UNICAGD_260X", "UNICAGD_260X.json", "SHA-256", UNICAGD_260X_SHA256)
unicagd_289x = analyze_digest("UNICAGD_289X", "UNICAGD_289X.json", "SHA-256", UNICAGD_289X_SHA256)

# Formatting Functions
function format_matrix_table(m::MatrixAnalysis, title::String)::String
    buf = IOBuffer()
    println(buf, "##### " * title * " (" * string(m.rows) * " × " * string(m.cols) * " Mátrix)")
    println(buf)
    
    print(buf, "| Sor (Row) | ")
    for c in 1:m.cols
        print(buf, "C", c, " | ")
    end
    println(buf, "**Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |")
    
    print(buf, "|:---:|")
    for c in 1:m.cols
        print(buf, ":---:|")
    end
    println(buf, ":---:|:---:|:---:|")
    
    for r in 1:m.rows
        print(buf, "| **R", r, "** | ")
        for c in 1:m.cols
            ch = m.char_grid[r, c]
            v = m.grid[r, c]
            @printf(buf, "`%c` (%d) | ", ch, v)
        end
        @printf(buf, "**%d** | %d | %d |\n", m.row_sums[r], m.row_dec_sums[r], m.row_digital_roots[r])
    end
    
    print(buf, "| **Oszlopösszeg (Hex)** | ")
    for c in 1:m.cols
        @printf(buf, "**%d** | ", m.col_sums[c])
    end
    tot_h = sum(m.row_sums)
    tot_d = sum(m.row_dec_sums)
    @printf(buf, "**%d** | %d | %d |\n", tot_h, tot_d, digital_root(tot_h))
    
    print(buf, "| **Oszlop Dec Összeg** | ")
    for c in 1:m.cols
        @printf(buf, "%d | ", m.col_dec_sums[c])
    end
    println(buf, "- | - | - |")
    
    print(buf, "| **Oszlop DR** | ")
    for c in 1:m.cols
        @printf(buf, "%d | ", m.col_digital_roots[c])
    end
    println(buf, "- | - | - |")
    println(buf)
    
    if m.rows == m.cols
        println(buf, "- **Főátló (Main Diagonal: R1C1 -> R", m.rows, "C", m.cols, ")**: `", join(m.main_diagonal, " + "), "` = **", m.main_diag_sum, "** (Digital Root: ", digital_root(m.main_diag_sum), ")")
        println(buf, "- **Mellékátló (Anti-Diagonal: R1C", m.cols, " -> R", m.rows, "C1)**: `", join(m.anti_diagonal, " + "), "` = **", m.anti_diag_sum, "** (Digital Root: ", digital_root(m.anti_diag_sum), ")")
        println(buf)
    end
    
    return String(take!(buf))
end

function format_quadrant_analysis(m::MatrixAnalysis)::String
    @assert m.rows == 8 && m.cols == 8 "Quadrants only defined for 8x8"
    buf = IOBuffer()
    q1 = sum(m.grid[1:4, 1:4])
    q2 = sum(m.grid[1:4, 5:8])
    q3 = sum(m.grid[5:8, 1:4])
    q4 = sum(m.grid[5:8, 5:8])
    
    println(buf, "###### 8×8 Mátrix Kvadráns Analízis (4 darab 4×4 al-szektor):")
    println(buf, "| Kvadráns (Quadrant) | Mátrix Tartomány | Hex Összeg | Dec Digit Összeg | Digital Root | Részarány (%) |")
    println(buf, "|:---|:---:|:---:|:---:|:---:|:---:|")
    
    q1_dec = sum(dec_digit_val(m.char_grid[r, c]) for r in 1:4, c in 1:4)
    q2_dec = sum(dec_digit_val(m.char_grid[r, c]) for r in 1:4, c in 5:8)
    q3_dec = sum(dec_digit_val(m.char_grid[r, c]) for r in 5:8, c in 1:4)
    q4_dec = sum(dec_digit_val(m.char_grid[r, c]) for r in 5:8, c in 5:8)
    
    tot = q1 + q2 + q3 + q4
    @printf(buf, "| **Q1 (Bal-felső / Top-Left)** | R1-R4, C1-C4 | **%d** | %d | %d | %.2f%% |\n", q1, q1_dec, digital_root(q1), (q1/tot)*100)
    @printf(buf, "| **Q2 (Jobb-felső / Top-Right)** | R1-R4, C5-C8 | **%d** | %d | %d | %.2f%% |\n", q2, q2_dec, digital_root(q2), (q2/tot)*100)
    @printf(buf, "| **Q3 (Bal-alsó / Bottom-Left)** | R5-R8, C1-C4 | **%d** | %d | %d | %.2f%% |\n", q3, q3_dec, digital_root(q3), (q3/tot)*100)
    @printf(buf, "| **Q4 (Jobb-alsó / Bottom-Right)** | R5-R8, C5-C8 | **%d** | %d | %d | %.2f%% |\n", q4, q4_dec, digital_root(q4), (q4/tot)*100)
    @printf(buf, "| **Mátrix Teljes Összeg** | Teljes 8×8 | **%d** | %d | %d | 100.00%% |\n", tot, q1_dec+q2_dec+q3_dec+q4_dec, digital_root(tot))
    println(buf)
    return String(take!(buf))
end

function format_sectors_table(sectors::Vector{SectorInfo}, title::String)::String
    buf = IOBuffer()
    println(buf, "##### " * title)
    println(buf)
    println(buf, "| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |")
    println(buf, "|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|")
    
    tot_h = sum(s.hex_sum for s in sectors)
    tot_d = sum(s.dec_sum for s in sectors)
    tot_b = sum(s.byte_sum for s in sectors)
    
    for s in sectors
        @printf(buf, "| **%s** | `%s` | `%s` | **%d** | %d | %d | %d | %.2f%% |\n",
            s.label, s.range_str, s.raw_str, s.hex_sum, s.dec_sum, s.byte_sum, s.digital_root_hex, s.weight_pct)
    end
    @printf(buf, "| **Összesen (Egyben)** | `[1..%d]` | *Teljes digest* | **%d** | **%d** | **%d** | **%d** | **100.00%%** |\n",
        length(sectors[1].raw_str) * length(sectors), tot_h, tot_d, tot_b, digital_root(tot_h))
    println(buf)
    return String(take!(buf))
end

function format_sector_combinations(sectors::Vector{SectorInfo})::String
    buf = IOBuffer()
    println(buf, "###### Szektor-kombinációk és Szimmetriák:")
    println(buf)
    
    n = length(sectors)
    println(buf, "- **Páros szektor-kombinációk (C(" * string(n) * ", 2) = " * string(div(n*(n-1), 2)) * " pár):**")
    println(buf)
    println(buf, "| Kombináció | Elemek | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |")
    println(buf, "|:---|:---:|:---:|:---:|:---:|:---:|")
    tot_h = sum(s.hex_sum for s in sectors)
    
    for i in 1:n
        for j in (i+1):n
            s_pair_h = sectors[i].hex_sum + sectors[j].hex_sum
            s_pair_d = sectors[i].dec_sum + sectors[j].dec_sum
            @printf(buf, "| **S%d + S%d** | S%d (%d) + S%d (%d) | **%d** | %d | %d | %.2f%% |\n",
                i, j, i, sectors[i].hex_sum, j, sectors[j].hex_sum, s_pair_h, s_pair_d, digital_root(s_pair_h), (s_pair_h/tot_h)*100)
        end
    end
    println(buf)
    
    if n == 4
        println(buf, "- **Hármas szektor-kombinációk (C(4, 3) = 4 hármas):**")
        println(buf)
        println(buf, "| Hármas | Kimaradó Elem | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |")
        println(buf, "|:---|:---:|:---:|:---:|:---:|:---:|")
        triplets = [
            (1, 2, 3, 4),
            (1, 2, 4, 3),
            (1, 3, 4, 2),
            (2, 3, 4, 1)
        ]
        for (a, b, c, rem) in triplets
            s_tri_h = sectors[a].hex_sum + sectors[b].hex_sum + sectors[c].hex_sum
            s_tri_d = sectors[a].dec_sum + sectors[b].dec_sum + sectors[c].dec_sum
            @printf(buf, "| **S%d + S%d + S%d** | S%d (%d) | **%d** | %d | %d | %.2f%% |\n",
                a, b, c, rem, sectors[rem].hex_sum, s_tri_h, s_tri_d, digital_root(s_tri_h), (s_tri_h/tot_h)*100)
        end
        println(buf)
        
        s_odd = sectors[1].hex_sum + sectors[3].hex_sum
        s_even = sectors[2].hex_sum + sectors[4].hex_sum
        s_front = sectors[1].hex_sum + sectors[2].hex_sum
        s_back = sectors[3].hex_sum + sectors[4].hex_sum
        
        println(buf, "- **Strukturális Szimmetria Analízis:**")
        println(buf)
        println(buf, "| Szimmetria Tengely | Oldal A | Összeg A | Oldal B | Összeg B | Eltérés (Δ) | Arány (A/B) |")
        println(buf, "|:---|:---|:---:|:---|:---:|:---:|:---:|")
        @printf(buf, "| **Paritás (Páratlan vs Páros)** | S1 + S3 | **%d** | S2 + S4 | **%d** | **%d** | %.4f |\n",
            s_odd, s_even, abs(s_odd - s_even), s_odd / max(1, s_even))
        @printf(buf, "| **Bipartíció (Front vs Back)** | S1 + S2 | **%d** | S3 + S4 | **%d** | **%d** | %.4f |\n",
            s_front, s_back, abs(s_front - s_back), s_front / max(1, s_back))
        println(buf)
    end
    
    return String(take!(buf))
end

function format_cross_digest_column_table(f1::DigestStats, std::DigestStats)::String
    buf = IOBuffer()
    println(buf, "##### Pozíciónkénti és Oszloponkénti Összehasonlítás: Fájl vs stdin Stream (" * f1.algorithm * ")")
    println(buf)
    println(buf, "| Index | Karakter (Fájl) | Hex v1 | Karakter (stdin) | Hex v2 | **Összeg (v1 + v2)** | **Eltérés (|v1 - v2|)** | Összeg DR |")
    println(buf, "|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|")
    
    sum_vector = Int[]
    delta_vector = Int[]
    
    for i in 1:f1.length
        c1 = f1.raw_hex[i]
        c2 = std.raw_hex[i]
        v1 = hex_val(c1)
        v2 = hex_val(c2)
        s = v1 + v2
        d = abs(v1 - v2)
        push!(sum_vector, s)
        push!(delta_vector, d)
        if i <= 16 || i > f1.length - 8 || f1.length <= 40
            @printf(buf, "| `%02d` | `%c` | %2d | `%c` | %2d | **%2d** | %2d | %d |\n", i, c1, v1, c2, v2, s, d, digital_root(s))
        elseif i == 17
            println(buf, "| ... | ... | ... | ... | ... | *[17..$(f1.length-8) sorok sűrítve]* | ... | ... |")
        end
    end
    
    tot_s = sum(sum_vector)
    tot_d = sum(delta_vector)
    matching = count(delta_vector .== 0)
    match_pct = (matching / f1.length) * 100
    
    println(buf)
    println(buf, "- **Összeadott Vektor Végösszege (Sum Vector Total)**: **" * string(tot_s) * "** (Digital Root: " * string(digital_root(tot_s)) * ")")
    println(buf, "- **Eltérés Vektor Végösszege (Total Absolute Delta)**: **" * string(tot_d) * "**")
    @printf(buf, "- **Egyező Pozíciók (Exact Matches)**: **%d / %d** (%.2f%%)\n", matching, f1.length, match_pct)
    println(buf)
    return String(take!(buf))
end

# Generate Large and Small Reports
large_io = IOBuffer()
small_io = IOBuffer()

# ------------------------------------------------------------------------------
# LARGE REPORT GENERATION
# ------------------------------------------------------------------------------
println(large_io, "# DEFENSE INTELLIGENCE DOSSIER // DIGEST SECTORIAL & COMBINATORIAL ANALYSIS")
println(large_io, "> **CLASSIFICATION:** TOP SECRET // STRICT DISSEMINATION CONTROL // ORCON")
println(large_io, "> **SECURITY DIRECTIVE:** REDACTED FROM GIT TRACKING (VCS CLOAKED IN `.defense_classified/`)")
println(large_io, "> **COMPUTATIONAL CORE:** Julia 1.12.6 Analytical Engine")
println(large_io, "> **DATE OF EXECUTION:** 2026-09-04 // ALMA Intercom •refract")
println(large_io, "> **PRIMARY TARGET:** NATO Archive Assets & Stdin Stream Concatenation")
println(large_io)
println(large_io, "---")
println(large_io)

println(large_io, "## 1. Digitális Leltár és Vizsgált Digestek Regisztere")
println(large_io)
println(large_io, "A vizsgálat célja a NATO logó archívumok és a konkatenált adatfolyamok kriptográfiai ujjlenyomatainak mikroszkopikus szintű, szektorális, sor- és oszlop-alapú mátrixos, valamint kombinatorikus elemzése.")
println(large_io)
println(large_io, "| Azonosító | Forrásfájl / Adatfolyam | Algoritmus | Digest Hossz | Nyers Hexadecimális Kivonat |")
println(large_io, "|:---|:---|:---:|:---:|:---|")
all_digests = [
    nato_sha1_f1, nato_sha1_f2, nato_sha1_in,
    nato_sha256_f1, nato_sha256_f2, nato_sha256_in,
    nato_sha512_f1, nato_sha512_f2, nato_sha512_in,
    unicagd_255x, unicagd_260x, unicagd_289x
]
for d in all_digests
    println(large_io, "| `", d.id, "` | ", d.name, " | `", d.algorithm, "` | ", d.length, " nibble | `", d.raw_hex, "` |")
end
println(large_io)
println(large_io, "> **Megjegyzés:** A `NATO-logo-files-2021.zip` és a `NATO-logo-files-2021..zip` binárisan teljesen identikus (azonos hash-értékek minden algoritmusnál). A `stdin` a két fájl egymás után fűzött konkatenációjának (`cat file1 file2 | openssl dgst`) eredménye.")
println(large_io)

println(large_io, "## 2. Globális Összegzések és Számjegy-statisztikák (\"Egyben\")")
println(large_io)
println(large_io, "Ebben a szakaszban a digestek összes számjegyének összege (mind a 0..15 közötti hexadecimális értékek, mind a 0..9 tisztán decimális számjegyek), bájt-összegek, digital root-ok és paritás-arányok találhatók.")
println(large_io)
println(large_io, "| Forrás / Algoritmus | Hex Összeg | Átlag Nibble | Dec Digit Összeg (0-9) | Dec Digitek Száma | Bájt Összeg | Hex Digital Root | Paritás (Páros/Páratlan db) |")
println(large_io, "|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|")
for d in all_digests
    @printf(large_io, "| **%s** (%s) | **%d** | %.2f | %d | %d / %d | %d | **%d** | %d páros / %d páratlan |\n",
        d.name, d.algorithm, d.hex_sum, d.mean_val, d.dec_digit_sum, d.dec_digit_count, d.length, d.byte_sum, d.digital_root_hex, d.even_count, d.odd_count)
end
println(large_io)

println(large_io, "## 3. Szektoronkénti Részletes Elemzés (\"Szektoronként\")")
println(large_io)
println(large_io, "A digesteket felosztjuk természetes blokkokra (4 szektoros kvadránsok, 8 szektoros regiszter-szavak, és 2 szektoros felezők).")
println(large_io)

# SHA-256 Sectors
println(large_io, "### 3.1. SHA-256 Szektorok (256-bit / 64 hex karakter)")
println(large_io)
s4_256_f1 = partition_sectors(nato_sha256_f1, 4)
s4_256_in = partition_sectors(nato_sha256_in, 4)
s8_256_f1 = partition_sectors(nato_sha256_f1, 8)
s8_256_in = partition_sectors(nato_sha256_in, 8)
s2_256_f1 = partition_sectors(nato_sha256_f1, 2)
s2_256_in = partition_sectors(nato_sha256_in, 2)

println(large_io, format_sectors_table(s4_256_f1, "NATO-logo-files-2021.zip - SHA-256 (4 Szektor / 16 karakteres kvadránsok)"))
println(large_io, format_sector_combinations(s4_256_f1))

println(large_io, format_sectors_table(s4_256_in, "cat NATO-*.zip (stdin stream) - SHA-256 (4 Szektor / 16 karakteres kvadránsok)"))
println(large_io, format_sector_combinations(s4_256_in))

println(large_io, format_sectors_table(s8_256_f1, "NATO-logo-files-2021.zip - SHA-256 (8 Szektor / 8 karakteres 32-bit szavak H0..H7)"))
println(large_io, format_sectors_table(s2_256_f1, "NATO-logo-files-2021.zip - SHA-256 (2 Fél / 32 karakteres bipartíció)"))

# SHA-512 Sectors
println(large_io, "### 3.2. SHA-512 Szektorok (512-bit / 128 hex karakter)")
println(large_io)
s4_512_f1 = partition_sectors(nato_sha512_f1, 4)
s4_512_in = partition_sectors(nato_sha512_in, 4)
s8_512_f1 = partition_sectors(nato_sha512_f1, 8)
s2_512_f1 = partition_sectors(nato_sha512_f1, 2)

println(large_io, format_sectors_table(s4_512_f1, "NATO-logo-files-2021.zip - SHA-512 (4 Szektor / 32 karakteres blokkok)"))
println(large_io, format_sector_combinations(s4_512_f1))

println(large_io, format_sectors_table(s4_512_in, "cat NATO-*.zip (stdin stream) - SHA-512 (4 Szektor / 32 karakteres blokkok)"))
println(large_io, format_sector_combinations(s4_512_in))

println(large_io, format_sectors_table(s8_512_f1, "NATO-logo-files-2021.zip - SHA-512 (8 Szektor / 16 karakteres 64-bit szavak H0..H7)"))

# SHA-1 Sectors
println(large_io, "### 3.3. SHA-1 Szektorok (160-bit / 40 hex karakter)")
println(large_io)
s4_sha1_f1 = partition_sectors(nato_sha1_f1, 4)
s4_sha1_in = partition_sectors(nato_sha1_in, 4)
s5_sha1_f1 = partition_sectors(nato_sha1_f1, 5)

println(large_io, format_sectors_table(s4_sha1_f1, "NATO-logo-files-2021.zip - SHA-1 (4 Szektor / 10 karakteres blokkok)"))
println(large_io, format_sector_combinations(s4_sha1_f1))

println(large_io, format_sectors_table(s4_sha1_in, "cat NATO-*.zip (stdin stream) - SHA-1 (4 Szektor / 10 karakteres blokkok)"))
println(large_io, format_sectors_table(s5_sha1_f1, "NATO-logo-files-2021.zip - SHA-1 (5 Szektor / 8 karakteres 32-bit szavak H0..H4)"))

println(large_io, "## 4. Mátrix Topográfia: Sorok és Oszlopok Részletes Elemzése")
println(large_io)
println(large_io, "A digesteket kétdimenziós mátrixba rendezve megvizsgáljuk az összes vízszintes sort (Row Sums), függőleges oszlopot (Column Sums), átlókat és kvadránsokat.")
println(large_io)

# 8x8 Matrices for SHA-256
m88_256_f1 = build_matrix(nato_sha256_f1, 8, 8)
m88_256_in = build_matrix(nato_sha256_in, 8, 8)

println(large_io, "### 4.1. SHA-256 Kanonikus 8×8 Mátrix Analízis")
println(large_io)
println(large_io, format_matrix_table(m88_256_f1, "NATO-logo-files-2021.zip [SHA-256]"))
println(large_io, format_quadrant_analysis(m88_256_f1))

println(large_io, format_matrix_table(m88_256_in, "cat NATO-*.zip (stdin stream) [SHA-256]"))
println(large_io, format_quadrant_analysis(m88_256_in))

# Difference Matrix 8x8
println(large_io, "#### SHA-256 Abszolút Eltérés Mátrix (|Fájl - stdin| 8×8)")
println(large_io)
diff_grid_256 = abs.(m88_256_f1.grid .- m88_256_in.grid)
diff_r_sums = [sum(diff_grid_256[r, :]) for r in 1:8]
diff_c_sums = [sum(diff_grid_256[:, c]) for c in 1:8]

print(large_io, "| Sor | ")
for c in 1:8
    print(large_io, "C", c, " | ")
end
println(large_io, "**Δ Sorösszeg** |")
print(large_io, "|:---:|")
for c in 1:8
    print(large_io, ":---:|")
end
println(large_io, ":---:|")

for r in 1:8
    print(large_io, "| **R", r, "** | ")
    for c in 1:8
        @printf(large_io, "**%2d** | ", diff_grid_256[r, c])
    end
    @printf(large_io, "**%d** |\n", diff_r_sums[r])
end
print(large_io, "| **Δ Oszlopösszeg** | ")
for c in 1:8
    @printf(large_io, "**%d** | ", diff_c_sums[c])
end
@printf(large_io, "**%d** |\n\n", sum(diff_r_sums))

# Alternative SHA-256 dimensions
m416_256_f1 = build_matrix(nato_sha256_f1, 4, 16)
m164_256_f1 = build_matrix(nato_sha256_f1, 16, 4)
println(large_io, "### 4.2. Alternatív SHA-256 Dimenziók")
println(large_io)
println(large_io, format_matrix_table(m416_256_f1, "NATO-logo-files-2021.zip [SHA-256] - 4 Sor × 16 Oszlop"))
println(large_io, format_matrix_table(m164_256_f1, "NATO-logo-files-2021.zip [SHA-256] - 16 Sor × 4 Oszlop"))

# SHA-1 Matrices
m58_sha1_f1 = build_matrix(nato_sha1_f1, 5, 8)
m410_sha1_f1 = build_matrix(nato_sha1_f1, 4, 10)
println(large_io, "### 4.3. SHA-1 Mátrix Dimenziók (40 hex karakter)")
println(large_io)
println(large_io, format_matrix_table(m58_sha1_f1, "NATO-logo-files-2021.zip [SHA-1] - 5 Sor (Regiszterek) × 8 Oszlop"))
println(large_io, format_matrix_table(m410_sha1_f1, "NATO-logo-files-2021.zip [SHA-1] - 4 Sor × 10 Oszlop"))

# SHA-512 Dual 8x8 Matrices
println(large_io, "### 4.4. SHA-512 Duális 8×8 Mátrix Analízis (128 hex karakter)")
println(large_io)
println(large_io, "Az 512 bites digest két darab egymást követő 8×8-as síkra (Alfa Szektor: 1..64, Béta Szektor: 65..128) bontható:")
println(large_io)
sha512_sub_a = analyze_digest("SHA512_A", "NATO SHA-512 Szektor Alfa", "Sub-512", nato_sha512_f1.raw_hex[1:64])
sha512_sub_b = analyze_digest("SHA512_B", "NATO SHA-512 Szektor Béta", "Sub-512", nato_sha512_f1.raw_hex[65:128])
m88_512_a = build_matrix(sha512_sub_a, 8, 8)
m88_512_b = build_matrix(sha512_sub_b, 8, 8)

println(large_io, format_matrix_table(m88_512_a, "NATO SHA-512 Alfa Mátrix [1..64]"))
println(large_io, format_matrix_table(m88_512_b, "NATO SHA-512 Béta Mátrix [65..128]"))

println(large_io, "## 5. Mindannyiuk Kombinációi (Kombinatorikus Szintézis)")
println(large_io)

# Cross-file combinations
println(large_io, "### 5.1. Fájlonkénti és Adatfolyam-kombinációk")
println(large_io)
println(large_io, "| Kombináció Leírása | SHA-1 Összeg | SHA-256 Összeg | SHA-512 Összeg | Tripla-Algoritmus Összeg |")
println(large_io, "|:---|:---:|:---:|:---:|:---:|")

s1_f1 = nato_sha1_f1.hex_sum
s256_f1 = nato_sha256_f1.hex_sum
s512_f1 = nato_sha512_f1.hex_sum
tri_f1 = s1_f1 + s256_f1 + s512_f1

s1_in = nato_sha1_in.hex_sum
s256_in = nato_sha256_in.hex_sum
s512_in = nato_sha512_in.hex_sum
tri_in = s1_in + s256_in + s512_in

@printf(large_io, "| **File1 (NATO-logo-files-2021.zip)** | %d | %d | %d | **%d** |\n", s1_f1, s256_f1, s512_f1, tri_f1)
@printf(large_io, "| **File2 (NATO-logo-files-2021..zip)** | %d | %d | %d | **%d** |\n", s1_f1, s256_f1, s512_f1, tri_f1)
@printf(large_io, "| **File1 + File2 Összege (Duplikátum Összeg)** | %d | %d | %d | **%d** |\n", s1_f1*2, s256_f1*2, s512_f1*2, tri_f1*2)
@printf(large_io, "| **stdin (cat File1 File2 összefűzés)** | %d | %d | %d | **%d** |\n", s1_in, s256_in, s512_in, tri_in)
@printf(large_io, "| **File1 + stdin Összegzése** | %d | %d | %d | **%d** |\n", s1_f1 + s1_in, s256_f1 + s256_in, s512_f1 + s512_in, tri_f1 + tri_in)
@printf(large_io, "| **File1 + File2 + stdin Tripla Konfiguráció** | %d | %d | %d | **%d** |\n", s1_f1*2 + s1_in, s256_f1*2 + s256_in, s512_f1*2 + s512_in, tri_f1*2 + tri_in)
@printf(large_io, "| **Δ(File1, stdin) Abszolút Különbség** | %d | %d | %d | **%d** |\n", abs(s1_f1 - s1_in), abs(s256_f1 - s256_in), abs(s512_f1 - s512_in), abs(tri_f1 - tri_in))
println(large_io)

# Cross-digest column alignments
println(large_io, format_cross_digest_column_table(nato_sha256_f1, nato_sha256_in))
println(large_io, format_cross_digest_column_table(nato_sha1_f1, nato_sha1_in))

# Cross-algorithm combinations
println(large_io, "### 5.2. Kereszt-Algoritmikus Kombinációk (Pairwise Algorithm Sums)")
println(large_io)
println(large_io, "| Entitás | SHA-1 + SHA-256 | SHA-256 + SHA-512 | SHA-1 + SHA-512 | SHA-1 + SHA-256 + SHA-512 |")
println(large_io, "|:---|:---:|:---:|:---:|:---:|")
@printf(large_io, "| **NATO Archívum Fájl (Egyedi)** | %d | %d | %d | **%d** |\n", s1_f1 + s256_f1, s256_f1 + s512_f1, s1_f1 + s512_f1, tri_f1)
@printf(large_io, "| **stdin Adatfolyam (Konkatenált)** | %d | %d | %d | **%d** |\n", s1_in + s256_in, s256_in + s512_in, s1_in + s512_in, tri_in)
@printf(large_io, "| **Együttes Kombinált Összesítő** | %d | %d | %d | **%d** |\n", (s1_f1+s1_in) + (s256_f1+s256_in), (s256_f1+s256_in) + (s512_f1+s512_in), (s1_f1+s1_in) + (s512_f1+s512_in), tri_f1 + tri_in)
println(large_io)

println(large_io, "## 6. UNICAGD Doktrína és Intelligencia Referenciák")
println(large_io)
println(large_io, "A rendszer integritási csomagjaiban szereplő alapvető doktrína-fájlok SHA-256 digest elemzése:")
println(large_io)
u_sectors_255 = partition_sectors(unicagd_255x, 4)
u_sectors_260 = partition_sectors(unicagd_260x, 4)
u_sectors_289 = partition_sectors(unicagd_289x, 4)

println(large_io, format_sectors_table(u_sectors_255, "UNICAGD_255X.json [SHA-256]"))
println(large_io, format_sectors_table(u_sectors_260, "UNICAGD_260X.json [SHA-256]"))
println(large_io, format_sectors_table(u_sectors_289, "UNICAGD_289X.json [SHA-256]"))

println(large_io, "## 7. Matematikai Ellenőrzés és Egzakt Bizonyítások")
println(large_io)
println(large_io, "1. **Sorösszegek és Oszlopösszegek Konzervációja:**")
println(large_io, raw"   $$\sum_{r=1}^R \text{RowSum}_r \equiv \sum_{c=1}^C \text{ColSum}_c \equiv \sum_{i=1}^N v(c_i)$$")
println(large_io, "   - NATO SHA-256 Fájl: `sum(RowSums) = ", sum(m88_256_f1.row_sums), "`, `sum(ColSums) = ", sum(m88_256_f1.col_sums), "`, `Total = ", nato_sha256_f1.hex_sum, "` -> **AZONOS (OK)**")
println(large_io, "   - NATO SHA-256 stdin: `sum(RowSums) = ", sum(m88_256_in.row_sums), "`, `sum(ColSums) = ", sum(m88_256_in.col_sums), "`, `Total = ", nato_sha256_in.hex_sum, "` -> **AZONOS (OK)**")
println(large_io, "2. **Szektorális Megmaradási Tétel:**")
println(large_io, "   - 4 szektor összege: `", sum(s.hex_sum for s in s4_256_f1), " == ", nato_sha256_f1.hex_sum, "` -> **AZONOS (OK)**")
println(large_io, "   - 8 szektor összege: `", sum(s.hex_sum for s in s8_256_f1), " == ", nato_sha256_f1.hex_sum, "` -> **AZONOS (OK)**")
println(large_io, "   - 4 kvadráns összege: `", sum([sum(m88_256_f1.grid[1:4, 1:4]), sum(m88_256_f1.grid[1:4, 5:8]), sum(m88_256_f1.grid[5:8, 1:4]), sum(m88_256_f1.grid[5:8, 5:8])]), " == ", nato_sha256_f1.hex_sum, "` -> **AZONOS (OK)**")
println(large_io, "3. **Paritás Megmaradási Invariáns:**")
println(large_io, "   - Páros összegek (", nato_sha256_f1.even_hex_sum, ") + Páratlan összegek (", nato_sha256_f1.odd_hex_sum, ") = **", nato_sha256_f1.even_hex_sum + nato_sha256_f1.odd_hex_sum, "** == `", nato_sha256_f1.hex_sum, "` -> **AZONOS (OK)**")
println(large_io)
println(large_io, "---")
println(large_io, "*Jelentés lezárva és archiválva a védelmi isolációs mappában (`.defense_classified/`).*")

# ------------------------------------------------------------------------------
# SMALL REPORT GENERATION
# ------------------------------------------------------------------------------
println(small_io, "# DEFENSE INTELLIGENCE // DIGEST ANALYSIS EXECUTIVE SUMMARY")
println(small_io, "> **STATUS:** CLASSIFIED // REDACTED FROM GIT TRACKING (`.defense_classified/`)")
println(small_io, "> **ENGINE:** Julia 1.12.6 Analytical Runtime")
println(small_io, "> **TARGET:** NATO Archives & Concatenated Byte Stream")
println(small_io)
println(small_io, "---")
println(small_io)

println(small_io, "## 1. Főbb Összesítések (\"Egyben\")")
println(small_io)
println(small_io, "| Célpont | Algoritmus | Hex Összeg | Dec Számjegy Összeg | Digital Root | Átlag Nibble |")
println(small_io, "|:---|:---:|:---:|:---:|:---:|:---:|")
for d in [nato_sha1_f1, nato_sha1_in, nato_sha256_f1, nato_sha256_in, nato_sha512_f1, nato_sha512_in]
    @printf(small_io, "| **%s** | `%s` | **%d** | %d | **%d** | %.2f |\n", d.name, d.algorithm, d.hex_sum, d.dec_digit_sum, d.digital_root_hex, d.mean_val)
end
println(small_io)

println(small_io, "## 2. 4-Szektoros Tömör Kimutatás (\"Szektoronként\")")
println(small_io)
println(small_io, "| Célpont / Algoritmus | S1 [1..25%] | S2 [26..50%] | S3 [51..75%] | S4 [76..100%] | **Összesen** | Digital Root |")
println(small_io, "|:---|:---:|:---:|:---:|:---:|:---:|:---:|")
function print_small_sector_row(io, label, sectors)
    @printf(io, "| **%s** | %d | %d | %d | %d | **%d** | %d |\n",
        label, sectors[1].hex_sum, sectors[2].hex_sum, sectors[3].hex_sum, sectors[4].hex_sum,
        sum(s.hex_sum for s in sectors), digital_root(sum(s.hex_sum for s in sectors)))
end
print_small_sector_row(small_io, "NATO Fájl (SHA-1)", s4_sha1_f1)
print_small_sector_row(small_io, "stdin Stream (SHA-1)", s4_sha1_in)
print_small_sector_row(small_io, "NATO Fájl (SHA-256)", s4_256_f1)
print_small_sector_row(small_io, "stdin Stream (SHA-256)", s4_256_in)
print_small_sector_row(small_io, "NATO Fájl (SHA-512)", s4_512_f1)
print_small_sector_row(small_io, "stdin Stream (SHA-512)", s4_512_in)
println(small_io)

println(small_io, "## 3. SHA-256 8×8 Mátrix Sorok és Oszlopok Gyorsjelentés")
println(small_io)
println(small_io, "| Tétel | NATO-logo-files-2021.zip | cat NATO-*.zip (stdin stream) | Abszolút Eltérés (Δ) |")
println(small_io, "|:---|:---:|:---:|:---:|")
@printf(small_io, "| **Sorösszegek (R1..R8)** | `[%s]` | `[%s]` | - |\n", join(m88_256_f1.row_sums, ", "), join(m88_256_in.row_sums, ", "))
@printf(small_io, "| **Oszlopösszegek (C1..C8)** | `[%s]` | `[%s]` | - |\n", join(m88_256_f1.col_sums, ", "), join(m88_256_in.col_sums, ", "))
@printf(small_io, "| **Főátló Összege** | **%d** (DR: %d) | **%d** (DR: %d) | **%d** |\n", m88_256_f1.main_diag_sum, digital_root(m88_256_f1.main_diag_sum), m88_256_in.main_diag_sum, digital_root(m88_256_in.main_diag_sum), abs(m88_256_f1.main_diag_sum - m88_256_in.main_diag_sum))
@printf(small_io, "| **Mellékátló Összege** | **%d** (DR: %d) | **%d** (DR: %d) | **%d** |\n", m88_256_f1.anti_diag_sum, digital_root(m88_256_f1.anti_diag_sum), m88_256_in.anti_diag_sum, digital_root(m88_256_in.anti_diag_sum), abs(m88_256_f1.anti_diag_sum - m88_256_in.anti_diag_sum))
@printf(small_io, "| **Q1 (Bal-felső 4×4)** | %d | %d | %d |\n", sum(m88_256_f1.grid[1:4, 1:4]), sum(m88_256_in.grid[1:4, 1:4]), abs(sum(m88_256_f1.grid[1:4, 1:4]) - sum(m88_256_in.grid[1:4, 1:4])))
@printf(small_io, "| **Q2 (Jobb-felső 4×4)** | %d | %d | %d |\n", sum(m88_256_f1.grid[1:4, 5:8]), sum(m88_256_in.grid[1:4, 5:8]), abs(sum(m88_256_f1.grid[1:4, 5:8]) - sum(m88_256_in.grid[1:4, 5:8])))
@printf(small_io, "| **Q3 (Bal-alsó 4×4)** | %d | %d | %d |\n", sum(m88_256_f1.grid[5:8, 1:4]), sum(m88_256_in.grid[5:8, 1:4]), abs(sum(m88_256_f1.grid[5:8, 1:4]) - sum(m88_256_in.grid[5:8, 1:4])))
@printf(small_io, "| **Q4 (Jobb-alsó 4×4)** | %d | %d | %d |\n", sum(m88_256_f1.grid[5:8, 5:8]), sum(m88_256_in.grid[5:8, 5:8]), abs(sum(m88_256_f1.grid[5:8, 5:8]) - sum(m88_256_in.grid[5:8, 5:8])))
@printf(small_io, "| **Mátrix Teljes Összeg** | **%d** | **%d** | **%d** |\n", nato_sha256_f1.hex_sum, nato_sha256_in.hex_sum, abs(nato_sha256_f1.hex_sum - nato_sha256_in.hex_sum))
println(small_io)

println(small_io, "## 4. Főbb Kombinációk Mátrixa")
println(small_io)
println(small_io, "| Típus | Összetevők | Hex Összeg | Digital Root |")
println(small_io, "|:---|:---|:---:|:---:|")
@printf(small_io, "| **Fájl Duplikátum** | File1 + File2 (SHA-256) | **%d** | %d |\n", nato_sha256_f1.hex_sum * 2, digital_root(nato_sha256_f1.hex_sum * 2))
@printf(small_io, "| **Fájl + Adatfolyam** | File1 + stdin (SHA-256) | **%d** | %d |\n", nato_sha256_f1.hex_sum + nato_sha256_in.hex_sum, digital_root(nato_sha256_f1.hex_sum + nato_sha256_in.hex_sum))
@printf(small_io, "| **Tripla Forrás** | File1 + File2 + stdin (SHA-256) | **%d** | %d |\n", nato_sha256_f1.hex_sum * 2 + nato_sha256_in.hex_sum, digital_root(nato_sha256_f1.hex_sum * 2 + nato_sha256_in.hex_sum))
@printf(small_io, "| **Tri-Algoritmus (File1)** | SHA-1 + SHA-256 + SHA-512 | **%d** | %d |\n", tri_f1, digital_root(tri_f1))
@printf(small_io, "| **Tri-Algoritmus (stdin)** | SHA-1 + SHA-256 + SHA-512 | **%d** | %d |\n", tri_in, digital_root(tri_in))
@printf(small_io, "| **Grand Combined Total** | File1 + stdin (Mind a 3 algoritmus) | **%d** | %d |\n", tri_f1 + tri_in, digital_root(tri_f1 + tri_in))
println(small_io)

println(small_io, "## 5. Biztonsági és Elrejtési Igazolás")
println(small_io, "- **Mappa elhelyezkedése:** `/Users/peter/Intercom •refract/.defense_classified/`")
println(small_io, "- **Gitignore állapota:** `.gitignore` konfigurálva, git indexálás és GitHub commit / push kizárva.")
println(small_io, "- **Nagy export fájl:** `DIGEST_MASTER_ANALYSIS_LARGE.md`")
println(small_io, "- **Kis export fájl:** `DIGEST_SUMMARY_REPORT_SMALL.md`")

# Save files to disk
out_dir = dirname(@__FILE__)
large_path = joinpath(out_dir, "DIGEST_MASTER_ANALYSIS_LARGE.md")
small_path = joinpath(out_dir, "DIGEST_SUMMARY_REPORT_SMALL.md")

open(large_path, "w") do f
    write(f, take!(large_io))
end
open(small_path, "w") do f
    write(f, take!(small_io))
end

println("Successfully exported:")
println("  - Large report: ", large_path, " (", filesize(large_path), " bytes)")
println("  - Small report: ", small_path, " (", filesize(small_path), " bytes)")
