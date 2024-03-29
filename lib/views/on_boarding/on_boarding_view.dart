import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_coffee_delivery/views/widgets/navigation_bottom.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/png/coffee_logo.png"),
            Text(
              "Coffee Shop",
              style: GoogleFonts.swankyAndMooMoo(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Esplora il Mondo dei Sapori: Dal Caffè all'Esclusiva Selezione di Bibite - La Tua Destinazione per l'Eccellenza del Gusto!",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationBottom(),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120.0, vertical: 20),
                  child: Text(
                    "Inizia ad ordinare!",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
