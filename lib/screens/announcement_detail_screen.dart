import 'package:flutter/material.dart';
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Text(
                    'Maintenance Pra UAS Semester Genap 2020/2021',
                    style: TextStyle(
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
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Teks Author & Tanggal
                      const Expanded(
                        child: Text(
                          'By Admin CeLOE – Rabu, 2 Juni 2021, 10:45',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Gambar Ilustrasi
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background illustration placeholder
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Server/Maintenance Icon
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.engineering,
                                  size: 48,
                                  color: Colors.orange[700],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildServerIcon(),
                                  const SizedBox(width: 8),
                                  _buildServerIcon(),
                                  const SizedBox(width: 8),
                                  _buildServerIcon(),
                                ],
                              ),
                            ],
                          ),
                          // Warning sign
                          Positioned(
                            top: 16,
                            right: 24,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.yellow[600],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.warning, size: 16, color: Colors.black87),
                                  SizedBox(width: 4),
                                  Text(
                                    'Maintenance',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Sub Judul Konten
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Center(
                    child: Text(
                      'Maintenance LMS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Isi Pengumuman
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Hormat Kami,',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'CeLOE Telkom University',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
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
      title: const Text(
        'Pengumuman',
        style: TextStyle(
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
