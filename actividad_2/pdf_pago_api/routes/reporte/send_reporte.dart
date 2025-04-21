import 'package:dart_frog/dart_frog.dart';
import 'package:pdf_pago_api/service/payment_factory.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {"Error": "Metodo no permitido"});
  }

  try {
    final body = await context.request.json() as Map<String, dynamic>;

    final report = PaymentFactory.createReport("reporte_pago", body);

    return Response.json(body: {
      "message": "Reporte generado exitosamente",
      "data": {
        "title": report.title,
        "theme": report.theme.toString().split('.').last,
        "format": report.format.toString().split('.').last,
        "includeLogo": report.includeLogo,
        "includeUserInfo": report.includeUserInfo,
        "includePaymentDetails": report.includePaymentDetails,
        "includeTimestamp": report.includeTimestamp,
        "footerMessage": report.footerMessage,
      }
    });
  } catch (e) {
    return Response.json(statusCode: 400, body: {'error': e.toString()});
  }
}
