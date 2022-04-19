import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/preferences.dart';

final prefRef = FutureProvider.family<dynamic, dynamic>(
    (_, key) async => await Preferences.getString(key));
