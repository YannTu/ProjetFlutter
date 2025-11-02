class UtilisateurSingleton {
  static final UtilisateurSingleton _instance =
      UtilisateurSingleton._internal();

  String? nomUtilisateur;

  factory UtilisateurSingleton() {
    return _instance;
  }

  UtilisateurSingleton._internal();
}
