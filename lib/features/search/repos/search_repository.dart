import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> search(String value) async {
    final hello = value;
    final result =
        await _db.collection("threads").where("text", isEqualTo: hello).get();
    print(value);
    return result;
  }
}

final searchRepos = Provider(
  (ref) => SearchRepository(),
);
