import '../model/new_model.dart';
import 'generic_service.dart';

class NewService extends GenericService<New> {
  New findById(int id) {
    return New(2, "", "", DateTime(2020, 1, 1), null);
  }

  List<New> findAll() {
    return List.empty();
  }

  bool save(New obj) {
    return true;
  }

  bool delete(New obj) {
    return true;
  }
}
