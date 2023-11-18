import 'package:myeoru_blog/data/di/repository_module.dart';
import 'package:myeoru_blog/domain/model/board_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_drawer_notifier.g.dart';

@riverpod
class MainDrawerNotifier extends _$MainDrawerNotifier {
  @override
  Future<List<BoardCategory>> build() async {
    final boardCategoryList = await ref.read(boardRepositoryProvider).getBoardCategoryList();
    return [
      BoardCategory(label: '전체글보기'),
      ...boardCategoryList
    ];
  }
}
