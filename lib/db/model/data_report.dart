class report {
  final String subname;

  report({required this.subname});

  static report frommap(Map<String, Object?> map) {
    final subname = map['subname'] as String;

    return report(subname: subname);
  }
}
