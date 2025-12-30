import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color maroonColor = Color(0xFFB94A48);
    const Color headerRedColor = Color(0xFFEF6C6A); // Salmon/Red-ish for section header
    const Color lightGreyRow = Color(0xFFF9F9F9);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maroonColor,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tugas 01 – UID Android Mobile Game',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECTION – DESKRIPSI TUGAS
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: _buildDescriptionSection(),
            ),

            // SECTION – STATUS TUGAS BANNER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: headerRedColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Text(
                'Status Tugas',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // STATUS ROWS
            _buildStatusRow('Status', 'Sudah Mengirim untuk di nilai', Colors.white),
            _buildStatusRow('Status Nilai', 'Belum Di nilai', lightGreyRow),
            _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB', Colors.white),
            _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya', lightGreyRow),
            
            // FILE ROW
            _buildFileRow('File Tugas', 'Dandy Candra Pratama_7708170114.pdf', Colors.white),

            const SizedBox(height: 60),

            // ACTION BUTTON
            _buildActionButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    final List<String> instructions = [
      'Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.',
      'Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.',
      'Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.',
      'Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.',
      'File dikumpulkan dalam format .PDF dengan size maksimal 5MB.',
      'Tugas dikumpulkan paling lambat hari Jum’at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: instructions.asMap().entries.map((entry) {
        int idx = entry.key + 1;
        String text = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(
            '$idx. $text',
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.6,
              color: const Color(0xFF444444),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStatusRow(String label, String value, Color bgColor) {
    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF444444),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: const Color(0xFF555555),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(String label, String fileName, Color bgColor) {
    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF444444),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.picture_as_pdf_outlined, size: 22, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: const Color(0xFF555555),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: ElevatedButton(
          onPressed: () => _showUploadBottomSheet(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF5F5F5),
            foregroundColor: Colors.black,
            elevation: 0,
            minimumSize: const Size(180, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Tambahkan Tugas',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            children: [
              // iOS Handle & Header
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFB94A48),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 100,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Upload File',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Max info text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Maksimum File 5MB , Maksimum Jumlah File 20',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Dashed Upload Area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomPaint(
                  painter: DashedRectPainter(),
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cloud_upload_rounded,
                          size: 150,
                          color: Color(0xFF3498DB),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'File yang akan di upload akan tampil di sini',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Buttons
              _buildBottomSheetButton('Pilih File', () {}),
              const SizedBox(height: 16),
              _buildBottomSheetButton('Simpan', () {}),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetButton(String text, VoidCallback onPressed) {
    return Container(
      width: 180,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, strokeWidth = 1.5;
    final paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Top
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Right
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(size.width, startY), Offset(size.width, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    // Bottom
    startX = size.width;
    while (startX > 0) {
      canvas.drawLine(Offset(startX, size.height), Offset(startX - dashWidth, size.height), paint);
      startX -= dashWidth + dashSpace;
    }

    // Left
    startY = size.height;
    while (startY > 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY - dashWidth), paint);
      startY -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
