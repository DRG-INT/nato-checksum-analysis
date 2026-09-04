# DEFENSE INTELLIGENCE DOSSIER // DIGEST SECTORIAL & COMBINATORIAL ANALYSIS
> **CLASSIFICATION:** TOP SECRET // STRICT DISSEMINATION CONTROL // ORCON
> **SECURITY DIRECTIVE:** REDACTED FROM GIT TRACKING (VCS CLOAKED IN `.defense_classified/`)
> **COMPUTATIONAL CORE:** Julia 1.12.6 Analytical Engine
> **DATE OF EXECUTION:** 2026-09-04 // ALMA Intercom •refract
> **PRIMARY TARGET:** NATO Archive Assets & Stdin Stream Concatenation

---

## 1. Digitális Leltár és Vizsgált Digestek Regisztere

A vizsgálat célja a NATO logó archívumok és a konkatenált adatfolyamok kriptográfiai ujjlenyomatainak mikroszkopikus szintű, szektorális, sor- és oszlop-alapú mátrixos, valamint kombinatorikus elemzése.

| Azonosító | Forrásfájl / Adatfolyam | Algoritmus | Digest Hossz | Nyers Hexadecimális Kivonat |
|:---|:---|:---:|:---:|:---|
| `NATO_SHA1_F1` | NATO-logo-files-2021.zip | `SHA-1` | 40 nibble | `27cee2652aaf19eac8cc7b24ec64bc2a0abd3086` |
| `NATO_SHA1_F2` | NATO-logo-files-2021..zip | `SHA-1` | 40 nibble | `27cee2652aaf19eac8cc7b24ec64bc2a0abd3086` |
| `NATO_SHA1_STDIN` | cat NATO-*.zip (stdin stream) | `SHA-1` | 40 nibble | `e0a6bb2b3eec4bb8076fb07cfec39c9a504a4ada` |
| `NATO_SHA256_F1` | NATO-logo-files-2021.zip | `SHA-256` | 64 nibble | `eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042` |
| `NATO_SHA256_F2` | NATO-logo-files-2021..zip | `SHA-256` | 64 nibble | `eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042` |
| `NATO_SHA256_STDIN` | cat NATO-*.zip (stdin stream) | `SHA-256` | 64 nibble | `5e8f6f20603c5a8ebaf8772314820aa5ad6c2033b4bb8f8a9f97f0655b9824b1` |
| `NATO_SHA512_F1` | NATO-logo-files-2021.zip | `SHA-512` | 128 nibble | `10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1` |
| `NATO_SHA512_F2` | NATO-logo-files-2021..zip | `SHA-512` | 128 nibble | `10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1` |
| `NATO_SHA512_STDIN` | cat NATO-*.zip (stdin stream) | `SHA-512` | 128 nibble | `4376e28a0ce1198b2463b0b8d01caecfcf8ce435af59ae3f46cfa52a1abffa8443749dac4d83e873be0edbcaa1271cb190ac6fbc97fe1cbaa9f0dfa45e742221` |
| `UNICAGD_255X` | UNICAGD_255X.json | `SHA-256` | 64 nibble | `fd9a22529fea516b466aa40702e2b0fb89450097f9e63c2ff270dd8d73d63284` |
| `UNICAGD_260X` | UNICAGD_260X.json | `SHA-256` | 64 nibble | `8ce959e5c97ab4a5ee0f5867f95d7590897cd160864cc319a17c311b1a9a5ae7` |
| `UNICAGD_289X` | UNICAGD_289X.json | `SHA-256` | 64 nibble | `d6aa6c8e71c10e24f12760aa37351963d89f8394a23a6aac74e982e44bdde137` |

> **Megjegyzés:** A `NATO-logo-files-2021.zip` és a `NATO-logo-files-2021..zip` binárisan teljesen identikus (azonos hash-értékek minden algoritmusnál). A `stdin` a két fájl egymás után fűzött konkatenációjának (`cat file1 file2 | openssl dgst`) eredménye.

## 2. Globális Összegzések és Számjegy-statisztikák ("Egyben")

Ebben a szakaszban a digestek összes számjegyének összege (mind a 0..15 közötti hexadecimális értékek, mind a 0..9 tisztán decimális számjegyek), bájt-összegek, digital root-ok és paritás-arányok találhatók.

| Forrás / Algoritmus | Hex Összeg | Átlag Nibble | Dec Digit Összeg (0-9) | Dec Digitek Száma | Bájt Összeg | Hex Digital Root | Paritás (Páros/Páratlan db) |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **NATO-logo-files-2021.zip** (SHA-1) | **323** | 8.07 | 84 | 20 / 40 | 2558 | **8** | 29 páros / 11 páratlan |
| **NATO-logo-files-2021..zip** (SHA-1) | **323** | 8.07 | 84 | 20 / 40 | 2558 | **8** | 29 páros / 11 páratlan |
| **cat NATO-*.zip (stdin stream)** (SHA-1) | **340** | 8.50 | 77 | 18 / 40 | 2800 | **7** | 24 páros / 16 páratlan |
| **NATO-logo-files-2021.zip** (SHA-256) | **552** | 8.62 | 116 | 28 / 64 | 5067 | **3** | 40 páros / 24 páratlan |
| **NATO-logo-files-2021..zip** (SHA-256) | **552** | 8.62 | 116 | 28 / 64 | 5067 | **3** | 40 páros / 24 páratlan |
| **cat NATO-*.zip (stdin stream)** (SHA-256) | **470** | 7.34 | 189 | 41 / 64 | 3800 | **2** | 34 páros / 30 páratlan |
| **NATO-logo-files-2021.zip** (SHA-512) | **876** | 6.84 | 397 | 89 / 128 | 7371 | **3** | 66 páros / 62 páratlan |
| **NATO-logo-files-2021..zip** (SHA-512) | **876** | 6.84 | 397 | 89 / 128 | 7371 | **3** | 66 páros / 62 páratlan |
| **cat NATO-*.zip (stdin stream)** (SHA-512) | **1043** | 8.15 | 280 | 66 / 128 | 8678 | **8** | 71 páros / 57 páratlan |
| **UNICAGD_255X.json** (SHA-256) | **466** | 7.28 | 184 | 42 / 64 | 4276 | **7** | 34 páros / 30 páratlan |
| **UNICAGD_260X.json** (SHA-256) | **499** | 7.80 | 219 | 41 / 64 | 4264 | **4** | 29 páros / 35 páratlan |
| **UNICAGD_289X.json** (SHA-256) | **468** | 7.31 | 189 | 41 / 64 | 4203 | **9** | 36 páros / 28 páratlan |

## 3. Szektoronkénti Részletes Elemzés ("Szektoronként")

A digesteket felosztjuk természetes blokkokra (4 szektoros kvadránsok, 8 szektoros regiszter-szavak, és 2 szektoros felezők).

### 3.1. SHA-256 Szektorok (256-bit / 64 hex karakter)

