import 'package:age_calculator/age_calculator.dart';
import 'package:scout_co/src/model/parent_dto.dart';

class ChildrenDto {
  int id;
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String? gender;
  String address;
  String city;
  String province;
  String postalCode;
  String? phone;
  String? email;
  bool consentImage;
  String? notes;
  int? fkParent1;
  int? fkParent2;
  ParentDto? parentDto1;
  ParentDto? parentDto2;
  DateTime dateRegistration;
  DateTime? datePaid;
  bool isPaid;

  ChildrenDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    this.gender,
    required this.address,
    required this.city,
    required this.province,
    required this.postalCode,
    this.phone,
    this.email,
    required this.consentImage,
    this.notes,
    this.fkParent1,
    this.fkParent2,
    this.parentDto1,
    this.parentDto2,
    required this.dateRegistration,
    this.datePaid,
    required this.isPaid,
  });

  int get age => AgeCalculator.age(dateOfBirth).years;

  factory ChildrenDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'firstName': String firstName,
        'lastName': String lastName,
        'dateOfBirth': String dateOfBirth,
        'gender': String gender,
        'address': String address,
        'city': String city,
        'province': String province,
        'postalCode': String postalCode,
        'phone': String phone,
        'email': String email,
        'consentImage': bool consentImage,
        'notes': String notes,
        'fkParent1': int fkParent1,
        'fkParent2': int fkParent2,
        'dateRegistration': String dateRegistration,
        'datePaid': String? datePaid,
        'isPaid': bool isPaid,
      } =>
        ChildrenDto(
          id: id,
          firstName: firstName,
          lastName: lastName,
          dateOfBirth: DateTime.parse(dateOfBirth),
          gender: gender,
          address: address,
          city: city,
          province: province,
          postalCode: postalCode,
          phone: phone,
          email: email,
          consentImage: consentImage,
          notes: notes,
          fkParent1: fkParent1,
          fkParent2: fkParent2,
          parentDto1: ParentDto.fromJson(json['fkParent1Navigation']),
          parentDto2: ParentDto.fromJson(json['fkParent2Navigation']),
          dateRegistration: DateTime.parse(dateRegistration),
          datePaid: datePaid != null ? DateTime.parse(datePaid) : null,
          isPaid: isPaid,
        ),
      _ => throw const FormatException('Failed to load children.'),
    };
  }
}
