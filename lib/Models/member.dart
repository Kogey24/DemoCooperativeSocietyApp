class Member {
  final String cmusername;
  final String pass;

  Member({required this.cmusername, required this.pass});

  Member copyWith({String? cmusername, String? pass}) {
    return Member(
      cmusername: cmusername ?? this.cmusername,
      pass: pass ?? this.pass,
    );
  }

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      cmusername: json['cmusername'] as String,
      pass: json['pass'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'cmusername': cmusername, 'pass': pass};
  }

  @override
  String toString() => 'Member(cmusername: $cmusername, pass: $pass)';
}
