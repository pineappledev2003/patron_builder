import 'package:notification_api_builder/patron_builder/builder/notification_builder.dart';
import 'package:notification_api_builder/patron_builder/products/email_notification.dart';

// Los atributos se definen también en el Builder porque este patrón
// requiere almacenar temporalmente los valores mientras se construye
// el objeto final (producto). Aunque el producto ya tenga estos campos,
// el Builder necesita tenerlos para establecerlos paso a paso, antes de
// crear la instancia final en el método build().

class EmailNotificationBuilder implements NotificationBuilder<EmailNotification> {
  String? _to;
  String? _subject;
  String? _body;
  List<String>? _cc = [];
  List<String>? _bcc = [];
  List<String>? _attachments = [];
  String? _priority;

  //? Este método devuelve `this` para permitir el encadenamiento de métodos (method chaining)
  //? Esto es típico del patrón Builder y hace que el código sea más legible y fluido

  EmailNotificationBuilder setTo(String to) {
    _to = to;
    return this;
  }

  //? Este método devuelve `this`, es decir, la misma instancia del builder actual.
  //? Así se permite encadenar llamadas (method chaining) y construir el objeto paso a paso.

  EmailNotificationBuilder setSubject(String subject) {
    _subject = subject;
    return this;
  }

  EmailNotificationBuilder setBody(String body) {
    _body = body;
    return this;
  }

  EmailNotificationBuilder addCc(List<String> recipient) {
    _cc!.addAll(recipient);
    return this;
  }

  EmailNotificationBuilder addBcc(List<String> recipient) {
    _bcc!.addAll(recipient);
    return this;
  }

  EmailNotificationBuilder addAttachments(List<String> attachment) {
    _attachments!.addAll(attachment);
    return this;
  }

  EmailNotificationBuilder setPriority(String priority) {
    _priority = priority;
    return this;
  }

  @override
  EmailNotification build() {
    if (_to == null || _subject == null || _body == null) {
      throw StateError('Los campos "to", "subject" y "body" son obligatorios para un Email.');
    }

    return EmailNotification(
        to: _to!,
        subject: _subject!,
        body: _body!,
        cc: _cc,
        bcc: _bcc,
        attachments: _attachments,
        priority: _priority);
  }
}
