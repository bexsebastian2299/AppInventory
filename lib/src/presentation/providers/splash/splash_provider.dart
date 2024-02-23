

import 'package:bexpicking_app/src/locator.dart';
import 'package:bexpicking_app/src/services/navigation.dart';
import 'package:bexpicking_app/src/services/storage.dart';
import 'package:bexpicking_app/src/utils/constants/strings.dart';

final LocalStorageService _storageService = locator<LocalStorageService>();
final NavigationService _navigationService = locator<NavigationService>();

class SplashProvider {

  Future<bool?> isFirstTime() async {
    return _storageService.getBool('first_time');
  }

  Future<void> initialize() async {
    // await isFirstTime().then((firstTime) async {
    //   if (firstTime == null || firstTime == false) {
    //     await _navigationService.goTo(politicsRoute);
    //   } else {
    //     var login = _storageService.getBool('login');
    //     var urlRpc = _storageService.getString('url_rpc');
    //     var dbRpc = _storageService.getString('db_rpc');

    //     if(urlRpc == null || dbRpc == null) {
    //       await _navigationService.goTo(companyRoute);
    //     }

    //     if(login == null || login == false) {
    //       await _navigationService.goTo(loginRoute);
    //     }

    //     await _navigationService.goTo(homeRoute);
    //   }
    // });
  }

}