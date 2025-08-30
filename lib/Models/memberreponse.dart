class MemberResponse {
  final String message;
  final int memberType;
  final String cusername;
  final String name;

  MemberResponse({
    required this.message,
    required this.memberType,
    required this.cusername,
    required this.name,
  });

  /// Factory constructor to create a [MemberResponse] from JSON
  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    return MemberResponse(
      message: json['message'] ?? '',
      memberType: json['member_type'] ?? 0,
      cusername: json['cusername'] ?? '',
      name: json['name'] ?? '',
    );
  }

  /// Convert a [MemberResponse] to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'member_type': memberType,
      'cusername': cusername,
      'name': name,
    };
  }

  /// CopyWith for immutability
  MemberResponse copyWith({
    String? message,
    int? memberType,
    String? cusername,
    String? name,
  }) {
    return MemberResponse(
      message: message ?? this.message,
      memberType: memberType ?? this.memberType,
      cusername: cusername ?? this.cusername,
      name: name ?? this.name,
    );
  }
}
