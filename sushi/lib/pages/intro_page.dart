import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/pages/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 83, 70),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 35),
        
              // shop name
              Text(
                'SushiO',
                style: GoogleFonts.syne(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
        
              const SizedBox(height: 35),

              // icon
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: -25,
                      blurRadius: 60,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'lib/images/sushi-3.png',
                  height: 290,
                ),
              ),
        
              const SizedBox(height: 35),
        
              // title
              Text(
                'The Taste of Japanese Cuisine',
                style: GoogleFonts.syne(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
        
              // subtitle
              Text(
                  'Feel the taste of Japan in every bite from anywhere and anytime',
                  style: GoogleFonts.syne(
                    fontSize: 20,
                    color: Colors.grey[200],
                  )),
        
              const SizedBox(height: 20),
        
              // get started button
              MyButton(
                text: 'Get Started',
                onTap: () {
                  // Navigator.pushNamed(context, '/menupage');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuPage(),),);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
