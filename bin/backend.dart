import 'package:shelf/shelf.dart';
import 'api/new_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'middleware/json_middleware.dart';

void main(List<String> arguments) async {
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(NewApi().handler).handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(JsonMiddleware().jsonParser)
      .addHandler(cascadeHandler);

  await CustomServer().init(handler: handler);
}
