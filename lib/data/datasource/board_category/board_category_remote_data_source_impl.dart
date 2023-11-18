import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myeoru_blog/data/datasource/board_category/board_category_remote_data_source.dart';
import 'package:myeoru_blog/data/entity/board_category_entity.dart';

class BoardCategoryRemoteDataSourceImpl implements BoardCategoryRemoteDataSource {
  final CollectionReference<BoardCategoryEntity> collectionRef;

  BoardCategoryRemoteDataSourceImpl(this.collectionRef);

  @override
  Future<List<BoardCategoryEntity>> getBoardCategoryList() async {
    final docSnap = await collectionRef.get();
    final entityList = docSnap.docs.map((e) => e.data()).toList();
    return entityList;
  }

  @override
  Future<void> addBoardCategory(BoardCategoryEntity entity) async {
    final snapshot = await collectionRef.where('label', isEqualTo: entity.label).get();

    if (snapshot.docs.isNotEmpty) {
      throw Exception('이미 존재하는 카테고리 입니다.');
    }

    await collectionRef.add(entity);
  }

  @override
  Future<void> deleteBoardCategory(String id) async {
    await collectionRef.doc(id).delete();
  }
}
