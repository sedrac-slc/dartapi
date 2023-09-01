import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../security/jwt_impl.dart';

class LoginApi {
  final SecurityServiceJWT _securityService = SecurityServiceJWT();

  Handler get handler {
    Router router = Router();
    router.post("/login", (Request req) async {
      var token = await _securityService.generateToken("123456");
      var result = await _securityService.validateToken(token);
      return Response.ok(result != null);
    });
    return router;
  }
}
