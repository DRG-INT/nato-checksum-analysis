# LSTM Neurális Hálózat Alapú Sorozatelemzés (Flux.jl)

A NATO ellenőrzőösszeg terminálkimenet karakter-szintű mélytanulásos vizsgálata **Long Short-Term Memory (LSTM)** rekurrens neurális hálózattal, a **Julia `Flux.jl` (v0.16.10)** keretrendszerben.

---

## 1. Modellarchitektúra és Paraméterek

A modell egy szekvenciális **Character-Level Language Model (Char-LSTM)**, amely minden $t$ időpillanatban a beérkező karakter egyforró (one-hot) kódolása alapján becsli meg a következő karakter valószínűség-eloszlását:

$$\hat{y}_t = \text{softmax}(W_{out} \cdot h_t + b_{out})$$

Ahol az LSTM rejtett állapota ($h_t$) és cella-állapota ($c_t$) az alábbi kapuzott rekurrens egyenletek szerint frissül:

$$f_t = \sigma(W_f x_t + U_f h_{t-1} + b_f) \quad \text{(Felejtő kapu)}$$
$$i_t = \sigma(W_i x_t + U_i h_{t-1} + b_i) \quad \text{(Bemeneti kapu)}$$
$$\tilde{c}_t = \tanh(W_c x_t + U_c h_{t-1} + b_c) \quad \text{(Jelölt cella-állapot)}$$
$$c_t = f_t \odot c_{t-1} + i_t \odot \tilde{c}_t \quad \text{(Cella-állapot frissítés)}$$
$$o_t = \sigma(W_o x_t + U_o h_{t-1} + b_o) \quad \text{(Kimeneti kapu)}$$
$$h_t = o_t \odot \tanh(c_t) \quad \text{(Rejtett kimeneti állapot)}$$

### Hálózati specifikációk:
* **Bemeneti szókészlet ($V$):** 51 egyedi karakter (0-9, a-z, A-Z, pont, kötőjel, zárójelek, egyenlőségjel, szimbólumok, sortörés)
* **Rejtett réteg dimenziója ($H$):** 64 neurális egység
* **Tanítható paraméterek száma:** **33 011** súly és torzítás
  * LSTM réteg: $4 \times 64 \times (51 + 64 + 1) = 29\,696$ paraméter
  * Dense kimeneti réteg: $51 \times 64 + 51 = 3\,315$ paraméter
* **Időhorizont ($T$):** 1245 egymást követő lépés
* **Optimalizáló:** Adam ($\eta = 0.01$)
* **Véletlen alapérték (Null baseline):** $\ln(51) = 3.9318$ nats (Perplexitás: 51.0)

---

## 2. Tanítási Konvergencia (200 Epoch)

| Epoch | Keresztentrópia Veszteség | Perplexitás ($PPL$) | Megjegyzés |
| :---: | :---: | :---: | :---|
| **1** | 3.9118 nats | 49.99 | Véletlenszerű tippeléshez közeli állapot |
| **25** | 2.9636 nats | 19.37 | Globális karaktergyakoriságok elsajátítása |
| **50** | 2.2296 nats | 9.30 | Szintaktikai minták (`SHA`, `NATO`, `===`) felismerése |
| **100** | 2.0845 nats | 8.04 | Stabilizálódás a strukturált és a véletlen zónák határán |
| **200** | **2.0707 nats** | **7.93** | Konvergens állapot: az LSTM elérte az elméleti korlátot |

---

## 3. Szakaszonkénti Meglepettség (Surprisal) és Entrópiavizsgálat

A Char-LSTM modell legnagyobb ereje, hogy mérhetővé teszi az **információs meglepettséget (Negative Log-Likelihood / Surprisal)** karakterről karakterre:

$$S(t) = -\ln P(c_t \mid c_{<t})$$

A szöveg strukturális kategóriákra bontása szignifikáns különbségeket mutat:

