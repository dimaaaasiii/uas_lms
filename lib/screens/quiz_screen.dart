import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_review_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class QuizQuestion {
  final String text;
  final List<String> options;
  final List<String> labels;

  QuizQuestion({
    required this.text,
    required this.options,
    this.labels = const ['A', 'B', 'C', 'D', 'E'],
  });
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  Map<int, int?> _selectedAnswers = {}; // questionIndex -> answerIndex
  late List<QuizQuestion> _questions;

  @override
  void initState() {
    super.initState();
    _questions = [
      QuizQuestion(
        text: "Radio button dapat digunakan untuk menentukan ?",
        options: ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
      ),
      QuizQuestion(
        text: "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
        options: ['Intergrasi', 'Standarisasi', 'Konsistensi', 'Koefensi', 'Koreksi'],
      ),
      QuizQuestion(
        text: "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
        options: ['Hobby', 'Alamat', 'Jenis Kelamin', 'Riwayat Pendidikan', 'Umur'],
        labels: ['C', 'B', 'A', 'D', 'E'],
      ),
      // Adding placeholders for questions 4-15
      ...List.generate(12, (index) => QuizQuestion(
        text: "Pertanyaan Akademik ${index + 4}: Implementasi prinsip desain pada antarmuka pengguna?",
        options: ['Opsi A', 'Opsi B', 'Opsi C', 'Opsi D', 'Opsi E'],
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    final selectedAnswer = _selectedAnswers[_currentQuestionIndex];

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
              children: List.generate(_questions.length, (index) {
                bool isActive = _currentQuestionIndex == index;
                bool isAnswered = _selectedAnswers.containsKey(index);
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentQuestionIndex = index;
                    });
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isAnswered ? const Color(0xFFB2FF59) : Colors.white, // Hijau terang jika dijawab
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? Colors.black : (isAnswered ? const Color(0xFFB2FF59) : Colors.black26),
                        width: isActive ? 2.5 : 1,
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
                  ),
                );
              }),
            ),
          ),

          const Divider(height: 1, color: Colors.black12),

          // 3. QUESTION AREA
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // INFO SOAL
                  Text(
                    'Soal Nomor ${_currentQuestionIndex + 1} / ${_questions.length}',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // PERTANYAAN
                  Text(
                    currentQuestion.text,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // PILIHAN JAWABAN
                  ...List.generate(currentQuestion.options.length, (index) {
                    bool isSelected = selectedAnswer == index;
                    String label = currentQuestion.labels[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAnswers[_currentQuestionIndex] = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFF7F50) : const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              '$label. ${currentQuestion.options[index]}',
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // 4. BUTTON NAVIGASI
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PREVIOUS BUTTON
                if (_currentQuestionIndex > 0)
                  _buildNavButton('Soal Sebelum nya.', const Color(0xFFF5F5F5), () {
                    setState(() {
                      _currentQuestionIndex--;
                    });
                  })
                else
                  const SizedBox(width: 100),

                // NEXT / FINISH BUTTON
                _currentQuestionIndex == _questions.length - 1
                ? _buildNavButton('Selesai.', const Color(0xFFB2FF59), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizReviewScreen()),
                    );
                  }, isAction: true)
                : _buildNavButton('Soal Selanjut nya.', const Color(0xFFF5F5F5), () {
                    setState(() {
                      _currentQuestionIndex++;
                    });
                  }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String label, Color bgColor, VoidCallback onTap, {bool isAction = false}) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: isAction ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ] : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              label,
              style: GoogleFonts.outfit(
                color: Colors.black,
                fontSize: 13,
                fontWeight: isAction ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
