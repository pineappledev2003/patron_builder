import 'package:notification_api_builder/service/service_director.dart';

class NotificationFactory {
  static createNotificacion(String type, Map<String, dynamic> data) {
    switch (type) {
      case "email":
        return ServiceDirector.buildEmail(data);
      case "sms":
        return ServiceDirector.builSMS(data);
      case "push":
        return ServiceDirector.buildPush(data);
      case "whatsapp":
        return ServiceDirector.buildWhatsapp(data);
      default:
        throw ArgumentError("Tipo de notificacion no soportado $type");
    }
  }
}