##### NATO-logo-files-2021.zip - SHA-256 (4 Szektor / 16 karakteres kvadránsok)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..16]` | `eddefda1c8f143b4` | **151** | 21 | 1561 | 7 | 27.36% |
| **Sector 2** | `[17..32]` | `adec8fc41e4aeaa8` | **159** | 25 | 1254 | 6 | 28.80% |
| **Sector 3** | `[33..48]` | `9a210aaef157e07b` | **116** | 32 | 1046 | 8 | 21.01% |
| **Sector 4** | `[49..64]` | `a8aa4ea7c4b9b042` | **126** | 38 | 1206 | 9 | 22.83% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **552** | **116** | **5067** | **3** | **100.00%** |


###### Szektor-kombinációk és Szimmetriák:

- **Páros szektor-kombinációk (C(4, 2) = 6 pár):**

| Kombináció | Elemek | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2** | S1 (151) + S2 (159) | **310** | 46 | 4 | 56.16% |
| **S1 + S3** | S1 (151) + S3 (116) | **267** | 53 | 6 | 48.37% |
| **S1 + S4** | S1 (151) + S4 (126) | **277** | 59 | 7 | 50.18% |
| **S2 + S3** | S2 (159) + S3 (116) | **275** | 57 | 5 | 49.82% |
| **S2 + S4** | S2 (159) + S4 (126) | **285** | 63 | 6 | 51.63% |
| **S3 + S4** | S3 (116) + S4 (126) | **242** | 70 | 8 | 43.84% |

- **Hármas szektor-kombinációk (C(4, 3) = 4 hármas):**

| Hármas | Kimaradó Elem | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2 + S3** | S4 (126) | **426** | 78 | 3 | 77.17% |
| **S1 + S2 + S4** | S3 (116) | **436** | 84 | 4 | 78.99% |
| **S1 + S3 + S4** | S2 (159) | **393** | 91 | 6 | 71.20% |
| **S2 + S3 + S4** | S1 (151) | **401** | 95 | 5 | 72.64% |

- **Strukturális Szimmetria Analízis:**

| Szimmetria Tengely | Oldal A | Összeg A | Oldal B | Összeg B | Eltérés (Δ) | Arány (A/B) |
|:---|:---|:---:|:---|:---:|:---:|:---:|
| **Paritás (Páratlan vs Páros)** | S1 + S3 | **267** | S2 + S4 | **285** | **18** | 0.9368 |
| **Bipartíció (Front vs Back)** | S1 + S2 | **310** | S3 + S4 | **242** | **68** | 1.2810 |


##### cat NATO-*.zip (stdin stream) - SHA-256 (4 Szektor / 16 karakteres kvadránsok)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..16]` | `5e8f6f20603c5a8e` | **123** | 43 | 768 | 6 | 26.17% |
| **Sector 2** | `[17..32]` | `baf8772314820aa5` | **103** | 47 | 913 | 4 | 21.91% |
| **Sector 3** | `[33..48]` | `ad6c2033b4bb8f8a` | **127** | 34 | 1012 | 1 | 27.02% |
| **Sector 4** | `[49..64]` | `9f97f0655b9824b1` | **117** | 65 | 1107 | 9 | 24.89% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **470** | **189** | **3800** | **2** | **100.00%** |


###### Szektor-kombinációk és Szimmetriák:

- **Páros szektor-kombinációk (C(4, 2) = 6 pár):**

| Kombináció | Elemek | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2** | S1 (123) + S2 (103) | **226** | 90 | 1 | 48.09% |
| **S1 + S3** | S1 (123) + S3 (127) | **250** | 77 | 7 | 53.19% |
| **S1 + S4** | S1 (123) + S4 (117) | **240** | 108 | 6 | 51.06% |
| **S2 + S3** | S2 (103) + S3 (127) | **230** | 81 | 5 | 48.94% |
| **S2 + S4** | S2 (103) + S4 (117) | **220** | 112 | 4 | 46.81% |
| **S3 + S4** | S3 (127) + S4 (117) | **244** | 99 | 1 | 51.91% |

- **Hármas szektor-kombinációk (C(4, 3) = 4 hármas):**

| Hármas | Kimaradó Elem | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2 + S3** | S4 (117) | **353** | 124 | 2 | 75.11% |
| **S1 + S2 + S4** | S3 (127) | **343** | 155 | 1 | 72.98% |
| **S1 + S3 + S4** | S2 (103) | **367** | 142 | 7 | 78.09% |
| **S2 + S3 + S4** | S1 (123) | **347** | 146 | 5 | 73.83% |

- **Strukturális Szimmetria Analízis:**

| Szimmetria Tengely | Oldal A | Összeg A | Oldal B | Összeg B | Eltérés (Δ) | Arány (A/B) |
|:---|:---|:---:|:---|:---:|:---:|:---:|
| **Paritás (Páratlan vs Páros)** | S1 + S3 | **250** | S2 + S4 | **220** | **30** | 1.1364 |
| **Bipartíció (Front vs Back)** | S1 + S2 | **226** | S3 + S4 | **244** | **18** | 0.9262 |


##### NATO-logo-files-2021.zip - SHA-256 (8 Szektor / 8 karakteres 32-bit szavak H0..H7)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..8]` | `eddefda1` | **93** | 1 | 873 | 3 | 16.85% |
| **Sector 2** | `[9..16]` | `c8f143b4` | **58** | 20 | 688 | 4 | 10.51% |
| **Sector 3** | `[17..24]` | `adec8fc4` | **88** | 12 | 748 | 7 | 15.94% |
| **Sector 4** | `[25..32]` | `1e4aeaa8` | **71** | 13 | 506 | 8 | 12.86% |
| **Sector 5** | `[33..40]` | `9a210aae` | **56** | 12 | 371 | 2 | 10.14% |
| **Sector 6** | `[41..48]` | `f157e07b` | **60** | 20 | 675 | 6 | 10.87% |
| **Sector 7** | `[49..56]` | `a8aa4ea7` | **73** | 19 | 583 | 1 | 13.22% |
| **Sector 8** | `[57..64]` | `c4b9b042` | **53** | 19 | 623 | 8 | 9.60% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **552** | **116** | **5067** | **3** | **100.00%** |


##### NATO-logo-files-2021.zip - SHA-256 (2 Fél / 32 karakteres bipartíció)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..32]` | `eddefda1c8f143b4adec8fc41e4aeaa8` | **310** | 46 | 2815 | 4 | 56.16% |
| **Sector 2** | `[33..64]` | `9a210aaef157e07ba8aa4ea7c4b9b042` | **242** | 70 | 2252 | 8 | 43.84% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **552** | **116** | **5067** | **3** | **100.00%** |


### 3.2. SHA-512 Szektorok (512-bit / 128 hex karakter)

##### NATO-logo-files-2021.zip - SHA-512 (4 Szektor / 32 karakteres blokkok)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..32]` | `10f2da80ae9b8337122b978515618052` | **187** | 103 | 1792 | 7 | 21.35% |
| **Sector 2** | `[33..64]` | `8ed48654ffeb771058083623ad66bf56` | **239** | 108 | 1934 | 5 | 27.28% |
| **Sector 3** | `[65..96]` | `509ad48cd9a93878ff6ec6360f31b88c` | **263** | 111 | 2153 | 2 | 30.02% |
| **Sector 4** | `[97..128]` | `6240321b561b413e475b4bc23aa9a2c1` | **187** | 75 | 1492 | 7 | 21.35% |
| **Összesen (Egyben)** | `[1..128]` | *Teljes digest* | **876** | **397** | **7371** | **3** | **100.00%** |


