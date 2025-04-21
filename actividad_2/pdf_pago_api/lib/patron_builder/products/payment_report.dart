import 'package:pdf_pago_api/enum/enum_option.dart';

class PaymentReport {
  final bool? _includeLogo;
  final String _title;
  final bool _includePaymentDetails;
  final bool _includeUserInfo;
  final themeOptions _theme;
  final bool _includeTimestamp;
  final String _footerMessage;
  final formatOptions _format;

  PaymentReport({
    bool? includeLogo,
    required String title,
    required bool includePaymentDetails,
    required bool includeUserInfo,
    required themeOptions theme,
    required bool includeTimestamp,
    required String footerMessage,
    required formatOptions format,
  })  : _includeLogo = includeLogo,
        _title = title,
        _includePaymentDetails = includePaymentDetails,
        _includeUserInfo = includeUserInfo,
        _theme = theme,
        _includeTimestamp = includeTimestamp,
        _footerMessage = footerMessage,
        _format = format;

  bool get includeLogo => _includeLogo!;
  String get title => _title;
  bool get includePaymentDetails => _includePaymentDetails;
  bool get includeUserInfo => _includeUserInfo;
  themeOptions get theme => _theme;
  bool get includeTimestamp => _includeTimestamp;
  String get footerMessage => _footerMessage;
  formatOptions get format => _format;
}
