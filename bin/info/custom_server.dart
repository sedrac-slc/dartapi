import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> init(
      {required Handler handler,
      String address = "localhost",
      int port = 8081}) async {
    await shelf_io.serve(handler, address, port);
    print("Link https://$address:$port");
  }
}
