import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMateriScreen extends StatelessWidget {
  final String title;
  const DetailMateriScreen({super.key, this.title = "Konsep User Interface Design"});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, // "Tugas dan Kuis" tab aktif
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
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                      "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.outfit(
                        fontSize: 13,
                        color: Colors.grey[700],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Navigation
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.black12, width: 0.5),
                  ),
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Colors.black,
                  indicatorWeight: 1.5,
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
                    _buildMateriList(),
                    _buildTugasDanKuisList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMateriList() {
    return const Center(
      child: Text("Lampiran Materi akan tampil di sini"),
    );
  }

  Widget _buildTugasDanKuisList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      children: [
        // CARD 1 : QUIZ
        _buildQuizCard(),
        const SizedBox(height: 16),
        // CARD 2 : TUGAS
        _buildTugasCard(),
      ],
    );
  }

  Widget _buildQuizCard() {
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
            onTap: () {},
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
                          "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan. Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
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

  Widget _buildTugasCard() {
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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sisi Kiri: Icon & Divider
                  Column(
                    children: [
                      const Icon(Icons.description_outlined, color: Colors.black, size: 28),
                      const SizedBox(height: 12),
                      Container(
                        width: 1,
                        height: 100,
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
                              "Tugas 01 – UID Android Mobile Game",
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey[300],
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildBulletItem("1", "Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan."),
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
