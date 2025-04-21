class WhatsappNotification {
  final String _phoneNumber;
  final String _message;
  final String? _mediaUrl;
  final String? _caption;
  final List<String>? _interactiveButtons;
  final String? _languaje;

  WhatsappNotification({
    required String phoneNumber,
    required String message,
    String? mediaUrl,
    String? caption,
    List<String>? interactiveButtons,
    String? lenguaje,
  })  : _phoneNumber = phoneNumber,
        _message = message,
        _mediaUrl = mediaUrl,
        _caption = caption,
        _interactiveButtons = interactiveButtons,
        _languaje = lenguaje;

  String get phoneNumber => _phoneNumber;
  String get message => _message;
  String? get mediaUrl => _mediaUrl;
  String? get caption => _caption;
  List<String>? get interactiveButtons => _interactiveButtons;
  String? get lenguaje => _languaje;
}
