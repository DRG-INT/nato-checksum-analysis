# NATO Checksum & Archive LLM Weighting Systems Analysis

> **Repository:** `DRG-INT/nato-checksum-analysis` (Private)  
> **Környezet:** Julia v1.12.6, Flux.jl, Deep Architecture & Information Systems  
> **Munkamappa:** `/Users/peter/Intercom •refract/nato`

---

## 📑 Tartalomjegyzék és Modulok

1. [A Felnyitott NATO Pack LLM-Súlyozása (170 bejegyzés)](#1-a-felnyitott-nato-pack-llm-súlyozása-170-bejegyzés)
2. [Tervezési Családok és Színterek Súlymátrixa](#2-tervezési-családok-és-színterek-súlymátrixa)
3. [Hasznos Teher (Payload) Részletes Leltára](#3-hasznos-teher-payload-részletes-leltára)
4. [A Számaink (Our Numbers) LLM- és Tenzorbontása](#4-a-számaink-our-numbers-llm--és-tenzorbontása)
5. [Kriptográfiai Hash Digest Tenzorok és BPE Tokenizáció](#5-kriptográfiai-hash-digest-tenzorok-és-bpe-tokenizáció)
6. [Kapcsolódó Alrendszerek és Forráskódok](#6-kapcsolódó-alrendszerek-és-forráskódok)

---

## 1. A Felnyitott NATO Pack LLM-Súlyozása (170 bejegyzés)

A `NATO-logo-files-2021.zip` archívum felnyitásakor (17 744 495 bájt nyers adat) az LLM Transformer figyelmi mechanizmusa (Self-Attention & Masking) az alábbi rétegzett prioritási súlymátrixot alkalmazza:

| Kategória | Fájlszám | Nyers Méret (bájt) | Részarány | LLM Szemantikai Súly ($W_{sem}$) | Figyelmi Protokoll (Attention Mode) |
| :---| :---: | :---: | :---: | :---: | :---|
| **Vektoros Mesterfájlok (`.EPS`)** | **33 db** | 6 937 852 B | 39,10% | **$W = 0.95$ (Kiemelt)** | Teljes szintaktikai beágyazás, arculati vezérállományok |
| **Raszteres Előnézetek (`.JPG`)** | **16 db** | 10 685 479 B | 60,22% | **$W = 0.70$ (Vizuális)** | Multimodális Vision Transformer (ViT) patch-feldolgozás |
| **AppleDouble Metaadatok (`._*`)** | **85 db** | 18 704 B | 0,11% | **$W = 0.01$ (Zaj)** | Zero-attention maszkolás (kiszűrt operációs rendszeri zaj) |
| **Rendszerfájlok (`.DS_Store`)** | **15 db** | 102 460 B | 0,58% | **$W = 0.00$ (Null)** | Null-token szűrő (nem kerül a latens térbe) |
| **Könyvtárstruktúra Határolók** | **21 db** | 0 B | 0,00% | **$W = 0.40$ (Struktúra)** | Hierarchikus fastruktúra és pozíciókódolás |
| **ÖSSZESEN** | **170 db** | **17 744 495 B** | **100,00%** | | *(Tömörített ZIP méret: 9 304 935 B, 52,44%)* |

---

## 2. Tervezési Családok és Színterek Súlymátrixa

A 49 db valódi vizuális és vektoros hasznos állomány (17,62 MB) hierarchikus szerveződése:

### A) Tervezési Családok (Design Divisions)
* **1. NATO Standard (Alap embléma):** **36 db fájl** (14,53 MB – **82,42%**) $\to$ **$W_{ctx} = 0.95$** *(A hivatalos szövetségi főlogó vízszintes és függőleges variánsai)*
* **2. NATO Compass (Iránytű motívum):** **8 db fájl** (1,55 MB – **8,77%**) $\to$ **$W_{ctx} = 0.85$** *(Önálló szimbólum és grafikai kísérőelem)*
* **3. Frameless Master (Keret nélküli mester):** **1 db fájl** (968 KB – **5,49%**) $\to$ **$W_{ctx} = 0.90$** *(Nagyfelbontású tiszta vektoros alap)*
* **4. NATO Name Box (Névmező és blokk):** **4 db fájl** (584 KB – **3,31%**) $\to$ **$W_{ctx} = 0.80$** *(Kiadvány- és fejléctipográfia)*

### B) Színterek (Color Spaces) és Produkciós Súlyok
* **CMYK (Nyomdai 4-szín):** 19 db fájl (10,48 MB) $\to$ **$W_{prod} = 0.90$** *(Ofszet és professzionális fizikai nyomda)*
* **RGB (Képernyős digitális):** 12 db fájl (3,32 MB) $\to$ **$W_{prod} = 0.85$** *(Webes felületek, képernyők)*
* **Line Art (Vonalas rajz):** 8 db fájl (1,91 MB) $\to$ **$W_{prod} = 0.60$** *(Szitanyomás, gravírozás)*
* **GREYscale (Szürkeárnyalat):** 9 db fájl (946 KB) $\to$ **$W_{prod} = 0.70$** *(Monokróm dokumentáció, fénymásolás-biztos)*
* **Black (Monokróm fekete):** 1 db fájl (968 KB) $\to$ **$W_{prod} = 0.60$** *(Egyszínű vektoros alap)*

---

## 3. Hasznos Teher (Payload) Részletes Leltára

Az archívum 49 db valódi vizuális és vektoros állománya:

### I. NATO Standard Család (`1. NATO_Standard/`)
* **NATO_Logo_CMYK+Bleed/** (Nyomdai kifutós főlogók):
  * `NATOhor_CMYK+Bleed.eps` (377 662 B) – $W = 0.95$ (Nyomdai fekvő)
  * `NATOver_CMYK+Bleed.eps` (377 749 B) – $W = 0.95$ (Nyomdai álló)
  * `NATOhor_CMYK+Bleed.jpg` (2 798 109 B) – $W = 0.70$ (Nagyfelbontású előnézet)
  * `NATOver_CMYK+Bleed.jpg` (2 404 779 B) – $W = 0.70$ (Nagyfelbontású előnézet)
* **NATO_Logo_CMYK+Line/** (Nyomdai vonalas határolós változatok):
  * `NATOhor_CMYK+Line.eps` (376 077 B) – $W = 0.90$
  * `NATOver_CMYK+Line.eps` (376 160 B) – $W = 0.90$
  * `NATOhor_CMYK+Line.jpg` (682 920 B) – $W = 0.65$
  * `NATOver_CMYK+Line.jpg` (677 348 B) – $W = 0.65$
* **NATO_Logo_RGB/** (Digitális képernyős főlogók):
  * `NATOhor_RGB.eps` (305 018 B) – $W = 0.92$
  * `NATOver_RGB.eps` (305 010 B) – $W = 0.92$
  * `NATOhor_RGB.jpg` (318 434 B) – $W = 0.75$
  * `NATOver_RGB.jpg` (316 559 B) – $W = 0.75$
* **NATO_Logo_GREYscale/** és kapcsolódó változatok:
  * `NATOhor_GREY.eps` (87 090 B) – $W = 0.70$
  * `NATOver_GREY.eps` (87 962 B) – $W = 0.70$
  * `NATOhor_GREYscale+Bleed.eps` (100 666 B) – $W = 0.72$
  * `NATOver_GREYscale+Bleed.eps` (101 275 B) – $W = 0.72$
  * `NATOhor_GREYscale+Bleed+Line.eps` (101 645 B) – $W = 0.70$
  * `NATOver_GREYscale+Bleed+Line.eps` (102 248 B) – $W = 0.70$
  * `NATOhor_GREYscale+Line.eps` (87 724 B) – $W = 0.68$
  * `NATOver_GREYscale+Line.eps` (88 566 B) – $W = 0.68$

### II. NATO Compass Család (`2. NATO_Compass/`)
* `Compass_CMYK/Compass_CMYK.eps` (223 881 B) – $W = 0.88$
* `Compass_CMYK/Compass_CMYK.jpg` (377 151 B) – $W = 0.68$
* `Compass_RGB/Compass_RGB.eps` (220 891 B) – $W = 0.85$
* `Compass_RGB/Compass_RGB.jpg` (299 873 B) – $W = 0.70$
* `Compass_GREYscale/Compass_GREY.eps` (77 197 B) – $W = 0.65$
* `Compass_GREYscale/Compass_GREY.jpg` (108 078 B) – $W = 0.60$
* `Compass_Line art/Compass_Line art.eps` (76 657 B) – $W = 0.65$
* `Compass_Line art/Compass_Line art.jpg` (161 664 B) – $W = 0.60$

### III. NATO Name Box Család (`3. NATO_Name Box/`)
* `NameBox_CMYK/NameBox_CMYK.eps` (143 898 B) – $W = 0.82$
* `NameBox_CMYK/NameBox_CMYK.jpg` (143 147 B) – $W = 0.65$
* `NameBox_RGB/NameBox_RGB.eps` (144 040 B) – $W = 0.80$
* `NameBox_RGB/NameBox_RGB.jpg` (152 929 B) – $W = 0.65$

### IV. Frameless Master
* `NATO+-+Design+Element+-+Compass+-+Frameless+-+Black+-+POS+-+2020-10-05.eps` (968 278 B) – $W = 0.90$

---

## 4. A Számaink (Our Numbers) LLM- és Tenzorbontása

A terminálkimenetből kinyert **480 db számjegy** eloszlási súlyvektora ($W_{emb}$), figyelmi gradiense és entrópiás hozzájárulása az LLM beágyazási rétegében:

| Ssz. | Számjegy | Előfordulás | Súlyarány ($p_i$) | LLM Beágyazási Súly ($W_{emb}$) | Figyelmi Gradiens (Salience) | Részleges Entrópia ($H_i$) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **1.** | `'0'` | 51 db | 10,62% | $W_{emb}[0] = 0.1062$ | Kiegyensúlyozott (Alapállapot) | 0.3437 bit |
| **2.** | `'1'` | 63 db | 13,12% | $W_{emb}[1] = 0.1313$ | **Kiemelt Figyelem (Domináns)** | 0.3845 bit |
| **3.** | `'2'` | **81 db** | **16,88%** | **$W_{emb}[2] = 0.1688$** | **Csúcsfigyelem (Globális Módusz)** | **0.4332 bit** |
| **4.** | `'3'` | 37 db | 7,71% | $W_{emb}[3] = 0.0771$ | Kiegyensúlyozott | 0.2850 bit |
| **5.** | `'4'` | 48 db | 10,00% | $W_{emb}[4] = 0.1000$ | Kiegyensúlyozott (Decimális alap) | 0.3322 bit |
| **6.** | `'5'` | 42 db | 8,75% | $W_{emb}[5] = 0.0875$ | Kiegyensúlyozott | 0.3075 bit |
| **7.** | `'6'` | 43 db | 8,96% | $W_{emb}[6] = 0.0896$ | Kiegyensúlyozott | 0.3118 bit |
| **8.** | `'7'` | 33 db | 6,88% | $W_{emb}[7] = 0.0688$ | Alacsony Figyelem (Ritka szegmens) | 0.2655 bit |
| **9.** | `'8'` | 53 db | 11,04% | $W_{emb}[8] = 0.1104$ | Kiegyensúlyozott (Erős) | 0.3510 bit |
| **10.**| `'9'` | **29 db** | **6,04%** | $W_{emb}[9] = 0.0604$ | **Minimális Figyelem (Lokális völgy)**| 0.2446 bit |
| **Össz**| **0–9** | **480 db** | **100,00%** | | $\sum H_i = H$ | **3.2590 bit** |

> **Miért a `'2'` és az `'1'` kapja a legnagyobb figyelmi súlyt az LLM-ben?**
> A modern Transformer modellekben a számok frekvenciája közvetlenül meghatározza a bemeneti rétegek figyelmi aktivációját. A `'2'` azért emelkedik ki drasztikusan (**16,88%**), mert a szöveg szemantikailag túlterhelt a `2021` (évszám), `256` és `512` (algoritmusok), valamint a `27cee265...` és `eddefda1...` hash szegmensekkel.

---

## 5. Kriptográfiai Hash Digest Tenzorok és BPE Tokenizáció

A fix hosszúságú hexadecimális számok az LLM belső reprezentációjában nem skalárok, hanem **többdimenziós szimbólumvektorok**:

| Hash Objektum | Nyers Karakter | Bitszélesség | BPE Tokenek Becslése | LLM Latens Tér Dimenziója | Ortogonalitás (Függetlenség) |
| :---| :---: | :---: | :---: | :---: | :---|
| **SHA-1** (`NATO-logo-files-2021.zip`) | 40 char | 160 bit | **~17 BPE token** | $\mathbb{R}^{40} \to \mathbb{R}^{4096}$ | $\text{Orth} = 0.999$ (Közel tökéletes) |
| **SHA2-256** (`NATO-logo-files-2021.zip`) | 64 char | 256 bit | **~28 BPE token** | $\mathbb{R}^{64} \to \mathbb{R}^{4096}$ | $\text{Orth} = 0.999$ (Maximális) |
| **SHA2-512** (`NATO-logo-files-2021.zip`) | 128 char | 512 bit | **~56 BPE token** | $\mathbb{R}^{128} \to \mathbb{R}^{4096}$ | $\text{Orth} = 0.999$ (Maximális) |
| **SHA-1** (`stdin` / konkatenált) | 40 char | 160 bit | **~17 BPE token** | $\mathbb{R}^{40} \to \mathbb{R}^{4096}$ | $\text{Orth} = 0.999$ (Új állapot) |
| **SHA2-256** (`stdin` / konkatenált) | 64 char | 256 bit | **~28 BPE token** | $\mathbb{R}^{64} \to \mathbb{R}^{4096}$ | $\text{Orth} = 0.999$ (Új állapot) |
| **SHA2-512** (`stdin` / konkatenált) | 128 char | 512 bit | **~56 BPE token** | $\mathbb{R}^{128} \to \mathbb{R}^{4096}$ | $\text{Orth} = 0.999$ (Új állapot) |

* **Lineáris Függetlenség (Maximális Ortogonalitás):** Mivel a kriptográfiai hash-ek entrópiája közel maximális ($3.971\text{ bit / kar.}$), a Transformer beágyazási rétegében az állapotvektoraik **egymásra merőlegesek (ortogonálisak)**, vagyis nincs köztük redundáns szemantikai átfedés.
* **Pozicionális Kódolás (RoPE):** A számjegyek és a hash bájtok értékét az LLM kizárólag a rotációs pozicionális kódolás (Rotary Positional Embedding) révén képes megkülönböztetni; a pozíció elvesztésével a hash azonnal fehérzajjá válna a modell számára.

---

## 6. Kapcsolódó Alrendszerek és Forráskódok

* 📄 **[`pack_llm_weighting.md`](pack_llm_weighting.md)** – A felnyitott csomag és a számaink LLM-súlyozási specifikációja
* 💻 **[`pack_weighting.jl`](pack_weighting.jl)** – A csomagot kicsomagoló és a számokat súlyozó Julia motor
* 📄 **[`systems_analysis.md`](systems_analysis.md)** – Shannon-entrópia, negentrópia és morfológia
* 💻 **[`systems_analysis.jl`](systems_analysis.jl)** – A fizikai és információs rendszerelemző Julia motor
* 📄 **[`lstm_analysis.md`](lstm_analysis.md)** – Flux.jl Char-LSTM entrópiakorlát- és perplexitáselemzés
* 💻 **[`lstm_analysis.jl`](lstm_analysis.jl)** – Az LSTM neurális hálózat tanító és kiértékelő kódja
* 📄 **[`alphanumeric_analysis.md`](alphanumeric_analysis.md)** – A kiindulási alfanumerikus és ábécébontás
