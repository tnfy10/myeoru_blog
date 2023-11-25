import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myeoru_blog/data/model/board_category.dart';
import 'package:myeoru_blog/data/repository/board_repository.dart';

class BoardRepositoryImpl implements BoardRepository {
  final CollectionReference<BoardCategory> boardCategoryCollection;

  BoardRepositoryImpl({
    required this.boardCategoryCollection,
  });

  @override
  Future<List<BoardCategory>> getBoardCategoryList() async {
    final docSnap = await boardCategoryCollection.get();
    return docSnap.docs.map((e) => e.data()).toList();
  }

  @override
  Future<void> addBoardCategory(BoardCategory boardCategory) async {
    final snapshot =
        await boardCategoryCollection.where('label', isEqualTo: boardCategory.label).get();

    if (snapshot.docs.isNotEmpty) {
      throw Exception('이미 존재하는 카테고리 입니다.');
    }

    await boardCategoryCollection.add(boardCategory);
  }

  @override
  Future<void> deleteBoardCategory(String id) async {
    await boardCategoryCollection.doc(id).delete();
  }
}
