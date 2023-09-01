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
    String key = "1983443232idj@djeroKLASMEi_a3ddna4aq";
    String token = jwt.sign(SecretKey(key));
    return token;
  }

  @override
  JWT? validateToken(String token) {
    throw UnimplementedError();
  }
}
