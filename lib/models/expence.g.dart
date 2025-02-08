// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expence.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenceModelAdapter extends TypeAdapter<ExpenceModel> {
  @override
  final int typeId = 1;

  @override
  ExpenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenceModel(
      title: fields[0] as String,
      amount: fields[1] as double,
      date: fields[2] as DateTime,
      category: fields[3] as Category,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenceModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
