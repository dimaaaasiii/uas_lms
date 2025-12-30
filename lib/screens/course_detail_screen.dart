import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import 'dashboard/dashboard_page.dart';
import 'class_screen.dart';
import 'notification_screen.dart';
import 'detail_materi_screen.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Sistem Cerdas',
            textAlign: TextAlign.left,
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
              ),
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 1.5,
                labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 14),
                unselectedLabelStyle: GoogleFonts.outfit(fontSize: 14),
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
            _buildMateriTab(),
            // Tab 2: Tugas Dan Kuis
            _buildTugasTab(),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildMateriTab() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      itemCount: _materials.length,
      itemBuilder: (context, index) {
        return _buildMaterialCard(_materials[index]);
      },
    );
  }

  Widget _buildTugasTab() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return _buildTaskCard(_tasks[index]);
      },
    );
  }

  Widget _buildMaterialCard(Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMateriScreen(
              title: data['title'],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      data['meeting'],
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF1976D2),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.check_circle,
                    color: data['isCompleted'] ? const Color(0xFF4CAF50) : Colors.grey[200],
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                data['title'],
                style: GoogleFonts.outfit(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data['description'],
                style: GoogleFonts.outfit(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: data['type'] == 'Kuis' ? const Color(0xFFFFF3E0) : const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    data['type'].toUpperCase(),
                    style: GoogleFonts.outfit(
                      color: data['type'] == 'Kuis' ? Colors.orange[800] : const Color(0xFFD32F2F),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  data['status'],
                  style: GoogleFonts.outfit(
                    color: data['statusColor'],
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              data['title'],
              style: GoogleFonts.outfit(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time_rounded, color: Colors.grey, size: 14),
                const SizedBox(width: 6),
                Text(
                  'Deadline: ${data['deadline']}',
                  style: GoogleFonts.outfit(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: GoogleFonts.outfit(fontSize: 11),
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
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_outlined),
            activeIcon: Icon(Icons.class_),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}
