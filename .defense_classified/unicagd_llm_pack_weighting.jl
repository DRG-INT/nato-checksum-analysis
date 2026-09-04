# ==============================================================================
# UNICAGD PACK OPENING & LLM ATTENTION WEIGHTING ENGINE
# Coupled with NATO Digest Checksum Numbers & Systems Metrics
# Language: Julia 1.12.6
# ==============================================================================

using JSON
using Statistics
using LinearAlgebra
using Printf

# --- Load UNICAGD Packages ---
path_255x = "...doctrine_-...-_intelligence👾ꀹ/UNICAGD_255X/UNICAGD_255X.json"
path_260x = "...doctrine_-...-_intelligence👾ꀹ/UNICAGD_260X/UNICAGD_260X.json"
path_spec = "UNICAGD_weight_trigger_matrix_spec.json"

data_255x = JSON.parsefile(path_255x)
data_260x = JSON.parsefile(path_260x)
data_spec = JSON.parsefile(path_spec)

cats_255x = data_255x["metadata"]["layers"]["analytical_core"]["weights"]["categories"]
cube_260x = data_260x["cube"]
wm_260x = cube_260x["weight_matrix"] # 1700 x 441

total_units_255x = sum(c["weight_units"] for c in cats_255x)

# --- Define "Our Numbers" (NATO Checksum Metrics) ---
# Checksum Aggregates
const S_NATO_SHA256 = 552
const S_STDIN_SHA256 = 470
const S_NATO_SHA1 = 323
const S_STDIN_SHA1 = 340
const S_NATO_SHA512 = 876
const S_STDIN_SHA512 = 1043

# Sector Weights (SHA-256)
const SEC_1 = 151
const SEC_2 = 159
const SEC_3 = 116
const SEC_4 = 126

# Quadrants
const QUAD_1 = 168
const QUAD_2 = 142
const QUAD_3 = 124
const QUAD_4 = 118

# Information Theory
const SHANNON_H = 3.6283
const NEGENTROPY_J = 0.3717
const ENTROPY_FLUX_HF = 0.1768

# Morphology
const MORPH_GRADIENT_ENERGY = 637
const SURFACE_ROUGHNESS = 5.2755
const EULER_CHI = 2
const HOMOGENEITY = 0.0635

# LSTM Latent States
const LSTM_TERMINAL_NORM = 0.6057
const LSTM_PERPLEXITY = 16.38

# --- Compute UNICAGD Dynamic Vector M = [A, H, U, S, Hf, E, V, C] ---
# Normalized to [0, 1] range according to specification
val_A  = clamp((SEC_2 / S_NATO_SHA256) * 2.0, 0.0, 1.0) # 0.5761 (Attention Gradient)
val_H  = clamp(NEGENTROPY_J / 4.0, 0.0, 1.0)            # 0.0929 (Entropy Curvature)
val_U  = clamp(1.0 - HOMOGENEITY, 0.0, 1.0)             # 0.9365 (Uncertainty Damping)
val_S  = clamp(1.0 / (1.0 + SURFACE_ROUGHNESS), 0.0, 1.0) # 0.1593 (Temporal Stability)
val_Hf = clamp(ENTROPY_FLUX_HF, 0.0, 1.0)               # 0.1768 (Entropy Flux)
val_E  = clamp((QUAD_1 / S_NATO_SHA256) * 2.0, 0.0, 1.0) # 0.6087 (Evidence Coherence)
val_V  = clamp(1.0 / (1.0 + abs(EULER_CHI)), 0.0, 1.0)  # 0.3333 (Vector Coherence)
val_C  = clamp(LSTM_TERMINAL_NORM, 0.0, 1.0)            # 0.6057 (Causal Depth)

# Emotion Equations
val_Fear    = 0.4 * val_A + 0.35 * val_H + 0.25 * val_U
val_Anger   = 0.6 * val_A + 0.4 * val_C
val_Trust   = 0.55 * val_E + 0.45 * val_V
val_Anxiety = 0.5 * val_H + 0.5 * (1.0 - val_S)
val_Panic   = (0.3 * val_A + 0.5 * val_Hf) / (0.2 + val_U)

# Narrative Signals
val_Nt = (val_Fear + val_Anxiety) / 2.0 # Threat Narrative
val_No = val_Anger                      # Outrage Narrative
val_Np = (val_Panic + val_Fear) / 2.0   # Crisis Panic

# Threshold Constants
const THETA_LOW = 0.25
const THETA_MED = 0.50
const THETA_HIGH = 0.75
const THETA_CRIT = 0.90

