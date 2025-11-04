// lib/mobility_page.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // Tambahkan ini

class MobilityPage extends StatefulWidget {
  const MobilityPage({super.key});

  @override
  State<MobilityPage> createState() => _MobilityPageState();
}

class _MobilityPageState extends State<MobilityPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Ganti path video dengan path video kamu
    _controller = VideoPlayerController.asset('assets/videos/PUSDHAY_ LATIHAN DADA, BAHU, TRICEPS DI GYM.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true); // Video akan terus berulang
  }

  @override
  void dispose() {
    _controller.dispose(); // Hapus controller saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Body Mobility"),
        backgroundColor: const Color(0xFF3A9D4E),
        foregroundColor: Colors.white,
        elevation: 0, // Hilangkan bayangan AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === HERO VIDEO PLAYER ===
              Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _controller.value.isInitialized
                    ? Stack(
                        children: [
                          // Video Player
                          VideoPlayer(_controller),
                          // Overlay gelap untuk teks
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
                          // Teks overlay
                          const Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Full Body Mobility",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Improve your range of motion and flexibility.",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()), // Tampilkan loading jika video belum siap
              ),
              const SizedBox(height: 24),

              // === YOUR PREHAB PATH ===
              const Text(
                "Your Prehab Path",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPathItem("Full Body\nPrehab", Colors.green),
                      _buildPathItem("Fitness\nFundamentals", Colors.yellow),
                      _buildPathItem("Full Body\nMobility", Colors.orange),
                      _buildPathItem("Fitness", Colors.red),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // === PROGRAM INFO ===
              const Text(
                "Program Info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoItem("8", "Weeks"),
                      _buildInfoItem("4", "Days/week"),
                      _buildInfoItem("30", "Mins/day"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // === STATS ===
              const Text(
                "Stats",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem("10.2K", "Members", const Color(0xFFFF4D4D)),
                      _buildStatItem("Gym /\nHome", "Location", const Color(0xFF4DFF4D)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // === POPULAR CONDITIONS ===
              const Text(
                "Popular Conditions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "• Other conditions: Those with limitations in their mobility.",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // === PERSONALIZE AND START BUTTON ===
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Personalize and Start Program diklik!");
                      // TODO: Nanti kita isi fungsi personalisasi
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A9D4E),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Personalize and Start Program",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // === DESCRIPTION ===
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A9D4E),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Mobility is not just the ability to move, it's the ability to move well. "
                    "This program is designed to improve your range of motion, reduce stiffness, "
                    "and enhance overall body function. Perfect for anyone looking to unlock their body's potential.",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat item path
  Widget _buildPathItem(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Widget helper untuk membuat item info program
  Widget _buildInfoItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A9D4E),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Widget helper untuk membuat item stats
  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
