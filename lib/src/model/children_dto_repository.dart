import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:http/http.dart' as http;
import 'package:scout_co/src/utils/api_url.dart';

class ChildrenDtoRepository {
  final ApiUrl apiUrl = ApiUrl();
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (!_isInitialized) {
      await apiUrl.initialize();
      _isInitialized = true;
    }
  }

  Future<ChildrenDto> fetchChildrenDto(int id) async {
    String apiPath = apiUrl.storedApiPath;
    final response = await http.get(Uri.parse('$apiPath/$id'),
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return ChildrenDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create child.');
    }
  }

  Future<List<ChildrenDto>> fetchAllChildrenDto() async {
    String apiPath = apiUrl.storedApiPath;
    final response = await http
        .get(Uri.parse(apiPath), headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ChildrenDto> childrenList =
          jsonResponse.map((item) => ChildrenDto.fromJson(item)).toList();
      return childrenList;
    } else {
      throw Exception('Failed to fetch children.');
    }
  }

  Future<void> putChildrenDto(ChildrenDto childrenDto) async {
    String apiPath = apiUrl.storedApiPath;
    debugPrint(jsonEncode(childrenDto.toJson()));
    await http.put(Uri.parse('$apiPath/${childrenDto.id}'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(childrenDto.toJson()));
  }

  Future<void> postChildrenDto(ChildrenDto childrenDto) async {
    String apiPath = apiUrl.storedApiPath;
    await http.post(Uri.parse(apiPath),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(childrenDto.toJson()));
  }
}

class NetworkException implements Exception {}
