import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../dtos/transfert.dart';
import '../generated/l10n.dart';
import '../pages/ecran_consultation.dart';
import 'imageAccueil.dart';

class TacheAccueil extends StatelessWidget {
  const TacheAccueil({super.key, required Tache item, required String id})
    : _item = item,
      _id = id;

  final Tache _item;
  final String _id;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(_item.nom, style: TextStyle(fontSize: 24)),
      subtitle: Row(
        children: [
          ImageAccueil(item: _item),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text(S.of(context).accueilAvancement)),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text("${_item.pourcentageAvancement}%"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: LinearProgressIndicator(
                              value: _item.pourcentageAvancement / 100,
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
                    Expanded(flex: 4, child: Text(S.of(context).accueilTemps)),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text("${_item.pourcentageTemps}%"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: LinearProgressIndicator(
                              value: _item.pourcentageTemps / 100,
                              backgroundColor: Colors.grey[300],
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: Text(S.of(context).accueilDateLimite)),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(DateFormat.yMd(Localizations.localeOf(context).toString()).format(_item.dateLimite)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcranConsultation(idTache: _id),
          ),
        );
      },
    );
  }
}
