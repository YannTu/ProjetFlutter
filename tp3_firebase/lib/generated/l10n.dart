// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get titreConnexion {
    return Intl.message('Login', name: 'titreConnexion', desc: '', args: []);
  }

  /// `Email`
  String get nomUtilisateur {
    return Intl.message('Email', name: 'nomUtilisateur', desc: '', args: []);
  }

  /// `Password`
  String get motDePasse {
    return Intl.message('Password', name: 'motDePasse', desc: '', args: []);
  }

  /// `Logging in...`
  String get dialogueConnexion {
    return Intl.message(
      'Logging in...',
      name: 'dialogueConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get boutonConnexion {
    return Intl.message('Log in', name: 'boutonConnexion', desc: '', args: []);
  }

  /// `Sign up`
  String get boutonInscription {
    return Intl.message(
      'Sign up',
      name: 'boutonInscription',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect username or password`
  String get erreurNomOuMdp {
    return Intl.message(
      'Incorrect username or password',
      name: 'erreurNomOuMdp',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get nomObligatoire {
    return Intl.message(
      'Username is required',
      name: 'nomObligatoire',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get motDePasseObligatoire {
    return Intl.message(
      'Password is required',
      name: 'motDePasseObligatoire',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get autreErreur {
    return Intl.message(
      'An error occurred',
      name: 'autreErreur',
      desc: '',
      args: [],
    );
  }

  /// `Server connection error, please check your internet connection`
  String get erreurReseau {
    return Intl.message(
      'Server connection error, please check your internet connection',
      name: 'erreurReseau',
      desc: '',
      args: [],
    );
  }

  /// `Username does not exist`
  String get mauvaisNom {
    return Intl.message(
      'Username does not exist',
      name: 'mauvaisNom',
      desc: '',
      args: [],
    );
  }

  /// `Log in with Google`
  String get boutonConnexionGoogle {
    return Intl.message(
      'Log in with Google',
      name: 'boutonConnexionGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get titreInscription {
    return Intl.message(
      'Sign up',
      name: 'titreInscription',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmationMotDePasse {
    return Intl.message(
      'Confirm password',
      name: 'confirmationMotDePasse',
      desc: '',
      args: [],
    );
  }

  /// `Signing up...`
  String get dialogueInscription {
    return Intl.message(
      'Signing up...',
      name: 'dialogueInscription',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation is required`
  String get confirmationObligatoire {
    return Intl.message(
      'Password confirmation is required',
      name: 'confirmationObligatoire',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get motsDePasseDifferents {
    return Intl.message(
      'Passwords do not match',
      name: 'motsDePasseDifferents',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted`
  String get nomTropCourtOuLong {
    return Intl.message(
      'The email address is badly formatted',
      name: 'nomTropCourtOuLong',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get mdpTropCourtOuLong {
    return Intl.message(
      'The password is too weak',
      name: 'mdpTropCourtOuLong',
      desc: '',
      args: [],
    );
  }

  /// `This email is already taken`
  String get nomDejaPris {
    return Intl.message(
      'This email is already taken',
      name: 'nomDejaPris',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get titreAccueil {
    return Intl.message('Home', name: 'titreAccueil', desc: '', args: []);
  }

  /// `Task progress:`
  String get accueilAvancement {
    return Intl.message(
      'Task progress:',
      name: 'accueilAvancement',
      desc: '',
      args: [],
    );
  }

  /// `Elapsed time:`
  String get accueilTemps {
    return Intl.message(
      'Elapsed time:',
      name: 'accueilTemps',
      desc: '',
      args: [],
    );
  }

  /// `Due date:`
  String get accueilDateLimite {
    return Intl.message(
      'Due date:',
      name: 'accueilDateLimite',
      desc: '',
      args: [],
    );
  }

  /// `Network Error`
  String get titreErreur {
    return Intl.message(
      'Network Error',
      name: 'titreErreur',
      desc: '',
      args: [],
    );
  }

  /// `Reload page`
  String get recharger {
    return Intl.message('Reload page', name: 'recharger', desc: '', args: []);
  }

  /// `Create`
  String get titreCreation {
    return Intl.message('Create', name: 'titreCreation', desc: '', args: []);
  }

  /// `Task name`
  String get nomTache {
    return Intl.message('Task name', name: 'nomTache', desc: '', args: []);
  }

  /// `Due date`
  String get dateEcheanceTache {
    return Intl.message(
      'Due date',
      name: 'dateEcheanceTache',
      desc: '',
      args: [],
    );
  }

  /// `Select date`
  String get boutonDateEcheance {
    return Intl.message(
      'Select date',
      name: 'boutonDateEcheance',
      desc: '',
      args: [],
    );
  }

  /// `Creating task...`
  String get dialogueCreation {
    return Intl.message(
      'Creating task...',
      name: 'dialogueCreation',
      desc: '',
      args: [],
    );
  }

  /// `Create task`
  String get boutonCreerTache {
    return Intl.message(
      'Create task',
      name: 'boutonCreerTache',
      desc: '',
      args: [],
    );
  }

  /// `Task name is required`
  String get nomTacheVide {
    return Intl.message(
      'Task name is required',
      name: 'nomTacheVide',
      desc: '',
      args: [],
    );
  }

  /// `Task name must be between 2 and 255 characters`
  String get nomTacheTropCourtOuLong {
    return Intl.message(
      'Task name must be between 2 and 255 characters',
      name: 'nomTacheTropCourtOuLong',
      desc: '',
      args: [],
    );
  }

  /// `A task with this name already exists`
  String get tacheDejaExistante {
    return Intl.message(
      'A task with this name already exists',
      name: 'tacheDejaExistante',
      desc: '',
      args: [],
    );
  }

  /// `Due date must be in the future`
  String get dateInvalide {
    return Intl.message(
      'Due date must be in the future',
      name: 'dateInvalide',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get titreConsultation {
    return Intl.message('View', name: 'titreConsultation', desc: '', args: []);
  }

  /// `Due date: {date}`
  String consultationDateLimite(Object date) {
    return Intl.message(
      'Due date: $date',
      name: 'consultationDateLimite',
      desc: '',
      args: [date],
    );
  }

  /// `Edit task progress`
  String get modifierTache {
    return Intl.message(
      'Edit task progress',
      name: 'modifierTache',
      desc: '',
      args: [],
    );
  }

  /// `Updating...`
  String get dialogueModification {
    return Intl.message(
      'Updating...',
      name: 'dialogueModification',
      desc: '',
      args: [],
    );
  }

  /// `Update progress`
  String get boutonModifier {
    return Intl.message(
      'Update progress',
      name: 'boutonModifier',
      desc: '',
      args: [],
    );
  }

  /// `Add an image`
  String get boutonAjouterImage {
    return Intl.message(
      'Add an image',
      name: 'boutonAjouterImage',
      desc: '',
      args: [],
    );
  }

  /// `Task progress value must be between 0 and 100`
  String get tacheErreur {
    return Intl.message(
      'Task progress value must be between 0 and 100',
      name: 'tacheErreur',
      desc: '',
      args: [],
    );
  }

  /// `Soft delete task`
  String get softDelete {
    return Intl.message(
      'Soft delete task',
      name: 'softDelete',
      desc: '',
      args: [],
    );
  }

  /// `Hard delete task`
  String get hardDelete {
    return Intl.message(
      'Hard delete task',
      name: 'hardDelete',
      desc: '',
      args: [],
    );
  }

  /// `Deleting task...`
  String get dialogueSuppression {
    return Intl.message(
      'Deleting task...',
      name: 'dialogueSuppression',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get navigationCreation {
    return Intl.message(
      'Add task',
      name: 'navigationCreation',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get navigationDeconnexion {
    return Intl.message(
      'Log out',
      name: 'navigationDeconnexion',
      desc: '',
      args: [],
    );
  }

  /// `Logging out...`
  String get dialogueDeconnexion {
    return Intl.message(
      'Logging out...',
      name: 'dialogueDeconnexion',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
