import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'announcement_detail_screen.dart';
import 'announcement_list_screen.dart';
import 'class_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // Spacing for BottomNav
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                
                // Section: TUgas Yang Akan Datang
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildSectionHeader('TUGAS YANG AKAN DATANG'),
                      const SizedBox(height: 16),
                      _buildUpcomingTaskCard(),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),

                // Section: Pengumuman Terakhir
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSectionHeader('PENGUMUMAN TERAKHIR'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AnnouncementListScreen()),
                              );
                            },
                            child: Text('Lihat Semua', style: GoogleFonts.outfit(color: Colors.blue)),
                          ),
                        ],
                      ),
                      _buildAnnouncementCard(),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Section: Progres Kelas
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('PROGRES KELAS'),
                      const SizedBox(height: 16),
                      _buildClassProgressList(),
                    ],
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

  // 1. HEADER
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 140, // Increased height to accommodate status bar padding + content
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 24), // Add top padding for status bar area
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Center vertically in the container content area
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Wrap content height
                children: [
                   Text(
                    'Hallo,',
                    style: GoogleFonts.outfit(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dimas',
                    style: GoogleFonts.outfit(
                      color: Colors.white, 
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          
          GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2), // Darker red effect
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    'MAHASISWA',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.person, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // 2. UPCOMING TASK CARD
  Widget _buildUpcomingTaskCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF8B1010), // Merah lebih tua (Dark Red)
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tugas 01 - UID Android Mobile Game',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Divider tipis
          Container(height: 1, width: 60, color: Colors.white24),
          const SizedBox(height: 16),
          Text(
            'Waktu Pengumpulan',
            style: GoogleFonts.outfit(color: Colors.white.withOpacity(0.7), fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            'Jumat 26 Februari, 23:59 WIB',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 3. ANNOUNCEMENT CARD
  Widget _buildAnnouncementCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnouncementDetailScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Illustration Placeholder
            ClipRRect(
               borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                'assets/images/maintenance.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) => Container(
                  height: 120,
                  width: double.infinity,
                  color: const Color(0xFFEEEEEE),
                   child: Center(
                    child: Icon(Icons.campaign, size: 48, color: Colors.grey[400]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Maintenance Pra UAS Semester Genap 2020/2021',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. CLASS PROGRESS SECTION
  Widget _buildClassProgressList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Thumbnail
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.book, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 16),
              
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          '2021/2',
                          style: GoogleFonts.outfit(fontSize: 10, color: Colors.grey),
                        ),
                         Text(
                          '89% Selesai',
                          style: GoogleFonts.outfit(
                            fontSize: 10, 
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'PEMROGRAMAN BERORIENTASI OBJEK',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'CSI322 • Dosen Pengampu',
                      style: GoogleFonts.outfit(fontSize: 10, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: 0.89,
                        minHeight: 4,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 5. BOTTOM NAVIGATION BAR
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Use Container color
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.outfit(),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          if (index == 1) {
            // Navigate to Kelas Saya
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClassScreen()),
            );
          } else if (index == 2) {
            // Navigate to Notifikasi
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationScreen()),
            );
          } else {
            setState(() {
              _bottomNavIndex = index;
            });
          }
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
