import '../Entities/sms_model.dart';

abstract class GetSmsUseCaseAbs {
  Future<List<SmsModel>> getSms();
}
