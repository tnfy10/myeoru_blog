import 'package:myeoru_blog/data/entity/board_category_entity.dart';

abstract interface class BoardCategoryRemoteDataSource {
  Future<List<BoardCategoryEntity>> getBoardCategoryList();

  Future<void> addBoardCategory(BoardCategoryEntity entity);

  Future<void> deleteBoardCategory(String id);
}
