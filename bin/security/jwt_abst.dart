abstract class SecurityJWT<T> {
  Future<String> generateToken(String userID);
  Future<T?> validateToken(String token);
}
