import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme.dart';
import 'package:lms/screens/dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Bottom Sheet Logic - Single Language (Indonesian)
  void _showHelpBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            // Handle Bar
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
            
            // Title
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Bantuan Masuk',
                style: GoogleFonts.outfit(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(height: 1, color: Colors.grey),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Panduan Login',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Text('1. Gunakan akun SSO Microsoft Office 365 Anda (email kampus).', style: GoogleFonts.outfit()),
                    const SizedBox(height: 8),
                    Text('2. Format: nama@student.telkomuniversity.ac.id', style: GoogleFonts.outfit()),
                    const SizedBox(height: 8),
                    Text('3. Jika lupa kata sandi, silakan reset melalui layanan iGracias.', style: GoogleFonts.outfit()),
                    const SizedBox(height: 24),
                    Text(
                      'Masih Terkendala?',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Text('Tim Helpdesk kami siap membantu:', style: GoogleFonts.outfit()),
                    const SizedBox(height: 4),
                    Text('• Email: helpdesk@telkomuniversity.ac.id', style: GoogleFonts.outfit()),
                    Text('• WhatsApp: +62 812 3456 7890', style: GoogleFonts.outfit()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Screen height for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    // Modern Header height: ± 30%
    final double headerHeight = screenHeight * 0.30; 
    // Logo size
    const double logoSize = 100.0;
    const double logoTopOverlap = logoSize / 2;

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
                      // 1. MODERN HEADER
                      SizedBox(
                        height: headerHeight + logoTopOverlap,
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
                                        AppTheme.primaryColor, // Deep Red
                                        Color(0xFFE53935), // Lighter Red
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Abstract Shapes
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
                            
                            // Floating Logo
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width: logoSize,
                                  height: logoSize,
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
                                    padding: const EdgeInsets.all(20.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Greeting / Title
                            Text(
                              'Login',
                              style: GoogleFonts.outfit(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFB71C1C),
                                letterSpacing: 0.5,
                              ),
                            ),
                             Text(
                              'Silakan login menggunakan akun email Anda.',
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 32),
            
                            // Email Input
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'nama@student.telkomuniversity.ac.id',
                                hintStyle: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
                                labelStyle: GoogleFonts.outfit(color: Colors.grey),
                                contentPadding: const EdgeInsets.only(bottom: 8),
                                isDense: true,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                                ),
                              ),
                              style: GoogleFonts.outfit(),
                            ),
                            const SizedBox(height: 24),
            
                            // Password Input
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                labelStyle: GoogleFonts.outfit(color: Colors.grey),
                                suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey, size: 20),
                                contentPadding: const EdgeInsets.only(bottom: 8),
                                isDense: true,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                                ),
                              ),
                              style: GoogleFonts.outfit(),
                            ),
                            const SizedBox(height: 48),
            
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
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.outfit(
                                    fontSize: 18, // Bigger text
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
            
                            // Help Text
                            Center(
                              child: TextButton( // Changed to TextButton for better interaction
                                onPressed: _showHelpBottomSheet,
                                child: Text(
                                  'Butuh bantuan?',
                                  style: GoogleFonts.outfit(
                                    color: AppTheme.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
