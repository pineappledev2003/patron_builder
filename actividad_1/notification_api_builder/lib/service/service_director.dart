import 'package:notification_api_builder/patron_builder/concrete_builders/email_notification_builder.dart';
import 'package:notification_api_builder/patron_builder/concrete_builders/push_notification_builder.dart';
import 'package:notification_api_builder/patron_builder/concrete_builders/sms_notification_builder.dart';
import 'package:notification_api_builder/patron_builder/concrete_builders/whatsapp_notification_builder.dart';
import 'package:notification_api_builder/patron_builder/products/email_notification.dart';
import 'package:notification_api_builder/patron_builder/products/push_notification.dart';
import 'package:notification_api_builder/patron_builder/products/sms_notification.dart';
import 'package:notification_api_builder/patron_builder/products/whatsapp_notification.dart';
/**
  **Comentario:**
 Cuando usamos `return this` dentro de un método del Builder, estamos devolviendo la instancia actual 
 del Builder, lo que permite encadenar múltiples llamadas a métodos. Esto significa que después de
 ejecutar un método, podemos seguir configurando más atributos del objeto en una sola línea (cascada).
 En otras palabras, `return this` permite que la misma instancia del Builder sea utilizada para modificar 
 diferentes atributos sin tener que crear nuevos objetos ni repetir el nombre del builder en cada línea.

 Ejemplo:
 builder.setTo("destinatario").setSubject("asunto").setBody("mensaje");

 En este ejemplo, después de llamar a `setTo()`, el método retorna la misma instancia de builder,
 lo que permite que las siguientes llamadas a `setSubject()` y `setBody()` puedan encadenarse de forma fluida.
 Finalmente, cuando se llama a `build()`, el objeto construido se devuelve como el resultado final.
 */
 

/**
 
  {
    "tipo": "email",
    "data": {
      "destinatario": "cliente@ejemplo.com",
      "monto": 99.99,
      "id": "TX123456",
      "cc": ["soporte@ejemplo.com", "ventas@ejemplo.com"],
      "bcc": ["admin@ejemplo.com"],
      "attachment": ["factura.pdf", "comprobante.pdf"],
      "priority": "alta"
    }
  }

 */

class ServiceDirector {
  //Metodo para crear un correo electronico
  static EmailNotification buildEmail(Map<String, dynamic> data) {
    // 1: Creamos una instancia del Builder especifico para el tipo de notificacion (Email)
    final builder = EmailNotificationBuilder();

    // 2: Utilizar el builder para configurar los atributos necesarios para el email
    builder
        .setTo(data["destinatario"])
        .setSubject("Pago Exitoso")
        .setBody("Tu pago de \$${data["monto"]} ha sido procesado exitosamente. \nID de transacción: ${data["id"]} ")
        .addCc(List.from(data["cc"] ?? []))
        .addBcc(List.from(data["bcc"] ?? []))
        .addAttachments(List.from(data["attachment"] ?? []))
        .setPriority(data["priority"] ?? "---");

    //3: Llamamos al método build() del Builder para obtener el objeto EmailNotification construido
    return builder.build();
  }

  static SmsNotification builSMS(Map<String, dynamic> data) {
    final builder = SmsNotificationBuilder();

    builder
        .setPhoneNumber(data["phoneNumber"])
        .setMessage("Tu pago de \$${data["monto"]} ha sido procesado exitosamente.")
        .setSenderId(data["senderId"] ?? "---")
        .setDeliveryReportRequired(data["deliveryReportRequired"])
        .setScheduleTime(data["scheduleTime"] ?? "----");

    return builder.build();
  }

  static PushNotification buildPush(Map<String, dynamic> data) {
    final builder = PushNotificationBuilder();

    builder
        .setDeviceToken(data["deviceToken"])
        .setTitle("Pago Exitoso")
        .setMessage("Tu pago de \$${data["monto"]} ha sido procesado exitosamente.")
        .setImageUrl(data["imageUrl"])
        .setClickAction(data["clickAction"])
        .setPriority(data["priority"] ?? "---");

    return builder.build();
  }

  static WhatsappNotification buildWhatsapp(Map<String, dynamic> data) {
    final builder = WhatsappNotificationBuilder();

    builder
        .setPhoneNumber(data["phoneNumber"])
        .setMessage("Tu pago de \$${data["monto"]} ha sido procesado exitosamente.")
        .setMediaUrl(data["mediaUrl"])
        .setCaption(data["caption"])
        .addInteractiveButton(List<String>.from(data["interactiveButtons"] ?? []))
        .setLanguage(data["lenguaje"] ?? "es"); // Por defecto en español

    return builder.build();
  }
}
