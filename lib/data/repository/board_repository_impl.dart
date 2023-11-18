import 'package:myeoru_blog/core/utils/logger.dart';
import 'package:myeoru_blog/data/datasource/board_category/board_category_remote_data_source.dart';
import 'package:myeoru_blog/data/mapper/board_category_mapper.dart';
import 'package:myeoru_blog/domain/model/board_category.dart';
import 'package:myeoru_blog/domain/repository/board_repository.dart';

class BoardRepositoryImpl implements BoardRepository {
  final BoardCategoryRemoteDataSource boardCategoryRemoteDataSource;

  BoardRepositoryImpl({
    required this.boardCategoryRemoteDataSource,
  });

  @override
  Future<List<BoardCategory>> getBoardCategoryList() async {
    try {
      final data = await boardCategoryRemoteDataSource.getBoardCategoryList();
      return mapperToBoardCategoryList(data);
    } catch (e, stack) {
      logger.e(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
