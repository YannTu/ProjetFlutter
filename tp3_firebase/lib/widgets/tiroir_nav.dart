import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp3_firebase/pages/ecran_accueil.dart';
import 'package:tp3_firebase/pages/ecran_connexion.dart';
import 'package:tp3_firebase/pages/ecran_creation.dart';
import 'package:tp3_firebase/utilisateur_singleton.dart';

import '../generated/l10n.dart';

class LeTiroir extends StatefulWidget {
  @override
  State<LeTiroir> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {
  Future<void> showLoadingDialog(BuildContext context, bool isLoading) async {
    if (isLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text(S.of(context).dialogueDeconnexion),
              ],
            ),
          ),
        ),
      );
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.cyan.shade200,
          padding: EdgeInsets.only(top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  UtilisateurSingleton().nomUtilisateur!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.home),
          title: Text(S.of(context).titreAccueil),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => EcranAccueil()),
              (route) => false,
            );
            // Then close the drawer
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.add),
          title: Text(S.of(context).navigationCreation),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => EcranCreation()),
              (route) => false,
            );
            // Then close the drawer
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.logout),
          title: Text(S.of(context).navigationDeconnexion),
          onTap: () async {
            showLoadingDialog(context, true);
            try {
              await Future.delayed(Duration(seconds: 3));
              await FirebaseAuth.instance.signOut();
              print("User has signed out!");
              showLoadingDialog(context, false);
              UtilisateurSingleton().nomUtilisateur = null;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => EcranConnexion()),
                    (route) => false,
              );
            } on FirebaseAuthException catch (e) {
              print(S.of(context).autreErreur);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).autreErreur),
                  duration: Duration(seconds: 5),
                ),
              );
              showLoadingDialog(context, false);
            }
          },
        ),
      ],
    );

    return Drawer(
      child: Container(color: const Color(0xFFFFFFFF), child: listView),
    );
  }
}
