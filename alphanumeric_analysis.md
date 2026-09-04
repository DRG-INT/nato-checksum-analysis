# Alfanumerikus Elemzés és Ellenőrzőösszeg-vizsgálat

Elemzett forráskimenet (OpenSSL dgst és SHA hash ujjlenyomatok NATO logóarchívumokon):

```bash
peter@ALMA Intercom •refract % for alg in sha1 sha256 sha512; do echo "=== $alg ==="; openssl dgst -$alg NATO-logo-files-2021.zip NATO-logo-files-2021..zip; cat NATO-logo-files-2021.zip NATO-logo-files-2021..zip | openssl dgst -$alg; done
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
SHA2-512(stdin)= 4376e28a0ce1198b2463b0b8d01caecfcf8ce435af59ae3f46cfa52a1abffa8443749dac4d83e873be0edbcaa1271cb190ac6fbc97fe1cbaa9f0dfa45e742221
```

---

## 1. Általános Alfanumerikus Áttekintés

* **Teljes karakterszám:** 1246 karakter (100,00%)
* **Alfanumerikus karakterek:** 1073 karakter (86,12%)
  * **Számjegyek (0–9):** 480 db (38,52% a teljesből / 44,73% az alfanumerikusból)
  * **Betűk (A–Z, a–z):** 593 db (47,59% a teljesből / 55,27% az alfanumerikusból)
    * Kisbetűk: 521 db (87,86% a betűkből)
    * Nagybetűk: 72 db (12,14% a betűkből)
* **Nem alfanumerikus karakterek:** 173 karakter (13,88%)
  * Szóközök és sortörések: 56 db (44 szóköz, 12 sortörés)
  * Írásjelek és szimbólumok: 117 db (`-`, `=`, `.`, `(`, `)`, `;`, `$`, `"`, `@`, `|`, `%`, `•`)

> **Kriptográfiai megjegyzés:** A bemenet döntő részét 9 db kriptográfiai hash teszi ki (3× SHA1 = 120 hex, 3× SHA2-256 = 192 hex, 3× SHA2-512 = 384 hex, összesen 696 tiszta hexadecimális karakter). Emiatt az alfanumerikus karakterek **79,31%-a** (851 db) pusztán a 16 db hexadecimális alapszimbólumból áll.

---

## 2. Számjegyek (Digits) Elemzése (0-tól 9-ig beszámozva)

* **Számjegyek darabszáma:** 480 db
* **Számjegyek összege:** 1912
* **Számtani átlag:** 3,983 *(közel az elméleti 4,5-ös egyenletes eloszláshoz)*
* **Medián:** 4,0
* **Leggyakoribb számjegy (módusz):** `'2'` (81 db – az algoritmusnevek és fájlnevek miatt)
* **Legritkább számjegy:** `'9'` (29 db)

| Ssz. | Számjegy | Előfordulás (db) | Részarány (számjegyek közt) | Részarány (teljes szövegben) |
| :---: | :---: | :---: | :---: | :---: |
| **1.** | `'0'` | 51 db | 10,62% | 4,09% |
| **2.** | `'1'` | 63 db | 13,12% | 5,06% |
| **3.** | `'2'` | 81 db | 16,88% | 6,50% |
| **4.** | `'3'` | 37 db | 7,71% | 2,97% |
| **5.** | `'4'` | 48 db | 10,00% | 3,85% |
| **6.** | `'5'` | 42 db | 8,75% | 3,37% |
| **7.** | `'6'` | 43 db | 8,96% | 3,45% |
| **8.** | `'7'` | 33 db | 6,88% | 2,65% |
| **9.** | `'8'` | 53 db | 11,04% | 4,25% |
| **10.** | `'9'` | 29 db | 6,04% | 2,33% |
| **Össz.** | **0–9** | **480 db** | **100,00%** | **38,52%** |

---

## 3. Szokásos Latin Ábécé Elemzése (1-től 26-ig beszámozva)

Összesen 593 betű található a szövegben.

