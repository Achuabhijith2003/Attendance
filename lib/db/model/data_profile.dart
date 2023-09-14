class Profile {
  final String name;
  final String email;
  final String coures;
  final String year;
  Profile(
      {required this.name,
      required this.email,
      required this.coures,
      required this.year});
  static Profile frommap(Map<String, Object?> ma) {
    final name = ma['name'] as String;
    final email = ma['email'] as String;
    final coures = ma['coures'] as String;
    final year = ma['year'] as String;

    return Profile(name: name, email: email, coures: coures, year: year);
  }
}
