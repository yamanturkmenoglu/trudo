// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 0;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel(
      accessToken: fields[0] as String?,
      id: fields[1] as String?,
      role: fields[2] as String?,
      name: fields[3] as String?,
      username: fields[4] as String?,
      password: fields[5] as String?,
      firstTimeAppOpened: fields[6] as bool?,
      phone: fields[7] as String?,
      center: fields[8] as String?,
      step: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.firstTimeAppOpened)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.center)
      ..writeByte(9)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
