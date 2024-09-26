import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisStraTionScreen extends StatelessWidget {
  const RegisStraTionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
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
                    labelText: "Enter Your Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Full Name',
                  style: GoogleFonts.getFont(
                    "Nunito Sans",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/icons/user.png',
                        color: Color(0xFF102DE1),
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
                    labelText: "Enter Your Name"),
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
                    labelText: "Enter Your Password"),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    height: 56,
                    width: 356,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      gradient: LinearGradient(
                        colors: [Color(0xFF102DE1), Color(0xCC0D6EFF)],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('ok');
                      },
                      child: Center(
                        child: Text(
                          'SignUP',
                          style: GoogleFonts.getFont("Nunito Sans",
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 281,
                    top: -10,
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: 20,
                        width: 20,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alreay have an Account?',
                    style: GoogleFonts.getFont(
                      "Nunito Sans",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.getFont("Nunito Sans",
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF102DE1)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
