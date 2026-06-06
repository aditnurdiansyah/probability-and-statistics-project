mu_hipotesis <- 85
x_bar <- 81
sigma_populasi <- 8
n <- 40
alpha <- 0.05

se <- sigma_populasi / sqrt(n)
z_hitung <- (x_bar - mu_hipotesis) / se

p_value <- 2 * pnorm(abs(z_hitung), lower.tail = FALSE)

z_kritis_atas  <- qnorm(p = alpha / 2, lower.tail = FALSE)
z_kritis_bawah <- qnorm(p = alpha / 2, lower.tail = TRUE)

cat("\n\n--- HASIL UJI HIPOTESIS & INTERPRETASI LENGKAP ---\n\n")
cat(sprintf("Rata-rata Sampel: %.2f\n", x_bar))
cat(sprintf("Jumlah Sampel: %.d\n", n))
cat(sprintf("Simpangan Baku Populasi: %.2f\n", sigma_populasi))
cat(sprintf("Tingkat Signifikansi: %.2f\n", alpha))
cat(sprintf("Standard Error: %.4f\n", se))
cat(sprintf("Z-hitung: %.4f\n", z_hitung))
cat(sprintf("Z-kritis (Batas Bawah & Atas): %.4f & %.4f\n", z_kritis_bawah, z_kritis_atas))
cat(sprintf("P-value: %.6f\n", p_value))

if (p_value <= alpha) {
  cat("\nKEPUTUSAN BERDASARKAN P-value:\n")
  cat(sprintf("Karena P-value (%.6f) <= alpha (%.2f), maka H0 ditolak.\n", p_value, alpha))
  
  cat("KESIMPULAN:\n")
  cat("Pada taraf nyata 5%, belum terdapat cukup bukti untuk mendukung pendapat Manajer Quality Assurance bahwa rata-rata tingkat kepuasan pengguna aplikasi sama dengan 85 poin.\n")
} else {
  cat("KEPUTUSAN:\n")
  cat(sprintf("Karena P-value (%.6f) > alpha (%.2f), maka H0 gagal ditolak.\n", p_value, alpha))
  
  cat("KESIMPULAN:\n")
  cat("Pada taraf nyata 5%, terdapat cukup bukti untuk mendukung pendapat Manajer Quality Assurance bahwa rata-rata tingkat kepuasan pengguna aplikasi sama dengan 85 poin.\n")
}

if (z_hitung < z_kritis_bawah || z_hitung > z_kritis_atas) {
  cat("\nKEPUTUSAN BERDASARKAN Z-hitung:\n")
  cat(sprintf("Karena Z-hitung (%.4f) berada di luar rentang Z-kritis (%.4f sampai %.4f), maka H0 ditolak.\n", z_hitung, z_kritis_bawah, z_kritis_atas))
  
  cat("KESIMPULAN:\n")
  cat("Pada taraf nyata 5%, belum terdapat cukup bukti untuk mendukung pendapat Manajer Quality Assurance bahwa rata-rata tingkat kepuasan pengguna aplikasi sama dengan 85 poin.\n")
} else {
  cat("KEPUTUSAN:\n")
  cat(sprintf("Karena Z-hitung (%.4f) berada di dalam rentang Z-kritis (%.4f sampai %.4f), maka H0 gagal ditolak.\n", z_hitung, z_kritis_bawah, z_kritis_atas))
  
  cat("KESIMPULAN:\n")
  cat("Pada taraf nyata 5%, terdapat cukup bukti untuk mendukung pendapat Manajer Quality Assurance bahwa rata-rata tingkat kepuasan pengguna aplikasi sama dengan 85 poin.\n")
}