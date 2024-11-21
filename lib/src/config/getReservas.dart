import 'package:flutter/material.dart';
import 'package:hotel_app/src/services/api.dart';

class GetReservas extends StatefulWidget {
  const GetReservas({super.key});

  @override
  State<GetReservas> createState() => _GetReservasState();
}

class _GetReservasState extends State<GetReservas> {
  late Future<List<Map<String, dynamic>>> _reservasFuture;

  @override
  void initState() {
    super.initState();
    // Cargar las reservas al iniciar el estado
    _reservasFuture = Api.getReservas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _reservasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay reservas disponibles.'));
          } else {
            List<Map<String, dynamic>> reservas = snapshot.data!;
            return ListView.builder(
              itemCount: reservas.length,
              itemBuilder: (context, index) {
                final reserva = reservas[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Habitación ${reserva['numeroHabitacion']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fechas: ${reserva['fechas']['fechaInicio']} - ${reserva['fechas']['fechaFin']}'),
                        Text('Huésped: ${reserva['huesped']['nombre']} ${reserva['huesped']['apellidos']}'),
                        Text('Email: ${reserva['huesped']['email']}'),
                        Text('Teléfono: ${reserva['huesped']['telefono']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),

    );
  }
}
