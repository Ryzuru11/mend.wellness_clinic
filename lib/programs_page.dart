// lib/programs_page.dart
import 'package:flutter/material.dart';
import 'main.dart'; // Untuk akses MyHomePage
import 'workouts_page.dart'; // Untuk akses WorkoutsPage
import 'mobility_page.dart'; // Untuk akses MobilityPage

class ProgramsPage extends StatelessWidget {
  ProgramsPage({super.key});

  final List<Map<String, String>> bodyRegions = [
    {"title": "Foot/Ankle", "imagePath": "assets/images/foot_ankle.jpg"},
    {"title": "Head/Neck", "imagePath": "assets/images/head_neck.jpg"},
    {"title": "Upper Back", "imagePath": "assets/images/upper_back.jpg"},
    {"title": "Elbow/Wrist", "imagePath": "assets/images/elbow_wrist.jpg"},
    {"title": "Shoulder", "imagePath": "assets/images/shoulder.jpg"},
    {"title": "Lower Back", "imagePath": "assets/images/lower_back.jpg"},
    {"title": "Knee", "imagePath": "assets/images/knee.jpg"},
    {"title": "Hip", "imagePath": "assets/images/hip.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programs"),
        backgroundColor: const Color(0xFF3A9D4E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // === HEADER PROGRAMS (diperbagus) ===
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.explore, color: Color(0xFF3A9D4E), size: 28),
                      const SizedBox(width: 12),
                      const Text(
                        "Explore Programs",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A9D4E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Let’s find the perfect program for your body and goals — whether you’re recovering, training, or just moving better.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // === CLINIC RECOMMENDATION VIDEO (dengan gaya modern) ===
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF5FFF5),
                border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3A9D4E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.video_library, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Clinic Recommendation Video",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A9D4E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Personalized videos from our physiotherapists to guide your recovery and boost mobility — made just for you.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 240,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        final programs = [
                          {
                            "title": "Upper Body Recovery Guide",
                            "description": "Rehab exercises for shoulder and arm injuries.",
                            "imagePath": "assets/images/upper_body_performance.jpg",
                          },
                          {
                            "title": "Lower Body Mobility Tips",
                            "description": "Gentle movements for knee and hip recovery.",
                            "imagePath": "assets/images/lower_body_performance.jpg",
                          },
                          {
                            "title": "Full Body Relaxation Routine",
                            "description": "Stress relief and gentle stretching for whole body.",
                            "imagePath": "assets/images/full_body_performance.jpg",
                          },
                        ];

                        final program = programs[index];

                        return Container(
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.3)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                child: Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    image: DecorationImage(
                                      image: AssetImage(program["imagePath"]!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      program["title"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xFF3A9D4E),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      program["description"]!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // === BY BODY REGION (diperbagus) ===
            const Text(
              "📍 By Body Region",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (bodyRegions.length / 2).ceil(),
              itemBuilder: (context, rowIndex) {
                int startIndex = rowIndex * 2;
                int endIndex = startIndex + 2;
                if (endIndex > bodyRegions.length) {
                  endIndex = bodyRegions.length;
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(endIndex - startIndex, (index) {
                    int itemIndex = startIndex + index;
                    var item = bodyRegions[itemIndex];
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: _buildBodyRegionCard(context, item['title']!, item['imagePath']!),
                      ),
                    );
                  }),
                );
              },
            ),
            const SizedBox(height: 32),

            // === PROGRAM CATEGORIES (diperbagus) ===
            const Text(
              "🎯 Program Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProgramCategoryCard(
                      context,
                      "Full Body Mobility",
                      "assets/images/full_body_mobility.jpg",
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
                      "assets/images/fitness_training.jpg",
                      () {
                        print("Navigasi ke FitnessPage (belum dibuat)");
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildProgramCategoryCard(
                      context,
                      "Recovery & Relaxation",
                      "assets/images/recovery_relaxation.jpg",
                      () {
                        print("Navigasi ke RecoveryPage (belum dibuat)");
                      },
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40), // 🔥 JARAK AMAN SEBELUM BOTTOM NAV BAR

            // === TAMBAHKAN SPACE DI BAWAH UNTUK MENGHINDARI KOSONG ===
            const SizedBox(height: 20), // Memberi ruang ekstra agar tidak terlalu rapat ke bottom nav

          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          switch(index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Mend.Wellness Clinic')),
              );
              break;
            case 1:
              break;
            case 2:
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

  // Widget helper: Card Daerah Tubuh (2 kolom) — diperbagus
  Widget _buildBodyRegionCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        print("Pilih program untuk $title");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
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
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper: Card Kategori Program — diperbagus
  Widget _buildProgramCategoryCard(
    BuildContext context,
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
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
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget BottomNavBar
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