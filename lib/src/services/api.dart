import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'http://10.0.2.2:4000'; // Cambia por la URL de tu servidor
  // Enviar datos de huésped
  static Future<void> addHuesped(Map<String, dynamic> datosHuesped) async {
    var url = Uri.parse('$baseUrl/reserva/huesped');
    try {
      final response = await http.post(url, body: jsonEncode(datosHuesped), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        print('Huésped enviado correctamente: ${response.body}');
      } else {
        print('Error al enviar huésped: ${response.body}');
      }
    } catch (e) {
      print('Error en la solicitud de huésped: $e');
    }
  }

  static Future<void> addFechas(Map<String, dynamic> datosFechas) async {
    var url = Uri.parse('$baseUrl/reservacion/fechas');
    try {
      final response = await http.post(url, body: jsonEncode(datosFechas), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        print('Fechas enviadas correctamente: ${response.body}');
      } else {
        print('Error al enviar fechas: ${response.body}');
      }
    } catch (e) {
      print('Error en la solicitud de fechas: $e');
    }
  }

  // Método para obtener las reservas
 static Future<List<Map<String, dynamic>>> getReservas() async {
  try {
    List<int> numerosDeHabitacion = [1, 2, 3, 4, 5, 6];
    List<Map<String, dynamic>> reservas = [];

    for (int numero in numerosDeHabitacion) {
      var urlFechas = Uri.parse('$baseUrl/reservacion/fechas/$numero');
      var urlHuespedes = Uri.parse('$baseUrl/reserva/huesped/$numero');

      final responseFechas = await http.get(urlFechas);
      final responseHuespedes = await http.get(urlHuespedes);

      print('Respuesta Fechas Habitación $numero: ${responseFechas.body}');
      print('Respuesta Huésped Habitación $numero: ${responseHuespedes.body}');

      if (responseFechas.statusCode == 200 && responseHuespedes.statusCode == 200) {
        // Decodificar las respuestas
        var fechasData = jsonDecode(responseFechas.body);
        var huespedData = jsonDecode(responseHuespedes.body);

        // Agregar datos a la lista de reservas
        reservas.add({
          'numeroHabitacion': numero,
          'fechas': fechasData.isNotEmpty
              ? {
                  'fechaInicio': fechasData[0]['fechaInicio'] ?? '',
                  'fechaFin': fechasData[0]['fechaFin'] ?? ''
                }
              : {'fechaInicio': '', 'fechaFin': ''},
          'huesped': huespedData.isNotEmpty
              ? {
                  'nombre': huespedData[0]['nombre'] ?? '',
                  'apellidos': huespedData[0]['apellidos'] ?? '',
                  'email': huespedData[0]['email'] ?? '',
                  'telefono': huespedData[0]['telefono'] ?? ''
                }
              : {'nombre': '', 'apellidos': '', 'email': '', 'telefono': ''}
        });
      } else {
        print('Error en las solicitudes para la habitación $numero');
      }
    }

    return reservas;
  } catch (e) {
    print('Error en la solicitud: $e');
    return [];
  }
}

}
