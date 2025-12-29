import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import 'profile_edit_screen.dart';

class ProfileKelasScreen extends StatefulWidget {
  const ProfileKelasScreen({super.key});

  @override
  State<ProfileKelasScreen> createState() => _ProfileKelasScreenState();
}

class _ProfileKelasScreenState extends State<ProfileKelasScreen> {
  int _bottomNavIndex = 1; // Kelas Saya active

  // Sample class data
  final List<Map<String, String>> _classList = [
    {
      'name': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
      'code': 'D4SM-41-GABI [ARS]',
      'date': 'Tanggal Mulai Monday, 8 February 2021',
    },
    {
      'name': 'PEMROGRAMAN BERORIENTASI OBJEK',
      'code': 'D4SM-41-PBO [CSI]',
      'date': 'Tanggal Mulai Monday, 8 February 2021',
    },
    {
      'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'code': 'D4SM-41-DAUP [TRM]',
      'date': 'Tanggal Mulai Monday, 8 February 2021',
    },
    {
      'name': 'BASIS DATA LANJUT',
      'code': 'D4SM-41-BDL [DBM]',
      'date': 'Tanggal Mulai Monday, 8 February 2021',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                // 1. Header & Tab Stack
                SizedBox(
                  height: 340,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Red Header Background
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 280,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: SafeArea(
                            child: Column(
                              children: [
                                // Top Bar (Back Button)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Profile Photo
                                Container(
                                  width: 110,
                                  height: 110,
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8B1010), // Darker red
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Container(
                                      color: const Color(0xFF8B1010),
                                      child: const Icon(Icons.person, size: 60, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                
                                // User Name
                                const Text(
                                  'DIMAS WAHYU ROMADHONI',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Floating Tab Card
                      Positioned(
                        bottom: 0,
                        left: 24,
                        right: 24,
                        height: 70,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTabItem('About Me', isActive: false, onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                                );
                              }),
                              _buildTabItem('Kelas', isActive: true, onTap: () {}),
                              _buildTabItem('Edit Profile', isActive: false, onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProfileEditScreen()),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 2. Class List Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _classList.map((classItem) => _buildClassItem(classItem)).toList(),
                  ),
                ),
              ],
            ),
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

  Widget _buildTabItem(String title, {required bool isActive, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.black87 : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
          if (isActive) ...[
            const SizedBox(height: 4),
            Container(
              width: 20,
              height: 2,
              color: Colors.grey,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildClassItem(Map<String, String> classItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Blue oval placeholder
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF90CAF9), // Light blue
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.class_, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          
          // Right: Class info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classItem['name'] ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  classItem['code'] ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  classItem['date'] ?? '',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION BAR
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
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            if (index == 0) { // Home
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            }
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
