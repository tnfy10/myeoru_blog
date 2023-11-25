import 'package:myeoru_blog/data/model/board_category.dart';

abstract interface class BoardRepository {
  Future<List<BoardCategory>> getBoardCategoryList();
  Future<void> addBoardCategory(BoardCategory boardCategory);
  Future<void> deleteBoardCategory(String id);
}
