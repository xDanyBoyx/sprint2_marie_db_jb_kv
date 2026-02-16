import 'package:flutter/material.dart';

class Ventana1 extends StatefulWidget {
  const Ventana1({super.key});

  @override
  State<Ventana1> createState() => _Ventana1State();
}

const Color colorPrincipal = Color(0xFF8B2E24);

class _Ventana1State extends State<Ventana1> {
  int _indice = 0;

  // --- DATOS DE COMPRAS (HISTORIAL) ---
  final List<Map<String, String>> comprasRealizadas = [
    {
      "titulo": "Santiago Ixcuintla",
      "precio": "\$2,000",
      "fecha": "14 Feb 2024",
      "estado": "Entregado",
      "imagen": "assets/obra1.png",
    },
    {
      "titulo": "Retrato",
      "precio": "\$1,500",
      "fecha": "10 Ene 2024",
      "estado": "En camino",
      "imagen": "assets/obra5.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "MARIE-ART",
              style: TextStyle(
                fontSize: 20,
                color: colorPrincipal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            // Asegúrate de que logo.png exista, si no muestra un icono
            Image.asset('assets/logo.png', height: 30, errorBuilder: (c,o,s)=>const Icon(Icons.palette)),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: contenido(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: _indice,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "FORO"
          ),
          // --- PESTAÑA DE COMPRAS ---
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "COMPRAS"
          ),
        ],
        onTap: (pos) {
          setState(() {
            _indice = pos;
          });
        },
        selectedFontSize: 14,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }

  Widget contenido() {
    switch (_indice) {
      case 0: // --- PANTALLA INICIO ---
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Búsqueda...",
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: colorPrincipal,
                      width: 3,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.pink.shade50,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  obraItem("Santiago Ixcuintla, Nayarit", "2000", "assets/obra1.png"),
                  obraItem("Rosa Morada, Nayarit", "2001", "assets/obra2.png"),
                  obraItem("Negrita", "2002", "assets/obra3.png"),
                  obraItem("Cuarenta", "2018", "assets/obra4.png"),
                  obraItem("Retrato", "2025", "assets/obra5.png"),
                ],
              ),
            ),
          ],
        );

      case 1: // --- PANTALLA FORO ---
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Búsqueda...",
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.pink.shade50,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "¿Qué estás pensando?",
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.send, color: Colors.blue)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            // Publicaciones usando el widget optimizado
            _buildForoCard("Mi nueva pintura.", "assets/frida.png", null),
            _buildForoCard("Me falta motivación.", null, "He perdido la motivación en mi vida. Algunos consejos para recuperarla??"),
            _buildForoCard("MARIE es la mejor artista.", null, "Soy un gran fan de MARIE. Ya conozco todas sus obras."),
          ],
        );

      case 2: // --- PANTALLA COMPRAS ---
        return _pantallaCompras();

      default:
        return const Center(child: Text("Error"));
    }
  }

  // --- WIDGET PARA LA LISTA DE COMPRAS ---
  Widget _pantallaCompras() {
    if (comprasRealizadas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey.shade300),
            const SizedBox(height: 10),
            const Text("No has realizado compras aún.", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Historial de Compras",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: comprasRealizadas.length,
            itemBuilder: (context, index) {
              final compra = comprasRealizadas[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Imagen de la compra
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(compra['imagen']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Detalles
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                compra['titulo']!,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text("Fecha: ${compra['fecha']}", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.green.shade200)
                                ),
                                child: Text(
                                  compra['estado']!,
                                  style: TextStyle(color: Colors.green.shade700, fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        // Precio
                        Text(
                          compra['precio']!,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: colorPrincipal),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- WIDGET REUTILIZABLE PARA OBRAS ---
  Widget obraItem(String titulo, String anio, String imagen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5, offset: const Offset(0, 3))]
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\"$titulo\"", style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Año: $anio"),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          shape: const StadiumBorder(),
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: const Text("DETALLES", style: TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          shape: const StadiumBorder(),
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: const Text("COMPRAR", style: TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.bookmark_border),
        ],
      ),
    );
  }

  // --- WIDGET REUTILIZABLE PARA FORO (Limpio y ordenado) ---
  Widget _buildForoCard(String titulo, String? imagen, String? descripcion) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.blue.shade100,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 15),
                Image.asset('assets/user.png', width: 35),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(),
            if (imagen != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagen, width: 250),
              ),
            if (descripcion != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(descripcion, textAlign: TextAlign.center),
              ),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_down)),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}