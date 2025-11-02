import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../services/api_service.dart';
import '../widgets/dialogUtils.dart';
import '../widgets/textField.dart';
import 'ecran_accueil.dart';

class EcranInscription extends StatefulWidget {
  @override
  State<EcranInscription> createState() => _EcranInscriptionState();
}

class _EcranInscriptionState extends State<EcranInscription> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isLoading = false;
  String? _nomErreur;
  String? _mdpErreur;
  String? _confirmErreur;

  @override
  void dispose() {
    _nomController.dispose();
    _mdpController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).titreInscription),
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
                  SizedBox(height: 10),
                  TextFieldWidget(
                    controller: _confirmController,
                    labelText: S.of(context).confirmationMotDePasse,
                    isMdp: true,
                    errorText: _confirmErreur,
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 200,
                    child: FilledButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              setState(() {
                                _nomErreur = null;
                                _mdpErreur = null;
                                _confirmErreur = null;
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
                              } else if (_confirmController.text.isEmpty) {
                                setState(() {
                                  _confirmErreur = S
                                      .of(context)
                                      .confirmationObligatoire;
                                });
                                return;
                              } else if (_confirmController.text !=
                                  _mdpController.text) {
                                setState(() {
                                  _confirmErreur = S
                                      .of(context)
                                      .motsDePasseDifferents;
                                });
                                return;
                              }
                              setState(() => _isLoading = true);
                              DialogUtils.showLoadingDialog(
                                context,
                                true,
                                message: S.of(context).dialogueInscription,
                              );

                              final erreur = await inscriptionEmail(
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
                              }
                              if (erreur == 'invalid-email') {
                                print(S.of(context).nomTropCourtOuLong);
                                setState(() {
                                  _nomErreur = S.of(context).nomTropCourtOuLong;
                                });
                              } else if (erreur == 'weak-password') {
                                print(S.of(context).mdpTropCourtOuLong);
                                setState(() {
                                  _mdpErreur = S.of(context).mdpTropCourtOuLong;
                                });
                              } else if (erreur == 'email-already-in-use') {
                                print(S.of(context).nomDejaPris);
                                setState(() {
                                  _nomErreur = S.of(context).nomDejaPris;
                                });
                              } else {
                                print(S.of(context).autreErreur);
                                setState(() {
                                  _confirmErreur = S.of(context).autreErreur;
                                });
                              }
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
