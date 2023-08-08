import 'package:backend/backend.dart' as backend;
import 'package:shelf/shelf.dart';
import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'info/custom_server.dart';
import 'utils/custom_env.dart';

void main(List<String> arguments) async {
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(BlogApi().handler).handler;
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);
  await CustomServer().init(
      handler,
      await CustomEnv.get<String>(key: "server_address"),
      await CustomEnv.get<int>(key: "server_port"));
}