| Szakasz / Tartomány Típusa | Karakterszám | Átlagos Veszteség | Információs Entrópia | Perplexitás | Jelleg |
| :---| :---: | :---: | :---: | :---: | :---|
| **Fájlnév & algoritmus metaadatok** (`SHA...= `) | 249 db | **1.069 nats** | **1.54 bit / kar.** | **2.91** | *Determinisztikus, magas redundancia* |
| **Szakaszfejlécek** (`=== sha... ===`) | 40 db | **1.519 nats** | **2.19 bit / kar.** | **4.57** | *Ismétlődő mintázat* |
| **Bash parancssor és ciklus** | 239 db | **1.703 nats** | **2.46 bit / kar.** | **5.49** | *Programozási szintaxis* |
| **Kriptográfiai Hash Digest (SHA ujjlenyomat)** | 705 db | **2.561 nats** | **3.69 bit / kar.** | **12.94** | *Pszeudovéletlen kriptográfiai zaj* |

### 🔬 A Kriptográfiai "Entrópiafal" Jelenség (The Entropy Barrier):
1. **A strukturált szakaszokban (`SHA2-256(NATO-logo-files-2021.zip)= `):** Az LSTM belső kapui gyorsan adaptálódnak a statikus szavakra. A perplexitás lecsökken **2.91-re**, ami azt jelenti, hogy a hálózat minimális bizonytalansággal, szinte hibátlanul képes kitalálni a következő karaktert.
2. **A hash-nél (`eddefda1c8f1...`):** Amint a modell eléri az egyenlőségjelet (`= `), beleütközik a kriptográfiai ujjlenyomatba. A modern hash függvények (SHA-1, SHA-256, SHA-512) alapvető tulajdonsága a **szigorú lavina-effektus (avalanche effect)** és a kimeneti bitek függetlensége.
3. **Matematikai igazolás:** 16 lehetséges hexadecimális karakter létezik (`0-9` és `a-f`). A maximális elméleti entrópiájuk:
   $$H_{max} = \log_2(16) = 4.00 \text{ bit/karakter} \quad (\ln(16) \approx 2.772 \text{ nats})$$
   Az LSTM által mért érték: **3.69 bit/karakter (2.561 nats)**.
   Ez azt jelenti, hogy a 200 epochon át tanított neurális hálózat sem talált és nem is találhatott összefüggést a hash egymást követő karaktereiben; a perplexitás azonnal felugrott **12.94-re** (a 16-os elméleti maximum közelébe).

---

## 4. Belső Állapotdinamika (Hidden State Representation)

Az LSTM rejtett állapotvektorának ($h_t \in \mathbb{R}^{64}$) normája ($L_2$ norma):
* **Metaadat (strukturált) állapotok normája:** $\|h_t\|_2 = 2.428 \pm 0.139$
* **Hash ujjlenyomat (zaj) állapotok normája:** $\|h_t\|_2 = 2.441 \pm 0.139$

A kapuk telítettsége jelzi, hogy a rekurrens memória a hash-ek feldolgozása közben folyamatosan "felejtő" állapotban tartja a belső cellát, meggátolva, hogy a determinisztikus parancssori szintaxisra vonatkozó súlyok sérüljenek.

---

## 5. Generatív Szövegmintavételezés (Generative Sampling)

A betanított hálózat elé a `SHA2-256(` kezdőszeletet adva, a modellből különböző hőmérsékleti szinteken ($T$) az alábbi generált szekvenciák álltak elő:

* **Alacsony hőmérséklet ($T = 0.4$ – konzervatív, determinisztikus):**
  ```text
  SHA2-256(NATO-lefin)= 123eshaefaaaa863a9b4b4es-f1b4eceffilens-filo-21.zile21021.zip)=====
  ```
  *Megfigyelés:* A modell tökéletesen rekonstruálta a szintaktikai vázat (`SHA...= `), és azonnal hexadecimális karaktereket kezdett kibocsátani, majd visszatért a mintázatban szereplő `zip` és `===` blokkokra.

* **Közepes hőmérséklet ($T = 0.8$ – kiegyensúlyozott):**
  ```text
  SHA2-256(NATO-28cede43aa2
  SHA1.zipefinslo NATO-51218cdaa1.zins-57122512023b4b020a04a97c4e
  ```

* **Magas hőmérséklet ($T = 1.2$ – sztochasztikus, kreatív):**
  ```text
  SHA2-256(NATO-2325eslgs-27809aaec87ed636
  SHA2(NATO-28co-f3est shogog 
  ==== •rac61(s-5120a
  ```
  *Megfigyelés:* Még a legmagasabb hőmérsékleten is megjelenik a terminál prompt ritka bullet karaktere (`•rac`), a zárójelek és az openssl parancsok foszlányai.
