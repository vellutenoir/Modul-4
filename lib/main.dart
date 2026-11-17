import 'package:flutter/material.dart';
import 'tebas_pohon_oop.dart';

void main() {
  runApp(const Modul4OopApp());
}

class Modul4OopApp extends StatelessWidget {
  const Modul4OopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul IV OOP Dart - 707012400012',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const Modul4HomePage(),
    );
  }
}

class Modul4HomePage extends StatefulWidget {
  const Modul4HomePage({super.key});

  @override
  State<Modul4HomePage> createState() => _Modul4HomePageState();
}

class _Modul4HomePageState extends State<Modul4HomePage> {
  final TextEditingController _mController = TextEditingController(text: '25');
  final TextEditingController _pohonController = TextEditingController(
    text: '4 2 9 9 5 3 6 7 2 10',
  );
  String _hasilTebas = 'Batas ketinggian maksimum (X): 3';

  void _hitungTebasPohon() {
    final m = int.tryParse(_mController.text.trim()) ?? 0;
    final listTinggi = _pohonController.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    final hasil = selesaikanKasus(listTinggi.length, m, listTinggi);
    setState(() {
      _hasilTebas = 'Batas ketinggian maksimum (X): $hasil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul IV OOP Dart - 707012400012'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Vayola Aura Mecca — 707012400012'),
              subtitle: Text('D4SIKC-48-03 | Pemrograman Perangkat Bergerak Lanjut'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Simulator Studi Kasus: Tebas Tebang Pohon (OOP)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _mController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Kebutuhan Kayu Minimal (M)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _pohonController,
                    decoration: const InputDecoration(
                      labelText: 'Daftar Tinggi Pohon (pisahkan spasi)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: _hitungTebasPohon,
                    icon: const Icon(Icons.calculate),
                    label: const Text('Hitung Batas Tinggi X'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _hasilTebas,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
