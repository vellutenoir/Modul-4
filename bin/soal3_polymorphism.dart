// Praktikum Modul IV - Soal 3: Polimorfisme (Polymorphism)
// Nama: Vayola Aura Mecca | NIM: 707012400012

class Pegawai {
  void kerja() {
    print("Pegawai bekerja...");
  }
}

class Programmer extends Pegawai {
  @override
  void kerja() {
    print("Programmer menulis kode...");
  }
}

class Designer extends Pegawai {
  @override
  void kerja() {
    print("Designer membuat UI/UX...");
  }
}

// Tugas 3b: Tambahan class Manager dengan implementasi kerja() yang berbeda
class Manager extends Pegawai {
  @override
  void kerja() {
    print("Manager memimpin rapat dan mengelola proyek tim...");
  }
}

void main() {
  List<Pegawai> daftar = [Programmer(), Designer(), Manager(), Pegawai()];

  for (var p in daftar) {
    p.kerja();
  }
}
