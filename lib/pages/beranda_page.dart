import 'package:flutter/material.dart';
import 'model/guru_model.dart';
import 'detail_guru.dart';

class BerandaPage extends StatefulWidget {
  final String email;
  final bool isDarkMode;

  const BerandaPage({super.key, required this.email, required this.isDarkMode});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  String _selectedLevel = "SD";

  final List<Guru> allTeachers = [
    GuruSD("Budi", 50, 4.8, "assets/guru3.jpg"),
    GuruSD("Siti", 55, 4.9, "assets/guru1.jpg"),
    GuruSMP("Andi", 60, 4.7, "assets/guru3.jpg"),
    GuruSMP("Maya", 65, 4.6, "assets/guru2.jpg"),
    GuruSMA("Dewi", 80, 5.0, "assets/guru1.jpg"),
    GuruSMA("Rudi", 85, 4.5, "assets/guru3.jpg"),
  ];

  ///  cek apakah photo path URL atau asset
  ImageProvider getImage(String path) {
    return path.startsWith("http") ? NetworkImage(path) : AssetImage(path);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;

    // Filter guru rekomendasi sesuai level
    final filteredTeachers = allTeachers
        .where((guru) => guru.level == _selectedLevel)
        .toList();

    // guru dengan rating tertinggi
    final favoriteTeachers = [...allTeachers]
      ..sort((a, b) => b.rating.compareTo(a.rating));
    final topTeachers = favoriteTeachers.take(3).toList();

    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? Colors.grey[900]
          : const Color.fromARGB(255, 246, 146, 179),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Guru Terfavorit
            Text(
              "Guru Terfavorit ⭐",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.pinkAccent : Colors.pink[900],
              ),
            ),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topTeachers.length,
              itemBuilder: (context, index) {
                final guru = topTeachers[index];
                return Card(
                  color: widget.isDarkMode ? Colors.grey[850] : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: getImage(guru.photo),
                      radius: 25,
                    ),
                    title: Text(
                      guru.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    subtitle: Text(
                      guru.deskripsi(),
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? Colors.white70
                            : Colors.grey[700],
                        fontSize: 13,
                      ),
                    ),
                    trailing: Text(
                      "Rp ${guru.price}K",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.isDarkMode
                            ? Colors.pinkAccent
                            : Colors.pink[800],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailGuruPage(guru: guru),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Promo
            Card(
              color: widget.isDarkMode
                  ? Colors.deepOrange[300]
                  : Colors.orange[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.red),
                title: Text(
                  "Promo Diskon 20%",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.red[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Dapatkan diskon untuk 3 kali les pertama!",
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Guru rekomendasi
            Text(
              "Guru Rekomendasi ($_selectedLevel)",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.pinkAccent : Colors.pink[900],
              ),
            ),
            const SizedBox(height: 10),

            // Pilihan level
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ["SD", "SMP", "SMA/SMK"].map((level) {
                final isSelected = _selectedLevel == level;
                return ChoiceChip(
                  label: Text(
                    level,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Colors.white
                          : (widget.isDarkMode
                                ? Colors.white70
                                : Colors.black87),
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: widget.isDarkMode
                      ? Colors.pinkAccent
                      : Colors.blue[300],
                  backgroundColor: widget.isDarkMode
                      ? Colors.grey[700]
                      : Colors.grey[300],
                  onSelected: (_) {
                    setState(() => _selectedLevel = level);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // List guru rekomendasi
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredTeachers.length,
                itemBuilder: (context, index) {
                  final guru = filteredTeachers[index];
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 12),
                    child: Card(
                      color: widget.isDarkMode
                          ? Colors.grey[850]
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: getImage(guru.photo),
                              backgroundColor: Colors.grey[300],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              guru.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              guru.deskripsi(),
                              style: TextStyle(
                                color: widget.isDarkMode
                                    ? Colors.white70
                                    : Colors.grey[600],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailGuruPage(guru: guru),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: widget.isDarkMode
                                    ? Colors.pinkAccent
                                    : Colors.pink[300],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(Icons.info, size: 16),
                              label: const Text("Detail"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
