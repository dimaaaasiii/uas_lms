import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MateriPembelajaranScreen extends StatelessWidget {
  const MateriPembelajaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB94A48),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Pengantar User Interface Design",
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black26),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Halaman",
                    style: GoogleFonts.outfit(
                      fontSize: 8,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "1/26",
                    style: GoogleFonts.outfit(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Ensure solid background
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SECTION 1: COVER
              _buildCoverSection(),
              const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
              
              // SECTION 2: PERKENALAN
              _buildIntroSection(),
              const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

              // SECTION 3: USER INTERFACE
              _buildUISection(),
              const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

              // SECTION 4: PENTINGNYA DESAIN UI
              _buildImportanceSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          // Background
          Image.asset(
            'assets/images/class_uiux.png',
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
          ),
          // Logo overlay if needed (the image might already have it)
          // Dark Overlay Box - More opaque for better readability
          Positioned(
            left: 24,
            bottom: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.85),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Pengantar Desain\nAntarmuka Pengguna",
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
          ),
          // Course Badge - Boxed for contrast
          Positioned(
            right: 24,
            bottom: 40,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "VE214",
                    style: GoogleFonts.outfit(
                      color: const Color(0xFFB94A48),
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "UI / UX Design",
                    style: GoogleFonts.outfit(
                      color: const Color(0xFFB94A48),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection() {
    return Container(
      width: double.infinity,
      color: Colors.white, // Solid white section
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Perkenalan",
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo circular
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: const Icon(Icons.person, color: Colors.grey, size: 60),
              ),
              const SizedBox(width: 24),
              // Bullet points
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIntroBullet("Ady Purna Kurniawan → ADY"),
                    _buildIntroBullet("E-mail: adypurnakurniawan@telkomuniversity.ac.id"),
                    _buildIntroBullet("Bidang Keahlian:"),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          _buildIntroBullet("Information System", sub: true),
                          _buildIntroBullet("Web Programming and Design", sub: true),
                          _buildIntroBullet("Game Development", sub: true),
                        ],
                      ),
                    ),
                    _buildIntroBullet("No.HP: 085727930642 → SMS/Telp/Whatsapp"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUISection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User Interface",
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextBullet("Antarmuka / user interface (UI) merupakan bagian dari komputer dan perangkat lunaknya yang dapat dilihat, didengar, disentuh, dan diajak bicara, baik secara langsung maupun dengan proses pemahaman tertentu."),
          const SizedBox(height: 20),
          _buildTextBullet("UI yang baik adalah UI yang tidak disadari, dan memungkinkan pengguna fokus pada informasi dan task tanpa perlu mengetahui mekanisme sistem."),
          const SizedBox(height: 20),
          _buildTextBullet("Komponen utamanya:"),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Column(
              children: [
                _buildTextBullet("Input", sub: true),
                _buildTextBullet("Output", sub: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportanceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pentingnya Desain UI yang Baik",
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextBullet("Banyak sistem dengan fungsionalitas yang baik tapi tidak efisien, membingungkan, dan tidak berguna karena desain UI yang buruk"),
          const SizedBox(height: 16),
          _buildTextBullet("Antarmuka yang baik merupakan jendela untuk melihat kemampuan sistem serta jembatan bagi kemampuan perangkat lunak"),
          const SizedBox(height: 16),
          _buildTextBullet("Desain yang buruk akan membingungkan, tidak efisien, bahkan menyebabkan frustasi"),
          
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/frustration.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroBullet(String text, {bool sub = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sub ? "- " : "• ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                fontSize: 13,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextBullet(String text, {bool sub = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sub ? "- " : "• ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
