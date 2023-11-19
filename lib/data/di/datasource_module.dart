import 'package:myeoru_blog/core/firebase/firebase_module.dart';
import 'package:myeoru_blog/data/const/collection_name.dart';
import 'package:myeoru_blog/data/datasource/board_category/board_category_remote_data_source.dart';
import 'package:myeoru_blog/data/datasource/board_category/board_category_remote_data_source_impl.dart';
import 'package:myeoru_blog/data/entity/board_category_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_module.g.dart';

@riverpod
BoardCategoryRemoteDataSource boardCategoryRemoteDataSource(BoardCategoryRemoteDataSourceRef ref) {
  final db = ref.read(firebaseFirestoreProvider);
  final collectionRef = db.collection(CollectionName.boardCategory).withConverter(
      fromFirestore: BoardCategoryEntity.fromFirestore,
      toFirestore: (entity, _) => entity.toFirestore());
  return BoardCategoryRemoteDataSourceImpl(collectionRef);
}
