import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

import '../dtos/transfert.dart';
import '../utilisateur_singleton.dart';

Future<UserCredential?> signInWithGoogle() async {
  final googleSignIn = GoogleSignIn();
  await googleSignIn.signOut(); // Ensure previous sessions are cleared
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  if (googleUser == null) {
    // L'utilisateur a annulé la connexion
    return null;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  if (googleAuth.accessToken == null && googleAuth.idToken == null) {
    // Problème d'authentification
    return null;
  }

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<String?> connexionEmail(
  TextEditingController _nomController,
  TextEditingController _mdpController,
) async {
  try {
    await Future.delayed(Duration(seconds: 3));
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _nomController.text,
      password: _mdpController.text,
    );
    UtilisateurSingleton().nomUtilisateur = credential.user!.email!;
    return null;
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}

Future<String?> inscriptionEmail(
  TextEditingController _nomController,
  TextEditingController _mdpController,
) async {
  try {
    await Future.delayed(Duration(seconds: 3));
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: _nomController.text,
          password: _mdpController.text,
        );
    print("User ${credential.user!.email!} has been created!");
    UtilisateurSingleton().nomUtilisateur = credential.user!.email!;
    return null;
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getTasks() {
  User user = FirebaseAuth.instance.currentUser!;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('taches')
      .where('estSupprimee', isEqualTo: false)
      .snapshots();

}

Future<String?> addTask(Tache tache) async {
  User user = FirebaseAuth.instance.currentUser!;
  final existing = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('taches')
      .where('nom', isEqualTo: tache.nom)
      .where('estSupprimee', isEqualTo: false)
      .get();
  if (existing.docs.isNotEmpty) {
    return 'task_exists';
  }
  CollectionReference tachesCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('taches')
      .withConverter<Tache>(
    fromFirestore: (snapshot, _) => Tache.fromJson(snapshot.data()!),
    toFirestore: (tache, _) => tache.toJson(),
  );
  await tachesCollection.add(tache);
  return null;
}

Future<Tache> getTask(String idTache) async {
  User user = FirebaseAuth.instance.currentUser!;
  var doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('taches')
      .doc(idTache)
      .get();
  return Tache.fromJson(doc.data()!);
}

Future<void> editTask(String idTache, Tache tache) async {
  User user = FirebaseAuth.instance.currentUser!;
  DocumentReference<Tache> tacheDoc = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('taches')
      .doc(idTache)
      .withConverter<Tache>(
    fromFirestore: (snap, _) => Tache.fromJson(snap.data()!),
    toFirestore: (tache, _) => tache.toJson(),
  );
  await tacheDoc.update(tache.toJson());
}

Future<void> deleteTask(String idTache, bool isHardDelete, Tache tache) async {
  User user = FirebaseAuth.instance.currentUser!;
  DocumentReference<Tache> tacheDoc = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('taches')
      .doc(idTache)
      .withConverter<Tache>(
    fromFirestore: (snap, _) => Tache.fromJson(snap.data()!),
    toFirestore: (tache, _) => tache.toJson(),
  );

  if (isHardDelete) {
    await tacheDoc.delete();
  } else {
    tache.estSupprimee = true;
    await tacheDoc.update(tache.toJson());
  }
}

Future<bool> addImage(String idTache, Tache tache) async {
  ImagePicker picker = ImagePicker();
  print("ouverture du selecteur d'image");
  try {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      await Future.delayed(Duration(seconds: 3));
      var file = File(pickedImage.path);
      final fileList = await Supabase.instance.client.storage
          .from('supabucket')
          .list(path: '');
      final existing = fileList
          .where((f) => f.name == pickedImage.name)
          .toList();

      if (existing.isNotEmpty) {
        await Supabase.instance.client.storage.from('supabucket').remove([
          existing.first.name,
        ]);
      }
      await Supabase.instance.client.storage
          .from('supabucket')
          .upload(pickedImage.name, file);
      DocumentReference<Tache> tacheDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('taches')
          .doc(idTache)
          .withConverter<Tache>(
        fromFirestore: (snap, _) => Tache.fromJson(snap.data()!),
        toFirestore: (tache, _) => tache.toJson(),
      );
      tache.imageUrl = Supabase.instance.client.storage
          .from('supabucket')
          .getPublicUrl(pickedImage.name);
      print('URL image : ${tache.imageUrl}');
      await tacheDoc.update(tache.toJson());
    } else {
      print('Pas de choix effectue.');
    }
    return false;
  } catch (e) {
    return true;
  }
}