import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestionReviewScreen extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final String savedAnswer;
  final List<String> options;
  final List<String> labels;

  const QuizQuestionReviewScreen({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.savedAnswer,
    this.options = const ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
    this.labels = const ['A', 'B', 'C', 'D', 'E'],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. APP BAR / HEADER (MAROON)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 24, left: 24, right: 24),
            decoration: const BoxDecoration(
              color: Color(0xFFB94A48), // Maroon #B94A48
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40), 
                Text(
                  'Quiz Review 1',
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // TIMER
                Row(
                  children: [
                    const Icon(Icons.alarm, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '15 : 00',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. NAVIGASI NOMOR SOAL
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            color: Colors.white,
            child: Wrap(
              spacing: 8,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: List.generate(15, (index) {
                bool isActive = (index + 1) == questionNumber;
                return Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB2FF59), // Hijau terang
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? Colors.black : const Color(0xFFB2FF59),
                      width: isActive ? 2 : 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ),
          ),

          const Divider(height: 1, color: Colors.black12),

          // 3. CONTENT AREA
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // INFO SOAL
                  Text(
                    'Soal Nomor $questionNumber / 15',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // PERTANYAAN
                  Text(
                    questionText,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // PILIHAN JAWABAN (READ-ONLY)
                  ...List.generate(options.length, (index) {
                    String label = labels[index];
                    String fullText = "$label. ${options[index]}";
                    bool isSelected = savedAnswer.contains(label);

                    return _buildReviewOption(fullText, isSelected: isSelected);
                  }),
                  
                  const SizedBox(height: 40),

                  // 4. BUTTON NAVIGASI BAWAH
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Kembali Ke Halam Review',
                          style: GoogleFonts.outfit(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewOption(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF8A80).withOpacity(0.8) : const Color(0xFFF9F9F9), // Merah soft
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isSelected ? 0.08 : 0.03),
            blurRadius: isSelected ? 12 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
