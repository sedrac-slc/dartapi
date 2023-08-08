import 'dart:io';

import 'parse_extension.dart';

class CustomEnv {
  static String _file = ".env";
  static Map<String, String> _map = {};

  CustomEnv._();

  factory CustomEnv.fromFile({required String file}) {
    _file = file;
    return CustomEnv._();
  }

  static Future<String> _readFile() async {
    return await File(_file).readAsString();
  }

  static Future<void> _load() async {
    List<String> lines = (await _readFile()).split("\n");
    _map = {for (var line in lines) line.split("=")[0]: line.split("=")[1]};
  }

  static Future<T> get<T>({required String key}) async {
    if (_map.isEmpty) await _load();
    return _map[key]!.toType(T);
  }
}
