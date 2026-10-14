// ignore_for_file: unnecessary_this

class BabyModel {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime dateOfBirth;
  final String gender;
  final String? image;
  final String birthType;
  final double weight;
  final double height;
  final String? question;

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
    this.question, 
  });

  factory BabyModel.newBaby({
    required int id,
    required String name,
    required DateTime birthday,
    required String gender,
    String? image,
    required String birthType,
    required double weight,
    required double height,
    String? question,
  }) {
    return BabyModel(
      id :DateTime.now().millisecondsSinceEpoch,
      name: name,
      createdAt: DateTime.now(),
      dateOfBirth: birthday,
      gender: gender,
      image: image,
      birthType: birthType,
      weight: weight,
      height: height,
      question: question, 
    );
  }

  BabyModel copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? birthday,
    String? gender,
    String? image,
    String? birthType,
    double? weight,
    double? height,
    String? question,
  }) {
    return BabyModel(
      id:id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      dateOfBirth: birthday ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      birthType: birthType ?? this.birthType,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      question: question ?? this.question,
    );
  }
}