| Ssz. | Betű | Kisbetű (db) | Nagybetű (db) | Összesen (db) | Részarány (betűk közt) | Részarány (teljes) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **1.** | **A / a** | 88 db | 21 db | **109 db** | 18,38% | 8,75% |
| **2.** | **B / b** | 53 db | 0 db | **53 db** | 8,94% | 4,25% |
| **3.** | **C / c** | 52 db | 0 db | **52 db** | 8,77% | 4,17% |
| **4.** | **D / d** | 34 db | 0 db | **34 db** | 5,73% | 2,73% |
| **5.** | **E / e** | 68 db | 0 db | **68 db** | 11,47% | 5,46% |
| **6.** | **F / f** | 55 db | 0 db | **55 db** | 9,27% | 4,41% |
| **7.** | **G / g** | 16 db | 0 db | **16 db** | 2,70% | 1,28% |
| **8.** | **H / h** | 7 db | 9 db | **16 db** | 2,70% | 1,28% |
| **9.** | **I / i** | 24 db | 1 db | **25 db** | 4,22% | 2,01% |
| **10.** | **J / j** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **11.** | **K / k** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **12.** | **L / l** | 26 db | 1 db | **27 db** | 4,55% | 2,17% |
| **13.** | **M / m** | 1 db | 1 db | **2 db** | 0,34% | 0,16% |
| **14.** | **N / n** | 8 db | 10 db | **18 db** | 3,04% | 1,44% |
| **15.** | **O / o** | 27 db | 10 db | **37 db** | 6,24% | 2,97% |
| **16.** | **P / p** | 13 db | 0 db | **13 db** | 2,19% | 1,04% |
| **17.** | **Q / q** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **18.** | **R / r** | 5 db | 0 db | **5 db** | 0,84% | 0,40% |
| **19.** | **S / s** | 25 db | 9 db | **34 db** | 5,73% | 2,73% |
| **20.** | **T / t** | 9 db | 10 db | **19 db** | 3,20% | 1,52% |
| **21.** | **U / u** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **22.** | **V / v** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **23.** | **W / w** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **24.** | **X / x** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **25.** | **Y / y** | 0 db | 0 db | **0 db** | 0,00% | 0,00% |
| **26.** | **Z / z** | 10 db | 0 db | **10 db** | 1,69% | 0,80% |

* **Hiányzó latin betűk (8 db):** `J`, `K`, `Q`, `U`, `V`, `W`, `X`, `Y`.

---

## 4. Teljes Magyar Ábécé Elemzése (1-től 44-ig beszámozva)

Tokenizálás a leghosszabb illeszkedés (greedy longest match) elve alapján a 44 betűs kiterjesztett magyar ábécével:

