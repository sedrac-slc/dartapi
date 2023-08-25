import '../model/new_model.dart';
import '../utils/list_extension.dart';
import 'generic_service.dart';

class NewService implements GenericService<New> {
  final List<New> _listFake = [
    New(1, "Morte de Adão", "Adão morreu de ataque cardiaco",
        DateTime(2023, 08, 08), DateTime(2023, 08, 08))
  ];

  @override
  New findById(int id) {
    return _listFake.firstWhere((e) => e.id == id);
  }

  @override
  List<New> findAll() {
    return _listFake;
  }

  @override
  bool save(New obj) {
    int tam = _listFake.length;
    New? model = _listFake.firstWhereOrNull((e) => e.id == obj.id);
    if (model == null) {
      _listFake.add(obj);
    } else {
      int index = _listFake.indexWhere((e) => e.id == obj.id);
      _listFake[index] = obj;
    }
    return _listFake.length > tam;
  }

  @override
  bool deleteById(int id) {
    int tam = _listFake.length;
    _listFake.removeWhere((e) => e.id == id);
    return _listFake.length < tam;
  }
}