###### Szektor-kombinációk és Szimmetriák:

- **Páros szektor-kombinációk (C(4, 2) = 6 pár):**

| Kombináció | Elemek | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2** | S1 (187) + S2 (239) | **426** | 211 | 3 | 48.63% |
| **S1 + S3** | S1 (187) + S3 (263) | **450** | 214 | 9 | 51.37% |
| **S1 + S4** | S1 (187) + S4 (187) | **374** | 178 | 5 | 42.69% |
| **S2 + S3** | S2 (239) + S3 (263) | **502** | 219 | 7 | 57.31% |
| **S2 + S4** | S2 (239) + S4 (187) | **426** | 183 | 3 | 48.63% |
| **S3 + S4** | S3 (263) + S4 (187) | **450** | 186 | 9 | 51.37% |

- **Hármas szektor-kombinációk (C(4, 3) = 4 hármas):**

| Hármas | Kimaradó Elem | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2 + S3** | S4 (187) | **689** | 322 | 5 | 78.65% |
| **S1 + S2 + S4** | S3 (263) | **613** | 286 | 1 | 69.98% |
| **S1 + S3 + S4** | S2 (239) | **637** | 289 | 7 | 72.72% |
| **S2 + S3 + S4** | S1 (187) | **689** | 294 | 5 | 78.65% |

- **Strukturális Szimmetria Analízis:**

| Szimmetria Tengely | Oldal A | Összeg A | Oldal B | Összeg B | Eltérés (Δ) | Arány (A/B) |
|:---|:---|:---:|:---|:---:|:---:|:---:|
| **Paritás (Páratlan vs Páros)** | S1 + S3 | **450** | S2 + S4 | **426** | **24** | 1.0563 |
| **Bipartíció (Front vs Back)** | S1 + S2 | **426** | S3 + S4 | **450** | **24** | 0.9467 |


##### cat NATO-*.zip (stdin stream) - SHA-512 (4 Szektor / 32 karakteres blokkok)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..32]` | `4376e28a0ce1198b2463b0b8d01caecf` | **232** | 73 | 2062 | 7 | 22.24% |
| **Sector 2** | `[33..64]` | `cf8ce435af59ae3f46cfa52a1abffa84` | **292** | 67 | 2212 | 4 | 28.00% |
| **Sector 3** | `[65..96]` | `43749dac4d83e873be0edbcaa1271cb1` | **252** | 72 | 2097 | 9 | 24.16% |
| **Sector 4** | `[97..128]` | `90ac6fbc97fe1cbaa9f0dfa45e742221` | **267** | 68 | 2307 | 6 | 25.60% |
| **Összesen (Egyben)** | `[1..128]` | *Teljes digest* | **1043** | **280** | **8678** | **8** | **100.00%** |


###### Szektor-kombinációk és Szimmetriák:

- **Páros szektor-kombinációk (C(4, 2) = 6 pár):**

| Kombináció | Elemek | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2** | S1 (232) + S2 (292) | **524** | 140 | 2 | 50.24% |
| **S1 + S3** | S1 (232) + S3 (252) | **484** | 145 | 7 | 46.40% |
| **S1 + S4** | S1 (232) + S4 (267) | **499** | 141 | 4 | 47.84% |
| **S2 + S3** | S2 (292) + S3 (252) | **544** | 139 | 4 | 52.16% |
| **S2 + S4** | S2 (292) + S4 (267) | **559** | 135 | 1 | 53.60% |
| **S3 + S4** | S3 (252) + S4 (267) | **519** | 140 | 6 | 49.76% |

- **Hármas szektor-kombinációk (C(4, 3) = 4 hármas):**

| Hármas | Kimaradó Elem | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2 + S3** | S4 (267) | **776** | 212 | 2 | 74.40% |
| **S1 + S2 + S4** | S3 (252) | **791** | 208 | 8 | 75.84% |
| **S1 + S3 + S4** | S2 (292) | **751** | 213 | 4 | 72.00% |
| **S2 + S3 + S4** | S1 (232) | **811** | 207 | 1 | 77.76% |

- **Strukturális Szimmetria Analízis:**

| Szimmetria Tengely | Oldal A | Összeg A | Oldal B | Összeg B | Eltérés (Δ) | Arány (A/B) |
|:---|:---|:---:|:---|:---:|:---:|:---:|
| **Paritás (Páratlan vs Páros)** | S1 + S3 | **484** | S2 + S4 | **559** | **75** | 0.8658 |
| **Bipartíció (Front vs Back)** | S1 + S2 | **524** | S3 + S4 | **519** | **5** | 1.0096 |


##### NATO-logo-files-2021.zip - SHA-512 (8 Szektor / 16 karakteres 64-bit szavak H0..H7)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..16]` | `10f2da80ae9b8337` | **114** | 41 | 1119 | 6 | 13.01% |
| **Sector 2** | `[17..32]` | `122b978515618052` | **73** | 62 | 673 | 1 | 8.33% |
| **Sector 3** | `[33..48]` | `8ed48654ffeb7710` | **132** | 50 | 1197 | 6 | 15.07% |
| **Sector 4** | `[49..64]` | `58083623ad66bf56` | **107** | 58 | 737 | 8 | 12.21% |
| **Sector 5** | `[65..80]` | `509ad48cd9a93878` | **128** | 70 | 1148 | 2 | 14.61% |
| **Sector 6** | `[81..96]` | `ff6ec6360f31b88c` | **135** | 41 | 1005 | 9 | 15.41% |
| **Sector 7** | `[97..112]` | `6240321b561b413e` | **74** | 38 | 479 | 2 | 8.45% |
| **Sector 8** | `[113..128]` | `475b4bc23aa9a2c1` | **113** | 37 | 1013 | 5 | 12.90% |
| **Összesen (Egyben)** | `[1..128]` | *Teljes digest* | **876** | **397** | **7371** | **3** | **100.00%** |


### 3.3. SHA-1 Szektorok (160-bit / 40 hex karakter)

##### NATO-logo-files-2021.zip - SHA-1 (4 Szektor / 10 karakteres blokkok)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..10]` | `27cee2652a` | **74** | 24 | 614 | 2 | 22.91% |
| **Sector 2** | `[11..20]` | `af19eac8cc` | **103** | 18 | 838 | 4 | 31.89% |
| **Sector 3** | `[21..30]` | `7b24ec64bc` | **83** | 23 | 683 | 2 | 25.70% |
| **Sector 4** | `[31..40]` | `2a0abd3086` | **63** | 19 | 423 | 9 | 19.50% |
| **Összesen (Egyben)** | `[1..40]` | *Teljes digest* | **323** | **84** | **2558** | **8** | **100.00%** |


###### Szektor-kombinációk és Szimmetriák:

- **Páros szektor-kombinációk (C(4, 2) = 6 pár):**

| Kombináció | Elemek | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2** | S1 (74) + S2 (103) | **177** | 42 | 6 | 54.80% |
| **S1 + S3** | S1 (74) + S3 (83) | **157** | 47 | 4 | 48.61% |
| **S1 + S4** | S1 (74) + S4 (63) | **137** | 43 | 2 | 42.41% |
| **S2 + S3** | S2 (103) + S3 (83) | **186** | 41 | 6 | 57.59% |
| **S2 + S4** | S2 (103) + S4 (63) | **166** | 37 | 4 | 51.39% |
| **S3 + S4** | S3 (83) + S4 (63) | **146** | 42 | 2 | 45.20% |

