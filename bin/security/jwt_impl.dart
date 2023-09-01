import '../utils/custom_env.dart';
import 'jwt_abst.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SecurityServiceJWT extends SecurityJWT<JWT> {
  @override
  Future<String> generateToken(String userID) async {
    var jwt = JWT({
      'iat': DateTime.now().millisecondsSinceEpoch,
      'userID': userID,
      'roles': ['admin', 'user']
    });
    String key = await CustomEnv.get(key: "jwt_token");
    String token = jwt.sign(SecretKey(key));
    return token;
  }

  @override
  Future<JWT?> validateToken(String token) async {
    String key = await CustomEnv.get(key: "jwt_token");
    try {
      return JWT.verify(token, SecretKey(key));
    } on JWTInvalidException {
      return null;
    } on JWTExpiredException {
      return null;
    } on JWTNotActiveException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
