import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhabit/models/roadmap_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeFirebaseServices {
  static Future<void> addRoadmapsToFirebase(List<RoadmapModel> roadmaps) async {
    final user = FirebaseAuth.instance.currentUser;
    final userRoadmapRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.email)
        .collection('roadmaps');

    for (final roadmap in roadmaps) {
      await userRoadmapRef.doc(roadmap.day).set(
            roadmap.toMap(),
          );
    }
  }
}
