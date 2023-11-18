import 'package:myeoru_blog/data/entity/board_category_entity.dart';
import 'package:myeoru_blog/domain/model/board_category.dart';

List<BoardCategory> mapperToBoardCategoryList(List<BoardCategoryEntity> boardCategoryEntityList) {
  return boardCategoryEntityList
      .where((element) => element.label != null)
      .map((e) => BoardCategory(label: e.label!))
      .toList();
}
