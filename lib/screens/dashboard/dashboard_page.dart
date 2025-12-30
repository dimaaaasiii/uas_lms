import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme.dart';
import '../class_screen.dart';
import '../notification_screen.dart';
import '../profile_screen.dart';
import '../announcement_list_screen.dart';
import '../task_detail_screen.dart';

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
          // Content Scrollable
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 110), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                
                // Section: Tugas Yang Akan Datang
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
                            child: Text(
                              'Lihat Semua', 
                              style: GoogleFonts.outfit(
                                color: const Color(0xFF1565C0),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
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

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 70, 24, 40),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x33B71C1C),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/user_profile.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
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
                children: [
                  Text(
                    'Hallo,',
                    style: GoogleFonts.outfit(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'DIMAS WAHYU ROMADHONI',
                    style: GoogleFonts.outfit(
                      color: Colors.white, 
                      fontSize: 22, 
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Text(
                    'MAHASISWA',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.verified_user_rounded, color: Colors.white, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(0.6),
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildUpcomingTaskCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TaskDetailScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB71C1C), Color(0xFF8B1010)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB71C1C).withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'Mobile Progaming Lanjut',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: Colors.white.withOpacity(0.7),
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Tugas 01',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 1, 
              width: 40, 
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time_filled_rounded, size: 16, color: Colors.white.withOpacity(0.7)),
                const SizedBox(width: 8),
                Text(
                  'Waktu Pengumpulan:',
                  style: GoogleFonts.outfit(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Rabu 31 Desember, 23:59 WIB',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(Icons.campaign_outlined, size: 64, color: Colors.grey[200]),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'PENTING',
                      style: GoogleFonts.outfit(
                        color: AppTheme.primaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UAS Semester Ganjil 2024/2025',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded, size: 14, color: Colors.grey[400]),
                    const SizedBox(width: 8),
                    Text(
                      '01 Januari 2026',
                      style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassProgressList() {
    final List<Map<String, dynamic>> progresses = [
      {
        'title': 'Seminar Tugas Akhir',
        'term': '2024/2025',
        'progress': 0.89,
      },
      {
        'title': 'SISTEM CERDAS',
        'term': '2024/2025',
        'progress': 0.75,
      },
      {
        'title': 'MOBILE PROGRAMMING LANJUT',
        'term': '2024/2025',
        'progress': 0.90,
      },
    ];

    return Column(
      children: progresses.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.menu_book_rounded, color: AppTheme.primaryColor, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['term'],
                          style: GoogleFonts.outfit(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${(item['progress'] * 100).toInt()}% Selesai',
                          style: GoogleFonts.outfit(
                            fontSize: 11, 
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title'],
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 14),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: item['progress'],
                        minHeight: 6,
                        backgroundColor: Colors.grey[100],
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB71C1C).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.4),
          selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 11),
          unselectedLabelStyle: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w500),
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            if (index == 0) return;
            
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClassScreen()),
              );
            } else if (index == 2) {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.grid_view_rounded),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.class_outlined),
              ),
              label: 'Kelas',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.notifications_none_rounded),
              ),
              label: 'Notifikasi',
            ),
          ],
        ),
      ),
    );
  }
}
