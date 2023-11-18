import 'package:myeoru_blog/domain/model/board_category.dart';

abstract interface class BoardRepository {
  Future<List<BoardCategory>> getBoardCategoryList();
}
