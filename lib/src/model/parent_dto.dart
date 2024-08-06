// ignore_for_file: public_member_api_docs, sort_constructors_first
class ParentDto {
  int id;
  String firstName;
  String lastName;
  String? gender;
  String? phone;
  String? email;
  String? notes;

  ParentDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.phone,
    this.email,
    this.notes,
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
        'notes': String notes,
      } =>
        ParentDto(
          id: id,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          phone: phone,
          email: email,
          notes: notes,
        ),
      _ => throw const FormatException('Failed to load parent.'),
    };
  }
}
