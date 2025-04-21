import 'package:notification_api_builder/patron_builder/builder/notification_builder.dart';
import 'package:notification_api_builder/patron_builder/products/push_notification.dart';

class PushNotificationBuilder implements NotificationBuilder<PushNotification> {
  String? _deviceToken;
  String? _title;
  String? _message;
  String? _imageUrl;
  String? _clickAction;
  String? _priority;

  PushNotificationBuilder setDeviceToken(String deviceToken) {
    _deviceToken = deviceToken;
    return this;
  }

  PushNotificationBuilder setTitle(String title) {
    _title = title;
    return this;
  }

  PushNotificationBuilder setMessage(String message) {
    _message = message;
    return this;
  }

  PushNotificationBuilder setImageUrl(String imageUrl) {
    _imageUrl = imageUrl;
    return this;
  }

  PushNotificationBuilder setClickAction(String clickAction) {
    _clickAction = clickAction;
    return this;
  }

  PushNotificationBuilder setPriority(String priority) {
    _priority = priority;
    return this;
  }

  @override
  PushNotification build() {
    if (_deviceToken == null || _title == null || _message == null) {
      throw StateError(
          'Los campos "deviceToken", "title" y "message" son obligatorios para una notificación Push.');
    }

    return PushNotification(
        diviceToken: _deviceToken!,
        title: _title!,
        message: _message!,
        imageUrl: _imageUrl,
        clickAction: _clickAction,
        priority: _priority);
  }
}
