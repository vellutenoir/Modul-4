// Praktikum Modul IV - Soal 1: Pewarisan (Inheritance) & Overriding
// Nama: Vayola Aura Mecca | NIM: 707012400012

class Kendaraan {
  void jalan() {
    print("Kendaraan sedang berjalan");
  }
}

// Kode A: Pewarisan langsung tanpa overriding
class Mobil extends Kendaraan {
  void klakson() {
    print("Mobil membunyikan klakson: Tin tin!");
  }
}

// Kode B: Pewarisan dengan overriding metode induk
class Motor extends Kendaraan {
  @override
  void jalan() {
    print("Motor melaju di jalan raya");
  }

  void bunyiMesin() {
    print("Motor berbunyi: Brummm!");
  }
}

// Tugas 1c: Tambahan class Pesawat yang bisa jalan() dan terbang()
class Pesawat extends Kendaraan {
  @override
  void jalan() {
    print("Pesawat meluncur di landasan pacu (taxiing)");
  }

  void terbang() {
    print("Pesawat terbang tinggi di udara!");
  }
}

void main() {
  print("=== KODE A: PEWARISAN LANGSUNG ===");
  var k = Kendaraan();
  k.jalan();

  var m = Mobil();
  m.jalan();
  m.klakson();

  print("\n=== KODE B: OVERRIDING ===");
  var motor = Motor();
  motor.jalan();
  motor.bunyiMesin();

  print("\n=== TUGAS 1C: CLASS PESAWAT ===");
  var pesawat = Pesawat();
  pesawat.jalan();
  pesawat.terbang();
}
