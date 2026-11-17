// Praktikum Modul IV - Soal 2: Enkapsulasi (Encapsulation)
// Nama: Vayola Aura Mecca | NIM: 707012400012

class RekeningBank {
  double _saldo = 0;

  // Tugas 2b: Validasi agar setor() hanya menerima nilai positif
  void setor(double jumlah) {
    if (jumlah > 0) {
      _saldo += jumlah;
      print("Berhasil setor: Rp\$jumlah");
    } else {
      print("Gagal setor: Jumlah setoran harus lebih dari 0!");
    }
  }

  void tarik(double jumlah) {
    if (jumlah <= 0) {
      print("Gagal tarik: Jumlah penarikan harus lebih dari 0!");
    } else if (_saldo >= jumlah) {
      _saldo -= jumlah;
      print("Berhasil tarik: Rp\$jumlah");
    } else {
      print("Saldo tidak cukup!");
    }
  }

  double get saldo => _saldo;
}

void main() {
  var r = RekeningBank();
  r.setor(1000);
  print("Saldo: \${r.saldo}");

  r.tarik(500);
  print("Saldo: \${r.saldo}");

  // Pengujian validasi input negatif / nol
  print("\n=== PENGUJIAN VALIDASI SETOR ===");
  r.setor(-250);
  r.setor(0);
  print("Saldo akhir: \${r.saldo}");
}
