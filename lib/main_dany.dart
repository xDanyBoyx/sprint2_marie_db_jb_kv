import 'package:flutter/material.dart';
import 'package:sprint2marie_db_jb_kh/ventana1.dart';

export 'package:flutter/material.dart';

class Marie extends StatefulWidget {
  const Marie({super.key});

  @override
  State<Marie> createState() => _MarieState();
}

final user = TextEditingController();
final pass = TextEditingController();
const Color colorPrincipal = Color(0xFF8B2E24);

class _MarieState extends State<Marie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MARIE-ART",
          style: TextStyle(color: colorPrincipal, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset("assets/logo.png", width: 150),
              const SizedBox(height: 20),
              const Text("Iniciar Sesión", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("USUARIO: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        TextField(
                          controller: user,
                          decoration: const InputDecoration(
                            hintText: "Nombre de usuario",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("CONTRASEÑA: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        TextField(
                          controller: pass,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Contraseña",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child:
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Ventana1()),
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
                            child: const Text("INGRESAR", style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("¿OLVIDASTE TU CONTRASEÑA?")),
            ],
          ),
        ),
      ),
    );
  }
}