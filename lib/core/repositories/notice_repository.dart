import 'dart:async';

import '../../api/rest_client.dart';
import '../models/notice_model/notice_model.dart';

abstract class NoticeRepository {
  Future<List<NoticeModel?>?> getNotices();
}

class NoticeRepositoryImpl extends NoticeRepository {
  NoticeRepositoryImpl({required RestClient api}) : _api = api;

  final RestClient _api;

  @override
  Future<List<NoticeModel?>?> getNotices() async {
    try {
      final res = await _api.getNotices();
      return res;
    } catch (e) {
      return null;
    }
  }
}
