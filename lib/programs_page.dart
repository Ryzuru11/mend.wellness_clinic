// lib/programs_page.dart
import 'package:flutter/material.dart';
import 'main.dart'; // Tambahkan ini untuk mengakses MyHomePage
import 'workouts_page.dart'; // Tambahkan ini untuk mengakses WorkoutsPage
import 'mobility_page.dart'; // Tambahkan ini

class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programs"),
        backgroundColor: const Color(0xFF3A9D4E), // Warna hijau utama
        foregroundColor: Colors.white, // Warna teks
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // === HEADER PROGRAMS ===
              const Text(
                "Explore Programs",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 8),
              Text(
                "Choose a body region or program category to start your journey.",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),

              // === BY BODY REGION ===
              const Text(
                "By Body Region",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true, // Penting!
                physics: const NeverScrollableScrollPhysics(), // Penting!
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildBodyRegionCard(context, "Foot/Ankle", "assets/images/foot_ankle.jpg"),
                  _buildBodyRegionCard(context, "Head/Neck", "assets/images/head_neck.jpg"),
                  _buildBodyRegionCard(context, "Upper Back", "assets/images/upper_back.jpg"),
                  _buildBodyRegionCard(context, "Elbow/Wrist", "assets/images/elbow_wrist.jpg"),
                  _buildBodyRegionCard(context, "Shoulder", "assets/images/shoulder.jpg"),
                  _buildBodyRegionCard(context, "Lower Back", "assets/images/lower_back.jpg"),
                  _buildBodyRegionCard(context, "Knee", "assets/images/knee.jpg"),
                  _buildBodyRegionCard(context, "Hip", "assets/images/hip.jpg"),
                ],
              ),
              const SizedBox(height: 24),

              // === PROGRAM CATEGORIES ===
              const Text(
                "Program Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 16),

              // Card Program Horizontal Scroll
              SizedBox(
                height: 180, // Tetapkan tinggi tetap
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildProgramCategoryCard(
                        context,
                        "Full Body Mobility",
                        "assets/images/full_body_mobility.jpg", // Pastikan gambar ada
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MobilityPage()),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      _buildProgramCategoryCard(
                        context,
                        "Fitness Training",
                        "assets/images/fitness_training.jpg", // Ganti dengan path gambar kamu
                        () {
                          // TODO: Navigasi ke FitnessPage
                          print("Navigasi ke FitnessPage (belum dibuat)");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const FitnessPage()),
                          // );
                        },
                      ),
                      const SizedBox(width: 16),
                      _buildProgramCategoryCard(
                        context,
                        "Recovery & Relaxation",
                        "assets/images/recovery_relaxation.jpg", // Ganti dengan path gambar kamu
                        () {
                          // TODO: Navigasi ke RecoveryPage
                          print("Navigasi ke RecoveryPage (belum dibuat)");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const RecoveryPage()),
                          // );
                        },
                      ),
                      // Tambahkan card lain jika perlu
                      const SizedBox(width: 16), // Spasi di akhir
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Karena ini adalah halaman Programs, indexnya 1
        onTap: (index) {
          switch(index) {
            case 0: // Jika tombol Home (index 0) diklik
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Mend.Wellness Clinic')),
              );
              break;
            case 1: // Jika tombol Programs (index 1) diklik
              // Tetap di halaman Programs
              break;
            case 2: // Jika tombol Workouts (index 2) diklik
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WorkoutsPage()),
              );
              break;
          }
        },
      ),
    );
  }

  // Widget helper untuk membuat card daerah tubuh
  Widget _buildBodyRegionCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Nanti kita isi fungsi navigasi ke halaman program spesifik
        print("Pilih program untuk $title");
        // TODO: Navigasi ke halaman detail program
      },
      child: Card(
        elevation: 4, // Bayangan card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Border bulat
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar daerah tubuh
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat card kategori program
  Widget _buildProgramCategoryCard(
    BuildContext context,
    String title,
    String imagePath,
    VoidCallback onTap, // Fungsi yang dipanggil saat card diklik
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: 150, // Lebar card
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar kategori program
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget BottomNavBar yang digunakan di sini
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Programs'),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workouts'),
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF3A9D4E),
      unselectedItemColor: Colors.grey,
      onTap: onTap,
    );
  }
}
