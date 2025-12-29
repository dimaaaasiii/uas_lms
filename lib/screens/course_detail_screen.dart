import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import 'dashboard_screen.dart';
import 'class_screen.dart';
import 'notification_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _bottomNavIndex = 1; // Class is active

  // Dummy Data for "Materi"
  final List<Map<String, dynamic>> _materials = [
    {
      'meeting': 'Pertemuan 1',
      'title': '01 - Pengantar User Interface Design',
      'description': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': false,
    },
    {
      'meeting': 'Pertemuan 2',
      'title': '02 - Konsep User Interface Design',
      'description': '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
      'isCompleted': true,
    },
    {
      'meeting': 'Pertemuan 3',
      'title': '03 - Interaksi pada User Interface Design',
      'description': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
    {
      'meeting': 'Pertemuan 4',
      'title': '04 - Ethnographic Observation',
      'description': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
    {
      'meeting': 'Pertemuan 5',
      'title': '05 - UID Testing',
      'description': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
    {
      'meeting': 'Pertemuan 6',
      'title': '06 - Assessment 1',
      'description': '3 URLs, 2 Files, 3 Interactive Content',
      'isCompleted': true,
    },
  ];

  // Dummy Data for "Tugas"
  final List<Map<String, dynamic>> _tasks = [
    {
      'type': 'Tugas',
      'title': 'Tugas 01 - UID Android Mobile Game',
      'deadline': 'Jumat, 26 Februari 2021, 23:59 WIB',
      'status': 'Selesai',
      'statusColor': Colors.green,
    },
    {
      'type': 'Kuis',
      'title': 'Kuis Pertemuan 2',
      'deadline': 'Jumat, 5 Maret 2021, 13:00 WIB',
      'status': 'Selesai',
      'statusColor': Colors.green,
    },
    {
      'type': 'Tugas',
      'title': 'Tugas 02 - Prototyping',
      'deadline': 'Jumat, 12 Maret 2021, 23:59 WIB',
      'status': 'Belum Mengumpulkan',
      'statusColor': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2), // Light Grey Background
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor, // Maroon
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]',
            textAlign: TextAlign.left,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                unselectedLabelStyle: GoogleFonts.outfit(),
                tabs: const [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas Dan Kuis'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Materi
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _materials.length,
              itemBuilder: (context, index) {
                return _buildMaterialCard(_materials[index]);
              },
            ),
            // Tab 2: Tugas Dan Kuis (Empty/Placeholder)
            // Tab 2: Tugas Dan Kuis
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return _buildTaskCard(_tasks[index]);
              },
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildMaterialCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Chip & Status
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data['meeting'],
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.check_circle,
                  color: data['isCompleted'] ? Colors.green : Colors.grey[300],
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              data['title'],
              style: GoogleFonts.outfit(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              data['description'],
              style: GoogleFonts.outfit(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Chip & Status
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color:  data['type'] == 'Kuis' ? Colors.orange : AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data['type'],
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  data['status'],
                  style: GoogleFonts.outfit(
                    color: data['statusColor'],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              data['title'],
              style: GoogleFonts.outfit(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              'Deadline: ${data['deadline']}',
              style: GoogleFonts.outfit(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor, // Maroon Background as requested
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0), // Requirement didn't specify radius, assuming standard flat or custom
          topRight: Radius.circular(0),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Maroon from container
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
