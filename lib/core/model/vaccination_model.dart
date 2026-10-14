import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
part 'vaccination_model.g.dart';

@HiveType(typeId: 0)
class VaccinationModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double age;
  @HiveField(3)
  final String routeOfAdministration;
  @HiveField(4)
  final String reason;

  const VaccinationModel({
    required this.id,
    required this.name,
    required this.age,
    required this.routeOfAdministration,
    required this.reason,
  });

  factory VaccinationModel.newVaccination({
    required String name,
    required double age,
    required String routeOfAdministration,
    required String reason,
  }) {
    return VaccinationModel(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      age: age,
      routeOfAdministration: routeOfAdministration,
      reason: reason,
    );
  }

  VaccinationModel copyWith({
    int? id,
    String? name,
    double? age,
    String? routeOfAdministration,
    String? reason,
  }) {
    return VaccinationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      routeOfAdministration: routeOfAdministration ?? this.routeOfAdministration,
      reason: reason ?? this.reason,
    );
  }
}