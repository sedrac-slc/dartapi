import 'package:backend/backend.dart' as backend;
import 'api/login_api.dart';
import 'info/custom_server.dart';

void main(List<String> arguments) async {
  await CustomServer().inicialize(LoginApi().handler);
}
