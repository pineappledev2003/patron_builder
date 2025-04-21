class SmsNotification {
  final String _phoneNumber;
  final String _message;
  final String? _senderId;
  final bool? _deliveryReportRequired;
  final DateTime? _scheduleTime;

  SmsNotification({
    required String phoneNumber,
    required String message,
    String? senderId,
    bool? deliveryReportRequired,
    DateTime? scheduleTime,
  })  : _phoneNumber = phoneNumber,
        _message = message,
        _senderId = senderId,
        _deliveryReportRequired = deliveryReportRequired,
        _scheduleTime = scheduleTime;

  String get phoneNumber => _phoneNumber;
  String get message => _message;
  String? get senderId => _senderId;
  bool? get deliveryReportRequired => _deliveryReportRequired;
  DateTime? get scheduleTime => _scheduleTime;
}
