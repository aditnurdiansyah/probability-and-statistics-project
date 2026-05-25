# PANDUAN LENGKAP PROJECT MATA KULIAH PROBABILITAS DAN STATISTIKA
## Uji Hipotesis bagi Rata-Rata Satu Populasi – Ragam Populasi Diketahui (Uji Z)
### Tutorial di RStudio

---

# BAGIAN 1 — ANALISIS TUGAS DOSEN

## 1.1 Rincian Requirement Tugas

Berdasarkan file penugasan dosen, berikut adalah breakdown lengkap requirement yang wajib dipenuhi:

| No | Requirement | Keterangan |
|----|------------|------------|
| 1 | Kelompok 4–5 anggota | Kelompok Anda: **5 anggota** ✔ |
| 2 | Topik | **Uji Z – Ragam Populasi Diketahui (Satu Populasi)** |
| 3 | Tool yang digunakan | **RStudio** (bukan Excel) |
| 4 | Data | Bebas / boleh dummy |
| 5 | Media rekam | **Google Meet (GMEET)** via Laptop/PC |
| 6 | Format video | Narasi 1 orang + share screen, **TANPA background music** |
| 7 | Dokumentasi | File **.pdf** step-by-step tutorial |
| 8 | Upload PDF | Di **GitHub** salah satu anggota |
| 9 | Pengumpulan | Link video + link GitHub dikumpulkan |
| 10 | Deadline | **07 Juni 2026** |

## 1.2 Output Akhir yang Harus Dikumpulkan

Terdapat **dua output utama** yang harus dikumpulkan:

**Output 1 — Video Tutorial**
- Direkam melalui Google Meet
- Isi: narasi (1 orang) + share screen RStudio
- Tidak ada background music
- Tidak menggunakan HP
- Link video dikumpulkan melalui file pengumpulan yang disediakan dosen

**Output 2 — Dokumentasi PDF**
- File PDF berisi langkah-langkah tutorial secara tertulis
- Diunggah ke repositori GitHub salah satu anggota
- Link GitHub dikumpulkan bersamaan dengan link video

## 1.3 Risiko Kesalahan yang Harus Dihindari

Berikut adalah daftar risiko kesalahan yang paling umum dan cara menghindarinya:

| Risiko | Cara Menghindari |
|--------|-----------------|
| Menggunakan HP untuk rekam | Pastikan hanya menggunakan laptop/PC untuk bergabung ke GMEET |
| Lupa aktifkan rekam GMEET | Cek fitur "Record meeting" di GMEET sebelum memulai narasi |
| Background music aktif | Matikan semua pemutar musik sebelum rekam |
| Suara tidak terdengar | Test microphone sebelum rekam; gunakan headset jika perlu |
| Kode R error saat live demo | Jalankan dan verifikasi semua kode SEBELUM rekam |
| PDF tidak lengkap | Sertakan semua screenshot output RStudio di PDF |
| GitHub link tidak bisa diakses | Set repositori GitHub ke **Public** |
| Topik salah | Konfirmasi: topik adalah Uji Z SATU populasi, ragam DIKETAHUI |
| Menggunakan Uji-t alih-alih Uji-Z | Uji-t digunakan jika ragam TIDAK diketahui; Uji-Z jika ragam DIKETAHUI |

## 1.4 Hal-Hal Teknis yang Wajib Diperhatikan

**Tentang Konsep Statistik:**
- Uji Z untuk satu populasi digunakan ketika **simpangan baku populasi (σ) sudah diketahui**
- Rumus statistik uji: **Z_h = (x̄ - μ₀) / (σ / √n)**
- Karena σ diketahui, fungsi yang digunakan di R adalah **perhitungan manual** (bukan `t.test()`), mengikuti pola Contoh Kasus (2) dari modul dosen

**Tentang Kode R:**
- Tidak ada fungsi bawaan R khusus untuk Uji Z satu populasi dengan σ diketahui
- Harus dihitung manual menggunakan `pnorm()` dan `qnorm()`
- Pastikan arah uji (dua arah / satu arah) sesuai dengan H1

**Tentang Video:**
- Resolusi minimal 720p agar teks di RStudio terbaca jelas
- Zoom font RStudio ke ukuran 14–16pt sebelum rekam
- Gunakan tema RStudio yang kontras (putih/terang) agar mudah dibaca

## 1.5 Checklist Final Sebelum Pengumpulan

```
CHECKLIST VIDEO
[ ] Video direkam via GMEET menggunakan Laptop/PC
[ ] Narasi hanya 1 orang (bukan bergantian berbicara)
[ ] Share screen menampilkan RStudio dengan jelas
[ ] Tidak ada background music
[ ] Suara narasi terdengar jelas
[ ] Seluruh langkah kode R ditampilkan dan dijalankan
[ ] Output RStudio terlihat jelas di video
[ ] Video berdurasi wajar (±10–15 menit)
[ ] Link video berhasil diakses oleh orang lain (cek dari akun berbeda)

CHECKLIST PDF DOKUMENTASI
[ ] PDF berisi narasi kasus/soal
[ ] PDF berisi langkah-langkah kode R secara berurutan
[ ] PDF berisi screenshot output RStudio
[ ] PDF berisi interpretasi hasil
[ ] PDF berisi kesimpulan
[ ] PDF telah diunggah ke GitHub

CHECKLIST GITHUB
[ ] Repositori berstatus PUBLIC (bukan private)
[ ] File PDF berhasil diakses dari link GitHub
[ ] Nama file PDF jelas dan profesional

CHECKLIST PENGUMPULAN
[ ] Link video sudah tercatat
[ ] Link GitHub sudah tercatat
[ ] Dikumpulkan sebelum 07 Juni 2026
```

---

# BAGIAN 2 — CONTOH KASUS (MODEL SEPERTI CONTOH KASUS (2) DI MODUL DOSEN)

## 2.1 Narasi Kasus

> **Manajer Produksi sebuah pabrik minuman kemasan menduga bahwa rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei adalah 600 ml. Untuk memverifikasi dugaan tersebut, diambil sampel acak sebanyak 40 botol dan diperoleh rata-rata volume sampel sebesar 597,5 ml. Berdasarkan data historis produksi, diketahui bahwa simpangan baku volume isi botol untuk seluruh populasi produksi adalah 8 ml. Ujilah dugaan Manajer Produksi tersebut pada taraf nyata 5%.**

## 2.2 Parameter yang Diketahui

| Parameter | Simbol | Nilai |
|-----------|--------|-------|
| Rata-rata hipotesis (nilai yang diuji) | μ₀ | 600 ml |
| Rata-rata sampel | x̄ | 597,5 ml |
| Simpangan baku populasi (DIKETAHUI) | σ | 8 ml |
| Ragam populasi | σ² | 64 ml² |
| Ukuran sampel | n | 40 botol |
| Taraf nyata | α | 0,05 (5%) |
| Jenis uji | — | Dua arah (two-tailed) |

