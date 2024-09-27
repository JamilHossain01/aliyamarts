import 'package:aliyamart/views/screen/authentication_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogingScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  LogingScreen({super.key});

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
                  const SizedBox(
                    height: 150,
                  ),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/email.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: "Enter Your Email",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/password.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.visibility),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: "Enter Your Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print(email);
                        print(password);
                      } else {
                        print('Form validation failed');
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisStraTionScreen(),
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
}
