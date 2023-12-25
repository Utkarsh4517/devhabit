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

  // check if roadmap is created or not??
  static Future<bool> checkRoadmap() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    if (documentSnapshot.exists) {
      return documentSnapshot['roadmap'];
    } else {
      return false;
    }
  }

  // update isRoadmapCreated
  static Future<void> updateIsRoadmap() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email);
    if (documentSnapshot.exists) {
      docRef.update({
        'roadmap': true,
      });
    } else {
      docRef.set({
        'roadmap': true,
      });
    }
  }

  // fetch roadmaps from firebase
  static Stream<QuerySnapshot> get roadmapsStream {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('roadmaps')
        .orderBy('dayNo', descending: false)
        .snapshots();
  }

  // method to find the number of docs -> to get the roadmap length
  static Future<dynamic> getRoadmapLength() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('roadmaps')
        .get();
    return querySnapshot.docs.length;
  }

  // delete roadmaps
  static Future<void> deleteRoadmap() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('roadmaps')
        .get();
    for (var documentSnapshot in querySnapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  }
}
