// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tache _$TacheFromJson(Map<String, dynamic> json) => Tache(
  nom: json['nom'] as String,
  dateLimite: json['dateLimite'] == null
      ? null
      : DateTime.parse(json['dateLimite'] as String),
  pourcentageAvancement: (json['pourcentageAvancement'] as num?)?.toInt() ?? 0,
  estSupprimee: json['estSupprimee'] as bool? ?? false,
  imageUrl: json['imageUrl'] as String? ?? '',
)..dateCreation = DateTime.parse(json['dateCreation'] as String);

Map<String, dynamic> _$TacheToJson(Tache instance) => <String, dynamic>{
  'nom': instance.nom,
  'dateCreation': instance.dateCreation.toIso8601String(),
  'dateLimite': instance.dateLimite.toIso8601String(),
  'pourcentageAvancement': instance.pourcentageAvancement,
  'estSupprimee': instance.estSupprimee,
  'imageUrl': instance.imageUrl,
};
