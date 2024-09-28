import 'package:aliyamart/controller/auth_controller.dart';
import 'package:aliyamart/views/screen/authentication_screen/loging_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;
  late String name;
  late String password;
  bool _obscureText = true;

  registerUser() async {
    String res = await _authController.registerNewUser(email, password, name);
    if (res == "success" && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful')),
      );
      // Navigate to the login screen after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $res')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Create Your Account",
                        style: GoogleFonts.getFont('Nunito Sans',
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "To explore the world of exclusives",
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
                    // Name Field
                    _buildTextField(
                      label: 'Full Name',
                      iconPath: 'assets/icons/user.png',
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name';
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
                          return 'Enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
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
                    // Register Button
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          registerUser();
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
                            'Sign Up',
                            style: GoogleFonts.getFont("Nunito Sans",
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Existing Account Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an Account?',
                          style: GoogleFonts.getFont("Nunito Sans",
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            ' Sign in',
                            style: GoogleFonts.getFont("Nunito Sans",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF102DE1)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