- **Hármas szektor-kombinációk (C(4, 3) = 4 hármas):**

| Hármas | Kimaradó Elem | Hex Összeg | Dec Összeg | Digital Root | Arány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **S1 + S2 + S3** | S4 (63) | **260** | 65 | 8 | 80.50% |
| **S1 + S2 + S4** | S3 (83) | **240** | 61 | 6 | 74.30% |
| **S1 + S3 + S4** | S2 (103) | **220** | 66 | 4 | 68.11% |
| **S2 + S3 + S4** | S1 (74) | **249** | 60 | 6 | 77.09% |

- **Strukturális Szimmetria Analízis:**

| Szimmetria Tengely | Oldal A | Összeg A | Oldal B | Összeg B | Eltérés (Δ) | Arány (A/B) |
|:---|:---|:---:|:---|:---:|:---:|:---:|
| **Paritás (Páratlan vs Páros)** | S1 + S3 | **157** | S2 + S4 | **166** | **9** | 0.9458 |
| **Bipartíció (Front vs Back)** | S1 + S2 | **177** | S3 + S4 | **146** | **31** | 1.2123 |


##### cat NATO-*.zip (stdin stream) - SHA-1 (4 Szektor / 10 karakteres blokkok)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..10]` | `e0a6bb2b3e` | **82** | 11 | 682 | 1 | 24.12% |
| **Sector 2** | `[11..20]` | `ec4bb8076f` | **88** | 25 | 613 | 7 | 25.88% |
| **Sector 3** | `[21..30]` | `b07cfec39c` | **95** | 19 | 905 | 5 | 27.94% |
| **Sector 4** | `[31..40]` | `9a504a4ada` | **75** | 22 | 600 | 3 | 22.06% |
| **Összesen (Egyben)** | `[1..40]` | *Teljes digest* | **340** | **77** | **2800** | **7** | **100.00%** |