**Alasan menggunakan Uji Z:** Karena simpangan baku populasi (σ = 8 ml) **sudah diketahui**, maka uji yang tepat adalah Uji-Z, bukan Uji-t.

## 2.3 Perumusan Hipotesis

Karena dugaan Manajer adalah bahwa rata-rata "adalah" 600 ml (tanpa arah spesifik lebih besar atau lebih kecil), maka ini merupakan **hipotesis dua arah**:

- **H₀ : μ = 600** → Rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei adalah 600 ml
- **H₁ : μ ≠ 600** → Rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei tidak sama dengan 600 ml

## 2.4 Perhitungan Manual Step-by-Step

### Langkah 1 — Identifikasi semua nilai yang diketahui

```
DIK:
  μ₀  = 600    (rata-rata populasi menurut H0)
  x̄   = 597,5  (rata-rata sampel)
  σ   = 8      (simpangan baku POPULASI, diketahui)
  n   = 40     (ukuran sampel)
  α   = 0,05   (taraf nyata)
```

### Langkah 2 — Hitung Standard Error (SE)

Standard Error adalah simpangan baku dari distribusi sampling rata-rata:

```
SE = σ / √n
   = 8 / √40
   = 8 / 6,3246
   = 1,2649
```

### Langkah 3 — Hitung Statistik Uji Z (Z_hitung)

Rumus:
```
Z_h = (x̄ - μ₀) / SE
    = (597,5 - 600) / 1,2649
    = (-2,5) / 1,2649
    = -1,9764
```

### Langkah 4 — Tentukan Nilai Kritis (Z_tabel)

Karena uji dua arah dengan α = 0,05:
```
Z_kritis = Z_(α/2) = Z_(0,025) = ±1,96

Batas bawah penolakan : -1,96
Batas atas penolakan  : +1,96
```

### Langkah 5 — Hitung P-value

Karena uji dua arah:
```
P-value = 2 × P(Z > |Z_hitung|)
        = 2 × P(Z > |-1,9764|)
        = 2 × P(Z > 1,9764)
        = 2 × (1 - Φ(1,9764))
        = 2 × 0,0241
        = 0,0482
```

### Langkah 6 — Kriteria Pengujian

```
Tolak H₀ jika:
  |Z_hitung| > Z_(α/2)
  |Z_hitung| > 1,96
ATAU
  P-value ≤ α = 0,05
```

### Langkah 7 — Pengambilan Keputusan

```
Berdasarkan Z-statistik:
  |Z_hitung| = |-1,9764| = 1,9764
  Z_kritis   = 1,96
  Karena 1,9764 > 1,96 → H₀ DITOLAK

Berdasarkan P-value:
  P-value = 0,0482
  α       = 0,05
  Karena 0,0482 ≤ 0,05 → H₀ DITOLAK
```

### Langkah 8 — Kesimpulan

**Pada taraf nyata 5%, terdapat cukup bukti statistik untuk menolak dugaan Manajer Produksi. Artinya, rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei secara signifikan berbeda dari 600 ml.**

---

# BAGIAN 4 — IMPLEMENTASI DI RSTUDIO

## 4.1 Persiapan Awal: Membuka RStudio

**Step 1: Membuka RStudio**
1. Klik tombol Start / Launchpad di komputer Anda
2. Cari aplikasi "RStudio" dan klik untuk membuka
3. Tunggu hingga tampilan RStudio muncul sepenuhnya
4. RStudio terdiri dari 4 panel: Source (kiri atas), Console (kiri bawah), Environment (kanan atas), Files/Plots (kanan bawah)

**Step 2: Membuat Script Baru**
1. Klik menu **File** → **New File** → **R Script**
2. Atau tekan shortcut **Ctrl + Shift + N** (Windows/Linux) / **Cmd + Shift + N** (Mac)
3. Sebuah tab baru (Untitled1) akan muncul di panel Source (kiri atas)

**Step 3: Menyimpan Script**
1. Tekan **Ctrl + S** (Windows) / **Cmd + S** (Mac)
2. Beri nama file: `uji_z_volume_botol.R`
3. Pilih lokasi penyimpanan yang mudah ditemukan (misalnya folder Desktop)
4. Klik Save

**Step 4: Pengaturan Tampilan (untuk video)**
- Klik **Tools** → **Global Options** → **Appearance**
- Ubah font size ke **14** agar teks terlihat jelas saat direkam
- Klik Apply → OK

---

## 4.2 Kode R Lengkap dengan Penjelasan Setiap Baris

