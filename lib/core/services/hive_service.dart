import 'package:hive_ce/hive.dart';
import 'package:rafeeqa/core/model/baby_model.dart';

class HiveService {
  final Box<BabyModel> box;

  HiveService({required this.box});

  // add
  Future<void> saveData(BabyModel baby) async {
  await box.put(baby.id.toString(), baby);
}

  // get all
  List<BabyModel> getData() => box.values.toList();

  // get one
     BabyModel? getById(int id) => box.get(id.toString());

  // update
  Future<void> updateData(dynamic key, BabyModel data) async {
    await box.put(key, data);
  }

  // delete
  Future<void> deleteData(dynamic key) async {
    await box.delete(key);
  }
}
