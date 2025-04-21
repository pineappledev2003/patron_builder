import 'package:pdf_pago_api/enum/enum_option.dart';
import 'package:pdf_pago_api/patron_builder/concrete_builders/payment_report_builder.dart';
import 'package:pdf_pago_api/patron_builder/products/payment_report.dart';

class ServiceDirector {
  static PaymentReport buildReport(Map<String, dynamic> body) {
    final builder = PaymentReportBuilder();

    builder
        .setIncludeLogo(body["includeLogo"])
        .setTitle("REPORTE PAGO")
        .setIncludePaymentDetails(body["includePaymentsDetails"])
        .setIncludeUserInfo(body["includeUserInfo"])
        .setTheme(parseTheme(body["theme"]))
        .setIncludeTimestamp(body["includeTimestamp"])
        .setFooterMessage(body["footerMessage"])
        .setFormat(parseFormat(body["format"]));

    return builder.build();
  }
  
  static themeOptions parseTheme(String value) {
    switch (value.toUpperCase()) {
      case "LIGHT":
        return themeOptions.light;
      case "DARK":
        return themeOptions.dark;
      default:
        throw Exception("Tema no válido: $value");
    }
  }

  static formatOptions parseFormat(String value) {
    switch (value.toUpperCase()) {
      case "A4":
        return formatOptions.a4;
      case "LETTER":
        return formatOptions.letter;
      default:
        throw Exception("Formato no válido: $value");
    }
  }
}
