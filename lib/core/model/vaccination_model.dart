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
  @HiveField(5)
  final String nameAr;
  @HiveField(6)
  final String routeOfAdministrationAr;
  @HiveField(7)
  final String reasonAr;

  const VaccinationModel({
    required this.id,
    required this.name,
    required this.age,
    required this.routeOfAdministration,
    required this.reason,
    required this.nameAr,
    required this.routeOfAdministrationAr,
    required this.reasonAr,
  });

  factory VaccinationModel.newVaccination({
    required String name,
    required double age,
    required String routeOfAdministration,
    required String reason,
    required String nameAr,
    required String routeOfAdministrationAr,
    required String reasonAr,
  }) {
    return VaccinationModel(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      nameAr: nameAr,
      age: age,
      routeOfAdministration: routeOfAdministration,
      routeOfAdministrationAr: routeOfAdministrationAr,
      reason: reason,
      reasonAr: reasonAr,
    );
  }

  VaccinationModel copyWith({
    int? id,
    String? name,
    double? age,
    String? routeOfAdministration,
    String? reason,
    String? nameAr,
    String? routeOfAdministrationAr,
    String? reasonAr,
  }) {
    return VaccinationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      routeOfAdministration:
          routeOfAdministration ?? this.routeOfAdministration,
      reason: reason ?? this.reason,
      nameAr: nameAr ?? this.nameAr,
      routeOfAdministrationAr:
          routeOfAdministrationAr ?? this.routeOfAdministrationAr,
      reasonAr: reasonAr ?? this.reasonAr,
    );
  }
}
