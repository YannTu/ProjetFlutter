import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp3_firebase/widgets/tiroir_nav.dart';
import 'package:tp3_firebase/dtos/transfert.dart';
import '../generated/l10n.dart';
import '../services/api_service.dart';
import '../widgets/dialogUtils.dart';
import '../widgets/textField.dart';
import 'ecran_accueil.dart';

class EcranCreation extends StatefulWidget {
  @override
  State<EcranCreation> createState() => _EcranCreationState();
}

class _EcranCreationState extends State<EcranCreation> {
  final TextEditingController _nomController = TextEditingController();
  bool _isLoading = false;
  String? _nomErreur;

  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> create() async {
    final trimmedName = _nomController.text.trim();

    if (trimmedName.isEmpty) {
      print(S.of(context).nomTacheVide);
      setState(() {
        _nomErreur = S.of(context).nomTacheVide;
      });
      return;
    } else if (trimmedName.length < 3 || trimmedName.length > 255) {
      print(S.of(context).nomTacheTropCourtOuLong);
      setState(() {
        _nomErreur = S.of(context).nomTacheTropCourtOuLong;
      });
      return;
    } else if (_selectedDate != null &&
        _selectedDate!.isBefore(DateTime.now())) {
      print(S.of(context).dateInvalide);
      setState(() {
        _nomErreur = S.of(context).dateInvalide;
      });
      return;
    }
    setState(() {
      _nomErreur = null;
      _isLoading = true;
    });
    DialogUtils.showLoadingDialog(
      context,
      true,
      message: S.of(context).dialogueCreation,
    );
    try {
      await Future.delayed(Duration(seconds: 3));
      Tache tache = Tache(
        nom: _nomController.text,
        dateLimite: _selectedDate != null
            ? DateTime(
          _selectedDate!.year,
          _selectedDate!.month,
          _selectedDate!.day,
        )
            : null,
      );
      final result = await addTask(tache);
      DialogUtils.showLoadingDialog(context, false);
      setState(() => _isLoading = false);
      if (result == 'task_exists') {
        print(S.of(context).tacheDejaExistante);
        setState(() {
          _nomErreur = S.of(context).tacheDejaExistante;
        });
        return;
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => EcranAccueil()),
        (route) => false,
      );
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        print(S.of(context).erreurReseau);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).erreurReseau),
            duration: Duration(seconds: 5),
          ),
        );
      } else {
        print(S.of(context).autreErreur);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).autreErreur),
            duration: Duration(seconds: 5),
          ),
        );
      }
      DialogUtils.showLoadingDialog(context, false);
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).titreCreation),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldWidget(
                  controller: _nomController,
                  labelText: S.of(context).nomTache,
                  isMdp: false,
                  errorText: _nomErreur,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _selectedDate == null
                              ? S.of(context).dateEcheanceTache
                              : DateFormat.yMd(
                                  Localizations.localeOf(context).toString(),
                                ).format(_selectedDate!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: _isLoading
                            ? null
                            : () => _selectDate(context),
                        child: Text(S.of(context).boutonDateEcheance),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            await create();
                          },
                    child: Text(S.of(context).boutonCreerTache),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
