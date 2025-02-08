import 'package:hive/hive.dart';
import 'package:expence_master/models/expence.dart';

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2; // Type ID for Hive storage

  @override
  Category read(BinaryReader reader) {
    return Category.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer.writeByte(obj.index);
  }
}