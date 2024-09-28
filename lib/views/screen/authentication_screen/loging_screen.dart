import 'package:aliyamart/controller/auth_controller.dart';
import 'package:aliyamart/views/screen/authentication_screen/registration_screen.dart';
import 'package:aliyamart/views/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email = ''; // Initialize with empty strings
  late String password = ''; // Initialize with empty strings
  bool _obscureText = true; // For password visibility toggle

  loginUser() async {
    // Ensure the widget is still mounted
    String res = await _authController.loginUser(email, password);
    if (res == 'success' && mounted) {
      // Navigate to the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logged in')));
    } else if (mounted) {
      // Show error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login failed: $res')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Welcome Back",
                      style: GoogleFonts.getFont('Nunito Sans',
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Log in to explore the world of exclusives",
                    style: GoogleFonts.getFont('Lato',
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Container(
                    height: 248,
                    width: 257,
                    child: Image.asset('assets/images/illustration.png'),
                  ),
                  // Email Field
                  _buildTextField(
                    label: 'Email',
                    iconPath: 'assets/icons/email.png',
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Password Field
                  _buildTextField(
                    label: 'Password',
                    iconPath: 'assets/icons/password.png',
                    obscureText: _obscureText,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        loginUser();
                      }
                    },
                    child: Container(
                      height: 56,
                      width: 356,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                          colors: [Color(0xFF102DE1), Color(0xCC0D6EFF)],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.getFont(
                            "Nunito Sans",
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Register Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Register Here',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
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

  Widget _buildTextField({
    required String label,
    required String iconPath,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.getFont("Nunito Sans",
              fontSize: 17, fontWeight: FontWeight.w600),
        ),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(iconPath, height: 20, width: 20),
            ),
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelText: "Enter Your $label",
          ),
        ),
      ],
    );
  }
}
