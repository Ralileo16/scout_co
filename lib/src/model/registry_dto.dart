import 'package:scout_co/src/model/children_dto.dart';

class RegistryDto {
  int id;
  int fkChildren;
  ChildrenDto childrenDto;
  DateTime dateRegistration;
  DateTime? datePaid;
  bool? isPaid;

  RegistryDto({
    required this.id,
    required this.fkChildren,
    required this.childrenDto,
    required this.dateRegistration,
    this.datePaid,
    this.isPaid,
  });
}
