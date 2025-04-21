import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:notification_api_builder/service/notification_factory.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {"Error": "Metodo no permitido"});
  }

  try {
    final body = await context.request.body();
    final data = jsonDecode(body) as Map<String, dynamic>;

    final tipo = data["tipo"];
    final contenido = data["data"];
    final notification = NotificationFactory.createNotificacion(tipo, contenido);

    return Response.json(
      statusCode: 200,
      body: {
        'message': 'Notificación creada exitosamente',
        'tipo':tipo,
        'notification': notification.toMap()
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'error': 'Error al procesar la notificación', 'details': e.toString()},
    );
  }
}
