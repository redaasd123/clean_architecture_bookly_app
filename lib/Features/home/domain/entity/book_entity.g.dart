// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      webReaderLink: fields[9] as String,
      bookId: fields[0] as String,
      title: fields[2] as String,
      authorName: fields[3] as String?,
      image: fields[1] as String?,
      count: fields[6] as num?,
      price: fields[5] as num?,
      rating: fields[4] as num?,
      category: fields[7] as String,
      previewLink: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.authorName)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.count)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.previewLink)
      ..writeByte(9)
      ..write(obj.webReaderLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
