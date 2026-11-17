// Praktikum Modul IV - Soal 5: Studi Kasus Tebas Tebang Pohon (Subsoal 1 & Subsoal 2 OOP)
// Menerapkan: Pewarisan (Inheritance), Enkapsulasi, Polimorfisme, Agregasi, dan Komposisi
// Nama: Vayola Aura Mecca | NIM: 707012400012

import 'dart:io';

// 1. Kelas Induk (Inheritance & Polymorphism)
abstract class Tanaman {
  final int _tinggi; // Enkapsulasi atribut private

  Tanaman(this._tinggi);

  int get tinggi => _tinggi;

  // Metode polimorfik untuk menghitung hasil potongan pada batas ketinggian X
  int hitungPotongan(int batasX);
}

// 2. Kelas Turunan Pohon (Inheritance + Overriding / Polymorphism)
class Pohon extends Tanaman {
  Pohon(super.tinggi);

  @override
  int hitungPotongan(int batasX) {
    return tinggi > batasX ? (tinggi - batasX) : 0;
  }
}

// 3. Komposisi: AlatGergaji dimiliki secara mutlak oleh LahanPakRanceher
class AlatGergaji {
  int potongSemua(List<Tanaman> daftarTanaman, int batasX) {
    int totalKayu = 0;
    for (var tanaman in daftarTanaman) {
      totalKayu += tanaman.hitungPotongan(batasX); // Polimorfisme saat pemanggilan
    }
    return totalKayu;
  }
}

// 4. Agregasi & Komposisi pada LahanPakRanceher
class LahanPakRanceher {
  // Agregasi: Pohon dapat ditambahkan dari luar dan tetap eksis secara independen
  final List<Tanaman> _koleksiPohon = [];

  // Komposisi: AlatGergaji dibuat di dalam LahanPakRanceher dan bergantung pada siklus hidupnya
  final AlatGergaji _gergaji = AlatGergaji();

  void tambahPohon(Tanaman p) {
    _koleksiPohon.add(p);
  }

  int get tinggiMaksimal {
    int maks = 0;
    for (var p in _koleksiPohon) {
      if (p.tinggi > maks) maks = p.tinggi;
    }
    return maks;
  }

  // Pencarian Biner (Binary Search) O(N log(max(Ai))) agar efisien hingga N = 100.000
  int cariBatasTinggiMaksimal(int kebutuhanMinimalM) {
    int totalSemuaJikaNol = _gergaji.potongSemua(_koleksiPohon, 0);
    if (totalSemuaJikaNol < kebutuhanMinimalM) {
      return -1;
    }

    int low = 0;
    int high = tinggiMaksimal;
    int jawaban = -1;

    while (low <= high) {
      int mid = low + ((high - low) >> 1);
      int totalKayu = _gergaji.potongSemua(_koleksiPohon, mid);

      if (totalKayu >= kebutuhanMinimalM) {
        jawaban = mid; // Memenuhi syarat >= M, coba cari batas X yang lebih tinggi
        low = mid + 1;
      } else {
        high = mid - 1; // Kayu kurang, turunkan batas ketinggian X
      }
    }
    return jawaban;
  }
}

int selesaikanKasus(int n, int m, List<int> daftarTinggi) {
  var lahan = LahanPakRanceher();
  for (int i = 0; i < n; i++) {
    lahan.tambahPohon(Pohon(daftarTinggi[i]));
  }
  return lahan.cariBatasTinggiMaksimal(m);
}

void main(List<String> args) {
  // Jika dijalankan dengan argumen --stdin, baca masukan standar format kompetitif
  if (args.contains('--stdin')) {
    final tokens = <int>[];
    String? line;
    while ((line = stdin.readLineSync()) != null) {
      for (final part in line!.trim().split(RegExp(r'\s+'))) {
        if (part.isNotEmpty) tokens.add(int.parse(part));
      }
    }
    if (tokens.length >= 2) {
      int n = tokens[0];
      int m = tokens[1];
      List<int> tinggi = tokens.sublist(2, 2 + n);
      print(selesaikanKasus(n, m, tinggi));
    }
    return;
  }

  print("=== PENGUJIAN STUDI KASUS TEBAS TEBANG POHON (OOP) ===");
  final testCases = [
    {"n": 10, "m": 25, "a": [4, 2, 9, 9, 5, 3, 6, 7, 2, 10], "expected": 3},
    {"n": 5, "m": 5, "a": [2, 7, 2, 9, 5], "expected": 5},
    {"n": 5, "m": 25, "a": [2, 7, 2, 9, 5], "expected": 0},
    {"n": 5, "m": 125, "a": [2, 7, 2, 9, 5], "expected": -1},
  ];

  for (int i = 0; i < testCases.length; i++) {
    var tc = testCases[i];
    int hasil = selesaikanKasus(
      tc["n"] as int,
      tc["m"] as int,
      tc["a"] as List<int>,
    );
    print(
      "Contoh ${i + 1}: N=${tc['n']}, M=${tc['m']}, Tinggi=${tc['a']} => Output: $hasil (Ekspektasi: ${tc['expected']})",
    );
  }
}
