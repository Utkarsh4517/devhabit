import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // method to add new task
  Future<void> addTask(
    String userId,
    String title,
    String description,
    String category,
    DateTime dateTime,
  ) async {
    try {
      await _firestore.collection('users').doc(userId).collection('tasks').add({
        'title': title,
        'description': description,
        'category': category,
        'dateTime': dateTime,
        'completed': false,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Stream<QuerySnapshot> getTasksStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .snapshots();
  }
}
