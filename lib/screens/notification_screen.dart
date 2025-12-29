import 'package:flutter/material.dart';
import '../core/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _bottomNavIndex = 2; // Notifikasi is active by default

  // Dummy data notifikasi
  final List<Map<String, dynamic>> _notifications = [
    {
      'icon': Icons.assignment_outlined,
      'title': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
      'time': '3 Hari 9 Jam Yang Lalu',
    },
    {
      'icon': Icons.quiz_outlined,
      'title': 'Anda telah menyelesaikan kuis Formatif Quiz Pertemuan 7',
      'time': '5 Hari 2 Jam Yang Lalu',
    },
    {
      'icon': Icons.assignment_outlined,
      'title': 'Anda telah mengirimkan pengajuan tugas untuk Tugas 02 - Prototyping Mobile App',
      'time': '1 Minggu Yang Lalu',
    },
    {
      'icon': Icons.quiz_outlined,
      'title': 'Anda telah menyelesaikan kuis Formatif Quiz Pertemuan 6',
      'time': '1 Minggu 3 Hari Yang Lalu',
    },
    {
      'icon': Icons.assignment_outlined,
      'title': 'Anda telah mengirimkan pengajuan tugas untuk Tugas 01 - UID Android Mobile Game',
      'time': '2 Minggu Yang Lalu',
    },
    {
      'icon': Icons.quiz_outlined,
      'title': 'Anda telah menyelesaikan kuis Formatif Quiz Pertemuan 5',
      'time': '2 Minggu 1 Hari Yang Lalu',
    },
    {
      'icon': Icons.assignment_outlined,
      'title': 'Anda telah mengirimkan pengajuan tugas untuk Assessment 2 (Tugas Individu)',
      'time': '3 Minggu Yang Lalu',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          // Content
          ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
            itemCount: _notifications.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              return _buildNotificationItem(_notifications[index]);
            },
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  // App Bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Notifikasi',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  // Notification Item
  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Icon(
          notification['icon'] as IconData,
          size: 24,
          color: Colors.black87,
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Notifikasi
              Text(
                notification['title'] as String,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              // Waktu Notifikasi
              Text(
                notification['time'] as String,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}
