class ParentDto {
  int id;
  String firstName;
  String lastName;
  String? gender;
  String? phone;
  String? email;

  ParentDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.phone,
    this.email,
  });

  factory ParentDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'firstName': String firstName,
        'lastName': String lastName,
        'gender': String gender,
        'phone': String phone,
        'email': String email,
      } =>
        ParentDto(
          id: id,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          phone: phone,
          email: email,
        ),
      _ => throw const FormatException('Failed to load parent.'),
    };
  }

  Map<String, dynamic> toJson() => {
        if (id != 0) 'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'phone': phone,
        'email': email,
      };
}
