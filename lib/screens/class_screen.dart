import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import 'dashboard_screen.dart';
import 'notification_screen.dart';
import 'course_detail_screen.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  int _bottomNavIndex = 1;

  final List<Map<String, dynamic>> classes = [
    {
      'title': 'SISTEM CERDAS',
      'code': 'MKK020127',
      'lecturer': 'MIFTAHUL WALID, S.Kom., MT',
      'progress': 0.89,
      'image': 'assets/images/class_code.png',
      'term': '2021/2',
      'status': 'Approved',
    },
    {
      'title': 'SEMINAR TUGAS AKHIR',
      'code': 'MPB020102',
      'lecturer': 'Dr. HOZAIRI, S.ST., M.T',
      'progress': 0.86,
      'image': 'assets/images/class_uiux.png',
      'term': '2021/2',
      'status': 'Approved',
    },
    {
      'title': 'PENGAMAN SISTEM CYBER',
      'code': 'MKK-020124',
      'lecturer': 'HOIRIYAH, S.Kom., M.Kom',
      'progress': 0.90,
      'image': 'assets/images/class_code.png',
      'term': '2021/2',
      'status': 'Approved',
    },
    {
      'title': 'MOBILE PROGRAMING LANJUT',
      'code': 'MKB020122',
      'lecturer': 'ROFIUDDIN, M. Kom',
      'progress': 0.90,
      'image': 'assets/images/class_code.png',
      'term': '2021/2',
      'status': 'Approved',
    },
    {
      'title': 'APLIKASI SISTEM INFORMASI GEOGRAFIS',
      'code': 'MKB020117',
      'lecturer': 'ARY ISWAHYUDI, S.Si.,M.T',
      'progress': 0.90,
      'image': 'assets/images/class_uiux.png',
      'term': '2021/2',
      'status': 'Approved',
    },
    {
      'title': 'KULIAH KERJA NYATA',
      'code': 'MBB020102',
      'lecturer': 'ROFIUDDIN, M. Kom',
      'progress': 0.90,
      'image': 'assets/images/class_pancasila.png',
      'term': '2021/2',
      'status': 'Approved',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Kelas Saya',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final course = classes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to top
                children: [
                  // Thumbnail Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0), // Sharp edges as per design
                    child: Image.asset(
                      course['image'],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 70,
                        height: 70,
                        color: AppTheme.primaryColor.withOpacity(0.1),
                        child: const Icon(Icons.book, color: AppTheme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Term
                        Text(
                          course['term'],
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Title
                        Text(
                          course['title'],
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                         const SizedBox(height: 2),
                         // Code
                        Text(
                          '${course['code']} [${course['lecturer'].split(',')[0]}]', // Use just first name part or code
                           style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                           maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        // Progress Bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: course['progress'],
                            minHeight: 6,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFA81111)), // Dark red
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${(course['progress'] * 100).toInt()}% Selesai',
                           style: GoogleFonts.outfit(
                            fontSize: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
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
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

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
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.outfit(),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
              (route) => false,
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
