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
  });

  int get age => AgeCalculator.age(dateOfBirth).years;
}

class ChildrenDtoRepository {
  Future<ChildrenDto> fetchChildrenDto(int id) {
    // Simulate network delay
    //throw NetworkException();
    //TODO try catch expection when this will be connected to a DB
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return childrenDtoList.firstWhere((e) => e.id == id);
      },
    );
  }
}

class NetworkException implements Exception {}

List<ChildrenDto> childrenDtoList = [
  ChildrenDto(
    id: 1,
    firstName: 'Ben',
    lastName: 'Dover',
    dateOfBirth: DateTime(2008, 07, 06),
    gender: "Male",
    address: "123 rue des bateaux",
    city: "CaFlotte",
    province: "SurLeau",
    postalCode: "L9L 9L9",
    consentImage: true,
  ),
  ChildrenDto(
    id: 2,
    firstName: 'Dixie',
    lastName: 'Normous',
    dateOfBirth: DateTime(2002, 12, 30),
    gender: "Female",
    address: "456 rue des bateaux",
    city: "CaFlotte",
    province: "SurLeau",
    postalCode: "L9L 9L9",
    consentImage: true,
  ),
  ChildrenDto(
    id: 3,
    firstName: 'Jenny',
    lastName: 'Talia',
    dateOfBirth: DateTime(1999, 01, 15),
    gender: "Female",
    address: "789 rue des bateaux",
    city: "CaFlotte",
    province: "SurLeau",
    postalCode: "L9L 9L9",
    consentImage: true,
  ),
];
