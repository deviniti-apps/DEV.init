import 'package:domain/store/storable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'storable_model.freezed.dart';
part 'storable_model.g.dart';

@freezed
class StorableModel with _$StorableModel implements Storable {
  const factory StorableModel({
    required int id,
  }) = _StorableModel;

  factory StorableModel.fromJson(Map<String, dynamic> json) => _$StorableModelFromJson(json);
}
