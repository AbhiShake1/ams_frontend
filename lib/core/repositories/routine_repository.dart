import 'dart:async';

import '../../api/rest_client.dart';

abstract class RoutineRepository {
  Future<String?> getRoutine(String userId);
}

class RoutineRepositoryImpl extends RoutineRepository {
  RoutineRepositoryImpl({required RestClient api}) : _api = api;

  final RestClient _api;

  @override
  Future<String?> getRoutine(String userId) async {
    try {
      final res = await _api.getRoutine(userId);
      return res;
    } catch (e) {
      return null;
    }
  }
}
