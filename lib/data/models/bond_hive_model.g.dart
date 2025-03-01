// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BondHiveModelAdapter extends TypeAdapter<BondHiveModel> {
  @override
  final int typeId = 0;

  @override
  BondHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BondHiveModel(
      id: fields[0] as String,
      code: fields[1] as String,
      companyName: fields[2] as String,
      rating: fields[3] as String,
      logoUrl: fields[4] as String,
      tags: (fields[5] as List).cast<String>(),
      isActive: fields[6] as bool,
      bookmarkedAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BondHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.companyName)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.logoUrl)
      ..writeByte(5)
      ..write(obj.tags)
      ..writeByte(6)
      ..write(obj.isActive)
      ..writeByte(7)
      ..write(obj.bookmarkedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BondHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
