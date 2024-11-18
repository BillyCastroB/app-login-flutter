import 'package:flutter/material.dart';
import 'package:hotel_app/src/config/create.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                ElevatedButton.icon(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (_) => createScrem()));
                },
                icon: Icon(Icons.create_sharp, color: Colors.blueAccent,),
                label: Text('Crear Habitación')),
                ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.read_more_sharp, color: Colors.grey,),
                label: Text('Ver Habitaciones')),
                ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.delete, color: Colors.redAccent,),
                label: Text('Eliminar Habitación')),
                ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.restart_alt_rounded, color: Colors.amberAccent,),
                label: Text('Editar Habitación')),
                ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.close_outlined, color: Colors.black54,),
                label: Text('Salir')),
              ],
              ),
              
            ),

          ]
        ),
      ),
    );
  }
}