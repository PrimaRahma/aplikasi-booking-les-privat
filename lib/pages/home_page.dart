import 'package:flutter/material.dart';
import 'model/user_model.dart';
import 'profil_page.dart';
import 'beranda_page.dart';
import 'cari_guru_page.dart';
import 'tambah_guru_page.dart';

class MyHomePage extends StatefulWidget {
  final UserModel user;

  const MyHomePage({super.key, required this.user});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isDarkMode = false; // status mode gelap/terang

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      BerandaPage(email: widget.user.email, isDarkMode: _isDarkMode),
      CariGuruPage(email: widget.user.email, isDarkMode: _isDarkMode),
      TambahGuruPage(isDarkMode: _isDarkMode),
      ProfilPage(user: widget.user, isDarkMode: _isDarkMode),
    ];

    return Scaffold(
      // background sesuai mode
      backgroundColor: _isDarkMode ? Colors.grey[900] : const Color(0xFFFFF0F5),

      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 64, 122, 1),
        iconTheme: const IconThemeData(color: Colors.white), // ikon putih
        title: Row(
          children: [
            // Logo panda di assets
            Image.asset("assets/panda.png", height: 50, width: 50),
            const SizedBox(width: 8),
            const Text(
              "LES MANIA",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleDarkMode,
            tooltip: _isDarkMode ? "Mode Terang" : "Mode Gelap",
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isDarkMode
                    ? [Colors.grey[800]!, Colors.black]
                    : [Colors.pink[200]!, Colors.pink[400]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              "Welcome, ${widget.user.name}! Selamat datang di aplikasi LES MANIA.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // halaman utama
          Expanded(child: pages[_selectedIndex]),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pink[700],
        unselectedItemColor: _isDarkMode ? Colors.white70 : Colors.grey[600],
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 24),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cari Guru"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Tambah Guru"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
