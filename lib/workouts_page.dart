// lib/workouts_page.dart
import 'package:flutter/material.dart';
import 'main.dart'; // Impor halaman Home
import 'programs_page.dart'; // Impor halaman Programs

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        backgroundColor: const Color(0xFF3A9D4E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === HERO SECTION (Placeholder) ===
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    // Ganti dengan AssetImage jika sudah ada
                    image: NetworkImage('https://picsum.photos/seed/workout/600/400'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Overlay Gelap untuk teks
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Workout of the Week',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Full Body Strength Blast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // === CATEGORIES SECTION ===
              const Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 16),
              // Kita pakai ListView horizontal agar bisa discroll
              SizedBox(
                height: 100, // Tentukan tinggi tetap
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard('Strengthening', Icons.fitness_center),
                    const SizedBox(width: 16),
                    _buildCategoryCard('Mobility', Icons.accessibility_new),
                    const SizedBox(width: 16),
                    _buildCategoryCard('Recovery', Icons.spa),
                    const SizedBox(width: 16),
                    _buildCategoryCard('Warm-up', Icons.directions_run),
                    const SizedBox(width: 16),
                    _buildCategoryCard('Cool-down', Icons.airline_seat_recline_extra),
                    const SizedBox(width: 16), // Spasi di akhir
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // === POPULAR WORKOUTS SECTION ===
              const Text(
                'Popular Workouts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                5, // Misalnya 5 workout populer
                (index) => _buildWorkoutCard(
                  context,
                  'Popular Workout $index',
                  'assets/images/video_placeholder.jpg', // Ganti dengan path asli
                  '45 mins',
                  4.5, // Rating
                ),
              ),
              const SizedBox(height: 24),

              // === YOUR PROGRESS CARD ===
              const Text(
                'Your Progress',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('This Week', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    // Hapus const di sini karena memanggil fungsi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard('Completed', 3),
                        _buildStatCard('Planned', 5),
                        _buildStatCard('Streak', 2),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // === RECENT ACTIVITY SECTION ===
              const Text(
                'Recent Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                3, // Misalnya 3 aktivitas terakhir
                (index) => _buildActivityItem('Completed: Core Stability Routine', '2 days ago'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // === BOTTOM NAVIGATION BAR ===
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
        ],
        currentIndex: 2, // Karena ini adalah halaman Workouts, indexnya 2
        selectedItemColor: const Color(0xFF3A9D4E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0: // Jika tombol Home (index 0) diklik
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Mend.Wellness Clinic')),
              );
              break;
            case 1: // Jika tombol Programs (index 1) diklik
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProgramsPage()),
              );
              break;
            case 2: // Jika tombol Workouts (index 2) diklik
              // Tetap di halaman Workouts
              break;
          }
        },
      ),
    );
  }

  // --- WIDGET HELPERS ---

  /// Membuat card kategori workout
  Widget _buildCategoryCard(String title, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 100, // Lebar card
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF3A9D4E)),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  /// Membuat card workout
  Widget _buildWorkoutCard(BuildContext context, String title, String imagePath, String duration, double rating) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(duration),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text(rating.toString(), style: const TextStyle(fontSize: 12)),
          ],
        ),
        onTap: () {
          // TODO: Navigasi ke detail workout
          print('Tapped on $title');
        },
      ),
    );
  }

  /// Membuat item aktivitas terbaru
  Widget _buildActivityItem(String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  /// Membuat card statistik kecil
  static Widget _buildStatCard(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A9D4E),
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
