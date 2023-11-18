import 'package:cloud_firestore/cloud_firestore.dart';

class BoardCategoryEntity {
  final String? label;

  BoardCategoryEntity({
    required this.label,
  });

  factory BoardCategoryEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BoardCategoryEntity(
      label: data?['label'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (label != null) "label": label,
    };
  }
}
