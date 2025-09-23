import 'package:flutter/material.dart';
import 'model/user_model.dart';
import 'login_page.dart';

class ProfilPage extends StatelessWidget {
  final UserModel user;
  final bool isDarkMode;

  const ProfilPage({super.key, required this.user, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode
        ? Colors.grey[900]
        : const Color.fromARGB(255, 246, 146, 179);
    final cardColor = isDarkMode
        ? Colors.grey[800]
        : const Color.fromARGB(255, 255, 210, 225);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, ${user.name}!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 20),

          // Card Email
          Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.pink, width: 1.5),
            ),
            child: ListTile(
              leading: Icon(Icons.email, color: Colors.pink[700]),
              title: Text("Email", style: TextStyle(color: textColor)),
              subtitle: Text(user.email, style: TextStyle(color: textColor)),
            ),
          ),

          // Card Telepon
          Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.pink, width: 1.5),
            ),
            child: ListTile(
              leading: Icon(Icons.phone, color: Colors.pink[700]),
              title: Text("Telepon", style: TextStyle(color: textColor)),
              subtitle: Text(user.phone, style: TextStyle(color: textColor)),
            ),
          ),

          // Card Alamat
          Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.pink, width: 1.5),
            ),
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.pink[700]),
              title: Text("Alamat", style: TextStyle(color: textColor)),
              subtitle: Text(
                user.address ?? "-",
                style: TextStyle(color: textColor),
              ),
            ),
          ),

          const Spacer(),

          // Tombol Logout
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[700],
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Berhasil logout!")),
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                "Log Out",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