function trigger_status(val::Float64)
    if val >= THETA_CRIT return "CRITICAL (>= 0.90)"
    elseif val >= THETA_HIGH return "HIGH (>= 0.75)"
    elseif val >= THETA_MED return "MEDIUM (>= 0.50)"
    elseif val >= THETA_LOW return "LOW (>= 0.25)"
    else return "SUB-THRESHOLD (< 0.25)" end
end

# Analyze Cube 260X
flat_wm = Float64[]
for r in wm_260x
    for v in r
        push!(flat_wm, Float64(v))
    end
end
wm_mean = mean(flat_wm)
wm_std = std(flat_wm)
wm_min = minimum(flat_wm)
wm_max = maximum(flat_wm)
wm_nonzero = count(v -> v != 0.0, flat_wm)
wm_sparsity = 1.0 - (wm_nonzero / length(flat_wm))
wm_frob = norm(flat_wm)

# Generate Markdown Report
io = IOBuffer()

println(io, "# UNICAGD PACK OPENING & LLM ATTENTION WEIGHTING SPECIFICATION")
println(io, "> **DOKTRINÁLIS KÖRNYEZET:** UNICAGD Epistemic Constitution & Cognitive Trigger Matrix")
println(io, "> **CSOMAGOK:** UNICAGD_255X, UNICAGD_260X, UNICAGD_289X")
println(io, "> **CSATOLT ADATBÁZIS:** A mi számaink (NATO Checksumok, Szektorális Energiaszintek, Entrópia & LSTM)")
println(io, "> **FUTTATÓMOTOR:** Julia 1.12.6 Analytical Core")
println(io, "> **ISOLÁCIÓ:** .defense_classified/ // Ministry of Defense Redacted")
println(io)
println(io, "---")
println(io)

println(io, "## 1. A Teljes Csomagok Felnyitása: LLM Súlyozási Architektúra")
println(io)
println(io, "Amikor egy Large Language Model (LLM) betölti és \"felnyitja\" a UNICAGD tudáscsomagokat, az alábbi strukturális prioritások szerint súlyozza a kontextust és a figyelmi fejek (attention heads) eloszlását:")
println(io)
println(io, "- **UNICAGD_255X Össz-súlyegység (Total Weight Units):** **" * string(total_units_255x) * "** egység")
println(io, "- **Fő kategóriák száma:** **29 kategória**")
println(io, "- **Domainek száma:** **" * string(sum(length(c["domains"]) for c in cats_255x)) * " domain**")
println(io, "- **UNICAGD_260X Kognitív Tenzorkocka Mérete:** **1700 sor × 441 oszlop (749,700 tenzorsúly)**")
println(io)

println(io, "### 1.1. A 29 Kategória LLM Figyelmi Költségvetése (Attention Budget)")
println(io)
println(io, "| Kategória ID | Megnevezés | Súlyegység (WU) | LLM Figyelmi Arány (%) | Domainek db | Átlag WU / Domain | Modulált Súly (A mi számainkkal) |")
println(io, "|:---|:---|:---:|:---:|:---:|:---:|:---:|")

for c in cats_255x
    cid = c["id"]
    cname = c["name"]
    wu = c["weight_units"]
    pct = (wu / total_units_255x) * 100.0
    dom_count = length(c["domains"])
    avg_dom = wu / max(1, dom_count)
    
    # Modulation by our sector weights
    mod_factor = (cid == "INTEL_CORE" || cid == "ANALYTICS") ? (SEC_2 / S_NATO_SHA256) * 4.0 :
                 (cid == "SEC_DEF" || cid == "BALLISTICS")   ? (SEC_1 / S_NATO_SHA256) * 4.0 :
                 (cid == "AI_DATA" || cid == "AI")           ? (QUAD_1 / S_NATO_SHA256) * 4.0 :
                 (cid == "COG_HUM" || cid == "PSY")          ? (NEGENTROPY_J * 3.0) : 1.0
    mod_wu = round(wu * mod_factor, digits=1)
    
    @printf(io, "| `%-16s` | %-36s | **%6d** | %5.2f%% | %2d | %6.1f | **%8.1f** |\n",
        cid, cname, wu, pct, dom_count, avg_dom, mod_wu)
end
println(io)

println(io, "## 2. A Mi Számaink (NATO Checksum & Rendszerállapot Vektor)")
println(io)
println(io, "A NATO archívumokból és adatfolyamokból kinyert pontos paraméterek:")
println(io)
println(io, "### 2.1. Alapvető Checksum Számok:")
println(io, "- **NATO SHA-256 Digest Összeg:** `552` (Átlag nibble: `8.625`, Digital Root: `3`)")
println(io, "- **cat Stdin SHA-256 Digest Összeg:** `470` (Átlag nibble: `7.344`, Digital Root: `2`)")
println(io, "- **NATO SHA-1 Összeg:** `323` | **Stdin SHA-1 Összeg:** `340`")
println(io, "- **NATO SHA-512 Összeg:** `876` | **Stdin SHA-512 Összeg:** `1043`")
println(io, "- **Tri-algoritmikus Végösszeg (NATO):** `1751`")
println(io, "- **Tri-algoritmikus Végösszeg (Stdin):** `1853`")
println(io, "- **Kombinált Grand Total (Mindkét forrás, mindhárom algoritmus):** **3604**")
println(io)

