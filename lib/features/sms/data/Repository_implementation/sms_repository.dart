import 'dart:async';

import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:sms_demo/features/sms/domain/repos/sms_repository.dart';

class SmsRepoImpl extends SmsRepo {
  @override
  Future<dynamic> getSms() async {
    final query = SmsQuery();

    return query.querySms(
      kinds: [SmsQueryKind.inbox],
    );
  }
}
