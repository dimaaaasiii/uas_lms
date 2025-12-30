import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/screens/materi_pembelajaran_screen.dart';
import 'quiz_detail_screen.dart';
import 'task_detail_screen.dart';

class DetailMateriScreen extends StatelessWidget {
  final String title;
  const DetailMateriScreen({super.key, this.title = "Konsep User Interface Design"});

  @override
  Widget build(BuildContext context) {
    // Determine content based on title
    bool isPengantar = title.contains("Pengantar");
    
    String description = isPengantar
        ? "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience"
        : "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.";

    return DefaultTabController(
      initialIndex: 0, // "Lampiran Materi" tab aktif sesuai screenshot
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // iOS Style Handle
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Text(
                        title.replaceFirst(RegExp(r'^\d+\s*-\s*'), ''), // Strip numeric prefix if any
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Section Deskripsi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi",
                      style: GoogleFonts.outfit(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.outfit(
                        fontSize: 13,
                        color: Colors.grey[800],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Navigation
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5), // Light grey background like in screenshot
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.black,
                  indicatorWeight: 3,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
                  labelStyle: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: "Lampiran Materi"),
                    Tab(text: "Tugas dan Kuis"),
                  ],
                ),
              ),

              // Tab Content
              Expanded(
                child: TabBarView(
                  children: [
                    _buildMateriList(context),
                    isPengantar ? _buildEmptyTugasList() : _buildTugasDanKuisList(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMateriList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      children: [
        _buildResourceCard("Zoom Meeting Syncronous", Icons.link, isDone: true),
        const SizedBox(height: 12),
        _buildResourceCard(
          "Pengantar User Interface Design", 
          Icons.description_outlined, 
          isDone: false,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MateriPembelajaranScreen()),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildResourceCard("Empat Teori Dasar Antarmuka Pengguna", Icons.description_outlined, isDone: false),
        const SizedBox(height: 12),
        _buildResourceCard("Empat Teori Dasar Antarmuka Pengguna", Icons.description_outlined, isDone: true),
        const SizedBox(height: 12),
        _buildResourceCard("User Interface Design for Beginner", Icons.videocam_outlined, isDone: true),
        const SizedBox(height: 12),
        _buildResourceCard("20 Prinsip Desain", Icons.link, isDone: true),
        const SizedBox(height: 12),
        _buildResourceCard("Best Practice UI Design", Icons.link, isDone: true),
      ],
    );
  }

  Widget _buildResourceCard(String title, IconData icon, {required bool isDone, VoidCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Icon(icon, color: Colors.black, size: 24),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: isDone ? const Color(0xFF4CAF50) : Colors.grey[300],
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyTugasList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty_state_tugas.png',
          width: 250,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.assignment_late, size: 100, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        Text(
          "Tidak Ada Tugas Dan Kuis Hari Ini",
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTugasDanKuisList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      children: [
        // CARD 1 : QUIZ
        _buildQuizCard(context),
        const SizedBox(height: 16),
        // CARD 2 : TUGAS
        _buildTugasCard(context),
      ],
    );
  }

  Widget _buildQuizCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print("Quiz card tapped! Navigating to QuizDetailScreen...");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizDetailScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sisi Kiri: Icon & Divider
                  Column(
                    children: [
                      const Icon(Icons.quiz_outlined, color: Colors.black, size: 28),
                      const SizedBox(height: 12),
                      Container(
                        width: 1,
                        height: 60,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Sisi Kanan: Konten
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quiz Review 01",
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF4CAF50),
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan. Kerjakan sebelum hari Jum'at, 31 Desember 2025 jam 23:59 WIB.",
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTugasCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TaskDetailScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  const Icon(Icons.description_outlined, color: Colors.black, size: 28),
                  const SizedBox(width: 20),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Tugas 01 – Represensi Pengetahuan",
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey[200],
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildBulletItem("1", "Buatlah desain tampilan Represensi Pengetahuanyang akan menjadi tugas."),
                        const SizedBox(height: 8),
                        _buildBulletItem("2", "Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka hingga selesai."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$number. ",
          style: GoogleFonts.outfit(
            fontSize: 12,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
