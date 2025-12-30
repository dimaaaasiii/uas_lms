import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import 'dashboard/dashboard_page.dart';
import 'profile_screen.dart';
import 'class_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  int _bottomNavIndex = 0;

  // Form controllers
  final TextEditingController _firstNameController = TextEditingController(text: 'Dimas');
  final TextEditingController _lastNameController = TextEditingController(text: 'Wahyu Romadhoni');
  final TextEditingController _emailController = TextEditingController(text: 'rdimaswahyu7@mail.com');
  final TextEditingController _countryController = TextEditingController(text: 'Indonesia');
  final TextEditingController _descriptionController = TextEditingController(text: '');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                // 1. Header & Tab Stack
                SizedBox(
                  height: 340,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Red Header Background
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 280,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: SafeArea(
                            child: Column(
                              children: [
                                // Top Bar (Back Button)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Profile Photo
                                Container(
                                  width: 110,
                                  height: 110,
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: AppTheme.primaryColor, // Darker red
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/user_profile.jpg', 
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.person, size: 60, color: Colors.white);
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                
                                // User Name
                                Text(
                                  'DIMAS WAHYU ROMADHONI',
                                  style: GoogleFonts.outfit(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Floating Tab Card
                      Positioned(
                        bottom: 0,
                        left: 24,
                        right: 24,
                        height: 70,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTabItem('About Me', isActive: false, onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                                );
                              }),
                              _buildTabItem('Kelas', isActive: false, onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ClassScreen()),
                                );
                              }),
                              _buildTabItem('Edit Profile', isActive: true, onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 2. Edit Form Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField('Nama Pertama', _firstNameController),
                      const SizedBox(height: 20),
                      _buildTextField('Nama Terakhir', _lastNameController),
                      const SizedBox(height: 20),
                      _buildTextField('E-mail Address', _emailController),
                      const SizedBox(height: 20),
                      _buildTextField('Negara', _countryController),
                      const SizedBox(height: 20),
                      _buildTextField('Deskripsi', _descriptionController, maxLines: 4),
                      const SizedBox(height: 32),
                      
                      // Save Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5), // Light grey
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Handle save
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Profil berhasil disimpan!', style: GoogleFonts.outfit()),
                                    backgroundColor: AppTheme.primaryColor,
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                child: Text(
                                  'Simpan',
                                  style: GoogleFonts.outfit(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, {required bool isActive, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: isActive ? Colors.black87 : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
          if (isActive) ...[
            const SizedBox(height: 4),
            Container(
              width: 20,
              height: 2,
              color: Colors.grey,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.outfit(color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.primaryColor),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  // BOTTOM NAVIGATION BAR
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.outfit(),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            if (index == 0) { // Home
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}
