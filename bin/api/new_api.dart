import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class NewApi {
  Handler get handler {
    final String context = "/blog";
    Router router = Router();

    router.get("$context", (Request req) {
      return Response(200, body: 'LIST');
    });

    router.post("$context", (Request req) {
      return Response(200, body: 'STORE');
    });

    router.get("$context/<id>", (Request req) {
      return Response(200, body: 'FIND');
    });

    router.put("$context/<id>", (Request req) {
      return Response(200, body: 'UPDATE');
    });

    router.delete("$context/<id>", (Request req) {
      return Response(200, body: 'DELETE');
    });

    return router;
  }
}
