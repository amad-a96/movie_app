import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../controllers/network_checker_controller.dart';

checkRemoteFetch({required bool isRemoteFetched}) {
  if (isRemoteFetched != true &&
      NetworkCheckerController.to.networkInfo.value ==
          InternetConnectionStatus.connected) {
    return true;
  }
  return false;
}
