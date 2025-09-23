import 'package:flutter/material.dart';

class CariGuruPage extends StatefulWidget {
  final String email;
  final bool isDarkMode;

  const CariGuruPage({
    super.key,
    required this.email,
    required this.isDarkMode,
  });

  @override
  State<CariGuruPage> createState() => _CariGuruPageState();
}

class _CariGuruPageState extends State<CariGuruPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> recommendedTeachers = [
    {
      "name": "Budi",
      "level": "SD",
      "price": 50,
      "address": "Jakarta",
      "rating": 4.8,
    },
    {
      "name": "Maya",
      "level": "SMP",
      "price": 60,
      "address": "Jogja",
      "rating": 4.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDarkMode
        ? Colors.grey[900]
        : const Color.fromARGB(255, 246, 146, 179); // sama seperti Beranda
    final cardColor = widget.isDarkMode ? Colors.grey[850] : Colors.white;
    final borderColor = widget.isDarkMode
        ? Colors.pinkAccent
        : Colors.transparent;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;
    final subTextColor = widget.isDarkMode ? Colors.white70 : Colors.black87;

    return Container(
      color: bgColor,
      child: Column(
        children: [
          // Input pencarian
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: widget.isDarkMode ? Colors.white70 : Colors.grey[800],
                ),
                hintText: "Cari guru berdasarkan alamat...",
                hintStyle: TextStyle(color: subTextColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: widget.isDarkMode ? Colors.grey[800] : Colors.white,
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),

          // Hasil pencarian
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: recommendedTeachers
                  .where(
                    (guru) => guru["address"].toLowerCase().contains(
                      _searchController.text.toLowerCase(),
                    ),
                  )
                  .map(
                    (guru) => Card(
                      color: cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: borderColor, width: 1.2),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: widget.isDarkMode
                              ? Colors.pink[200]
                              : Colors.grey[300],
                          child: const Icon(Icons.person, color: Colors.black),
                        ),
                        title: Text(
                          "${guru["name"]} (${guru["level"]})",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        subtitle: Text(
                          "Alamat: ${guru["address"]}\nHarga: Rp ${guru["price"]}K/jam",
                          style: TextStyle(color: subTextColor),
                        ),
                        trailing: Text(
                          "⭐ ${guru["rating"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.isDarkMode
                                ? Colors.amber
                                : Colors.pink[900],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
