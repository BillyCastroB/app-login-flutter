import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_app/src/services/api.dart';

class createScrem extends StatefulWidget {
  const createScrem({super.key});

  @override
  State<createScrem> createState() => _HomePageState();
}

class _HomePageState extends State<createScrem> {
  var nombreController = TextEditingController();
  var apellidosController = TextEditingController();
  var emailController = TextEditingController();
  var telefonoController = TextEditingController();
  var numeroController = TextEditingController();
  TextEditingController fechaInicioController = TextEditingController();
  TextEditingController fechaSalidaController = TextEditingController();

void enviarDatos() async {
  print('numero: ${numeroController.text}');
  print('nombre: ${nombreController.text}');
  print('apellidos: ${apellidosController.text}');
  print('email: ${emailController.text}');
  print('telefono: ${telefonoController.text}');
  print('fechaInicio: ${fechaInicioController.text}');
  print('fechaSalida: ${fechaSalidaController.text}');

  // Recorta espacios y valida los campos
  if (numeroController.text.trim().isEmpty ||
      nombreController.text.trim().isEmpty ||
      apellidosController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      telefonoController.text.trim().isEmpty ||
      fechaInicioController.text.trim().isEmpty ||
      fechaSalidaController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Por favor, completa todos los campos.')),
    );
    return;
  }

  // Datos de huésped
  Map<String, dynamic> datosHuesped = {
    'numeroHabitacion': int.parse(numeroController.text.trim()),
    'nombre': nombreController.text.trim(),
    'apellidos': apellidosController.text.trim(),
    'email': emailController.text.trim(),
    'telefono': telefonoController.text.trim(),
  };

  // Datos de fechas
  Map<String, dynamic> datosFechas = {
    'numeroHabitacion': int.parse(numeroController.text.trim()),
    'numeroHuesped': int.parse(numeroController.text.trim()), // Opcional, cambia según lógica
    'fechaInicio': fechaInicioController.text.trim(),
    'fechaFin': fechaSalidaController.text.trim(),
    'totalPago': calcularTotalPago(fechaInicioController.text.trim(), fechaSalidaController.text.trim(), 100), // Cambia el precio base según tu lógica
  };

  // Llamadas a la API
  try {
    await Api.addHuesped(datosHuesped);
    await Api.addFechas(datosFechas);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos enviados correctamente.')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al enviar datos: $e')),
    );
  }
}

  int calcularTotalPago(String fechaInicio, String fechaFin, int precioPorDia) {
    DateTime inicio = DateTime.parse(fechaInicio);
    DateTime fin = DateTime.parse(fechaFin);
    int dias = fin.difference(inicio).inDays;
    return dias * precioPorDia;
  }

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
                  const Color.fromARGB(190, 193, 23, 23),
                ]),
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
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Otros campos...
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      controller: numeroController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Ingrese número de habitación',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      controller: nombreController,
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
                        controller: apellidosController,
                        decoration: InputDecoration(
                          hintText: 'Ingrese sus apellidos',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(115, 62, 80, 90),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      controller: emailController, // Asigna el controlador aquí
                      decoration: InputDecoration(
                        hintText: 'Ingrese su email',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90),
                        ),
                      ),
                    ),
                  ),
                 Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      controller: telefonoController, // Asigna el controlador aquí
                      keyboardType: TextInputType.number, // Define el tipo de entrada como numérico
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Permite solo dígitos
                      decoration: InputDecoration(
                        hintText: 'Ingrese su teléfono',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      controller: fechaInicioController,
                      readOnly: true, // Hace que el campo sea de solo lectura
                      decoration: InputDecoration(
                        hintText: 'Ingrese la fecha de Inicio',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000), // Fecha mínima
                          lastDate: DateTime(2100), // Fecha máxima
                        );
                        if (pickedDate != null) {
                          setState(() {
                            fechaInicioController.text = pickedDate.toString().split(' ')[0]; // Formatea la fecha
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70, left: 70),
                    child: TextField(
                      controller: fechaSalidaController,
                      readOnly: true, // Hace que el campo sea de solo lectura
                      decoration: InputDecoration(
                        hintText: 'Ingrese la fecha de Salida',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(115, 62, 80, 90),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000), // Fecha mínima
                          lastDate: DateTime(2100), // Fecha máxima
                        );
                        if (pickedDate != null) {
                          setState(() {
                            fechaSalidaController.text = pickedDate.toString().split(' ')[0]; // Formatea la fecha
                          });
                        }
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  ElevatedButton(
                    onPressed: enviarDatos,
                    child: Text('Enviar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
