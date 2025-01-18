import 'package:sms_demo/features/sms/domain/Entities/sms_model.dart';

class SearchSmsSenderNameUsecase {
  List<SmsModel> searchSenderName({
    required String name,
    required List<SmsModel> smsModelList,
  }) =>
      smsModelList
          .where(
              (msg) => msg.smsSender.toLowerCase().contains(name.toLowerCase()))
          .toList();
}
