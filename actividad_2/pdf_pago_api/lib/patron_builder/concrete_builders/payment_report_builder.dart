import 'package:pdf_pago_api/enum/enum_option.dart';
import 'package:pdf_pago_api/patron_builder/builder/report_builder.dart';
import 'package:pdf_pago_api/patron_builder/products/payment_report.dart';

class PaymentReportBuilder implements ReportBuilder<PaymentReport> {
  bool? _includeLogo;
  String _title = "";
  bool _includePaymentDetails = false;
  bool _includeUserInfo = false;
  themeOptions _theme = themeOptions.dark;
  bool _includeTimestamp = false;
  String _footerMessage = "";
  formatOptions _format = formatOptions.a4;

  PaymentReportBuilder setIncludeLogo(bool includeLogo) {
    _includeLogo = includeLogo;
    return this;
  }

  PaymentReportBuilder setTitle(String title) {
    _title = title;
    return this;
  }

  PaymentReportBuilder setIncludePaymentDetails(bool includePaymentDetails) {
    _includePaymentDetails = includePaymentDetails;
    return this;
  }

  PaymentReportBuilder setIncludeUserInfo(bool includeUserInfo) {
    _includeUserInfo = includeUserInfo;
    return this;
  }

  PaymentReportBuilder setTheme(themeOptions theme) {
    _theme = theme;
    return this;
  }

  PaymentReportBuilder setIncludeTimestamp(bool includeTimestamp) {
    _includeTimestamp = includeTimestamp;
    return this;
  }

  PaymentReportBuilder setFooterMessage(String footerMessage) {
    _footerMessage = footerMessage;
    return this;
  }

  PaymentReportBuilder setFormat(formatOptions format) {
    _format = format;
    return this;
  }

  @override
  PaymentReport build() {
    return PaymentReport(
      includeLogo: _includeLogo ?? false,
      title: _title,
      includePaymentDetails: _includePaymentDetails,
      includeUserInfo: _includeUserInfo,
      theme: _theme,
      includeTimestamp: _includeTimestamp,
      footerMessage: _footerMessage,
      format: _format,
    );
  }
}
