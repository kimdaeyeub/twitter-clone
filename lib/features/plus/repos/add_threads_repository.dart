import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/plus/models/threads_model.dart';

class AdddThreadsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask addImageForThreads(File file, String uid) {
    final fileRef = _storage.ref().child(
        "threads/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}");
    return fileRef.putFile(file);
  }

  Future<void> addThreads(Threads threads) async {
    final now = DateTime.now();
    final result = await _db
        .collection("threads")
        .doc(now.toString())
        .set(threads.tojson());
  }
}

final addThreadsRepo = Provider(
  (ref) => AdddThreadsRepository(),
);
