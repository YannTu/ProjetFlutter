import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../dtos/transfert.dart';
import '../generated/l10n.dart';

class TacheConsultation extends StatelessWidget {
  const TacheConsultation({super.key, required Tache tache})
    : _tache = tache;

  final Tache _tache;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_tache.nom, style: TextStyle(fontSize: 26)),
      subtitle: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(S.of(context).consultationDateLimite(DateFormat.yMd(Localizations.localeOf(context).toString()).format(_tache.dateLimite))),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(flex: 3, child: Text(S.of(context).accueilAvancement)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("${_tache.pourcentageAvancement}%"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: LinearProgressIndicator(
                        value: _tache.pourcentageAvancement / 100,
                        backgroundColor: Colors.grey[300],
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: Text(S.of(context).accueilTemps)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("${_tache.pourcentageTemps}%"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: LinearProgressIndicator(
                        value: _tache.pourcentageTemps / 100,
                        backgroundColor: Colors.grey[300],
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
