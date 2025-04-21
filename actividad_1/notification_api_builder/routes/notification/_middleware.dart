import 'package:dart_frog/dart_frog.dart';
import '../../middleware/cors.dart'; // si tu middleware CORS está en esa ruta

Handler middleware(Handler handler) {
  return handler.use(cors());
}
