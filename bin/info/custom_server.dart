import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> inicialize(Handler handler) async {
    String address = "localhost";
    int port = 8081;
    await shelf_io.serve(handler, address, port);
    print("Link https://$address:$port");
  }
}
