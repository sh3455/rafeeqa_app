// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VaccinationModelAdapter extends TypeAdapter<VaccinationModel> {
  @override
  final typeId = 0;

  @override
  VaccinationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VaccinationModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      age: (fields[2] as num).toDouble(),
      routeOfAdministration: fields[3] as String,
      reason: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VaccinationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.routeOfAdministration)
      ..writeByte(4)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VaccinationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
