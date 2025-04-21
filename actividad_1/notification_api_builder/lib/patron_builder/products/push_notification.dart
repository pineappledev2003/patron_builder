class PushNotification {
  final String _diviceToken;
  final String _title;
  final String _message;
  final String? _imageUrl;
  final String? _clickAction;
  final String? _priority;

  PushNotification(
      {required String diviceToken,
      required String title,
      required String message,
      String? imageUrl,
      String? clickAction,
      String? priority})
      : _diviceToken = diviceToken,
        _title = title,
        _message = message,
        _imageUrl = imageUrl,
        _clickAction = clickAction,
        _priority = priority;

  String get diviceToken => _diviceToken;
  String get title => _title;
  String get message => _message;
  String? get imageUrl => _imageUrl;
  String? get clickAction => _clickAction;
  String? get priority => _priority;
}
