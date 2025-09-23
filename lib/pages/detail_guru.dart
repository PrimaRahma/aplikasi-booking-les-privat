import 'package:flutter/material.dart';
import 'model/guru_model.dart';

class DetailGuruPage extends StatelessWidget {
  final Guru guru;

  const DetailGuruPage({super.key, required this.guru});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ${guru.name}"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(guru.photo),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 20),

            // Nama Guru
            Text(
              guru.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Level
            Text(
              "Jenjang: ${guru.level}",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 5),
                Text(
                  guru.rating.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Harga
            Text(
              "Rp ${guru.price}K / jam",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi Dummy
            const Text(
              "Guru berpengalaman lebih dari 5 tahun mengajar. "
              "Menyediakan metode pembelajaran interaktif, "
              "menyesuaikan dengan kebutuhan siswa agar cepat memahami materi.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),

            // Tombol Chat
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Membuka chat dengan ${guru.name}..."),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.chat),
              label: const Text("Chat Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
