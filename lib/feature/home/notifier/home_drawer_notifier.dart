import 'package:myeoru_blog/data/di/repository_module.dart';
import 'package:myeoru_blog/data/model/board_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_drawer_notifier.g.dart';

@riverpod
class HomeDrawerNotifier extends _$HomeDrawerNotifier {
  @override
  Future<List<BoardCategory>> build() async {
    final boardCategoryList = await ref.read(boardRepositoryProvider).getBoardCategoryList();
    return [
      const BoardCategory(label: '전체글보기'),
      ...boardCategoryList
    ];
  }
}