##### NATO-logo-files-2021.zip - SHA-1 (5 Szektor / 8 karakteres 32-bit szavak H0..H4)

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..8]` | `27cee265` | **62** | 22 | 572 | 8 | 19.20% |
| **Sector 2** | `[9..16]` | `2aaf19ea` | **71** | 12 | 476 | 8 | 21.98% |
| **Sector 3** | `[17..24]` | `c8cc7b24` | **68** | 21 | 563 | 5 | 21.05% |
| **Sector 4** | `[25..32]` | `ec64bc2a` | **71** | 12 | 566 | 8 | 21.98% |
| **Sector 5** | `[33..40]` | `0abd3086` | **51** | 17 | 381 | 6 | 15.79% |
| **Összesen (Egyben)** | `[1..40]` | *Teljes digest* | **323** | **84** | **2558** | **8** | **100.00%** |


## 4. Mátrix Topográfia: Sorok és Oszlopok Részletes Elemzése

A digesteket kétdimenziós mátrixba rendezve megvizsgáljuk az összes vízszintes sort (Row Sums), függőleges oszlopot (Column Sums), átlókat és kvadránsokat.

### 4.1. SHA-256 Kanonikus 8×8 Mátrix Analízis

##### NATO-logo-files-2021.zip [SHA-256] (8 × 8 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `e` (14) | `d` (13) | `d` (13) | `e` (14) | `f` (15) | `d` (13) | `a` (10) | `1` (1) | **93** | 1 | 3 |
| **R2** | `c` (12) | `8` (8) | `f` (15) | `1` (1) | `4` (4) | `3` (3) | `b` (11) | `4` (4) | **58** | 20 | 4 |
| **R3** | `a` (10) | `d` (13) | `e` (14) | `c` (12) | `8` (8) | `f` (15) | `c` (12) | `4` (4) | **88** | 12 | 7 |
| **R4** | `1` (1) | `e` (14) | `4` (4) | `a` (10) | `e` (14) | `a` (10) | `a` (10) | `8` (8) | **71** | 13 | 8 |
| **R5** | `9` (9) | `a` (10) | `2` (2) | `1` (1) | `0` (0) | `a` (10) | `a` (10) | `e` (14) | **56** | 12 | 2 |
| **R6** | `f` (15) | `1` (1) | `5` (5) | `7` (7) | `e` (14) | `0` (0) | `7` (7) | `b` (11) | **60** | 20 | 6 |
| **R7** | `a` (10) | `8` (8) | `a` (10) | `a` (10) | `4` (4) | `e` (14) | `a` (10) | `7` (7) | **73** | 19 | 1 |
| **R8** | `c` (12) | `4` (4) | `b` (11) | `9` (9) | `b` (11) | `0` (0) | `4` (4) | `2` (2) | **53** | 19 | 8 |
| **Oszlopösszeg (Hex)** | **83** | **71** | **74** | **64** | **70** | **65** | **74** | **51** | **552** | 116 | 3 |
| **Oszlop Dec Összeg** | 10 | 21 | 11 | 18 | 16 | 3 | 11 | 26 | - | - | - |
| **Oszlop DR** | 2 | 8 | 2 | 1 | 7 | 2 | 2 | 6 | - | - | - |

- **Főátló (Main Diagonal: R1C1 -> R8C8)**: `14 + 8 + 14 + 10 + 0 + 0 + 10 + 2` = **58** (Digital Root: 4)
- **Mellékátló (Anti-Diagonal: R1C8 -> R8C1)**: `1 + 11 + 15 + 14 + 1 + 5 + 8 + 12` = **67** (Digital Root: 4)


###### 8×8 Mátrix Kvadráns Analízis (4 darab 4×4 al-szektor):
| Kvadráns (Quadrant) | Mátrix Tartomány | Hex Összeg | Dec Digit Összeg | Digital Root | Részarány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **Q1 (Bal-felső / Top-Left)** | R1-R4, C1-C4 | **168** | 14 | 6 | 30.43% |
| **Q2 (Jobb-felső / Top-Right)** | R1-R4, C5-C8 | **142** | 32 | 7 | 25.72% |
| **Q3 (Bal-alsó / Bottom-Left)** | R5-R8, C1-C4 | **124** | 46 | 7 | 22.46% |
| **Q4 (Jobb-alsó / Bottom-Right)** | R5-R8, C5-C8 | **118** | 24 | 1 | 21.38% |
| **Mátrix Teljes Összeg** | Teljes 8×8 | **552** | 116 | 3 | 100.00% |


##### cat NATO-*.zip (stdin stream) [SHA-256] (8 × 8 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `5` (5) | `e` (14) | `8` (8) | `f` (15) | `6` (6) | `f` (15) | `2` (2) | `0` (0) | **65** | 21 | 2 |
| **R2** | `6` (6) | `0` (0) | `3` (3) | `c` (12) | `5` (5) | `a` (10) | `8` (8) | `e` (14) | **58** | 22 | 4 |
| **R3** | `b` (11) | `a` (10) | `f` (15) | `8` (8) | `7` (7) | `7` (7) | `2` (2) | `3` (3) | **63** | 27 | 9 |
| **R4** | `1` (1) | `4` (4) | `8` (8) | `2` (2) | `0` (0) | `a` (10) | `a` (10) | `5` (5) | **40** | 20 | 4 |
| **R5** | `a` (10) | `d` (13) | `6` (6) | `c` (12) | `2` (2) | `0` (0) | `3` (3) | `3` (3) | **49** | 14 | 4 |
| **R6** | `b` (11) | `4` (4) | `b` (11) | `b` (11) | `8` (8) | `f` (15) | `8` (8) | `a` (10) | **78** | 20 | 6 |
| **R7** | `9` (9) | `f` (15) | `9` (9) | `7` (7) | `f` (15) | `0` (0) | `6` (6) | `5` (5) | **66** | 36 | 3 |
| **R8** | `5` (5) | `b` (11) | `9` (9) | `8` (8) | `2` (2) | `4` (4) | `b` (11) | `1` (1) | **51** | 29 | 6 |
| **Oszlopösszeg (Hex)** | **58** | **71** | **69** | **75** | **45** | **61** | **50** | **41** | **470** | 189 | 2 |
| **Oszlop Dec Összeg** | 26 | 8 | 43 | 25 | 30 | 11 | 29 | 17 | - | - | - |
| **Oszlop DR** | 4 | 8 | 6 | 3 | 9 | 7 | 5 | 5 | - | - | - |

- **Főátló (Main Diagonal: R1C1 -> R8C8)**: `5 + 0 + 15 + 2 + 2 + 15 + 6 + 1` = **46** (Digital Root: 1)
- **Mellékátló (Anti-Diagonal: R1C8 -> R8C1)**: `0 + 8 + 7 + 0 + 12 + 11 + 15 + 5` = **58** (Digital Root: 4)


###### 8×8 Mátrix Kvadráns Analízis (4 darab 4×4 al-szektor):
| Kvadráns (Quadrant) | Mátrix Tartomány | Hex Összeg | Dec Digit Összeg | Digital Root | Részarány (%) |
|:---|:---:|:---:|:---:|:---:|:---:|
| **Q1 (Bal-felső / Top-Left)** | R1-R4, C1-C4 | **122** | 45 | 5 | 25.96% |
| **Q2 (Jobb-felső / Top-Right)** | R1-R4, C5-C8 | **104** | 45 | 5 | 22.13% |
| **Q3 (Bal-alsó / Bottom-Left)** | R5-R8, C1-C4 | **151** | 57 | 7 | 32.13% |
| **Q4 (Jobb-alsó / Bottom-Right)** | R5-R8, C5-C8 | **93** | 42 | 3 | 19.79% |
| **Mátrix Teljes Összeg** | Teljes 8×8 | **470** | 189 | 2 | 100.00% |


#### SHA-256 Abszolút Eltérés Mátrix (|Fájl - stdin| 8×8)

| Sor | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | **Δ Sorösszeg** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | ** 9** | ** 1** | ** 5** | ** 1** | ** 9** | ** 2** | ** 8** | ** 1** | **36** |
| **R2** | ** 6** | ** 8** | **12** | **11** | ** 1** | ** 7** | ** 3** | **10** | **58** |
| **R3** | ** 1** | ** 3** | ** 1** | ** 4** | ** 1** | ** 8** | **10** | ** 1** | **29** |
| **R4** | ** 0** | **10** | ** 4** | ** 8** | **14** | ** 0** | ** 0** | ** 3** | **39** |
| **R5** | ** 1** | ** 3** | ** 4** | **11** | ** 2** | **10** | ** 7** | **11** | **49** |
| **R6** | ** 4** | ** 3** | ** 6** | ** 4** | ** 6** | **15** | ** 1** | ** 1** | **40** |
| **R7** | ** 1** | ** 7** | ** 1** | ** 3** | **11** | **14** | ** 4** | ** 2** | **43** |
| **R8** | ** 7** | ** 7** | ** 2** | ** 1** | ** 9** | ** 4** | ** 7** | ** 1** | **38** |
| **Δ Oszlopösszeg** | **29** | **42** | **35** | **43** | **53** | **60** | **40** | **30** | **332** |

### 4.2. Alternatív SHA-256 Dimenziók

##### NATO-logo-files-2021.zip [SHA-256] - 4 Sor × 16 Oszlop (4 × 16 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | C9 | C10 | C11 | C12 | C13 | C14 | C15 | C16 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `e` (14) | `d` (13) | `d` (13) | `e` (14) | `f` (15) | `d` (13) | `a` (10) | `1` (1) | `c` (12) | `8` (8) | `f` (15) | `1` (1) | `4` (4) | `3` (3) | `b` (11) | `4` (4) | **151** | 21 | 7 |
| **R2** | `a` (10) | `d` (13) | `e` (14) | `c` (12) | `8` (8) | `f` (15) | `c` (12) | `4` (4) | `1` (1) | `e` (14) | `4` (4) | `a` (10) | `e` (14) | `a` (10) | `a` (10) | `8` (8) | **159** | 25 | 6 |
| **R3** | `9` (9) | `a` (10) | `2` (2) | `1` (1) | `0` (0) | `a` (10) | `a` (10) | `e` (14) | `f` (15) | `1` (1) | `5` (5) | `7` (7) | `e` (14) | `0` (0) | `7` (7) | `b` (11) | **116** | 32 | 8 |
| **R4** | `a` (10) | `8` (8) | `a` (10) | `a` (10) | `4` (4) | `e` (14) | `a` (10) | `7` (7) | `c` (12) | `4` (4) | `b` (11) | `9` (9) | `b` (11) | `0` (0) | `4` (4) | `2` (2) | **126** | 38 | 9 |
| **Oszlopösszeg (Hex)** | **43** | **44** | **39** | **37** | **27** | **52** | **42** | **26** | **40** | **27** | **35** | **27** | **43** | **13** | **32** | **25** | **552** | 116 | 3 |
| **Oszlop Dec Összeg** | 9 | 8 | 2 | 1 | 12 | 0 | 0 | 12 | 1 | 13 | 9 | 17 | 4 | 3 | 11 | 14 | - | - | - |
| **Oszlop DR** | 7 | 8 | 3 | 1 | 9 | 7 | 6 | 8 | 4 | 9 | 8 | 9 | 7 | 4 | 5 | 7 | - | - | - |


##### NATO-logo-files-2021.zip [SHA-256] - 16 Sor × 4 Oszlop (16 × 4 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `e` (14) | `d` (13) | `d` (13) | `e` (14) | **54** | 0 | 9 |
| **R2** | `f` (15) | `d` (13) | `a` (10) | `1` (1) | **39** | 1 | 3 |
| **R3** | `c` (12) | `8` (8) | `f` (15) | `1` (1) | **36** | 9 | 9 |
| **R4** | `4` (4) | `3` (3) | `b` (11) | `4` (4) | **22** | 11 | 4 |
| **R5** | `a` (10) | `d` (13) | `e` (14) | `c` (12) | **49** | 0 | 4 |
| **R6** | `8` (8) | `f` (15) | `c` (12) | `4` (4) | **39** | 12 | 3 |
| **R7** | `1` (1) | `e` (14) | `4` (4) | `a` (10) | **29** | 5 | 2 |
| **R8** | `e` (14) | `a` (10) | `a` (10) | `8` (8) | **42** | 8 | 6 |
| **R9** | `9` (9) | `a` (10) | `2` (2) | `1` (1) | **22** | 12 | 4 |
| **R10** | `0` (0) | `a` (10) | `a` (10) | `e` (14) | **34** | 0 | 7 |
| **R11** | `f` (15) | `1` (1) | `5` (5) | `7` (7) | **28** | 13 | 1 |
| **R12** | `e` (14) | `0` (0) | `7` (7) | `b` (11) | **32** | 7 | 5 |
| **R13** | `a` (10) | `8` (8) | `a` (10) | `a` (10) | **38** | 8 | 2 |
| **R14** | `4` (4) | `e` (14) | `a` (10) | `7` (7) | **35** | 11 | 8 |
| **R15** | `c` (12) | `4` (4) | `b` (11) | `9` (9) | **36** | 13 | 9 |
| **R16** | `b` (11) | `0` (0) | `4` (4) | `2` (2) | **17** | 6 | 8 |
| **Oszlopösszeg (Hex)** | **153** | **136** | **148** | **115** | **552** | 116 | 3 |
| **Oszlop Dec Összeg** | 26 | 24 | 22 | 44 | - | - | - |
| **Oszlop DR** | 9 | 1 | 4 | 7 | - | - | - |


### 4.3. SHA-1 Mátrix Dimenziók (40 hex karakter)

##### NATO-logo-files-2021.zip [SHA-1] - 5 Sor (Regiszterek) × 8 Oszlop (5 × 8 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `2` (2) | `7` (7) | `c` (12) | `e` (14) | `e` (14) | `2` (2) | `6` (6) | `5` (5) | **62** | 22 | 8 |
| **R2** | `2` (2) | `a` (10) | `a` (10) | `f` (15) | `1` (1) | `9` (9) | `e` (14) | `a` (10) | **71** | 12 | 8 |
| **R3** | `c` (12) | `8` (8) | `c` (12) | `c` (12) | `7` (7) | `b` (11) | `2` (2) | `4` (4) | **68** | 21 | 5 |
| **R4** | `e` (14) | `c` (12) | `6` (6) | `4` (4) | `b` (11) | `c` (12) | `2` (2) | `a` (10) | **71** | 12 | 8 |
| **R5** | `0` (0) | `a` (10) | `b` (11) | `d` (13) | `3` (3) | `0` (0) | `8` (8) | `6` (6) | **51** | 17 | 6 |
| **Oszlopösszeg (Hex)** | **30** | **47** | **51** | **58** | **36** | **34** | **32** | **35** | **323** | 84 | 8 |
| **Oszlop Dec Összeg** | 4 | 15 | 6 | 4 | 11 | 11 | 18 | 15 | - | - | - |
| **Oszlop DR** | 3 | 2 | 6 | 4 | 9 | 7 | 5 | 8 | - | - | - |


##### NATO-logo-files-2021.zip [SHA-1] - 4 Sor × 10 Oszlop (4 × 10 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | C9 | C10 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `2` (2) | `7` (7) | `c` (12) | `e` (14) | `e` (14) | `2` (2) | `6` (6) | `5` (5) | `2` (2) | `a` (10) | **74** | 24 | 2 |
| **R2** | `a` (10) | `f` (15) | `1` (1) | `9` (9) | `e` (14) | `a` (10) | `c` (12) | `8` (8) | `c` (12) | `c` (12) | **103** | 18 | 4 |
| **R3** | `7` (7) | `b` (11) | `2` (2) | `4` (4) | `e` (14) | `c` (12) | `6` (6) | `4` (4) | `b` (11) | `c` (12) | **83** | 23 | 2 |
| **R4** | `2` (2) | `a` (10) | `0` (0) | `a` (10) | `b` (11) | `d` (13) | `3` (3) | `0` (0) | `8` (8) | `6` (6) | **63** | 19 | 9 |
| **Oszlopösszeg (Hex)** | **21** | **43** | **15** | **37** | **53** | **37** | **27** | **17** | **33** | **40** | **323** | 84 | 8 |
| **Oszlop Dec Összeg** | 11 | 7 | 3 | 13 | 0 | 2 | 15 | 17 | 10 | 6 | - | - | - |
| **Oszlop DR** | 3 | 7 | 6 | 1 | 8 | 1 | 9 | 8 | 6 | 4 | - | - | - |


### 4.4. SHA-512 Duális 8×8 Mátrix Analízis (128 hex karakter)

Az 512 bites digest két darab egymást követő 8×8-as síkra (Alfa Szektor: 1..64, Béta Szektor: 65..128) bontható:

##### NATO SHA-512 Alfa Mátrix [1..64] (8 × 8 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `1` (1) | `0` (0) | `f` (15) | `2` (2) | `d` (13) | `a` (10) | `8` (8) | `0` (0) | **49** | 11 | 4 |
| **R2** | `a` (10) | `e` (14) | `9` (9) | `b` (11) | `8` (8) | `3` (3) | `3` (3) | `7` (7) | **65** | 30 | 2 |
| **R3** | `1` (1) | `2` (2) | `2` (2) | `b` (11) | `9` (9) | `7` (7) | `8` (8) | `5` (5) | **45** | 34 | 9 |
| **R4** | `1` (1) | `5` (5) | `6` (6) | `1` (1) | `8` (8) | `0` (0) | `5` (5) | `2` (2) | **28** | 28 | 1 |
| **R5** | `8` (8) | `e` (14) | `d` (13) | `4` (4) | `8` (8) | `6` (6) | `5` (5) | `4` (4) | **62** | 35 | 8 |
| **R6** | `f` (15) | `f` (15) | `e` (14) | `b` (11) | `7` (7) | `7` (7) | `1` (1) | `0` (0) | **70** | 15 | 7 |
| **R7** | `5` (5) | `8` (8) | `0` (0) | `8` (8) | `3` (3) | `6` (6) | `2` (2) | `3` (3) | **35** | 35 | 8 |
| **R8** | `a` (10) | `d` (13) | `6` (6) | `6` (6) | `b` (11) | `f` (15) | `5` (5) | `6` (6) | **72** | 23 | 9 |
| **Oszlopösszeg (Hex)** | **51** | **71** | **65** | **54** | **67** | **54** | **37** | **27** | **426** | 211 | 3 |
| **Oszlop Dec Összeg** | 16 | 15 | 23 | 21 | 43 | 29 | 37 | 27 | - | - | - |
| **Oszlop DR** | 6 | 8 | 2 | 9 | 4 | 9 | 1 | 9 | - | - | - |

- **Főátló (Main Diagonal: R1C1 -> R8C8)**: `1 + 14 + 2 + 1 + 8 + 7 + 2 + 6` = **41** (Digital Root: 5)
- **Mellékátló (Anti-Diagonal: R1C8 -> R8C1)**: `0 + 3 + 7 + 8 + 4 + 14 + 8 + 10` = **54** (Digital Root: 9)


##### NATO SHA-512 Béta Mátrix [65..128] (8 × 8 Mátrix)

| Sor (Row) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | **Sorösszeg (Hex)** | **Dec Számjegy Összeg** | **Digital Root** |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **R1** | `5` (5) | `0` (0) | `9` (9) | `a` (10) | `d` (13) | `4` (4) | `8` (8) | `c` (12) | **61** | 26 | 7 |
| **R2** | `d` (13) | `9` (9) | `a` (10) | `9` (9) | `3` (3) | `8` (8) | `7` (7) | `8` (8) | **67** | 44 | 4 |
| **R3** | `f` (15) | `f` (15) | `6` (6) | `e` (14) | `c` (12) | `6` (6) | `3` (3) | `6` (6) | **77** | 21 | 5 |
| **R4** | `0` (0) | `f` (15) | `3` (3) | `1` (1) | `b` (11) | `8` (8) | `8` (8) | `c` (12) | **58** | 20 | 4 |
| **R5** | `6` (6) | `2` (2) | `4` (4) | `0` (0) | `3` (3) | `2` (2) | `1` (1) | `b` (11) | **29** | 18 | 2 |
| **R6** | `5` (5) | `6` (6) | `1` (1) | `b` (11) | `4` (4) | `1` (1) | `3` (3) | `e` (14) | **45** | 20 | 9 |
| **R7** | `4` (4) | `7` (7) | `5` (5) | `b` (11) | `4` (4) | `b` (11) | `c` (12) | `2` (2) | **56** | 22 | 2 |
| **R8** | `3` (3) | `a` (10) | `a` (10) | `9` (9) | `a` (10) | `2` (2) | `c` (12) | `1` (1) | **57** | 15 | 3 |
| **Oszlopösszeg (Hex)** | **51** | **64** | **48** | **65** | **60** | **42** | **54** | **66** | **450** | 186 | 9 |
| **Oszlop Dec Összeg** | 23 | 24 | 28 | 19 | 14 | 31 | 30 | 17 | - | - | - |
| **Oszlop DR** | 6 | 1 | 3 | 2 | 6 | 6 | 9 | 3 | - | - | - |

- **Főátló (Main Diagonal: R1C1 -> R8C8)**: `5 + 9 + 6 + 1 + 3 + 1 + 12 + 1` = **38** (Digital Root: 2)
- **Mellékátló (Anti-Diagonal: R1C8 -> R8C1)**: `12 + 7 + 6 + 11 + 0 + 1 + 7 + 3` = **47** (Digital Root: 2)


## 5. Mindannyiuk Kombinációi (Kombinatorikus Szintézis)

### 5.1. Fájlonkénti és Adatfolyam-kombinációk

| Kombináció Leírása | SHA-1 Összeg | SHA-256 Összeg | SHA-512 Összeg | Tripla-Algoritmus Összeg |
|:---|:---:|:---:|:---:|:---:|
| **File1 (NATO-logo-files-2021.zip)** | 323 | 552 | 876 | **1751** |
| **File2 (NATO-logo-files-2021..zip)** | 323 | 552 | 876 | **1751** |
| **File1 + File2 Összege (Duplikátum Összeg)** | 646 | 1104 | 1752 | **3502** |
| **stdin (cat File1 File2 összefűzés)** | 340 | 470 | 1043 | **1853** |
| **File1 + stdin Összegzése** | 663 | 1022 | 1919 | **3604** |
| **File1 + File2 + stdin Tripla Konfiguráció** | 986 | 1574 | 2795 | **5355** |
| **Δ(File1, stdin) Abszolút Különbség** | 17 | 82 | 167 | **102** |

##### Pozíciónkénti és Oszloponkénti Összehasonlítás: Fájl vs stdin Stream (SHA-256)

| Index | Karakter (Fájl) | Hex v1 | Karakter (stdin) | Hex v2 | **Összeg (v1 + v2)** | **Eltérés (|v1 - v2|)** | Összeg DR |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| `01` | `e` | 14 | `5` |  5 | **19** |  9 | 1 |
| `02` | `d` | 13 | `e` | 14 | **27** |  1 | 9 |
| `03` | `d` | 13 | `8` |  8 | **21** |  5 | 3 |
| `04` | `e` | 14 | `f` | 15 | **29** |  1 | 2 |
| `05` | `f` | 15 | `6` |  6 | **21** |  9 | 3 |
| `06` | `d` | 13 | `f` | 15 | **28** |  2 | 1 |
| `07` | `a` | 10 | `2` |  2 | **12** |  8 | 3 |
| `08` | `1` |  1 | `0` |  0 | ** 1** |  1 | 1 |
| `09` | `c` | 12 | `6` |  6 | **18** |  6 | 9 |
| `10` | `8` |  8 | `0` |  0 | ** 8** |  8 | 8 |
| `11` | `f` | 15 | `3` |  3 | **18** | 12 | 9 |
| `12` | `1` |  1 | `c` | 12 | **13** | 11 | 4 |
| `13` | `4` |  4 | `5` |  5 | ** 9** |  1 | 9 |
| `14` | `3` |  3 | `a` | 10 | **13** |  7 | 4 |
| `15` | `b` | 11 | `8` |  8 | **19** |  3 | 1 |
| `16` | `4` |  4 | `e` | 14 | **18** | 10 | 9 |
| ... | ... | ... | ... | ... | *[17..56 sorok sűrítve]* | ... | ... |
| `57` | `c` | 12 | `5` |  5 | **17** |  7 | 8 |
| `58` | `4` |  4 | `b` | 11 | **15** |  7 | 6 |
| `59` | `b` | 11 | `9` |  9 | **20** |  2 | 2 |
| `60` | `9` |  9 | `8` |  8 | **17** |  1 | 8 |
| `61` | `b` | 11 | `2` |  2 | **13** |  9 | 4 |
| `62` | `0` |  0 | `4` |  4 | ** 4** |  4 | 4 |
| `63` | `4` |  4 | `b` | 11 | **15** |  7 | 6 |
| `64` | `2` |  2 | `1` |  1 | ** 3** |  1 | 3 |

- **Összeadott Vektor Végösszege (Sum Vector Total)**: **1022** (Digital Root: 5)
- **Eltérés Vektor Végösszege (Total Absolute Delta)**: **332**
- **Egyező Pozíciók (Exact Matches)**: **3 / 64** (4.69%)


##### Pozíciónkénti és Oszloponkénti Összehasonlítás: Fájl vs stdin Stream (SHA-1)

| Index | Karakter (Fájl) | Hex v1 | Karakter (stdin) | Hex v2 | **Összeg (v1 + v2)** | **Eltérés (|v1 - v2|)** | Összeg DR |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| `01` | `2` |  2 | `e` | 14 | **16** | 12 | 7 |
| `02` | `7` |  7 | `0` |  0 | ** 7** |  7 | 7 |
| `03` | `c` | 12 | `a` | 10 | **22** |  2 | 4 |
| `04` | `e` | 14 | `6` |  6 | **20** |  8 | 2 |
| `05` | `e` | 14 | `b` | 11 | **25** |  3 | 7 |
| `06` | `2` |  2 | `b` | 11 | **13** |  9 | 4 |
| `07` | `6` |  6 | `2` |  2 | ** 8** |  4 | 8 |
| `08` | `5` |  5 | `b` | 11 | **16** |  6 | 7 |
| `09` | `2` |  2 | `3` |  3 | ** 5** |  1 | 5 |
| `10` | `a` | 10 | `e` | 14 | **24** |  4 | 6 |
| `11` | `a` | 10 | `e` | 14 | **24** |  4 | 6 |
| `12` | `f` | 15 | `c` | 12 | **27** |  3 | 9 |
| `13` | `1` |  1 | `4` |  4 | ** 5** |  3 | 5 |
| `14` | `9` |  9 | `b` | 11 | **20** |  2 | 2 |
| `15` | `e` | 14 | `b` | 11 | **25** |  3 | 7 |
| `16` | `a` | 10 | `8` |  8 | **18** |  2 | 9 |
| `17` | `c` | 12 | `0` |  0 | **12** | 12 | 3 |
| `18` | `8` |  8 | `7` |  7 | **15** |  1 | 6 |
| `19` | `c` | 12 | `6` |  6 | **18** |  6 | 9 |
| `20` | `c` | 12 | `f` | 15 | **27** |  3 | 9 |
| `21` | `7` |  7 | `b` | 11 | **18** |  4 | 9 |
| `22` | `b` | 11 | `0` |  0 | **11** | 11 | 2 |
| `23` | `2` |  2 | `7` |  7 | ** 9** |  5 | 9 |
| `24` | `4` |  4 | `c` | 12 | **16** |  8 | 7 |
| `25` | `e` | 14 | `f` | 15 | **29** |  1 | 2 |
| `26` | `c` | 12 | `e` | 14 | **26** |  2 | 8 |
| `27` | `6` |  6 | `c` | 12 | **18** |  6 | 9 |
| `28` | `4` |  4 | `3` |  3 | ** 7** |  1 | 7 |
| `29` | `b` | 11 | `9` |  9 | **20** |  2 | 2 |
| `30` | `c` | 12 | `c` | 12 | **24** |  0 | 6 |
| `31` | `2` |  2 | `9` |  9 | **11** |  7 | 2 |
| `32` | `a` | 10 | `a` | 10 | **20** |  0 | 2 |
| `33` | `0` |  0 | `5` |  5 | ** 5** |  5 | 5 |
| `34` | `a` | 10 | `0` |  0 | **10** | 10 | 1 |
| `35` | `b` | 11 | `4` |  4 | **15** |  7 | 6 |
| `36` | `d` | 13 | `a` | 10 | **23** |  3 | 5 |
| `37` | `3` |  3 | `4` |  4 | ** 7** |  1 | 7 |
| `38` | `0` |  0 | `a` | 10 | **10** | 10 | 1 |
| `39` | `8` |  8 | `d` | 13 | **21** |  5 | 3 |
| `40` | `6` |  6 | `a` | 10 | **16** |  4 | 7 |

- **Összeadott Vektor Végösszege (Sum Vector Total)**: **663** (Digital Root: 6)
- **Eltérés Vektor Végösszege (Total Absolute Delta)**: **187**
- **Egyező Pozíciók (Exact Matches)**: **2 / 40** (5.00%)


### 5.2. Kereszt-Algoritmikus Kombinációk (Pairwise Algorithm Sums)

| Entitás | SHA-1 + SHA-256 | SHA-256 + SHA-512 | SHA-1 + SHA-512 | SHA-1 + SHA-256 + SHA-512 |
|:---|:---:|:---:|:---:|:---:|
| **NATO Archívum Fájl (Egyedi)** | 875 | 1428 | 1199 | **1751** |
| **stdin Adatfolyam (Konkatenált)** | 810 | 1513 | 1383 | **1853** |
| **Együttes Kombinált Összesítő** | 1685 | 2941 | 2582 | **3604** |

## 6. UNICAGD Doktrína és Intelligencia Referenciák

A rendszer integritási csomagjaiban szereplő alapvető doktrína-fájlok SHA-256 digest elemzése:

##### UNICAGD_255X.json [SHA-256]

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..16]` | `fd9a22529fea516b` | **129** | 41 | 1104 | 3 | 27.68% |
| **Sector 2** | `[17..32]` | `466aa40702e2b0fb` | **102** | 31 | 1002 | 3 | 21.89% |
| **Sector 3** | `[33..48]` | `89450097f9e63c2f` | **118** | 62 | 943 | 1 | 25.32% |
| **Sector 4** | `[49..64]` | `f270dd8d73d63284` | **117** | 50 | 1227 | 9 | 25.11% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **466** | **184** | **4276** | **7** | **100.00%** |


