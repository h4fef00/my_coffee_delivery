import 'package:flutter/material.dart';

//inserire controller
//ricerca in base ad elementi che gia' ci sono nella lista di bibite
//view per click dell'elemento trovato

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: const SearchBar(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        hintText: "Cerca",
        //padding per interno
        padding: MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        //icona prima del testo
        leading: Icon(Icons.search),
      ),
    );
  }
}