| Ssz. | Betű | Típus | Előfordulás | Arány | Státusz |
| :---: | :---: | :---: | :---: | :---: | :---|
| **1.** | **A** | Egyjegyű | 109 db | 18,38% | Előfordul |
| **2.** | **Á** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **3.** | **B** | Egyjegyű | 53 db | 8,94% | Előfordul |
| **4.** | **C** | Egyjegyű | 52 db | 8,77% | Előfordul |
| **5.** | **CS** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **6.** | **D** | Egyjegyű | 34 db | 5,73% | Előfordul |
| **7.** | **DZ** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **8.** | **DZS** | Háromjegyű (trigráf) | 0 db | 0,00% | – |
| **9.** | **E** | Egyjegyű | 68 db | 11,47% | Előfordul |
| **10.** | **É** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **11.** | **F** | Egyjegyű | 55 db | 9,27% | Előfordul |
| **12.** | **G** | Egyjegyű | 16 db | 2,70% | Előfordul |
| **13.** | **GY** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **14.** | **H** | Egyjegyű | 16 db | 2,70% | Előfordul |
| **15.** | **I** | Egyjegyű | 25 db | 4,22% | Előfordul |
| **16.** | **Í** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **17.** | **J** | Egyjegyű | 0 db | 0,00% | – |
| **18.** | **K** | Egyjegyű | 0 db | 0,00% | – |
| **19.** | **L** | Egyjegyű | 27 db | 4,55% | Előfordul |
| **20.** | **LY** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **21.** | **M** | Egyjegyű | 2 db | 0,34% | Előfordul |
| **22.** | **N** | Egyjegyű | 18 db | 3,04% | Előfordul |
| **23.** | **NY** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **24.** | **O** | Egyjegyű | 37 db | 6,24% | Előfordul |
| **25.** | **Ó** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **26.** | **Ö** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **27.** | **Ő** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **28.** | **P** | Egyjegyű | 13 db | 2,19% | Előfordul |
| **29.** | **Q** | Egyjegyű (kiterjesztett) | 0 db | 0,00% | – |
| **30.** | **R** | Egyjegyű | 5 db | 0,84% | Előfordul |
| **31.** | **S** | Egyjegyű | 34 db | 5,73% | Előfordul |
| **32.** | **SZ** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **33.** | **T** | Egyjegyű | 19 db | 3,20% | Előfordul |
| **34.** | **TY** | Kétjegyű (digráf) | 0 db | 0,00% | – |
| **35.** | **U** | Egyjegyű | 0 db | 0,00% | – |
| **36.** | **Ú** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **37.** | **Ü** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **38.** | **Ű** | Egyjegyű (ékezetes) | 0 db | 0,00% | – |
| **39.** | **V** | Egyjegyű | 0 db | 0,00% | – |
| **40.** | **W** | Egyjegyű (kiterjesztett) | 0 db | 0,00% | – |
| **41.** | **X** | Egyjegyű (kiterjesztett) | 0 db | 0,00% | – |
| **42.** | **Y** | Egyjegyű (kiterjesztett) | 0 db | 0,00% | – |
| **43.** | **Z** | Egyjegyű | 10 db | 1,69% | Előfordul |
| **44.** | **ZS** | Kétjegyű (digráf) | 0 db | 0,00% | – |

* **Megjegyzés:** A szövegben sem digráf/trigráf (0 db), sem ékezetes karakter (0 db) nem található. A 40 betűs hagyományos magyar ábécéből hiányzó idegen betűk (`Q`, `W`, `X`, `Y`) szintén 0 előfordulással bírnak.

---

## 5. További Felsorolások és Toplisták

### A) Top 15 Alfanumerikus Karakter
1. `'a'` : 109 db (10,16%)
2. `'2'` : 81 db (7,55%)
3. `'e'` : 68 db (6,34%)
4. `'1'` : 63 db (5,87%)
5. `'f'` : 55 db (5,13%)
6. `'8'` : 53 db (4,94%)
7. `'b'` : 53 db (4,94%)
8. `'c'` : 52 db (4,85%)
9. `'0'` : 51 db (4,75%)
10. `'4'` : 48 db (4,47%)
11. `'6'` : 43 db (4,01%)
12. `'5'` : 42 db (3,91%)
13. `'o'` : 37 db (3,45%)
14. `'3'` : 37 db (3,45%)
15. `'d'` : 34 db (3,17%)

### B) Nem Alfanumerikus Karakterek (173 db)
* `' '` (szóköz, U+0020): 44 db
* `'-'` (kötőjel, U+002D): 38 db
* `'='` (egyenlőségjel, U+003D): 33 db
* `'.'` (pont, U+002E): 15 db
* `'\n'` (sortörés, U+000A): 12 db
* `')'` (csukó zárójel, U+0029): 9 db
* `'('` (nyitó zárójel, U+0028): 9 db
* `';'` (pontosvessző, U+003B): 4 db
* `'$'` (dollárjel, U+0024): 3 db
* `'"'` (idézőjel, U+0022): 2 db
* `'@'` (kukac, U+0040): 1 db
* `'|'` (pipe, U+007C): 1 db
* `'%'` (százalékjel, U+0025): 1 db
* `'•'` (golyó/bullet, U+2022): 1 db

---

## 6. Generáló Julia Forráskód (Julia v1.12+)

```julia
using Printf, Statistics

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

function analyze(text::String)
    println("Összes karakter: ", length(text))
    println("Számjegyek száma: ", count(isdigit, text))
    println("Betűk száma: ", count(isletter, text))
end

analyze(RAW_TEXT)
```
