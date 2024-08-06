import 'dart:convert';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:http/http.dart' as http;
import 'package:scout_co/src/api_url.dart';

class ChildrenDtoRepository {
  Future<ChildrenDto> fetchChildrenDto(int id) async {
    final response = await http.get(Uri.parse('${ApiUrl.children}$id'),
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return ChildrenDto.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create child.');
    }
  }

  Future<List<ChildrenDto>> fetchAllChildrenDto() async {
    final response = await http.get(Uri.parse(ApiUrl.children),
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ChildrenDto> childrenList =
          jsonResponse.map((item) => ChildrenDto.fromJson(item)).toList();
      return childrenList;
    } else {
      throw Exception('Failed to fetch children.');
    }
  }
}

class NetworkException implements Exception {}
