import 'package:flutter/material.dart';
class createScrem extends StatefulWidget {
  const createScrem({super.key});

  @override
  State<createScrem> createState() => _HomePageState();
}

class _HomePageState extends State<createScrem> {


  //manejar datos para la api
  var nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blueAccent,
                  const Color.fromARGB(190, 193, 23, 23)
                ])
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),  
                color: Colors.white54
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese número de habitacion',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese su nombre',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese sus apellidos',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese su email',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese su telefono',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese la fecha de Inicio',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ingrese la fecha de Salida',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90)
                        )
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Enviar'),
                  )
                ],
              ),
            )

          ]
        ),
      ),
    );
  }
}