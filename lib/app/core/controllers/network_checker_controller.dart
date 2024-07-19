import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../helpers/custom_snackbar/custom_snackbar.dart';
import '../localization/strings.dart';

class NetworkCheckerController extends GetxController {
  static NetworkCheckerController get to => Get.find();

  Rx<InternetConnectionStatus> networkInfo =
      Rx<InternetConnectionStatus>(InternetConnectionStatus.disconnected);

  @override
  void onReady() {
    super.onReady();
    InternetConnectionCheckerPlus().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          {
            networkInfo.value = InternetConnectionStatus.connected;
            Get.closeCurrentSnackbar();

            print(status);
          }

          break;
        case InternetConnectionStatus.disconnected:
          {
            networkInfo.value = InternetConnectionStatus.disconnected;
            CustomSnackBar.showCustomNoInternetSnackBar(
                title: Strings.networkConnectionError.tr,
                message: '${Strings.noInternetConnection.tr}!');

            print(status);
          }
          break;
      }
    });
  }
}
