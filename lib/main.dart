import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Volume',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hitung Volume Bangun Ruang")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenu(context, "Kubus", Icons.view_in_ar, const KubusPage()),
          _buildMenu(context, "Bola", Icons.circle_outlined, const BolaPage()),
          _buildMenu(context, "Tabung", Icons.Looks_one, const TabungPage()),
        ],
      ),
    );
  }

  Widget _buildMenu(
    BuildContext context,
    String title,
    IconData icon,
    Widget target,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => target),
        ),
      ),
    );
  }
}

// Hitung Kubus
class KubusPage extends StatefulWidget {
  const KubusPage({super.key});
  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController _sisiController = TextEditingController();
  double _result = 0;

  void _hitung() {
    double s = double.tryParse(_sisiController.text) ?? 0;
    setState(() {
      _result = pow(s, 3).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Volume Kubus")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sisiController,
              decoration: const InputDecoration(labelText: "Masukkan Sisi (s)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _hitung, child: const Text("Hitung")),
            const SizedBox(height: 20),
            Text(
              "Hasil: $_result",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Hitung Bola
class BolaPage extends StatefulWidget {
  const BolaPage({super.key});
  @override
  State<BolaPage> createState() => _BolaPageState();
}

class _BolaPageState extends State<BolaPage> {
  final TextEditingController _jariController = TextEditingController();
  double _result = 0;

  void _hitung() {
    double r = double.tryParse(_jariController.text) ?? 0;
    setState(() {
      _result = (4 / 3) * pi * pow(r, 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Volume Bola")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _jariController,
              decoration: const InputDecoration(
                labelText: "Masukkan Jari-jari (r)",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _hitung, child: const Text("Hitung")),
            const SizedBox(height: 20),
            Text(
              "Hasil: ${_result.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
// Hitung Tabung
class TabungPage extends StatefulWidget {
  const TabungPage({super.key});
  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final TextEditingController _rController = TextEditingController();
  final TextEditingController _tController = TextEditingController();
  double _result = 0;

  void _hitung() {
    double r = double.tryParse(_rController.text) ?? 0;
    double t = double.tryParse(_tController.text) ?? 0;
    setState(() {
      _result = pi * pow(r, 2) * t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Volume Tabung")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _rController, decoration: const InputDecoration(labelText: "Masukkan Jari-jari (r)"), keyboardType: TextInputType.number),
            TextField(controller: _tController, decoration: const InputDecoration(labelText: "Masukkan Tinggi (t)"), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _hitung, child: const Text("Hitung")),
            const SizedBox(height: 20),
            Text("Hasil: ${_result.toStringAsFixed(2)}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}