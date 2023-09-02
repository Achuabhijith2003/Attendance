class Profile {
  late String name;
  late String email;
  Profile({required this.name, required this.email});
  static Profile frommap(Map<String, Object?> map) {
    final name = map['subname'] as String;
    final email = map['email'] as String;

    return Profile(name: name, email: email);
  }
}
