import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> init(
      {required Handler handler,
      required String address,
      required int port}) async {
    await shelf_io.serve(handler, 'localhost', 8081);
    print("Link https://$address:$port");
  }
}