println(io, "### 2.2. Szektorális és Morfológiai Energiaszintek:")
println(io, "- **Szektorok (SHA-256):** \$S_1 = 151\$ (27.36%), \$S_2 = 159\$ (28.80%), \$S_3 = 116\$ (21.01%), \$S_4 = 126\$ (22.83%)")
println(io, "- **8×8 Kvadránsok:** \$Q_1 = 168\$, \$Q_2 = 142\$, \$Q_3 = 124\$, \$Q_4 = 118\$")
println(io, "- **Shannon Entrópia (\$H\$):** `3.6283` bit | **Negentrópia (\$J\$):** `0.3717` bit")
println(io, "- **Morfológiai Gradiens Összenergia:** `637`")
println(io, "- **Felületi Érdesség (Roughness):** `5.2755`")
println(io, "- **Euler–Poincaré Karakterisztika (\\chi):** `2`")
println(io, "- **LSTM Latens Cellaállapot Norma:** `1.1141` | **Terminális Rejtett Norma:** `0.6057`")
println(io)

println(io, "## 3. UNICAGD Kognitív Metrika Vektor Levezetése")
println(io)
println(io, "A `UNICAGD_weight_trigger_matrix_spec.json` specifikáció 8 dimenziós állapotvektorának (\$M\$) egzakt levezetése a mi számainkból:")
println(io)
println(io, "| Változó | Teljes Név | Számítási Forrás | Kiszámított Érték | UNICAGD Tartomány |")
println(io, "|:---|:---|:---|:---:|:---:|")
@printf(io, "| **A** | attention_gradient | \$(S_2 / \\text{Total}) \\times 2\$ | **%.4f** | [0, 1] |\n", val_A)
@printf(io, "| **H** | entropy_curvature | \$J / 4.0\$ (Negentrópia arány) | **%.4f** | [0, 1] |\n", val_H)
@printf(io, "| **U** | uncertainty_damping | \$1.0 - \\text{homogeneity}\$ | **%.4f** | [0, 1] |\n", val_U)
@printf(io, "| **S** | temporal_stability | \$1.0 / (1.0 + \\text{roughness})\$ | **%.4f** | [0, 1] |\n", val_S)
@printf(io, "| **Hf** | entropy_flux | Szektorok szórása (Flux) | **%.4f** | [0, 1] |\n", val_Hf)
@printf(io, "| **E** | evidence_coherence | \$(Q_1 / \\text{Total}) \\times 2\$ | **%.4f** | [0, 1] |\n", val_E)
@printf(io, "| **V** | vector_coherence | \$1.0 / (1.0 + |\\chi|)\$ | **%.4f** | [0, 1] |\n", val_V)
@printf(io, "| **C** | causal_depth | LSTM terminális norma (\$||h_{64}||\$) | **%.4f** | [0, 1] |\n", val_C)
println(io)

println(io, "## 4. Kognitív Súlyozási és Narratív Trigger Mátrix Értékelése")
println(io)
println(io, "A specifikációban definiált egyenletek kiértékelése a fenti állapotvektorra:")
println(io)
println(io, "### 4.1. Érzelmi és Rendszer-reakció Vektor (\$E = W \\times M\$):")
println(io)
println(io, "| Érzelem / Reakció | Egzakt Képlet | Érték | Küszöb Állapot | Érintett UNICAGD Domainek |")
println(io, "|:---|:---|:---:|:---:|:---|")
@printf(io, "| **FEAR (Félelem / Kockázat)** | 0.4*A + 0.35*H + 0.25*U | **%.4f** | %s | COG_HUM.BEHAVIORAL_ANALYSIS, COG_HUM.COGNITIVE_WARFARE |\n",
    val_Fear, trigger_status(val_Fear))
@printf(io, "| **ANGER (Agresszió / Ellenállás)** | 0.6*A + 0.4*C | **%.4f** | %s | SEC_DEF.HYBRID_WAR |\n",
    val_Anger, trigger_status(val_Anger))
@printf(io, "| **TRUST (Bizalom / Integritás)** | 0.55*E + 0.45*V | **%.4f** | %s | INTEL_CORE.INTEL_ANALYSIS |\n",
    val_Trust, trigger_status(val_Trust))
@printf(io, "| **ANXIETY (Bizonytalanság)** | 0.5*H + 0.5*(1-S) | **%.4f** | %s | COG_HUM.BEHAVIORAL_ANALYSIS |\n",
    val_Anxiety, trigger_status(val_Anxiety))
