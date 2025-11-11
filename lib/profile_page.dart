// lib/profile_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data Pasien (dari SharedPreferences atau dummy)
  String userName = "Loading...";
  String userCondition = "Loading...";
  String userAge = "25";
  String userGender = "Male";
  String userAddress = "Jakarta, Indonesia";
  int programSessions = 0;
  int prehabSessions = 0;
  int workoutSessions = 0;
  List<Map<String, dynamic>> recentSessions = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadDummySessionHistory(); // Load dummy session history
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "Pasien";
      userCondition = prefs.getString('userCondition') ?? "Belum ada kondisi awal";
    });
  }

  void _loadDummySessionHistory() {
    // Contoh data dummy untuk riwayat sesi
    setState(() {
      recentSessions = [
        {"title": "Full Body Mobility", "date": "2025-10-25", "completed": true},
        {"title": "Prehab Shoulder", "date": "2025-10-24", "completed": true},
        {"title": "Knee Strengthening", "date": "2025-10-23", "completed": false},
        {"title": "Back Flexibility", "date": "2025-10-22", "completed": true},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: const Color(0xFF3A9D4E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER PROFIL ===
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/video_placeholder.jpg'), // Ganti dengan avatar user jika ada
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Nama & Kondisi
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Kondisi: $userCondition",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // === DETAIL PROFIL ===
            const Text(
              "Detail Profil",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailItem(Icons.cake, "Usia", userAge),
                    const Divider(height: 24),
                    _buildDetailItem(Icons.transgender, "Jenis Kelamin", userGender),
                    const Divider(height: 24),
                    _buildDetailItem(Icons.location_on, "Alamat", userAddress),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // === PROGRESS STATISTICS ===
            const Text(
              "Statistik Progres",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard(Icons.assignment, "Program", programSessions.toString()),
                _buildStatCard(Icons.healing, "Prehab", prehabSessions.toString()),
                _buildStatCard(Icons.fitness_center, "Workout", workoutSessions.toString()),
              ],
            ),
            const SizedBox(height: 24),

            // === RECENT SESSIONS ===
            const Text(
              "Riwayat Sesi Terakhir",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: recentSessions.map((session) {
                    return ListTile(
                      leading: Icon(
                        session["completed"] ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: session["completed"] ? Colors.green : Colors.grey,
                      ),
                      title: Text(session["title"]),
                      subtitle: Text(session["date"]),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        print("Lihat detail sesi: ${session["title"]}");
                        // Nanti tambahkan navigasi ke detail sesi
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // === TOMBOL EDIT PROFIL ===
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  print("Edit Profil diklik!");
                  // Nanti tambahkan navigasi ke halaman edit profil
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Edit Profil",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3A9D4E),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat item detail profil
  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF3A9D4E)),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk membuat card statistik
  Widget _buildStatCard(IconData icon, String label, String value) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF3A9D4E), size: 30),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}