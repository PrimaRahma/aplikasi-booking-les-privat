import 'package:flutter/material.dart';

class TambahGuruPage extends StatelessWidget {
  final bool isDarkMode;

  const TambahGuruPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode
        ? Colors.grey[900]
        : const Color.fromARGB(255, 246, 146, 179);
    final cardColor = isDarkMode
        ? Colors.grey[850]
        : const Color.fromARGB(255, 255, 210, 225);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    InputDecoration inputDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: textColor),
        filled: true,
        fillColor: cardColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.pink, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.pink, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: cardColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Form Tambah Guru",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: inputDecoration("Nama"),
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: inputDecoration("Level"),
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: inputDecoration("Alamat"),
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: inputDecoration("Harga per jam"),
                  style: TextStyle(color: textColor),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[700],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Guru berhasil ditambahkan!"),
                        ),
                      );
                    },
                    child: const Text(
                      "Daftar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
