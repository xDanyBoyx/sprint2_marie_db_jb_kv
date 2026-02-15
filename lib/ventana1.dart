import 'package:flutter/material.dart';

class Ventana1 extends StatefulWidget {
  const Ventana1({super.key});

  @override
  State<Ventana1> createState() => _Ventana1State();
}

class _Ventana1State extends State<Ventana1> {
  int _indice = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text(
          "CHAMBIANDING",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: contenido(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work_history), label: "MAIN"),
          BottomNavigationBarItem(icon: Icon(Icons.work_history_rounded), label: "FORO"),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: "?"),
        ],
        onTap: (pos){
          setState(() {
            _indice = pos;
          }
          );
        },
        selectedFontSize: 15,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blue.shade200,
      ),
    );
  }

  Widget contenido() {
    switch (_indice) {
      case 1:
        return Text("FORO");
      case 2:
        return Text("¿?");
    }
    return Text("GALERIA");
  }

}
