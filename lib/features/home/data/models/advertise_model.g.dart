// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvertiseModelAdapter extends TypeAdapter<AdvertiseModel> {
  @override
  final int typeId = 2;

  @override
  AdvertiseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdvertiseModel(
      image: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdvertiseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvertiseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
