import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_category.freezed.dart';

part 'board_category.g.dart';

@freezed
class BoardCategory with _$BoardCategory {
  const factory BoardCategory({
    required String label,
  }) = _BoardCategory;

  factory BoardCategory.fromJson(Map<String, dynamic> json) => _$BoardCategoryFromJson(json);
}