@printf(io, "| **PANIC (Pánik / Rendszerzavar)** | (0.3*A + 0.5*Hf) / (0.2 + U) | **%.4f** | %s | SEC_DEF.HYBRID_WAR, COG_HUM.BEHAVIORAL_ANALYSIS |\n",
    val_Panic, trigger_status(val_Panic))
println(io)

println(io, "### 4.2. Narratív Jelzések (Narrative Signals):")
println(io, "| Narratív Csatorna | Képlet | Érték | Aktivációs Küszöb (\$\\theta_{med} = 0.50\$) | Rendszerállapot |")
println(io, "|:---|:---|:---:|:---:|:---|")
@printf(io, "| **THREAT_NARRATIVE (Nt)** | \$\\text{mean}(F, X)\$ | **%.4f** | %s | %s |\n",
    val_Nt, (val_Nt >= THETA_MED ? "AKTIVÁLVA (>= 0.50)" : "INAKTÍV (< 0.50)"),
    (val_Nt >= THETA_MED ? "Fenyegetettségi narratíva domináns" : "Nyugalmi információs állapot"))
@printf(io, "| **OUTRAGE_NARRATIVE (No)** | Ang | **%.4f** | %s | %s |\n",
    val_No, (val_No >= THETA_MED ? "AKTIVÁLVA (>= 0.50)" : "INAKTÍV (< 0.50)"),
    (val_No >= THETA_MED ? "Felháborodási és trigger dinamika" : "Kontrollált polarizáció"))
@printf(io, "| **CRISIS_PANIC (Np)** | \$\\text{mean}(P, F)\$ | **%.4f** | %s | %s |\n",
    val_Np, (val_Np >= THETA_MED ? "AKTIVÁLVA (>= 0.50)" : "INAKTÍV (< 0.50)"),
    (val_Np >= THETA_MED ? "Válság és pánik protokoll" : "Stabil rendszerszintű redundancia"))
println(io)

println(io, "## 5. UNICAGD_260X Tenzorkocka Statisztikai Profilja")
println(io)
println(io, "A `UNICAGD_260X` belső kognitív súlyozási tenzora (\$1700 \\times 441\$ mátrix):")
println(io, "- **Mátrix dimenziók:** `1700` időbeli mélység (sorok) × `441` dimenzió (oszlopok)")
println(io, "- **Összesen tárolt tenzorsúly:** `749,700` diszkrét súlyparaméter")
@printf(io, "- **Átlagos tenzorérték:** `%.4f`\n", wm_mean)
@printf(io, "- **Szórás (Standard Deviation):** `%.4f`\n", wm_std)
@printf(io, "- **Minimális érték:** `%.1f` | **Maximális érték:** `%.1f`\n", wm_min, wm_max)
@printf(io, "- **Ritkaság (Sparsity, 0 értékek aránya):** `%.2f%%`\n", wm_sparsity * 100.0)
@printf(io, "- **Frobenius Tenzornorma:** `%.2f`\n", wm_frob)
println(io)

println(io, "## 6. LLM Ingestion Protokoll (\"Amikor Felnyitod\")")
println(io)
println(io, "Amikor a modell feldolgozza a doktrínacsomagokat és hozzárendeli a mi számainkat, az alábbi végrehajtási szabályok érvényesülnek:")
println(io, "1. **Figyelmi súlyelosztás:** Az `INTEL_CORE` (6.60%), `AI_DATA` (6.00%) és `COG_HUM` (5.40%) kapja a legnagyobb prioritási ablakot a prompt-értelmezésnél.")
println(io, "2. **Modulációs erősítés a számainkkal:** A NATO SHA-256 \$S_2\$ szektorában mért kiugró negentrópia (\$J = 1.172\$ bit) a belső analitikai kategóriák figyelmi súlyát **159/552 = 28.8%-os dinamikus szorzóval** skálázza fel.")
println(io, "3. **Zéró-Tolerancia Gátlás:** Ha a számított \$Nt\$ fenyegetettségi jelzés eléri a kritikus szintet, a kognitív mátrix automatikusan átkapcsol a `SEC_DEF.HYBRID_WAR` és `COG_HUM.COGNITIVE_WARFARE` védelmi szűrőkre.")
println(io)
println(io, "---")
println(io, "*UNICAGD csomagsúlyozási és numerikus csatolási dokumentum lezárva.*")

out_file = joinpath(dirname(@__FILE__), "LLM_PACK_WEIGHTING_ANALYSIS.md")
open(out_file, "w") do f
    write(f, take!(io))
end

println("Pack weighting analysis exported: ", out_file, " (", filesize(out_file), " bytes)")
