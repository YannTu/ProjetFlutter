import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp3_firebase/services/api_service.dart';
import 'package:tp3_firebase/widgets/tiroir_nav.dart';
import 'package:tp3_firebase/dtos/transfert.dart';
import '../generated/l10n.dart';
import '../widgets/dialogUtils.dart';
import '../widgets/imageConsultation.dart';
import '../widgets/tacheConsultation.dart';
import 'ecran_accueil.dart';

class EcranConsultation extends StatefulWidget {
  final String idTache;

  const EcranConsultation({Key? key, required this.idTache}) : super(key: key);

  @override
  State<EcranConsultation> createState() => _EcranConsultationState();
}

class _EcranConsultationState extends State<EcranConsultation>
    with WidgetsBindingObserver {
  Tache _tache = Tache(nom: '');
  double _progress = 0.0;
  bool _isLoadingPage = true;
  bool _isLoadingRequest = false;
  String? _sliderError;
  final stopwatch = Stopwatch();
  bool _hasNetworkError = false;

  Future<bool> isNetworkAvailable() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<void> initConsultation() async {
    if (!await isNetworkAvailable()) {
      setState(() {
        _hasNetworkError = true;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).titreErreur),
          content: Text(S.of(context).erreurReseau),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                initConsultation();
              },
              child: Text(S.of(context).recharger),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _isLoadingPage = true;
      _hasNetworkError = false;
    });

    await Future.delayed(Duration(seconds: 3));
    try {
      final tache = await getTask(widget.idTache);
      setState(() {
        _tache = tache;
      });
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
    }
    setState(() => _isLoadingPage = false);
  }

  Future<void> update() async {
    setState(() => _isLoadingRequest = true);
    DialogUtils.showLoadingDialog(
      context,
      true,
      message: S.of(context).dialogueModification,
    );
    if (_progress < 0.0 || _progress > 1.0) {
      print(S.of(context).modifierTache);
      setState(() {
        _sliderError = S.of(context).modifierTache;
      });
    }
    try {
      await Future.delayed(Duration(seconds: 3));
      _tache.pourcentageAvancement = (_progress * 100).round();
      await editTask(widget.idTache, _tache);
      DialogUtils.showLoadingDialog(context, false);
      setState(() => _isLoadingRequest = false);
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
      setState(() => _isLoadingRequest = false);
    }
  }

  Future<void> delete(bool isHardDelete) async {
    setState(() => _isLoadingRequest = true);
    DialogUtils.showLoadingDialog(
      context,
      true,
      message: S.of(context).dialogueSuppression,
    );
    try {
      await Future.delayed(Duration(seconds: 3));
      await deleteTask(widget.idTache, isHardDelete, _tache);
      DialogUtils.showLoadingDialog(context, false);
      setState(() => _isLoadingRequest = false);
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
      setState(() => _isLoadingRequest = false);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initConsultation();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      stopwatch.stop();
      if (!_hasNetworkError) {
        initConsultation();
      }
      stopwatch.reset();
    } else if (state == AppLifecycleState.paused) {
      stopwatch.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _isLoadingPage ? null : LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Consultation"),
        automaticallyImplyLeading: !_isLoadingPage,
      ),
      body: _isLoadingPage || _hasNetworkError
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    TacheConsultation(tache: _tache),
                    SizedBox(height: 15),
                    Text(S.of(context).modifierTache),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Slider(
                                  value: _progress,
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 100,
                                  label: "${(_progress * 100).round()}%",
                                  onChanged: (value) {
                                    setState(() {
                                      _progress = value;
                                      _sliderError = null;
                                    });
                                  },
                                ),
                              ),
                              Text("${(_progress * 100).round()}%"),
                            ],
                          ),
                          if (_sliderError != null)
                            Text(
                              _sliderError!,
                              style: TextStyle(color: Colors.red),
                            ),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: _isLoadingRequest
                                  ? null
                                  : () async {
                                      await update();
                                    },
                              child: Text(S.of(context).boutonModifier),
                            ),
                          ),
                          SizedBox(height: 35),
                          ImageConsultation(imagePath: _tache.imageUrl),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: _isLoadingRequest
                                  ? null
                                  : () async {
                                var result = await addImage(widget.idTache, _tache);
                                if (!result) {
                                  final updatedTache = await getTask(widget.idTache);
                                  setState(() {
                                    _tache = updatedTache;
                                  });
                                } else {
                                  print(S.of(context).autreErreur);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(S.of(context).autreErreur),
                                      duration: Duration(seconds: 5),
                                    ),
                                  );
                                }
                              },
                              child: Text(S.of(context).boutonAjouterImage),
                            ),
                          ),
                          SizedBox(height: 35),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: _isLoadingRequest
                                  ? null
                                  : () async {
                                      await delete(false);
                                    },
                              child: Text(S.of(context).softDelete),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: _isLoadingRequest
                                  ? null
                                  : () async {
                                      await delete(true);
                                    },
                              child: Text(S.of(context).hardDelete),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
