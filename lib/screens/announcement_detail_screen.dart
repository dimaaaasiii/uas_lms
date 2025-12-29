import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';

class AnnouncementDetailScreen extends StatefulWidget {
  const AnnouncementDetailScreen({super.key});

  @override
  State<AnnouncementDetailScreen> createState() => _AnnouncementDetailScreenState();
}

class _AnnouncementDetailScreenState extends State<AnnouncementDetailScreen> {
  int _bottomNavIndex = 2; // Notifikasi is active by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // Spacing for BottomNav
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Pengumuman
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Text(
                    'Maintenance Pra UAS Semester Genap 2020/2021',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                ),

                // Informasi Penulis
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    children: [
                      // Avatar placeholder
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Teks Author & Tanggal
                      Expanded(
                        child: Text(
                          'By Admin CeLOE – Rabu, 2 Juni 2021, 10:45',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Gambar Ilustrasi
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/maintenance.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                             height: 200,
                             color: Colors.grey[100],
                             child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                        ),
                      ),
                     
                    ),
                  ),
                ),

                // Sub Judul Konten
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                  child: Center(
                    child: Text(
                      'Maintenance LMS',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Isi Pengumuman
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          color: const Color(0xFF424242),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          color: const Color(0xFF424242),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          color: const Color(0xFF424242),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Hormat Kami,',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          color: const Color(0xFF424242),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'CeLOE Telkom University',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF424242),
                          height: 1.6,
                        ),
                      ),
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
      title: Text(
        'Pengumuman',
        style: GoogleFonts.outfit(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  // Server icon for illustration
  Widget _buildServerIcon() {
    return Container(
      width: 36,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 4,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Container(
            width: 24,
            height: 4,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Container(
            width: 24,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
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
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.outfit(),
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
