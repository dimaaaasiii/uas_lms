import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_question_review_screen.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header + Scrollable Content
          Column(
            children: [
              // 1. APP BAR / HEADER (MAROON)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, bottom: 24),
                decoration: const BoxDecoration(
                  color: Color(0xFFB94A48), // Maroon #B94A48
                ),
                child: Center(
                  child: Text(
                    'Review Jawaban',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    children: [
                      // 2. SUMMARY CARD
                      _buildSummaryCard(),
                      const SizedBox(height: 32),

                      // 3. DAFTAR PERTANYAAN
                      _buildReviewItem(
                        context,
                        1,
                        "Radio button dapat digunakan untuk menentukan ?",
                        "A. Jenis Kelamin",
                      ),
                      _buildReviewItem(
                        context,
                        2,
                        "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
                        "B. Konsistensi",
                      ),
                      _buildReviewItem(
                        context,
                        3,
                        "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
                        "C. Konsistensi",
                      ),
                      _buildReviewItem(
                        context,
                        4,
                        "Pertanyaan Akademik 4: Implementasi prinsip desain pada antarmuka pengguna?",
                        "A. Jenis Kelamin",
                      ),
                      _buildReviewItem(
                        context,
                        5,
                        "Pertanyaan Akademik 5: Implementasi prinsip desain pada antarmuka pengguna?",
                        "C. Konsistensi",
                      ),
                      _buildReviewItem(
                        context,
                        6,
                        "Pertanyaan Akademik 6: Implementasi prinsip desain pada antarmuka pengguna?",
                        "C. Konsistensi",
                      ),
                      _buildReviewItem(
                        context,
                        7,
                        "Pertanyaan Akademik 7: Implementasi prinsip desain pada antarmuka pengguna?",
                        "A. Jenis Kelamin",
                      ),
                      const SizedBox(height: 100), // Space for bottom button
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 4. BUTTON SUBMIT (FIXED AT BOTTOM)
          Positioned(
            left: 24,
            right: 24,
            bottom: 40,
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Final submission logic
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2FF59), // Hijau terang
                  foregroundColor: Colors.black,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Kirim Jawaban',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow("Di Mulai Pada", "Kamis 01 Januari 2025 10:25"),
          const SizedBox(height: 12),
          _buildSummaryRow("Status", "Selesai"),
          const SizedBox(height: 12),
          _buildSummaryRow("Selesai Pada", "Kamis 01 Januari 2025 10:30"),
          const SizedBox(height: 12),
          _buildSummaryRow("Waktu Penyelesaian", "05 Menit"),
          const SizedBox(height: 12),
          _buildSummaryRow("Nilai", "0 / 100", isLast: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isLast = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem(BuildContext context, int number, String question, String savedAnswer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pertanyaan $number",
                style: GoogleFonts.outfit(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizQuestionReviewScreen(
                        questionNumber: number,
                        questionText: question,
                        savedAnswer: savedAnswer,
                        options: number == 2 || number == 3 
                            ? ['Intergrasi', 'Standarisasi', 'Konsistensi', 'Koefensi', 'Koreksi']
                            : ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
                        labels: number == 3 ? ['C', 'B', 'A', 'D', 'E'] : ['A', 'B', 'C', 'D', 'E'],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Lihat Soal",
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              question,
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Jawaban Tersimpan",
            style: GoogleFonts.outfit(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            savedAnswer,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