Ketik kode berikut ini secara bertahap di panel Source (BUKAN di Console). Penjelasan setiap baris diberikan sebagai komentar (#).

```r
# ============================================================
# TUTORIAL: UJI HIPOTESIS RATA-RATA SATU POPULASI
# RAGAM POPULASI DIKETAHUI (UJI Z)
# ============================================================
# Kasus: Volume Isi Botol Air Mineral
# Mata Kuliah: Probabilitas dan Statistika
# ============================================================

# -----------------------------------------------------------
# LANGKAH 1: MASUKKAN SEMUA PARAMETER YANG DIKETAHUI
# -----------------------------------------------------------

mu_hipotesis   <- 600    # Rata-rata populasi menurut H0 (dugaan awal)
x_bar          <- 597.5  # Rata-rata sampel yang diperoleh dari pengukuran
sigma_populasi <- 8      # Simpangan baku POPULASI (diketahui dari data historis)
n              <- 40     # Jumlah botol dalam sampel
alpha          <- 0.05   # Taraf nyata (tingkat signifikansi) = 5%

# -----------------------------------------------------------
# LANGKAH 2: HITUNG STANDARD ERROR (SE)
# -----------------------------------------------------------
# Standard Error adalah simpangan baku dari distribusi sampling
# Rumus: SE = sigma / sqrt(n)

se <- sigma_populasi / sqrt(n)
# Penjelasan: sqrt(n) menghitung akar kuadrat dari n

# -----------------------------------------------------------
# LANGKAH 3: HITUNG Z-STATISTIK (Z-HITUNG)
# -----------------------------------------------------------
# Rumus: Z_h = (x_bar - mu_hipotesis) / SE

z_hitung <- (x_bar - mu_hipotesis) / se
# Penjelasan: Menghitung seberapa jauh rata-rata sampel dari
#             rata-rata hipotesis, diukur dalam satuan SE

# -----------------------------------------------------------
# LANGKAH 4: HITUNG P-VALUE UNTUK UJI DUA ARAH
# -----------------------------------------------------------
# Untuk uji dua arah: P-value = 2 * P(Z > |z_hitung|)
# pnorm() menghitung probabilitas distribusi normal
# abs() mengambil nilai absolut (membuat positif)
# lower.tail = FALSE → menghitung P(Z > nilai)

p_value <- 2 * pnorm(abs(z_hitung), lower.tail = FALSE)

# -----------------------------------------------------------
# LANGKAH 5: HITUNG NILAI Z-KRITIS (Z-TABEL)
# -----------------------------------------------------------
# Untuk uji dua arah: batas penolakan ada di dua sisi
# qnorm() menghitung nilai Z untuk probabilitas tertentu

z_kritis_atas  <- qnorm(p = alpha / 2, lower.tail = FALSE)
# Batas atas: nilai Z positif (ekor kanan)

z_kritis_bawah <- qnorm(p = alpha / 2, lower.tail = TRUE)
# Batas bawah: nilai Z negatif (ekor kiri)

# -----------------------------------------------------------
# LANGKAH 6: TAMPILKAN OUTPUT HASIL UJI LENGKAP
# -----------------------------------------------------------

cat("============================================================\n")
cat("       HASIL UJI HIPOTESIS & INTERPRETASI LENGKAP          \n")
cat("============================================================\n\n")

cat("PARAMETER YANG DIKETAHUI:\n")
cat(sprintf("  Rata-rata Hipotesis (μ₀)        : %.1f ml\n", mu_hipotesis))
cat(sprintf("  Rata-rata Sampel (x̄)            : %.1f ml\n", x_bar))
cat(sprintf("  Simpangan Baku Populasi (σ)      : %.1f ml\n", sigma_populasi))
cat(sprintf("  Ukuran Sampel (n)               : %d botol\n", n))
cat(sprintf("  Standard Error (SE = σ/√n)      : %.4f\n", se))
cat("------------------------------------------------------------\n")

cat("HIPOTESIS:\n")
cat("  H0: μ = 600  (rata-rata volume = 600 ml)\n")
cat("  H1: μ ≠ 600  (rata-rata volume ≠ 600 ml)\n")
cat("------------------------------------------------------------\n")

cat(sprintf("  Tingkat Signifikansi (α)        : %.2f\n", alpha))
cat(sprintf("  Z-Hitung (z-statistic)          : %.4f\n", z_hitung))
cat(sprintf("  Z-Kritis (Batas Bawah & Atas)   : %.4f & %.4f\n",
            z_kritis_bawah, z_kritis_atas))
cat(sprintf("  P-value                         : %.4f\n", p_value))
cat("------------------------------------------------------------\n\n")

# -----------------------------------------------------------
# LANGKAH 7: PENGAMBILAN KEPUTUSAN (DUA CARA)
# -----------------------------------------------------------

# CARA 1: Berdasarkan P-value
cat("  Keputusan berdasarkan P-Value:\n")
if (p_value <= alpha) {
  cat(sprintf("  Karena P-value (%.4f) <= alpha (%.2f),\n", p_value, alpha))
  cat("  maka Hipotesis Nol DITOLAK.\n")
} else {
  cat(sprintf("  Karena P-value (%.4f) > alpha (%.2f),\n", p_value, alpha))
  cat("  maka Hipotesis Nol GAGAL DITOLAK.\n")
}

cat("\n")

# CARA 2: Berdasarkan Z-Statistik
cat("  Keputusan berdasarkan Z-Statistik:\n")
if (z_hitung < z_kritis_bawah || z_hitung > z_kritis_atas) {
  cat(sprintf("  Karena Z-Hitung (%.4f) berada di LUAR\n", z_hitung))
  cat(sprintf("  rentang Z-Kritis (%.4f s.d. %.4f),\n",
              z_kritis_bawah, z_kritis_atas))
  cat("  maka Hipotesis Nol DITOLAK.\n")
} else {
  cat(sprintf("  Karena Z-Hitung (%.4f) berada di DALAM\n", z_hitung))
  cat(sprintf("  rentang Z-Kritis (%.4f s.d. %.4f),\n",
              z_kritis_bawah, z_kritis_atas))
  cat("  maka Hipotesis Nol GAGAL DITOLAK.\n")
}

cat("\n")

# -----------------------------------------------------------
# LANGKAH 8: KESIMPULAN AKHIR
# -----------------------------------------------------------

cat("============================================================\n")
cat("KESIMPULAN:\n")
if (p_value <= alpha) {
  cat("Dengan taraf nyata 5%, terdapat cukup bukti statistik\n")
  cat("untuk menolak dugaan Manajer Produksi.\n")
  cat("Artinya, rata-rata volume isi botol air mineral yang\n")
  cat("diproduksi pada bulan Mei secara signifikan BERBEDA\n")
  cat("dari 600 ml.\n")
} else {
  cat("Dengan taraf nyata 5%, tidak terdapat cukup bukti\n")
  cat("statistik untuk menolak dugaan Manajer Produksi.\n")
  cat("Artinya, tidak ada cukup bukti untuk menyatakan bahwa\n")
  cat("rata-rata volume isi botol berbeda dari 600 ml.\n")
}
cat("============================================================\n")
```

---

## 4.3 Cara Menjalankan Kode

**Opsi A: Jalankan semua sekaligus**
1. Pastikan kursor berada di panel Source
2. Tekan **Ctrl + A** untuk memilih semua kode
3. Tekan **Ctrl + Enter** (Windows) / **Cmd + Enter** (Mac)
4. Semua kode akan berjalan di panel Console

**Opsi B: Jalankan baris per baris (direkomendasikan untuk tutorial)**
1. Klik pada baris pertama kode
2. Tekan **Ctrl + Enter** untuk menjalankan baris tersebut
3. Lanjutkan ke baris berikutnya
4. Perhatikan output yang muncul di Console setelah setiap langkah

---

## 4.4 Output yang Diharapkan

Setelah menjalankan seluruh kode, Console akan menampilkan:

```
============================================================
       HASIL UJI HIPOTESIS & INTERPRETASI LENGKAP          
============================================================

PARAMETER YANG DIKETAHUI:
  Rata-rata Hipotesis (μ₀)        : 600.0 ml
  Rata-rata Sampel (x̄)            : 597.5 ml
  Simpangan Baku Populasi (σ)      : 8.0 ml
  Ukuran Sampel (n)               : 40 botol
  Standard Error (SE = σ/√n)      : 1.2649
------------------------------------------------------------
HIPOTESIS:
  H0: μ = 600  (rata-rata volume = 600 ml)
  H1: μ ≠ 600  (rata-rata volume ≠ 600 ml)
------------------------------------------------------------
  Tingkat Signifikansi (α)        : 0.05
  Z-Hitung (z-statistic)          : -1.9764
  Z-Kritis (Batas Bawah & Atas)   : -1.9600 & 1.9600
  P-value                         : 0.0482
------------------------------------------------------------

  Keputusan berdasarkan P-Value:
  Karena P-value (0.0482) <= alpha (0.05),
  maka Hipotesis Nol DITOLAK.

  Keputusan berdasarkan Z-Statistik:
  Karena Z-Hitung (-1.9764) berada di LUAR
  rentang Z-Kritis (-1.9600 s.d. 1.9600),
  maka Hipotesis Nol DITOLAK.

============================================================
KESIMPULAN:
Dengan taraf nyata 5%, terdapat cukup bukti statistik
untuk menolak dugaan Manajer Produksi.
Artinya, rata-rata volume isi botol air mineral yang
diproduksi pada bulan Mei secara signifikan BERBEDA
dari 600 ml.
============================================================
```

---

## 4.5 Cara Membaca Hasil

| Nilai | Makna |
|-------|-------|
| SE = 1,2649 | Simpangan baku distribusi sampling; seberapa bervariasi rata-rata sampel antar sampel |
| Z-Hitung = -1,9764 | Rata-rata sampel berada 1,9764 simpangan baku DI BAWAH nilai hipotesis (600 ml) |
| Z-Kritis = ±1,96 | Batas daerah penolakan; jika Z-Hitung di luar rentang ini, H0 ditolak |
| P-value = 0,0482 | Probabilitas mendapatkan hasil ekstrem seperti ini jika H0 benar; 4,82% |
| Keputusan: TOLAK H0 | Karena P-value (0,0482) < α (0,05) dan Z-Hitung berada di luar Z-Kritis |

---

# BAGIAN 5 — SKENARIO VIDEO TUTORIAL

## Struktur Video (Durasi Total Estimasi: ±12–15 Menit)

---

### A. OPENING (±1 menit)

**Isi Screen:** Tampilan Google Meet — semua anggota terlihat di kamera, kemudian beralih ke share screen berupa slide pembuka.

**Slide Pembuka memuat:**
- Judul: "Tutorial Uji Hipotesis – Uji Z Satu Populasi (Ragam Diketahui)"
- Mata Kuliah: Probabilitas dan Statistika
- Nama kelompok dan NIM semua anggota
- Logo kampus (jika ada)

**Narasi (dibacakan 1 anggota):**
> "Assalamu'alaikum warahmatullahi wabarakatuh. Selamat datang di tutorial Uji Hipotesis mata kuliah Probabilitas dan Statistika. Pada kesempatan kali ini, kelompok kami akan mempresentasikan tutorial mengenai Uji Hipotesis bagi Rata-rata Satu Populasi dengan Ragam Populasi yang Diketahui, atau yang dikenal dengan Uji Z."

---

### B. PERKENALAN KELOMPOK (±1 menit)

**Isi Screen:** Slide perkenalan anggota (nama, NIM, peran masing-masing).

**Narasi:**
> "Perkenalkan, kami dari Kelompok [nomor kelompok]. Anggota kelompok kami terdiri dari: [Nama 1 - NIM], [Nama 2 - NIM], [Nama 3 - NIM], [Nama 4 - NIM], dan [Nama 5 - NIM]. Pada tutorial ini, yang akan bertugas sebagai narator adalah saya, [Nama Narator]."

---

### C. PENJELASAN MATERI SINGKAT (±2 menit)

**Isi Screen:** Slide berisi poin-poin teori Uji Z.

**Narasi:**
> "Sebelum masuk ke tutorial, izinkan kami menjelaskan secara singkat konsep dasar Uji-Z untuk satu populasi.
>
> Uji-Z digunakan untuk menguji hipotesis mengenai rata-rata suatu populasi ketika simpangan baku populasi, yaitu sigma (σ), sudah diketahui. Ini berbeda dengan Uji-t yang digunakan ketika sigma tidak diketahui.
>
> Ada tiga jenis hipotesis yang bisa digunakan: pertama, uji dua arah, di mana H1 menggunakan tanda 'tidak sama dengan'; kedua, uji satu arah ekor kanan, dengan H1 'lebih besar dari'; dan ketiga, uji satu arah ekor kiri, dengan H1 'lebih kecil dari'.
>
> Rumus statistik uji yang digunakan adalah: Z-hitung sama dengan x-bar dikurangi mu-nol, dibagi dengan sigma dibagi akar n. Di mana x-bar adalah rata-rata sampel, mu-nol adalah rata-rata hipotesis, sigma adalah simpangan baku populasi, dan n adalah ukuran sampel."

---

### D. PENJELASAN KASUS (±2 menit)

**Isi Screen:** Slide atau dokumen teks yang menampilkan narasi kasus.

**Narasi:**
> "Sekarang kita akan masuk ke contoh kasus yang akan kita selesaikan bersama.
>
> Kasus: Manajer Produksi sebuah pabrik minuman kemasan menduga bahwa rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei adalah 600 ml. Untuk memverifikasi dugaan tersebut, diambil sampel acak sebanyak 40 botol dan diperoleh rata-rata volume sampel sebesar 597,5 ml. Berdasarkan data historis produksi, diketahui bahwa simpangan baku volume isi botol untuk seluruh populasi produksi adalah 8 ml. Ujilah dugaan Manajer Produksi tersebut pada taraf nyata 5%.
>
> Dari kasus ini, kita dapat mengidentifikasi parameter yang diketahui:
> - Rata-rata hipotesis (mu nol) = 600 ml
> - Rata-rata sampel (x-bar) = 597,5 ml
> - Simpangan baku populasi (sigma) = 8 ml — dan ini DIKETAHUI, sehingga kita menggunakan Uji-Z
> - Jumlah sampel (n) = 40 botol
> - Taraf nyata (alpha) = 0,05 atau 5%
>
> Karena dugaan Manajer adalah nilai 'adalah' 600 ml tanpa menyebut arah, maka hipotesis yang kita buat adalah dua arah:
> - H0: mu sama dengan 600
> - H1: mu tidak sama dengan 600"

---

### E. TUTORIAL DI RSTUDIO (±6 menit)

**Isi Screen:** Share screen menampilkan RStudio secara langsung.

**Narasi (sambil mengetik dan menjalankan kode):**

> "Baik, sekarang kita beralih ke RStudio. Pertama-tama, saya akan membuat script baru. Saya klik File, New File, R Script."

*(Buat file baru)*

> "Sekarang saya ketikkan komentar judul terlebih dahulu sebagai penanda. Saya gunakan tanda pagar untuk membuat komentar, artinya baris ini tidak akan dieksekusi oleh R."

*(Ketik header komentar)*

> "Langkah pertama: kita masukkan semua parameter yang diketahui dari soal. Saya definisikan mu_hipotesis sama dengan 600. Ini adalah nilai yang akan kita uji. Lalu x_bar sama dengan 597,5, yaitu rata-rata sampel yang kita ukur. Kemudian sigma_populasi sama dengan 8, ini adalah simpangan baku populasi yang SUDAH DIKETAHUI. Kemudian n sama dengan 40, jumlah sampel. Dan alpha sama dengan 0,05, taraf nyata kita."

*(Ketik dan jalankan Langkah 1)*

> "Langkah kedua: kita hitung Standard Error. Saya ketik: se sama dengan sigma_populasi dibagi sqrt n. Fungsi sqrt adalah akar kuadrat di R. Saya jalankan dengan Ctrl+Enter."

*(Jalankan Langkah 2, tunjukkan hasil di Console)*

> "Kita bisa lihat di Console bahwa nilai se adalah 1,2649. Ini adalah simpangan baku dari distribusi sampling."

> "Langkah ketiga: hitung Z-hitung. Rumusnya adalah x_bar dikurangi mu_hipotesis dibagi se. Saya ketik dan jalankan."

*(Jalankan Langkah 3)*

> "Z-hitung kita adalah -1,9764. Nilai negatif berarti rata-rata sampel kita berada di bawah rata-rata hipotesis."

> "Langkah keempat: hitung P-value untuk uji dua arah. Kita gunakan fungsi pnorm. Karena uji dua arah, kita kalikan 2 dengan probabilitas ekor. Fungsi abs mengambil nilai absolut dari z-hitung. Argumen lower.tail sama dengan FALSE berarti kita menghitung probabilitas di sebelah kanan."

*(Jalankan Langkah 4)*

> "P-value kita adalah 0,0482, artinya 4,82 persen."

> "Langkah kelima: hitung Z-kritis. Kita gunakan fungsi qnorm. Untuk uji dua arah, alpha dibagi 2 sama dengan 0,025. Z-kritis batas atas adalah 1,96 dan batas bawah adalah -1,96."

*(Jalankan Langkah 5)*

> "Sekarang langkah keenam, kita tampilkan semua output secara rapi menggunakan fungsi cat dan sprintf. Saya jalankan seluruh blok output sekaligus."

*(Jalankan Langkah 6)*

> "Dan kita jalankan pengambilan keputusan dan kesimpulan."

*(Jalankan Langkah 7 dan 8)*

---

### F. INTERPRETASI HASIL (±1,5 menit)

**Isi Screen:** Console RStudio menampilkan output akhir.

**Narasi:**
> "Sekarang kita baca bersama hasil yang muncul di Console.
>
> Z-Hitung kita adalah -1,9764. Z-Kritis batas bawah adalah -1,96 dan batas atas adalah 1,96.
>
> Karena Z-Hitung -1,9764 lebih kecil dari Z-Kritis bawah -1,96, artinya Z-Hitung berada di LUAR rentang Z-Kritis. Dengan demikian, Hipotesis Nol DITOLAK.
>
> Dikonfirmasi pula oleh P-value: P-value sebesar 0,0482 lebih kecil dari alpha 0,05, sehingga H0 ditolak.
>
> Kesimpulannya: Dengan taraf nyata 5%, terdapat cukup bukti statistik untuk menolak dugaan Manajer Produksi bahwa rata-rata volume isi botol adalah 600 ml. Artinya, rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei secara signifikan BERBEDA dari 600 ml."

---

### G. PENUTUP (±0,5 menit)

**Isi Screen:** Slide penutup dengan ucapan terima kasih.

**Narasi:**
> "Demikian tutorial Uji Hipotesis bagi Rata-rata Satu Populasi dengan Ragam Populasi yang Diketahui menggunakan RStudio dari kelompok kami. Dokumentasi PDF lengkap dari tutorial ini dapat diakses melalui link GitHub yang tercantum di file pengumpulan. Terima kasih atas perhatiannya. Wassalamu'alaikum warahmatullahi wabarakatuh."

---

# BAGIAN 6 — SCRIPT NARASI VIDEO (FULL)

Berikut adalah naskah narasi lengkap yang siap dibacakan oleh satu anggota:

---

**[OPENING – Saat slide pembuka ditampilkan]**

"Assalamu'alaikum warahmatullahi wabarakatuh.

Selamat datang di tutorial Uji Hipotesis mata kuliah Probabilitas dan Statistika. Pada kesempatan kali ini, kelompok kami akan mempresentasikan tutorial mengenai Uji Hipotesis bagi Rata-rata Satu Populasi dengan Ragam Populasi yang Diketahui — atau yang dikenal dengan Uji-Z."

---

**[PERKENALAN – Saat slide anggota ditampilkan]**

"Perkenalkan, kami dari Kelompok [nomor kelompok]. Anggota kelompok kami terdiri dari lima orang, yaitu: [Nama 1], [Nama 2], [Nama 3], [Nama 4], dan [Nama 5]. Yang bertugas sebagai narator pada tutorial ini adalah saya, [nama narator]."

---

**[PENJELASAN TEORI – Saat slide teori ditampilkan]**

"Sebelum masuk ke tutorial, izinkan kami menjelaskan secara singkat konsep dasar Uji-Z untuk satu populasi.

Uji-Z digunakan untuk menguji hipotesis mengenai rata-rata suatu populasi. Syarat utama penggunaan Uji-Z adalah simpangan baku populasi, yaitu sigma, harus sudah diketahui sebelumnya. Jika sigma tidak diketahui, maka yang digunakan adalah Uji-t.

Rumus statistik uji yang digunakan adalah Z-hitung, yang dihitung dengan cara: x-bar dikurangi mu-nol, kemudian dibagi dengan sigma dibagi akar n.

Di sini: x-bar adalah rata-rata sampel yang kita ukur, mu-nol adalah nilai rata-rata yang kita hipotesiskan, sigma adalah simpangan baku populasi yang sudah diketahui, dan n adalah jumlah data dalam sampel.

Keputusan uji didasarkan pada dua cara: pertama, membandingkan Z-hitung dengan Z-kritis; dan kedua, membandingkan P-value dengan taraf nyata alpha."

---

**[PENJELASAN KASUS – Saat slide kasus ditampilkan]**

"Sekarang kita masuk ke contoh kasus yang akan kita selesaikan bersama menggunakan RStudio.

Kasusnya adalah sebagai berikut: Manajer Produksi sebuah pabrik minuman kemasan menduga bahwa rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei adalah 600 ml. Untuk memverifikasi dugaan tersebut, diambil sampel acak sebanyak 40 botol. Dari sampel tersebut, diperoleh rata-rata volume sebesar 597,5 ml. Berdasarkan data historis produksi, diketahui bahwa simpangan baku volume isi botol untuk seluruh populasi adalah 8 ml. Kita diminta untuk menguji dugaan Manajer Produksi tersebut pada taraf nyata 5%.

Dari kasus ini, kita identifikasi parameter yang diketahui:
- Mu nol sama dengan 600 ml — ini adalah dugaan awal yang akan kita uji
- X-bar sama dengan 597,5 ml — rata-rata dari 40 botol yang kita ukur
- Sigma sama dengan 8 ml — simpangan baku populasi yang sudah diketahui, sehingga kita gunakan Uji-Z
- N sama dengan 40 botol
- Alpha sama dengan 0,05 atau 5 persen

Karena dugaan Manajer menyatakan rata-rata 'adalah' 600 ml tanpa menyebut arah lebih besar atau lebih kecil, maka ini adalah uji dua arah:
- H-nol: mu sama dengan 600 — rata-rata volume botol adalah 600 ml
- H-satu: mu tidak sama dengan 600 — rata-rata volume botol tidak sama dengan 600 ml"

---

**[TUTORIAL RSTUDIO – Saat RStudio dibuka dan kode diketik]**

"Baik, sekarang kita beralih ke RStudio. Pertama saya buka RStudio, kemudian membuat file script baru. Caranya klik File, pilih New File, lalu R Script. Sebuah tab baru akan muncul di panel kiri atas.

Baik, sekarang kita mulai mengetik kode. Saya awali dengan memberi judul di baris komentar agar script kita rapi dan informatif.

Langkah pertama: kita definisikan semua parameter yang diketahui. Saya ketik: mu_hipotesis diisi 600, x_bar diisi 597,5, sigma_populasi diisi 8, n diisi 40, dan alpha diisi 0,05. Saya pilih semua baris ini dan tekan Ctrl+Enter untuk menjalankannya. Perhatikan di panel Environment sebelah kanan, semua variabel sudah terdefinisi.

Langkah kedua: kita hitung Standard Error. Standard Error adalah simpangan baku dari distribusi sampling, yang dihitung dengan sigma dibagi akar n. Saya ketik: se sama dengan sigma_populasi dibagi sqrt dari n. Saya jalankan. Di Console muncul nilai se sama dengan 1,2649. Artinya, simpangan baku distribusi sampling rata-rata kita adalah 1,2649 ml.

Langkah ketiga: hitung Z-hitung. Rumusnya adalah x-bar dikurangi mu-hipotesis dibagi se. Saya ketik dan jalankan. Z-hitung kita adalah -1,9764. Nilai negatif ini berarti rata-rata sampel kita berada sedikit di bawah rata-rata hipotesis.

Langkah keempat: hitung P-value untuk uji dua arah. Karena dua arah, kita kalikan 2 dengan probabilitas di salah satu ekor. Saya gunakan fungsi pnorm dengan argumen abs dari z-hitung dan lower.tail sama dengan FALSE. Saya jalankan. P-value kita adalah 0,0482.

Langkah kelima: hitung Z-kritis. Untuk uji dua arah dengan alpha 0,05, kita gunakan alpha dibagi 2 sama dengan 0,025. Saya gunakan fungsi qnorm. Z-kritis batas atas adalah 1,9600 dan batas bawah adalah -1,9600. Nilai ini sesuai dengan yang ada di tabel Z standar.

Langkah keenam: kita tampilkan semua output secara rapi menggunakan fungsi cat dan sprintf. Fungsi cat digunakan untuk mencetak teks, dan sprintf digunakan untuk memformat angka. Saya jalankan seluruh blok output ini.

Dan kita lihat di Console, seluruh hasil sudah tampil dengan rapi dan terstruktur.

Langkah ketujuh: pengambilan keputusan. Kita gunakan struktur if-else untuk membuat keputusan otomatis. Untuk cara pertama berdasarkan P-value: jika P-value lebih kecil atau sama dengan alpha, maka H0 ditolak. Karena P-value kita 0,0482 lebih kecil dari 0,05, output menyatakan H0 DITOLAK.

Untuk cara kedua berdasarkan Z-statistik: jika Z-hitung berada di luar rentang Z-kritis, maka H0 ditolak. Karena -1,9764 berada di luar rentang -1,96 sampai 1,96, output menyatakan H0 DITOLAK.

Langkah terakhir: kesimpulan akhir ditampilkan secara otomatis oleh kode kita."

---

**[INTERPRETASI – Saat output Console ditampilkan]**

"Mari kita baca bersama kesimpulan yang dihasilkan oleh program kita.

Z-Hitung adalah -1,9764. Z-Kritis bawah adalah -1,9600 dan batas atas 1,9600.

Karena Z-Hitung -1,9764 lebih kecil dari Z-Kritis bawah -1,9600, Z-Hitung berada di luar rentang kritis, sehingga H0 DITOLAK.

Dikonfirmasi oleh P-value: P-value 0,0482 lebih kecil dari alpha 0,05, sehingga H0 DITOLAK.

Dengan demikian, kesimpulan kita adalah: Dengan taraf nyata 5%, terdapat cukup bukti statistik untuk menolak dugaan Manajer Produksi. Artinya, rata-rata volume isi botol air mineral yang diproduksi pada bulan Mei secara signifikan berbeda dari 600 ml."

---

**[PENUTUP]**

"Demikianlah tutorial Uji Hipotesis bagi Rata-rata Satu Populasi dengan Ragam Populasi yang Diketahui menggunakan RStudio dari kelompok kami.

Dokumentasi PDF lengkap dari tutorial ini dapat diakses melalui link GitHub yang tercantum di file pengumpulan yang disediakan dosen.

Kami berharap tutorial ini bermanfaat dan dapat membantu pemahaman rekan-rekan semua mengenai Uji-Z.

Terima kasih atas perhatiannya. Wassalamu'alaikum warahmatullahi wabarakatuh."

---

# BAGIAN 7 — PEMBAGIAN TUGAS UNTUK 5 ANGGOTA

## Tabel Pembagian Tugas

| Anggota | Peran Utama | Tugas Rinci |
|---------|------------|-------------|
| **Anggota 1** | Penyusun Kasus & Konsep | • Membuat narasi kasus dummy yang realistis dan masuk akal secara statistik • Menentukan semua nilai parameter (μ₀, x̄, σ, n, α) • Mengerjakan perhitungan manual step-by-step • Memverifikasi kesesuaian kasus dengan topik Uji-Z |
| **Anggota 2** | Programmer R | • Menulis kode R lengkap di RStudio • Menguji dan memverifikasi semua kode hingga berjalan tanpa error • Memastikan output sesuai dengan perhitungan manual • Menyiapkan file `.R` yang siap didemonstrasikan |
| **Anggota 3** | Penyusun Dokumentasi PDF | • Menyusun file PDF dokumentasi step-by-step • Mengambil screenshot RStudio untuk setiap langkah • Memastikan PDF berisi semua komponen yang dipersyaratkan • Mengatur format dan tampilan PDF agar profesional |
| **Anggota 4** | Narator & Produksi Video | • Bertugas sebagai narator dalam video • Menghafalkan dan berlatih membaca script narasi • Mengatur setting Google Meet (jadwal meeting, aktifkan rekam) • Melakukan share screen RStudio saat recording |
| **Anggota 5** | Editor Teknis & GitHub | • Memastikan semua file dalam format yang benar • Membuat repositori GitHub dan mengupload PDF • Mengatur repositori menjadi Public • Mengumpulkan link video dan link GitHub ke file pengumpulan dosen • Memverifikasi semua link bisa diakses |

## Timeline Pengerjaan (Rekomendasi)

| Hari | Kegiatan |
|------|----------|
| H-7 | Rapat kelompok, pembagian tugas, finalisasi kasus |
| H-6 | Anggota 1 selesai perhitungan manual; Anggota 2 mulai coding |
| H-5 | Anggota 2 selesai coding; Anggota 3 mulai PDF; Anggota 4 latihan narasi |
| H-4 | Dry-run (simulasi recording): latihan narasi + demo RStudio |
| H-3 | Revisi berdasarkan dry-run; Anggota 3 finalisasi PDF |
| H-2 | Recording video via GMEET |
| H-1 | Anggota 5 upload PDF ke GitHub; kompilasi semua link |
| H-0 | Pengumpulan ke dosen (sebelum 07 Juni 2026) |

---

# BAGIAN 8 — DOKUMENTASI PDF STEP-BY-STEP

## Outline Isi PDF yang Harus Diupload ke GitHub

---

### Bagian 1: Halaman Judul

**Isi:**
- Judul: "Tutorial Uji Hipotesis – Uji Z Rata-rata Satu Populasi (Ragam Diketahui)"
- Mata Kuliah: Probabilitas dan Statistika
- Semester/Tahun Akademik
- Nama dosen
- Nama dan NIM semua anggota kelompok
- Logo institusi
- Tahun

---

### Bagian 2: Daftar Isi

**Isi:**
- Nomor halaman untuk setiap bagian

---

### Bagian 3: Dasar Teori

**Isi:**
- Pengertian Uji Hipotesis
- Kapan menggunakan Uji-Z (syarat: σ diketahui)
- Rumus statistik uji: Z_h = (x̄ - μ₀) / (σ/√n)
- Tabel jenis uji (satu arah/dua arah) beserta H0 dan H1-nya
- Kriteria penolakan H0

---

### Bagian 4: Deskripsi Kasus

**Isi:**
- Narasi kasus lengkap (persis seperti yang dibacakan di video)
- Tabel parameter yang diketahui (μ₀, x̄, σ, n, α)
- Perumusan H0 dan H1

---

### Bagian 5: Perhitungan Manual

**Isi:**
- Langkah 1: Identifikasi parameter (DIK)
- Langkah 2: Hitung Standard Error — tampilkan rumus dan substitusi angka
- Langkah 3: Hitung Z-hitung — tampilkan rumus dan substitusi angka
- Langkah 4: Tentukan Z-kritis dari tabel Z
- Langkah 5: Hitung P-value
- Langkah 6: Pengambilan keputusan
- Langkah 7: Kesimpulan

---

### Bagian 6: Tutorial di RStudio

**Sub-bagian 6.1: Persiapan**
- Screenshot: RStudio saat pertama dibuka (tampilan kosong)
- Penjelasan: cara membuat script baru

**Sub-bagian 6.2: Input Parameter (Langkah 1)**
- Screenshot: kode Langkah 1 di panel Source
- Screenshot: panel Environment setelah kode dijalankan (variabel terdefinisi)
- Penjelasan: makna setiap variabel

**Sub-bagian 6.3: Hitung Standard Error (Langkah 2)**
- Screenshot: kode Langkah 2
- Screenshot: output di Console (nilai SE)
- Penjelasan: interpretasi nilai SE

**Sub-bagian 6.4: Hitung Z-Hitung (Langkah 3)**
- Screenshot: kode Langkah 3
- Screenshot: output di Console (nilai Z-hitung)
- Penjelasan: makna nilai Z-hitung

**Sub-bagian 6.5: Hitung P-value (Langkah 4)**
- Screenshot: kode Langkah 4
- Screenshot: output di Console (nilai P-value)
- Penjelasan: makna P-value

**Sub-bagian 6.6: Hitung Z-Kritis (Langkah 5)**
- Screenshot: kode Langkah 5
- Screenshot: output di Console (nilai Z-kritis)
- Penjelasan: interpretasi nilai Z-kritis

**Sub-bagian 6.7: Output Lengkap (Langkah 6–8)**
- Screenshot: seluruh output di Console (hasil akhir lengkap)
- Penjelasan baris per baris dari output

---

### Bagian 7: Interpretasi Hasil

**Isi:**
- Tabel ringkasan hasil (Z-hitung, Z-kritis, P-value, keputusan)
- Penjelasan keputusan berdasarkan Z-statistik
- Penjelasan keputusan berdasarkan P-value
- Kesimpulan akhir dalam bahasa yang jelas

---

### Bagian 8: Penutup

**Isi:**
- Ringkasan kasus dan hasil
- Link video tutorial
- Daftar pustaka (jika ada referensi yang digunakan)

---

### Screenshot Wajib yang Harus Ada di PDF

| No | Screenshot | Keterangan |
|----|-----------|------------|
| 1 | Tampilan RStudio awal | Panel-panel RStudio sebelum kode diketik |
| 2 | Script file baru dibuat | Tab Untitled1 atau nama file .R |
| 3 | Kode Langkah 1 di Source | Setelah mengetik definisi variabel |
| 4 | Panel Environment setelah Langkah 1 | Semua variabel terdefinisi |
| 5 | Output Console Langkah 2 | Nilai SE |
| 6 | Output Console Langkah 3 | Nilai Z-hitung |
| 7 | Output Console Langkah 4 | Nilai P-value |
| 8 | Output Console Langkah 5 | Nilai Z-kritis bawah dan atas |
| 9 | Output Console Lengkap | Seluruh output dari Langkah 6–8 |
| 10 | Keputusan dan Kesimpulan | Bagian akhir output yang menampilkan kesimpulan |

---

# BAGIAN 9 — CHECKLIST PRODUKSI VIDEO

## Checklist Sebelum Hari Recording

```
PERSIAPAN TEKNIS (H-2 sebelum rekam)
[ ] RStudio sudah terinstal dan berjalan normal di laptop narator
[ ] Semua kode R sudah diuji dan berjalan tanpa error
[ ] File script R sudah disimpan dan siap dibuka
[ ] Font RStudio sudah diatur ke ukuran 14–16pt
[ ] Tema RStudio menggunakan tampilan terang (light theme)
[ ] Microphone/headset sudah diuji (rekam percobaan pendek)
[ ] Koneksi internet stabil (minimal 10 Mbps)
[ ] Battery laptop terisi penuh atau terhubung ke charger

PERSIAPAN KONTEN (H-2 sebelum rekam)
[ ] Script narasi sudah dihafalkan/dikuasai oleh narator
[ ] Dry-run narasi + demo RStudio sudah dilakukan minimal 1 kali
[ ] Slide pembuka (opening, perkenalan, teori, kasus) sudah siap
[ ] Semua anggota sudah tahu posisi masing-masing saat recording
```

## Checklist Setting Google Meet

```
SETTING GOOGLE MEET
[ ] Buat jadwal Google Meet baru (jangan join meeting acak)
[ ] Host: gunakan akun Google salah satu anggota
[ ] Semua anggota wajib bergabung via Laptop/PC (BUKAN HP)
[ ] Aktifkan fitur "Record meeting" SEBELUM narasi dimulai
  - Klik titik tiga (⋮) di pojok kanan bawah → "Record meeting"
  - Atau: Activities → Recording → Start recording
[ ] Pastikan notifikasi "This meeting is being recorded" muncul
[ ] Matikan semua suara notifikasi di laptop
[ ] Tutup semua aplikasi yang tidak perlu
[ ] Matikan antivirus jika memperlambat performa
```

## Checklist Share Screen

```
SHARE SCREEN
[ ] Pilih share screen "hanya satu window" (RStudio saja)
  - Jangan share entire screen jika ada notifikasi sensitif
[ ] Sebelum share: buka RStudio dan file script sudah tampil
[ ] Pastikan panel Console RStudio tidak terlalu kecil
[ ] Zoom tampilan browser atau layar jika teks terlalu kecil
[ ] Cek dari sisi peserta lain bahwa layar terlihat jelas
```

## Checklist Urutan Recording

```
URUTAN SAAT REKAM
[ ] Langkah 1: Buka GMEET, pastikan semua anggota hadir
[ ] Langkah 2: Aktifkan rekam (Record meeting)
[ ] Langkah 3: Narator mulai dengan Opening
[ ] Langkah 4: Tampilkan slide Perkenalan Kelompok
[ ] Langkah 5: Tampilkan slide Teori
[ ] Langkah 6: Tampilkan slide/teks Kasus
[ ] Langkah 7: Share screen RStudio → mulai demo kode
[ ] Langkah 8: Jalankan kode per langkah sambil narasi
[ ] Langkah 9: Tampilkan dan baca output akhir
[ ] Langkah 10: Kembali ke slide Penutup
[ ] Langkah 11: Stop recording
[ ] Langkah 12: Download video dari Google Drive (link dikirim otomatis)
```

## Checklist Audio dan Final

```
AUDIO
[ ] Tidak ada background music sama sekali
[ ] Suara narator jernih dan tidak ada noise berlebihan
[ ] Volume narasi konsisten sepanjang video
[ ] Tidak ada suara anggota lain yang mengganggu selama rekam

FINAL RENDER
[ ] Video diunduh dari Google Drive dalam format MP4
[ ] Tonton ulang video minimal 1 kali penuh sebelum dikumpulkan
[ ] Verifikasi: teks di RStudio terbaca jelas di video
[ ] Verifikasi: suara narasi terdengar jelas di video
[ ] Verifikasi: output akhir RStudio terlihat di video
[ ] Upload video ke platform yang diminta (YouTube/Drive/dll)
[ ] Uji link video dari akun/perangkat berbeda
```

---

# BAGIAN 10 — TIPS AGAR VIDEO TERLIHAT PROFESIONAL

## Durasi Ideal

| Bagian | Durasi Ideal |
|--------|-------------|
| Opening | 30–60 detik |
| Perkenalan | 45–60 detik |
| Penjelasan Teori | 90–120 detik |
| Penjelasan Kasus | 90–120 detik |
| Tutorial RStudio | 300–360 detik (5–6 menit) |
| Interpretasi Hasil | 60–90 detik |
| Penutup | 30 detik |
| **Total** | **±10–15 menit** |

> Catatan: Video yang terlalu singkat (di bawah 8 menit) berpotensi dinilai kurang tuntas. Video yang terlalu panjang (di atas 20 menit) berpotensi membosankan. Target ideal adalah **12–14 menit**.

## Tips Narasi

- Bicara dengan tempo yang **moderat** — tidak terlalu cepat sehingga pendengar bisa mengikuti kode yang diketik
- Gunakan **jeda singkat** setelah menjalankan setiap langkah kode, agar penonton bisa melihat outputnya
- Sebelum mengetik kode, **umumkan dulu** apa yang akan dilakukan ("Sekarang kita akan menghitung...")
- Setelah kode dijalankan, **baca output** yang muncul di Console secara eksplisit

## Tips Tampilan RStudio

- Font size **14–16pt**: Tools → Global Options → Appearance → Editor Font Size
- Gunakan tema **"Default"** atau **"Textmate"** (putih/terang) agar kontras tinggi
- Pastikan panel **Console dan Source sama-sama terlihat** saat share screen
- Hapus history Console sebelum rekam: ketik `cat("\014")` atau tekan Ctrl+L di Console
- Gunakan **fullscreen RStudio** (tekan F11 di Windows) untuk memaksimalkan area

## Tips Penamaan File

```
Nama File R Script yang Direkomendasikan:
  uji_z_satu_populasi_ragam_diketahui.R

Nama File PDF Dokumentasi:
  Tutorial_Uji_Z_Satu_Populasi_Kelompok[X]_[Kelas].pdf

Nama Repositori GitHub:
  tutorial-uji-hipotesis-uji-z

Nama Folder Lokal Project:
  project-uji-z/
  ├── kode/
  │   └── uji_z_satu_populasi_ragam_diketahui.R
  ├── dokumentasi/
  │   └── Tutorial_Uji_Z_Kelompok[X].pdf
  └── slide/
      └── slide_presentasi.pptx (opsional)
```

## Struktur Repositori GitHub

```
Repositori GitHub (Public):
tutorial-uji-hipotesis-uji-z/
│
├── README.md              ← Deskripsi singkat project
├── kode/
│   └── uji_z_ragam_diketahui.R
└── dokumentasi/
    └── Tutorial_Uji_Z_Satu_Populasi.pdf
```

**Isi README.md yang direkomendasikan:**
```markdown
# Tutorial Uji Hipotesis – Uji Z Satu Populasi (Ragam Diketahui)

Repositori ini berisi dokumentasi tutorial Uji Hipotesis untuk mata kuliah 
Probabilitas dan Statistika.

## Topik
Uji Hipotesis bagi Rata-rata Satu Populasi – Ragam Populasi Diketahui (Uji Z)

## Anggota Kelompok
- [Nama 1] - [NIM]
- [Nama 2] - [NIM]
- [Nama 3] - [NIM]
- [Nama 4] - [NIM]
- [Nama 5] - [NIM]

## Link Video Tutorial
[Masukkan link video di sini]

## Cara Menggunakan Kode
1. Buka RStudio
2. Buka file `kode/uji_z_ragam_diketahui.R`
3. Jalankan seluruh kode dengan Ctrl+A kemudian Ctrl+Enter
```

## Tips Kualitas PDF

- Gunakan software yang menghasilkan PDF berkualitas tinggi: Microsoft Word (Export to PDF), LibreOffice Writer, atau Canva
- Screenshot RStudio: gunakan resolusi layar penuh (bukan kamera HP)
- Ukuran font dalam PDF minimal **11pt** agar mudah dibaca
- Pastikan kode R di PDF menggunakan **font monospace** (misalnya Courier New) agar terlihat seperti kode
- Gunakan **nomor halaman** dan **header/footer** yang konsisten
- Ekspor PDF dengan **kualitas tinggi** (jangan kompres terlalu kecil)

## Tips Upload GitHub

1. Buat akun GitHub jika belum ada di github.com
2. Klik **"New repository"** → beri nama → pilih **"Public"**
3. Klik **"Add file"** → **"Upload files"**
4. Drag-and-drop file PDF dan file .R
5. Klik **"Commit changes"**
6. Salin URL halaman file PDF → klik kanan pada nama file → **"Copy link address"** → itulah link yang dikumpulkan

---

*Panduan ini disusun berdasarkan file penugasan dosen dan modul aplikasi di R yang diberikan.*
*Pastikan seluruh anggota kelompok membaca panduan ini sebelum memulai pengerjaan.*
