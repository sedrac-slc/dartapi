abstract class SecurityJWT<T> {
  Future<String> generateToken(String userID);
  T? validateToken(String token);
}
