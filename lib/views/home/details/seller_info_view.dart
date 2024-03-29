import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_coffee_delivery/models/seller.dart';

class SellerInfo extends StatelessWidget {
  const SellerInfo({super.key, required this.sellerData});
  final Seller sellerData;
  final Widget lineDivider = const Divider();
  final Widget margin6 = const SizedBox(
    height: 5,
  );

  void _goToList(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informazioni"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              sellerData.img,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerData.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                margin6,
                Text(
                  sellerData.description,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                  ),
                ),
                margin6,
                lineDivider,
                const Text(
                  "Indirizzo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                margin6,
                Text(
                  sellerData.indirizzo,
                  style: GoogleFonts.aBeeZee(fontSize: 15),
                ),
                margin6,
                lineDivider,
                const Text(
                  "Contatti",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                margin6,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.call_outlined),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      sellerData.telefono,
                      style: GoogleFonts.aBeeZee(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.mail_outlined),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      sellerData.email,
                      style: GoogleFonts.aBeeZee(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => _goToList(context),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120.0,
                        vertical: 20,
                      ),
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
        ],
      ),
    );
  }
}
