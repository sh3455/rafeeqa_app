// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BabyModelAdapter extends TypeAdapter<BabyModel> {
  @override
  final typeId = 1;

  @override
  BabyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BabyModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      createdAt: fields[2] as DateTime,
      dateOfBirth: fields[3] as DateTime,
      gender: fields[4] as String,
      image: fields[5] as String?,
      birthType: fields[6] as String,
      weight: (fields[7] as num).toDouble(),
      height: (fields[8] as num).toDouble(),
      vaccinations: (fields[9] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, BabyModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.dateOfBirth)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.birthType)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.vaccinations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BabyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
