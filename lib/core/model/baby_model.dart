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