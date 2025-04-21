import 'package:pdf_pago_api/service/service_director.dart';

class PaymentFactory {
  static createReport(String type , Map<String,dynamic> body){
    switch(type){
      case "reporte_pago":
        return ServiceDirector.buildReport(body);
      default:
        throw ArgumentError("Solo existe el reporte de pago");
    }
  }
}