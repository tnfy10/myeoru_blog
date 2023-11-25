import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myeoru_blog/core/firebase/firebase_module.dart';
import 'package:myeoru_blog/data/model/board_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_module.g.dart';

@riverpod
CollectionReference<BoardCategory> boardCategoryCollection(BoardCategoryCollectionRef ref) {
  final db = ref.read(firebaseFirestoreProvider);
  final collectionRef = db.collection('board_category').withConverter(
      fromFirestore: (snapshot, _) => BoardCategory.fromJson(snapshot.data() ?? {}),
      toFirestore: (data, _) => data.toJson());
  return collectionRef;
}
