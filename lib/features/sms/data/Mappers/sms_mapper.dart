import 'package:sms_demo/features/sms/data/Models/sms_data.dart';
import 'package:sms_demo/features/sms/data/models/sms_data.dart';

extension SMSMapper on SmsData {
  SmsModel toDomain() {
    return SmsModel(
      smsSender: smsSender,
      dateTime: dateTime,
      moneyAmount: moneyAmount,
      body: body,
      isSelected: isSelected,
    );
  }
}
