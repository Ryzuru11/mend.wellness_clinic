// lib/main.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async'; // Tambahkan ini untuk Timer
import 'workouts_page.dart'; // Tambahkan ini


// Import halaman Programs dari file terpisah
import 'programs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mend.Wellness Clinic',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF3A9D4E),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF3A9D4E),
          secondary: Color(0xFF2D8B3F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3A9D4E),
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Latar belakang lebih lembut
      ),
      home: const MyHomePage(title: 'Mend.Wellness Clinic'),
    );
  }
}

// Model Video
class VideoModel {
  final String title;
  final String description;
  final String videoPath;
  final String thumbnailPath;

  const VideoModel({
    required this.title,
    required this.description,
    required this.videoPath,
    required this.thumbnailPath,
  });
}

// Halaman Pemutar Video
class VideoPlayerPage extends StatefulWidget {
  final String videoPath;

  const VideoPlayerPage({super.key, required this.videoPath});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
      ),
      body: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

// Halaman Home
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Placeholder data
  String userName = "yang mulia Hilman";
  int programSessions = 0;
  int dailyPrehabSessions = 0;
  int workoutSessions = 0;

  // Variabel untuk pencarian
  String _searchQuery = '';

  // Daftar video (sesuaikan dengan file yang ada di folder assets/videos/)
  final List<VideoModel> _videos = [
    VideoModel(
      title: "Exercise Video 1",
      description: "Watch this video to improve your mobility.",
      videoPath: 'assets/videos/PUSDHAY_ LATIHAN DADA, BAHU, TRICEPS DI GYM.mp4',
      thumbnailPath: 'assets/images/video_placeholder.jpg',
    ),
    VideoModel(
      title: "Exercise Video 2",
      description: "Another video for improving flexibility.",
      videoPath: 'assets/videos/video_latihan.mp4',
      thumbnailPath: 'assets/images/video_placeholder.jpg',
    ),
    // Tambahkan video lain jika ada
  ];

  // Daftar gambar untuk carousel
  final List<String> _carouselImages = [
    'assets/images/gambar1.png',
    'assets/images/gambar2.png',
    'assets/images/gambar3.png',
  ];

  // Tambahkan variabel untuk autoplay PageView
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Mulai timer untuk autoplay
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Kembali ke halaman pertama
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer saat widget dihapus
    _pageController.dispose(); // Hapus PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter daftar video berdasarkan pencarian
    final filteredVideos = _videos.where((video) {
      return video.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             video.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // === HEADER SECTION ===
              Row(
                children: [
                  // Avatar Placeholder (Bisa diganti dengan foto profil nanti)
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/video_placeholder.jpg'), // Bisa diganti dengan avatar user
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                        ),
                        Text(
                          userName, // Nama user
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3A9D4E),
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Color(0xFF3A9D4E)),
                    onPressed: () {
                      print("Notifikasi diklik");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // === CAROUSEL SECTION ===
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: PageView.builder(
                  itemCount: _carouselImages.length,
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        _carouselImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Indikator Carousel (Titik-titik)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_carouselImages.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 10 : 8,
                    height: _currentPage == index ? 10 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? const Color(0xFF3A9D4E) : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),

              // === PROGRESS TRACKER SECTION ===
              Text(
                "Today's Progress",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCardWithIcon(Icons.assignment, "Program", programSessions),
                    _buildStatCardWithIcon(Icons.healing, "Prehab", dailyPrehabSessions),
                    _buildStatCardWithIcon(Icons.fitness_center, "Workout", workoutSessions),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // === HOW DO YOU FEEL TODAY? ===
              Text(
                "How do you feel today?",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {
                        print("Rating: ${index + 1}");
                      },
                      icon: Icon(
                        Icons.sentiment_satisfied_alt,
                        size: 40,
                        color: Colors.grey[600],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),

              // === RECOMMENDED VIDEO SECTION ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Videos",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      print("Lihat semua video");
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Color(0xFF3A9D4E)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // PageView untuk rekomendasi video
              Container(
                height: 280,
                child: PageView.builder(
                  itemCount: filteredVideos.length,
                  controller: PageController(viewportFraction: 0.85),
                  itemBuilder: (context, index) {
                    final video = filteredVideos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoPlayerPage(videoPath: video.videoPath)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF3A9D4E).withOpacity(0.3)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Thumbnail
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Container(
                                height: 160,
                                color: Colors.grey[300],
                                child: video.thumbnailPath.isNotEmpty
                                    ? Image.asset(video.thumbnailPath, fit: BoxFit.cover)
                                    : const Icon(Icons.play_circle_fill, size: 50, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video.title,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    video.description,
                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // === CALL TO ACTION BUTTON ===
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    print("Tombol 'Start Your Session' diklik!");
                  },
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  label: const Text(
                    'Start Your Session',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3A9D4E),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Programs'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workouts'),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF3A9D4E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              // Tetap di halaman Home
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProgramsPage()),
              );
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

  // Widget helper untuk membuat card statistik dengan ikon
  Widget _buildStatCardWithIcon(IconData icon, String label, int value) {
    return Column(
      children: [
        Icon(icon, size: 30, color: const Color(0xFF3A9D4E)),
        const SizedBox(height: 8),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3A9D4E)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
