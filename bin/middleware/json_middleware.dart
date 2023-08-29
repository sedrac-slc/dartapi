import 'package:shelf/shelf.dart';

class JsonMiddleware {
  Middleware get jsonParser {
    return createMiddleware(
        responseHandler: (Response req) =>
            req.change(headers: {"content-type": "application/json"}));
  }
}
