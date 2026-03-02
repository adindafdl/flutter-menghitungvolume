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

  Widget _buildMenu(BuildContext context, String title, IconData icon, Widget target) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => target)),
      ),
    );
  }
}