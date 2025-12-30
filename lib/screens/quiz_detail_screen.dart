import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_screen.dart';

class QuizDetailScreen extends StatelessWidget {
  const QuizDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFFB94A48), // Maroon akademik
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Quiz Review 1',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deskripsi Kuis
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
              child: Text(
                "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\n\nKerjakan sebelum hari Rabu, 31 Desember 2025 jam 23:59 WIB.",
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.black,
                ),
              ),
            ),

            // Info Card Kuis
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoText("Kuis Akan di tutup pada Kamis, 01 Januari 2025, 12:00 PM"),
                  const SizedBox(height: 8),
                  _buildInfoText("Batas Waktu: 15 menit"),
                  const SizedBox(height: 8),
                  _buildInfoText("Metode Penilaian: Nilai Tertinggi"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Section Percobaan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Percobaan Yang Sudah Di Lakukan",
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Table Header
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFE57373), // Coral / Merah Muda
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                children: [
                   Expanded(
                    flex: 3,
                    child: Text("Status", style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                  ),
                   Expanded(
                    flex: 2,
                    child: Center(child: Text("Nilai / 100.00", style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13))),
                  ),
                   Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Tinjau Kembali", style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),

            // Row Data
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(color: Color(0xFFEEEEEE)),
                  right: BorderSide(color: Color(0xFFEEEEEE)),
                  bottom: BorderSide(color: Color(0xFFEEEEEE)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selesai", style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text("Dikirim Pada Kamis, 01 Januari 2025, 10:40", style: GoogleFonts.outfit(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text("85,0", style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: Text("Lihat", style: GoogleFonts.outfit(fontSize: 13, color: Colors.blue, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Nilai Akhir
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00",
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 48),

            // Action Buttons
            Center(
              child: Column(
                children: [
                  _buildActionButton("Ambil Kuis", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizScreen()),
                    );
                  }),
                  const SizedBox(height: 16),
                  _buildActionButton("Kembali Ke Kelas", () => Navigator.pop(context)),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.outfit(
        fontSize: 13,
        color: Colors.black,
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 200,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEEEEEE),
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
