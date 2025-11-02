// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(date) => "Due date: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accueilAvancement": MessageLookupByLibrary.simpleMessage("Task progress:"),
    "accueilDateLimite": MessageLookupByLibrary.simpleMessage("Due date:"),
    "accueilTemps": MessageLookupByLibrary.simpleMessage("Elapsed time:"),
    "autreErreur": MessageLookupByLibrary.simpleMessage("An error occurred"),
    "boutonAjouterImage": MessageLookupByLibrary.simpleMessage("Add an image"),
    "boutonConnexion": MessageLookupByLibrary.simpleMessage("Log in"),
    "boutonConnexionGoogle": MessageLookupByLibrary.simpleMessage(
      "Log in with Google",
    ),
    "boutonCreerTache": MessageLookupByLibrary.simpleMessage("Create task"),
    "boutonDateEcheance": MessageLookupByLibrary.simpleMessage("Select date"),
    "boutonInscription": MessageLookupByLibrary.simpleMessage("Sign up"),
    "boutonModifier": MessageLookupByLibrary.simpleMessage("Update progress"),
    "confirmationMotDePasse": MessageLookupByLibrary.simpleMessage(
      "Confirm password",
    ),
    "confirmationObligatoire": MessageLookupByLibrary.simpleMessage(
      "Password confirmation is required",
    ),
    "consultationDateLimite": m0,
    "dateEcheanceTache": MessageLookupByLibrary.simpleMessage("Due date"),
    "dateInvalide": MessageLookupByLibrary.simpleMessage(
      "Due date must be in the future",
    ),
    "dialogueConnexion": MessageLookupByLibrary.simpleMessage("Logging in..."),
    "dialogueCreation": MessageLookupByLibrary.simpleMessage(
      "Creating task...",
    ),
    "dialogueDeconnexion": MessageLookupByLibrary.simpleMessage(
      "Logging out...",
    ),
    "dialogueInscription": MessageLookupByLibrary.simpleMessage(
      "Signing up...",
    ),
    "dialogueModification": MessageLookupByLibrary.simpleMessage("Updating..."),
    "dialogueSuppression": MessageLookupByLibrary.simpleMessage(
      "Deleting task...",
    ),
    "erreurNomOuMdp": MessageLookupByLibrary.simpleMessage(
      "Incorrect username or password",
    ),
    "erreurReseau": MessageLookupByLibrary.simpleMessage(
      "Server connection error, please check your internet connection",
    ),
    "hardDelete": MessageLookupByLibrary.simpleMessage("Hard delete task"),
    "mauvaisNom": MessageLookupByLibrary.simpleMessage(
      "Username does not exist",
    ),
    "mdpTropCourtOuLong": MessageLookupByLibrary.simpleMessage(
      "The password is too weak",
    ),
    "modifierTache": MessageLookupByLibrary.simpleMessage("Edit task progress"),
    "motDePasse": MessageLookupByLibrary.simpleMessage("Password"),
    "motDePasseObligatoire": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "motsDePasseDifferents": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "navigationCreation": MessageLookupByLibrary.simpleMessage("Add task"),
    "navigationDeconnexion": MessageLookupByLibrary.simpleMessage("Log out"),
    "nomDejaPris": MessageLookupByLibrary.simpleMessage(
      "This email is already taken",
    ),
    "nomObligatoire": MessageLookupByLibrary.simpleMessage(
      "Username is required",
    ),
    "nomTache": MessageLookupByLibrary.simpleMessage("Task name"),
    "nomTacheTropCourtOuLong": MessageLookupByLibrary.simpleMessage(
      "Task name must be between 2 and 255 characters",
    ),
    "nomTacheVide": MessageLookupByLibrary.simpleMessage(
      "Task name is required",
    ),
    "nomTropCourtOuLong": MessageLookupByLibrary.simpleMessage(
      "The email address is badly formatted",
    ),
    "nomUtilisateur": MessageLookupByLibrary.simpleMessage("Email"),
    "recharger": MessageLookupByLibrary.simpleMessage("Reload page"),
    "softDelete": MessageLookupByLibrary.simpleMessage("Soft delete task"),
    "tacheDejaExistante": MessageLookupByLibrary.simpleMessage(
      "A task with this name already exists",
    ),
    "tacheErreur": MessageLookupByLibrary.simpleMessage(
      "Task progress value must be between 0 and 100",
    ),
    "titreAccueil": MessageLookupByLibrary.simpleMessage("Home"),
    "titreConnexion": MessageLookupByLibrary.simpleMessage("Login"),
    "titreConsultation": MessageLookupByLibrary.simpleMessage("View"),
    "titreCreation": MessageLookupByLibrary.simpleMessage("Create"),
    "titreErreur": MessageLookupByLibrary.simpleMessage("Network Error"),
    "titreInscription": MessageLookupByLibrary.simpleMessage("Sign up"),
  };
}
