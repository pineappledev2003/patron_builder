import 'package:notification_api_builder/patron_builder/builder/notification_builder.dart';
import 'package:notification_api_builder/patron_builder/products/whatsapp_notification.dart';

class WhatsappNotificationBuilder implements NotificationBuilder<WhatsappNotification> {
  String? _phoneNumber;
  String? _message;
  String? _mediaUrl;
  String? _caption;
  List<String>? _interactiveButtons = [];
  String? _languaje;

  WhatsappNotificationBuilder setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    return this;
  }

  WhatsappNotificationBuilder setMessage(String message) {
    _message = message;
    return this;
  }

  WhatsappNotificationBuilder setMediaUrl(String mediaUrl) {
    _mediaUrl = mediaUrl;
    return this;
  }

  WhatsappNotificationBuilder setCaption(String caption) {
    _caption = caption;
    return this;
  }

  WhatsappNotificationBuilder addInteractiveButton(List<String> button) {
    _interactiveButtons ??= [];
    _interactiveButtons!.addAll(button);
    return this;
  }

  WhatsappNotificationBuilder setLanguage(String languaje) {
    _languaje = languaje;
    return this;
  }

  @override
  WhatsappNotification build() {
    if (_phoneNumber == null || _message == null) {
      throw StateError(
          'Los campos "phoneNumber" y "message" son obligatorios para una notificación de WhatsApp.');
    }
    return WhatsappNotification(
        phoneNumber: _phoneNumber!,
        message: _message!,
        mediaUrl: _mediaUrl,
        caption: _caption,
        interactiveButtons: _interactiveButtons,
        lenguaje: _languaje);
  }
}
