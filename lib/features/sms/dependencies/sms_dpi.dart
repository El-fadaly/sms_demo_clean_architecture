import 'package:sms_demo/app/dependencies/service_locator.dart';
import 'package:sms_demo/features/sms/data/repository_impl/sms_repository.dart';
import 'package:sms_demo/features/sms/domain/repos/sms_repository.dart';
import 'package:sms_demo/features/sms/domain/usecase/get_sms_usecase.dart';
import 'package:sms_demo/features/sms/domain/usecase/search_sms_sender_name_usecase.dart';
import 'package:sms_demo/features/sms/domain/usecase/sms_usecase_abs.dart';

class SmsDpi extends ServiceLocator {
  SmsDpi() {
    init();
  }

  @override
  void init() {
    serviceLocator.registerLazySingleton<SmsRepo>(() => SmsRepoImpl());
    serviceLocator
        .registerLazySingleton<GetSmsUseCaseAbs>(() => GetSmsUsecase());
    serviceLocator.registerLazySingleton<SearchSmsSenderNameUsecase>(
        () => SearchSmsSenderNameUsecase());
  }
}
