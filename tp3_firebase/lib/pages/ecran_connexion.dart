import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp3_firebase/pages/ecran_accueil.dart';
import 'package:tp3_firebase/utilisateur_singleton.dart';
import 'package:tp3_firebase/widgets/dialogUtils.dart';

import '../generated/l10n.dart';
import '../services/api_service.dart';
import '../widgets/textField.dart';
import 'ecran_inscription.dart';

class EcranConnexion extends StatefulWidget {
  @override
  State<EcranConnexion> createState() => _EcranConnexionState();
}

class _EcranConnexionState extends State<EcranConnexion> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  bool _isLoading = false;
  String? _nomErreur;
  String? _mdpErreur;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! ' + user.email!);
      }
    });
    _initConnexion();
  }

  Future<void> _initConnexion() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UtilisateurSingleton().nomUtilisateur = user.email;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EcranAccueil()),
          (route) => false,
        );
      });
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _mdpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).titreConnexion),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFieldWidget(
                    controller: _nomController,
                    labelText: S.of(context).nomUtilisateur,
                    isMdp: false,
                    errorText: _nomErreur,
                  ),
                  SizedBox(height: 10),
                  TextFieldWidget(
                    controller: _mdpController,
                    labelText: S.of(context).motDePasse,
                    isMdp: true,
                    errorText: _mdpErreur,
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 225,
                    child: FilledButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              setState(() {
                                _nomErreur = null;
                                _mdpErreur = null;
                              });
                              if (_nomController.text.isEmpty) {
                                setState(() {
                                  _nomErreur = S.of(context).nomObligatoire;
                                });
                                return;
                              } else if (_mdpController.text.isEmpty) {
                                setState(() {
                                  _mdpErreur = S
                                      .of(context)
                                      .motDePasseObligatoire;
                                });
                                return;
                              }
                              setState(() => _isLoading = true);
                              DialogUtils.showLoadingDialog(
                                context,
                                true,
                                message: S.of(context).dialogueConnexion,
                              );

                              final erreur = await connexionEmail(
                                _nomController,
                                _mdpController,
                              );
                              DialogUtils.showLoadingDialog(context, false);
                              setState(() => _isLoading = false);

                              if (erreur == null) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EcranAccueil(),
                                  ),
                                  (route) => false,
                                );
                              } else if (erreur == 'invalid-email') {
                                print(S.of(context).nomTropCourtOuLong);
                                setState(
                                  () => _nomErreur = S
                                      .of(context)
                                      .nomTropCourtOuLong,
                                );
                              } else if (erreur == 'invalid-credential') {
                                print(S.of(context).erreurNomOuMdp);
                                setState(
                                  () =>
                                      _mdpErreur = S.of(context).erreurNomOuMdp,
                                );
                                _mdpController.clear();
                              } else {
                                print(S.of(context).autreErreur);
                                setState(
                                  () => _mdpErreur = S.of(context).autreErreur,
                                );
                              }
                            },
                      child: Text(S.of(context).boutonConnexion),
                    ),
                  ),
                  SizedBox(
                    width: 225,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.indigo,
                      ),
                      onPressed: _isLoading
                          ? null
                          : () async {
                              try {
                                final credential = await signInWithGoogle();
                                if (credential == null ||
                                    credential.user == null) {
                                  // Affiche un message d’erreur ou ignore
                                  return;
                                }
                                UtilisateurSingleton().nomUtilisateur =
                                    credential.user!.email;
                                DialogUtils.showLoadingDialog(context, false);
                                setState(() => _isLoading = false);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EcranAccueil(),
                                  ),
                                  (route) => false,
                                );
                              } on FirebaseAuthException catch (e) {
                                print(e.code);
                              }
                            },
                      child: Text(S.of(context).boutonConnexionGoogle),
                    ),
                  ),
                  SizedBox(
                    width: 225,
                    child: FilledButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EcranInscription(),
                                ),
                              );
                            },
                      child: Text(S.of(context).boutonInscription),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
