import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_demo/app/dependencies/service_locator.dart';
import 'package:sms_demo/app/helpers/permission_helper/check_sms_permission_helper.dart';
import 'package:sms_demo/app/helpers/user_interaction_helper/show_toast.dart';
import 'package:sms_demo/features/sms/domain/Entities/sms_model.dart';
import 'package:sms_demo/features/sms/domain/usecase/search_sms_sender_name_usecase.dart';
import 'package:sms_demo/features/sms/domain/usecase/sms_usecase_abs.dart';

class SmsState extends ChangeNotifier {
  final GetSmsUseCaseAbs _getSmsUsecase = serviceLocator<GetSmsUseCaseAbs>();
  final SearchSmsSenderNameUsecase _searchSmsSenderNameUsecase =
      serviceLocator<SearchSmsSenderNameUsecase>();

  List<SmsModel> smsMsgs = [];

  double totalWithdrawal = 0.0;

  bool isLoading = true;

  Timer? _debounce;

  TextEditingController controller = TextEditingController();

  /// as the smsMsgs List is maybe get 3000+ Msgs so it consider a heavy task
  /// soooo we have to make this in isolate
  Future<void> getSms({required BuildContext context}) async {
    final isPermitted = await CheckSmsPermissionHelper.checkSMSPermission();
    if (isPermitted) {
      smsMsgs = await _getSmsUsecase.getSms();
    } else {
      UserInteraction.showSnackBar(
        context: context,
        text: 'please enable accessing  messages  manually',
      );
    }
    endLoading();
  }

  void searchSms({required String name}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      startLoading();
      smsMsgs = _searchSmsSenderNameUsecase.searchSenderName(
        name: name,
        smsModelList: smsMsgs,
      );
      getTotalWithdrawal();
      endLoading();
      notifyListeners();
    });
  }

  void onRemoveTapped() {
    controller.value = TextEditingValue.empty;

    /// to  get default values
    searchSms(name: '');
  }

  void getTotalWithdrawal() {
    totalWithdrawal = 0;
    for (final msg in smsMsgs) {
      totalWithdrawal = totalWithdrawal + msg.moneyAmount;
    }
    totalWithdrawal = double.parse(totalWithdrawal.toStringAsFixed(2));
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void onMessageTapped({required SmsModel sms}) {
    final index = searchListByItem(sms: sms);
    smsMsgs[index].isSelected = !smsMsgs[index].isSelected;
    notifyListeners();
  }

  int searchListByItem({required SmsModel sms}) => smsMsgs.indexOf(sms);
}
