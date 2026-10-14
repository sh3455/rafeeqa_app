import 'package:hive_ce/hive.dart';

class HiveService<T> {
  final Box<T> box;

  HiveService({required this.box});

  // add
  Future<void> addData(dynamic key, T data) async {
    await box.put(key, data);
  }

  // get all
  List<T> getData() => box.values.toList();

  // get one
  T? getById(dynamic key) => box.get(key);

  // update
  Future<void> updateData(dynamic key, T data) async {
    await box.put(key, data);
  }

  // delete
  Future<void> deleteData(dynamic key) async {
    await box.delete(key);
  }
}