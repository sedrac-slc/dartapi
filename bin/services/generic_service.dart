abstract class GenericService<T> {
  T findById(int id);
  List<T> findAll();
  bool save(T obj);
  bool delete(T obj);
}