##### UNICAGD_260X.json [SHA-256]

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..16]` | `8ce959e5c97ab4a5` | **144** | 61 | 1359 | 9 | 28.86% |
| **Sector 2** | `[17..32]` | `ee0f5867f95d7590` | **132** | 61 | 1047 | 6 | 26.45% |
| **Sector 3** | `[33..48]` | `897cd160864cc319` | **111** | 62 | 996 | 3 | 22.24% |
| **Sector 4** | `[49..64]` | `a17c311b1a9a5ae7` | **112** | 35 | 862 | 4 | 22.44% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **499** | **219** | **4264** | **4** | **100.00%** |


##### UNICAGD_289X.json [SHA-256]

| Szektor | Tartomány | Nyers Karakterek | Hex Összeg | Dec Számjegy Összeg | Byte Összeg | Digital Root | Súlyarány |
|:---|:---:|:---|:---:|:---:|:---:|:---:|:---:|
| **Sector 1** | `[1..16]` | `d6aa6c8e71c10e24` | **120** | 35 | 990 | 3 | 25.64% |
| **Sector 2** | `[17..32]` | `f12760aa37351963` | **88** | 53 | 778 | 7 | 18.80% |
| **Sector 3** | `[33..48]` | `d89f8394a23a6aac` | **132** | 52 | 1152 | 6 | 28.21% |
| **Sector 4** | `[49..64]` | `74e982e44bdde137` | **128** | 49 | 1283 | 2 | 27.35% |
| **Összesen (Egyben)** | `[1..64]` | *Teljes digest* | **468** | **189** | **4203** | **9** | **100.00%** |


## 7. Matematikai Ellenőrzés és Egzakt Bizonyítások

1. **Sorösszegek és Oszlopösszegek Konzervációja:**
   $$\sum_{r=1}^R \text{RowSum}_r \equiv \sum_{c=1}^C \text{ColSum}_c \equiv \sum_{i=1}^N v(c_i)$$
   - NATO SHA-256 Fájl: `sum(RowSums) = 552`, `sum(ColSums) = 552`, `Total = 552` -> **AZONOS (OK)**
   - NATO SHA-256 stdin: `sum(RowSums) = 470`, `sum(ColSums) = 470`, `Total = 470` -> **AZONOS (OK)**
2. **Szektorális Megmaradási Tétel:**
   - 4 szektor összege: `552 == 552` -> **AZONOS (OK)**
   - 8 szektor összege: `552 == 552` -> **AZONOS (OK)**
   - 4 kvadráns összege: `552 == 552` -> **AZONOS (OK)**
3. **Paritás Megmaradási Invariáns:**
   - Páros összegek (344) + Páratlan összegek (208) = **552** == `552` -> **AZONOS (OK)**

---
*Jelentés lezárva és archiválva a védelmi isolációs mappában (`.defense_classified/`).*
