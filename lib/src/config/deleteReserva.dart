import 'package:flutter/material.dart';
import 'package:hotel_app/src/services/api.dart';

class DeleteReserva extends StatefulWidget {
  const DeleteReserva({super.key});

  @override
  State<DeleteReserva> createState() => _DeleteReservaState();
}

class _DeleteReservaState extends State<DeleteReserva> {
  late Future<List<Map<String, dynamic>>> _reservasFuture;

  @override
  void initState() {
    super.initState();
    // Cargar las reservas al iniciar el estado
    _reservasFuture = Api.getReservas();
  }

  void _eliminarReserva(String id) async {
    try {
      final resultado = await Api.eliminarReserva(id);
      if (resultado) {
        setState(() {
          // Actualizar la lista de reservas después de eliminar
          _reservasFuture = Api.getReservas();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reserva eliminada exitosamente.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al eliminar la reserva.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _eliminarReserva(reserva['numeroHabitacion'].toString());
                      },
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
