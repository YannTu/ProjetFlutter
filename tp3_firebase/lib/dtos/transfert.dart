import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'transfert.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
///
/// La commande pour
@JsonSerializable()
class Tache {
  String nom;
  DateTime dateCreation;
  DateTime dateLimite;
  int pourcentageAvancement;
  bool estSupprimee;
  String imageUrl;

  Tache({
    required this.nom,
    DateTime? dateLimite,
    this.pourcentageAvancement = 0,
    this.estSupprimee = false,
    this.imageUrl = '',
  }) : dateCreation = DateTime(
         (DateTime.now()).year,
         (DateTime.now()).month,
         (DateTime.now()).day,
       ),
       dateLimite = DateTime(
         (dateLimite ?? DateTime.now().add(Duration(days: 7))).year,
         (dateLimite ?? DateTime.now().add(Duration(days: 7))).month,
         (dateLimite ?? DateTime.now().add(Duration(days: 7))).day,
       );

  int get pourcentageTemps {
    final now = DateTime.now();
    final totalDuration = dateLimite.difference(dateCreation).inSeconds;
    final elapsed = now.difference(dateCreation).inSeconds;
    if (totalDuration <= 0) return 100;
    final percent = (elapsed / totalDuration * 100).clamp(0, 100);
    return percent.round();
  }

  factory Tache.fromJson(Map<String, dynamic> json) => _$TacheFromJson(json);

  Map<String, dynamic> toJson() => _$TacheToJson(this);
}

final _dateFormatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

DateTime _fromJson(String date) => _dateFormatter.parse(date);

String _toJson(DateTime date) => _dateFormatter.format(date);
