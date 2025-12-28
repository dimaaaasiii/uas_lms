import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../dashboard_screen.dart';
import 'widgets/language_selector_sheet.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Bottom Sheet Logic
  void _showHelpBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const LanguageSelectorSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Screen height for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    // Modern Header height: ± 30%
    final double headerHeight = screenHeight * 0.30; 

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content Scrollable
          Positioned.fill(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                 constraints: BoxConstraints(
                  minHeight: screenHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // 1. MODERN HEADER (Gradient + Abstract Shapes + Floating Logo)
                      SizedBox(
                        height: headerHeight + 50, // Added space for logo overlap
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Background Gradient & Curve
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              height: headerHeight,
                              child: ClipPath(
                                clipper: ModernHeaderClipper(),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFB71C1C), // Deep Red
                                        Color(0xFFE53935), // Lighter Red
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Abstract Shapes (Soft Circles)
                                      Positioned(
                                        top: -50,
                                        left: -50,
                                        child: CircleAvatar(
                                          radius: 100,
                                          backgroundColor: Colors.white.withOpacity(0.05),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 50,
                                        right: -20,
                                        child: CircleAvatar(
                                          radius: 80,
                                          backgroundColor: Colors.white.withOpacity(0.05),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            // Floating Logo (Centered & Overlapping)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) => 
                                          const Icon(Icons.school, color: AppTheme.primaryColor, size: 45),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            
                      // 2. FORM SECTION
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 32.0, 
                          right: 32.0, 
                          top: 16.0, 
                          bottom: 0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Judul 'Login'
                            const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFB71C1C),
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 30),
            
                            // Email Input
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Email 365',
                                labelStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.only(bottom: 8),
                                isDense: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
            
                            // Password Input
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.grey),
                                suffixIcon: Icon(Icons.visibility_off, color: Colors.grey, size: 20),
                                contentPadding: EdgeInsets.only(bottom: 8),
                                isDense: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
            
                            // Button Login
                            SizedBox(
                              width: double.infinity,
                              height: 54, // Slightly taller for touch target
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to Dashboard
                                  Navigator.pushReplacement(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const DashboardPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primaryColor,
                                  foregroundColor: Colors.white,
                                  shadowColor: AppTheme.primaryColor.withOpacity(0.4),
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontSize: 18, // Bigger text
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
            
                            // Bantuan Text
                            Center(
                              child: GestureDetector(
                                onTap: _showHelpBottomSheet,
                                child: const Text(
                                  'Bantuan ?',
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const Spacer(), // Push footer to bottom
            
                      // 3. FOOTER WAVE (Decorative) (UNCHANGED)
                      SizedBox(
                        height: 120, // Height of the footer area
                        width: double.infinity,
                        child: ClipPath(
                          clipper: FooterWaveClipper(),
                          child: Container(
                            color: AppTheme.primaryColor, 
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Modern Clipper with Smooth Curve
class ModernHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40); // Start slightly above bottom-left

    var firstControlPoint = Offset(size.width * 0.5, size.height + 20); // Curve down in middle
    var firstEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0); // Back to top-right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Clipper untuk Footer Wave
class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start at bottom left
    path.moveTo(0, size.height);
    // Line to bottom right
    path.lineTo(size.width, size.height);
    // Line to mid-right (start of wave on right side)
    // The image shows the right side ending somewhat high, maybe 60% of height (from bottom)
    path.lineTo(size.width, size.height * 0.4); 

    // Create S-Curve (Hump on Left, Dip on Right)
    // Cubic Bezier from Right (size.width, size.height * 0.4) to Left (0, size.height * 0.3)
    // Actually drawing from Right to Left is harder to visualize.
    // Let's reset and draw Left to Right.
    
    path.reset();
    path.moveTo(0, size.height); // Bottom Left
    path.lineTo(size.width, size.height); // Bottom Right
    path.lineTo(size.width, size.height * 0.5); // End Point Right (Mid-height)
    
    // Cubic To Left
    // End Point: (0, size.height * 0.45)
    // Control Point 1 (Right Dip): (size.width * 0.65, size.height * 0.8) -> Pulls down
    // Control Point 2 (Left Hump): (size.width * 0.35, size.height * 0.1) -> Pulls up
    
    // Note: Y=0 is TOP of the container. Y=height is BOTTOM.
    // So smaller Y is HIGHER UP.
    
    // S-Curve: Left Hump (High), Right Dip (Low)
    // Start at Left: (0, size.height * 0.4)
    // End at Right: (size.width, size.height * 0.5)
    
    // Actually, let's just close the path properly.
    path.reset();
    // 1. Move to Bottom Left
    path.moveTo(0, size.height);
    // 2. Line to Bottom Right
    path.lineTo(size.width, size.height);
    // 3. Line to Right Wave Start
    path.lineTo(size.width, size.height * 0.55); 
    
    // 4. Cubic Curve to Left Edge
    // We want a dip around x=0.7 and a hump around x=0.3
    
    path.cubicTo(
      size.width * 0.75, size.height * 0.85, // Control Point 1: Pulls down (Dip)
      size.width * 0.35, size.height * 0.05, // Control Point 2: Pulls way up (Hump)
      0, size.height * 0.45 // End Point Left
    );
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Widget Bottom Sheet
class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  int _selectedIndex = 0; // 0 = ID, 1 = EN

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Indikator Strip
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Judul Bantuan
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Bantuan',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // Tabs (ID / EN)
          Row(
            children: [
              _buildTab('ID', '🇮🇩', 0),
              _buildTab('EN', '🇬🇧', 1),
            ],
          ),
          const Divider(height: 1, color: Colors.grey),

          // Konten
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: _selectedIndex == 0 ? _contentID() : _contentEN(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, String flag, int index) {
    bool isActive = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          color: Colors.transparent, // Hit area
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Flag Icon (Using Text Emoji for now as asset not provided for specific flags)
              Text(
                flag, 
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 8),
              // Label (ID/EN)
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              // Indicator
              Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
              // Divider line at bottom of tab header
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  FontWeight fontWeight(bool isActive) => isActive ? FontWeight.bold : FontWeight.normal;

  Widget _contentID() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        Text('1. Akses ini hanya diperuntukkan bagi Dosen dan Mahasiswa Telkom University.'),
        SizedBox(height: 8),
        Text('2. Silakan login menggunakan akun Microsoft Office 365 Anda (SSO).'),
        SizedBox(height: 8),
        Text('3. Format username: username@student.telkomuniversity.ac.id'),
        SizedBox(height: 8),
        Text('4. Jika gagal login, pastikan password Anda benar atau reset password melalui layanan iGracias.'),
        SizedBox(height: 24),
        Text(
          'Butuh Bantuan?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        Text('Hubungi Helpdesk melalui:'),
        Text('• Email: helpdesk@telkomuniversity.ac.id'),
        Text('• WhatsApp: +62 812 3456 7890'),
      ],
    );
  }

  Widget _contentEN() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        Text('1. This access is restricted to Lecturers and Students of Telkom University.'),
        SizedBox(height: 8),
        Text('2. Please login using your Microsoft Office 365 account (SSO).'),
        SizedBox(height: 8),
        Text('3. Username format: username@student.telkomuniversity.ac.id'),
        SizedBox(height: 8),
        Text('4. If login fails, please ensure your password is correct or reset it via iGracias.'),
        SizedBox(height: 24),
        Text(
          'Need Help?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        Text('Contact Helpdesk via:'),
        Text('• Email: helpdesk@telkomuniversity.ac.id'),
        Text('• WhatsApp: +62 812 3456 7890'),
      ],
    );
  }
}
