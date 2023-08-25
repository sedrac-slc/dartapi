import 'package:backend/backend.dart' as backend;
import 'package:shelf/shelf.dart';
import 'api/new_api.dart';
import 'api/login_api.dart';
import 'info/custom_server.dart';
import 'services/news_service.dart';
import 'utils/custom_env.dart';

void main(List<String> arguments) async {
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(NewApi().handler).handler;
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);
  await CustomServer().init(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
