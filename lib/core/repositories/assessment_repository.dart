import 'dart:async';

import '../../api/rest_client.dart';
import '../models/assessment_model/assessment_model.dart';

abstract class AssessmentRepository {
  Future<List<AssessmentModel?>?> getAssessments();
}

class AssessmentRepositoryImpl extends AssessmentRepository {
  AssessmentRepositoryImpl({required RestClient api}) : _api = api;

  final RestClient _api;

  @override
  Future<List<AssessmentModel?>?> getAssessments() async {
    try {
      final res = await _api.getAssessments();
      return res;
    } catch (e) {
      return null;
    }
  }
}
