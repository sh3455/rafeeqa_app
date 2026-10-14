
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
part 'baby_model.g.dart';


@HiveType(typeId: 1)
class BabyModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  final DateTime dateOfBirth;
  @HiveField(4)
  final String gender;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  final String birthType;
  @HiveField(7)
  final double weight;
  @HiveField(8)
  final double height;
  @HiveField(9)
  final List<int> vaccinations; 

  const BabyModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.dateOfBirth,
    required this.gender,
    this.image,
    required this.birthType,
    required this.weight,
    required this.height,
    required this.vaccinations,
  });

  factory BabyModel.newBaby({
    required String name,
    required DateTime dateOfBirth,
    required String gender,
    String? image,
    required String birthType,
    required double weight,
    required double height,
  }) {
    return BabyModel(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      createdAt: DateTime.now(),
      dateOfBirth: dateOfBirth,
      gender: gender,
      image: image,
      birthType: birthType,
      weight: weight,
      height: height,
      vaccinations: const [],
    );
  }

  BabyModel copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? dateOfBirth,
    String? gender,
    String? image,
    String? birthType,
    double? weight,
    double? height,
    List<int>? vaccinations,
  }) {
    return BabyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      birthType: birthType ?? this.birthType,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      vaccinations: vaccinations ?? this.vaccinations,
    );
  }
}