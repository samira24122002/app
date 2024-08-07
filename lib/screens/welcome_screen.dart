import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
          color: Colors.black54,
          image: DecorationImage(
            image: AssetImage("assets/coffee.png"),
            fit: BoxFit.cover,
            opacity: 0.6,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Adjusted Text Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Added padding
              child: Text(
                "Coffee Shop",
                style: GoogleFonts.pacifico(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                // Adjusted Text Widget
                Text(
                    "Feeling low? Take a sip of coffee",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                   
                  ),
                
                SizedBox(height: 80),
                Material(
                  color: Colors.brown,
                        borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                  
                      // Uncomment the following line to navigate to HomeScreen
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      decoration: BoxDecoration(
                        
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white, // Text color for visibility
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
