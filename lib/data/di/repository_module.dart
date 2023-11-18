import 'package:myeoru_blog/data/di/datasource_module.dart';
import 'package:myeoru_blog/data/repository/board_repository_impl.dart';
import 'package:myeoru_blog/domain/repository/board_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_module.g.dart';

@riverpod
BoardRepository boardRepository(BoardRepositoryRef ref) {
  final boardCategoryRemoteDataSource = ref.read(boardCategoryRemoteDataSourceProvider);

  return BoardRepositoryImpl(
    boardCategoryRemoteDataSource: boardCategoryRemoteDataSource,
  );
}
