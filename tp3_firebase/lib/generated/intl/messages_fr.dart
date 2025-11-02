// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static String m0(date) => "Date d\'échéance : ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accueilAvancement": MessageLookupByLibrary.simpleMessage(
      "Avancement de la tâche :",
    ),
    "accueilDateLimite": MessageLookupByLibrary.simpleMessage(
      "Date d\'échéance :",
    ),
    "accueilTemps": MessageLookupByLibrary.simpleMessage("Temps écoulé :"),
    "autreErreur": MessageLookupByLibrary.simpleMessage(
      "Une erreur est survenue",
    ),
    "boutonAjouterImage": MessageLookupByLibrary.simpleMessage(
      "Ajouter une image",
    ),
    "boutonConnexion": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "boutonConnexionGoogle": MessageLookupByLibrary.simpleMessage(
      "Se connecter avec Google",
    ),
    "boutonCreerTache": MessageLookupByLibrary.simpleMessage("Créer la tâche"),
    "boutonDateEcheance": MessageLookupByLibrary.simpleMessage(
      "Sélectionner la date",
    ),
    "boutonInscription": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "boutonModifier": MessageLookupByLibrary.simpleMessage(
      "Modifier l\'avancement",
    ),
    "confirmationMotDePasse": MessageLookupByLibrary.simpleMessage(
      "Confirmation du mot de passe",
    ),
    "confirmationObligatoire": MessageLookupByLibrary.simpleMessage(
      "La confirmation du mot de passe est obligatoire",
    ),
    "consultationDateLimite": m0,
    "dateEcheanceTache": MessageLookupByLibrary.simpleMessage(
      "Date d\'échéance",
    ),
    "dateInvalide": MessageLookupByLibrary.simpleMessage(
      "La date d\'échéance doit être dans le futur",
    ),
    "dialogueConnexion": MessageLookupByLibrary.simpleMessage(
      "Connexion en cours...",
    ),
    "dialogueCreation": MessageLookupByLibrary.simpleMessage(
      "Création de la tâche en cours...",
    ),
    "dialogueDeconnexion": MessageLookupByLibrary.simpleMessage(
      "Déconnexion en cours...",
    ),
    "dialogueInscription": MessageLookupByLibrary.simpleMessage(
      "Inscription en cours...",
    ),
    "dialogueModification": MessageLookupByLibrary.simpleMessage(
      "Modification en cours...",
    ),
    "dialogueSuppression": MessageLookupByLibrary.simpleMessage(
      "Suppression en cours...",
    ),
    "erreurNomOuMdp": MessageLookupByLibrary.simpleMessage(
      "Le nom d\'utilisateur ou le mot de passe est incorrect",
    ),
    "erreurReseau": MessageLookupByLibrary.simpleMessage(
      "Erreur de connexion au serveur, veuillez vérifier votre connexion Internet",
    ),
    "hardDelete": MessageLookupByLibrary.simpleMessage(
      "Supprimer physiquement la tâche",
    ),
    "mauvaisNom": MessageLookupByLibrary.simpleMessage(
      "Nom d\'utilisateur inexistant",
    ),
    "mdpTropCourtOuLong": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe est trop faible",
    ),
    "modifierTache": MessageLookupByLibrary.simpleMessage(
      "Modification de l\'avancement la tâche",
    ),
    "motDePasse": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "motDePasseObligatoire": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe est obligatoire",
    ),
    "motsDePasseDifferents": MessageLookupByLibrary.simpleMessage(
      "Les mots de passe ne correspondent pas",
    ),
    "navigationCreation": MessageLookupByLibrary.simpleMessage(
      "Ajout de tâche",
    ),
    "navigationDeconnexion": MessageLookupByLibrary.simpleMessage(
      "Déconnexion",
    ),
    "nomDejaPris": MessageLookupByLibrary.simpleMessage(
      "Cette adresse courriel est déjà prise",
    ),
    "nomObligatoire": MessageLookupByLibrary.simpleMessage(
      "Le nom d\'utilisateur est obligatoire",
    ),
    "nomTache": MessageLookupByLibrary.simpleMessage("Nom de la tâche"),
    "nomTacheTropCourtOuLong": MessageLookupByLibrary.simpleMessage(
      "Le nom de la tâche doit comporter entre 2 et 255 caractères",
    ),
    "nomTacheVide": MessageLookupByLibrary.simpleMessage(
      "Le nom de la tâche est obligatoire",
    ),
    "nomTropCourtOuLong": MessageLookupByLibrary.simpleMessage(
      "L\'adresse courriel est mal formatée",
    ),
    "nomUtilisateur": MessageLookupByLibrary.simpleMessage("Adresse courriel"),
    "recharger": MessageLookupByLibrary.simpleMessage("Recharger la page"),
    "softDelete": MessageLookupByLibrary.simpleMessage(
      "Supprimer en douceur la tâche",
    ),
    "tacheDejaExistante": MessageLookupByLibrary.simpleMessage(
      "Une tâche avec ce nom existe déjà",
    ),
    "tacheErreur": MessageLookupByLibrary.simpleMessage(
      "La valeur de l\'avancement de la tâche doit être comprise entre 0 et 100",
    ),
    "titreAccueil": MessageLookupByLibrary.simpleMessage("Accueil"),
    "titreConnexion": MessageLookupByLibrary.simpleMessage("Connexion"),
    "titreConsultation": MessageLookupByLibrary.simpleMessage("Consultation"),
    "titreCreation": MessageLookupByLibrary.simpleMessage("Création"),
    "titreErreur": MessageLookupByLibrary.simpleMessage("Erreur Réseau"),
    "titreInscription": MessageLookupByLibrary.simpleMessage("Inscription"),
  };
}
