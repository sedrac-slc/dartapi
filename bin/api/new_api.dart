import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../model/new_model.dart';
import '../services/news_service.dart';

class NewApi {
  final NewService _newService = NewService();

  Handler get handler {
    final String context = "/news";
    Router router = Router();

    router.get("$context", (Request req) async {
      List<New> list = _newService.findAll();
      List<Map> maps = list.map((e) => e.toJson()).toList();
      var jsonResponse = jsonEncode(maps);
      return Response.ok(jsonResponse,
          headers: {"content-type": "application/json"});
    });

    router.post("$context", (Request req) async {
      String body = await req.readAsString();
      _newService.save(New.fromJson(jsonDecode(body)));
      return Response(200, body: 'STORE');
    });

    router.get("$context/<id>", (Request req, int id) {
      //_newService.findById(id);
      return Response(200, body: 'FIND');
    });

    router.put("$context/<id>", (Request req, int id) {
      return Response(200, body: 'UPDATE');
    });

    router.delete("$context/<id>", (Request req, int id) {
      return Response(200, body: 'DELETE');
    });

    return router;
  }
}
