import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerConfigHandler {
  Handler get handler {
    final router = Router();

    router.get("/", (Request req) {
      return Response(200, body: 'OK');
    });

    router.get("/query", (Request req) {
      String? name = req.url.queryParameters['name'];
      String? age = req.url.queryParameters['age'];
      return Response(200, body: 'Name: $name, Age: $age');
    });

    router.post("/login", (Request req) async {
      var read = await req.readAsString();
      Map json = jsonDecode(read);
      String usermane = json['username'];
      String password = json['password'];
      if (usermane == "sedrac" && password == "12345678") {
        Map jsonMap = {
          "token": "iendsdk234msdnms",
          "session_id": "jdjsdhsjhdjsje"
        };
        var jsonResponse = jsonEncode(jsonMap);
        return Response.ok(jsonResponse,
            headers: {"content-type": "application/json"});
      }
      return Response.forbidden("Acesso negado");
    });

    router.get("/html", (Request req) {
      return Response(200,
          body: "<h1></h2>", headers: {"content-type": "text/html"});
    });

    router.get("/find/<name>", (Request req, String name) {
      return Response(200, body: 'Name: $name');
    });

    return router;
  }
}
