import 'dart:io';
import 'dart:math';

import 'package:trudo/core/hive/user.dart';
import 'package:trudo/core/providers/user_information_provider.dart';

enum HeaderType { withToken, withContentType }

Map<String, String> getHeader(HeaderType type) {
  UserInformationProvider provider = UserInformationProvider();
  UserHiveModel userHiveModel = provider.userHiveModel;
  // log("${userHiveModel.accessToken}");
  //  ${userHiveModel.accessToken}
  switch (type) {
    case HeaderType.withToken:
      return {
        HttpHeaders.authorizationHeader: 'Bearer ${userHiveModel.accessToken}'
      };

    case HeaderType.withContentType:
      return {
        HttpHeaders.authorizationHeader: 'Bearer ${userHiveModel.accessToken}',
        'Content-Type': 'application/json; charset=UTF-8'
      };
    default:
      return {};
  }
}
