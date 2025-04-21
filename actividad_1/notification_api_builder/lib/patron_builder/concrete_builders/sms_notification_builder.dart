import 'package:notification_api_builder/patron_builder/builder/notification_builder.dart';
import 'package:notification_api_builder/patron_builder/products/sms_notification.dart';

class SmsNotificationBuilder implements NotificationBuilder<SmsNotification> {
  String? _phoneNumber;
  String? _message;
  String? _senderId;
  bool? _deliveryReportRequired;
  DateTime? _scheduleTime;

  SmsNotificationBuilder setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    return this;
  }

  SmsNotificationBuilder setMessage(String message) {
    _message = message;
    return this;
  }

  SmsNotificationBuilder setSenderId(String senderId) {
    _senderId = senderId;
    return this;
  }

  SmsNotificationBuilder setDeliveryReportRequired(bool required) {
    _deliveryReportRequired = required;
    return this;
  }

  SmsNotificationBuilder setScheduleTime(DateTime time) {
    _scheduleTime = time;
    return this;
  }

  @override
  SmsNotification build() {
    if (_phoneNumber == null || _message == null) {
      throw StateError('Los campos "phoneNumber" y "message" son obligatorios para un SMS.');
    }
    return SmsNotification(
        phoneNumber: _phoneNumber!,
        message: _message!,
        senderId: _senderId,
        deliveryReportRequired: _deliveryReportRequired,
        scheduleTime: _scheduleTime);
  }
}
