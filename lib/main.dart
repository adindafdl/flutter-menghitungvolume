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
      title: 'Tugas 3 - Hitung Volume',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 91, 165, 250),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[800],
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// Widget untuk Menampilkan Rumus
class FormulaCard extends StatelessWidget {
  final String formula;
  const FormulaCard({super.key, required this.formula});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate, color: Colors.blue[600], size: 20),
            const SizedBox(width: 8),
            Text(
              "Rumus: ",
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              formula,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Hitung Volume")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hitung Volume Bangun Ruang",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 25),
            _buildMenuCard(
              context,
              "Kubus",
              Icons.view_in_ar,
              const KubusPage(),
            ),
            _buildMenuCard(
              context,
              "Bola",
              Icons.radio_button_unchecked,
              const BolaPage(),
            ),
            _buildMenuCard(
              context,
              "Tabung",
              Icons.view_column_sharp,
              const TabungPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget target,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[800], size: 30),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => target),
        ),
      ),
    );
  }
}

class KubusPage extends StatefulWidget {
  const KubusPage({super.key});
  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController _sisiController = TextEditingController();
  double _result = 0;
  bool _isCalculated = false;

  void _hitung() {
    double s = double.tryParse(_sisiController.text) ?? 0;
    if (s > 0) {
      setState(() {
        _result = pow(s, 3).toDouble();
        _isCalculated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Volume Kubus")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const FormulaCard(formula: "V = s³"),
            TextField(
              controller: _sisiController,
              decoration: const InputDecoration(
                labelText: "Masukkan Sisi (s)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.straighten),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _hitung,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
              ),
              child: const Text("Hitung Volume"),
            ),
            const SizedBox(height: 35),
            if (_isCalculated)
              Text(
                "Hasil: ${_result.toStringAsFixed(2)} cm³",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// --- HITUNG BOLA ---
class BolaPage extends StatefulWidget {
  const BolaPage({super.key});
  @override
  State<BolaPage> createState() => _BolaPageState();
}

class _BolaPageState extends State<BolaPage> {
  final TextEditingController _jariController = TextEditingController();
  double _result = 0;
  bool _isCalculated = false;
  void _hitung() {
    double r = double.tryParse(_jariController.text) ?? 0;
    if (r > 0) {
      setState(() {
        _result = (4 / 3) * pi * pow(r, 3);
        _isCalculated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Volume Bola")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const FormulaCard(formula: "V = 4/3 x π x r³"),
            TextField(
              controller: _jariController,
              decoration: const InputDecoration(
                labelText: "Masukkan Jari-jari (r)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.circle_outlined),
                suffixText: "cm",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: _hitung,
              icon: const Icon(Icons.done),
              label: const Text("Hitung Volume"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 35),
            if (_isCalculated) _buildResultDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultDisplay() {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "Hasil: ${_result.toStringAsFixed(2)} cm³",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}

// --- HITUNG TABUNG ---
class TabungPage extends StatefulWidget {
  const TabungPage({super.key});
  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final TextEditingController _rController = TextEditingController();
  final TextEditingController _tController = TextEditingController();
  double _result = 0;
  bool _isCalculated = false;

  void _hitung() {
    double r = double.tryParse(_rController.text) ?? 0;
    double t = double.tryParse(_tController.text) ?? 0;
    if (r > 0 && t > 0) {
      setState(() {
        _result = pi * pow(r, 2) * t;
        _isCalculated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Volume Tabung")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const FormulaCard(formula: "V = π x r² x t"),
            TextField(
              controller: _rController,
              decoration: const InputDecoration(
                labelText: "Jari-jari Alas (r)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.circle_outlined),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _tController,
              decoration: const InputDecoration(
                labelText: "Tinggi Tabung (t)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: _hitung,
              icon: const Icon(Icons.done),
              label: const Text("Hitung Volume"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 35),
            if (_isCalculated)
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Hasil: ${_result.toStringAsFixed(2)} cm³",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
