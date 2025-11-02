import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp3_firebase/widgets/tiroir_nav.dart';
import 'package:tp3_firebase/dtos/transfert.dart';
import '../generated/l10n.dart';
import '../services/api_service.dart';
import '../widgets/tacheAccueil.dart';
import 'ecran_creation.dart';

class EcranAccueil extends StatefulWidget {
  @override
  State<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil>
    with WidgetsBindingObserver {
  bool _hasNetworkError = false;
  final stopwatch = Stopwatch();

  Future<bool> delayedFuture() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future<bool> isNetworkAvailable() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<void> initAccueil() async {
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
                initAccueil();
              },
              child: Text(S.of(context).recharger),
            ),
          ],
        ),
      );
      return;
    }
    setState(() {
      _hasNetworkError = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initAccueil();
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
        initAccueil();
      }
      stopwatch.reset();
    } else if (state == AppLifecycleState.paused) {
      stopwatch.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: delayedFuture(),
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState != ConnectionState.done;
        final hideUI = isLoading || _hasNetworkError;

        return Scaffold(
          drawer: hideUI ? null : LeTiroir(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(S.of(context).titreAccueil),
            actions: hideUI
                ? null
                : [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: initAccueil,
                tooltip: S.of(context).recharger,
              ),
            ],
          ),
          body: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : StreamBuilder(
              stream: getTasks(),
              builder: (context, snapshot) {
                if (_hasNetworkError) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(S.of(context).erreurReseau),
                          duration: Duration(seconds: 5),
                        ),
                      );
                    });
                    return Center(child: Text(S.of(context).erreurReseau));
                  }
                }
                final docs = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final tache = Tache.fromJson(docs[index].data());
                    final id = docs[index].id;
                    return Column(
                      children: [
                        TacheAccueil(item: tache, id: id),
                        Divider(thickness: 1, color: Colors.grey, height: 0),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: hideUI
              ? null
              : FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EcranCreation()),
              );
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        );
      },
    );
  }
}
