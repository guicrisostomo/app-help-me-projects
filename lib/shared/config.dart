import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get apiKeyWeb => _get('APIKEYWEB');
  static String get appIdWeb => _get('APPIDWEB');
  static String get messagingSenderIdWeb => _get('MESSAGINGSENDERIDWEB');
  static String get projectIdWeb => _get('PROJECTIDWEB');
  static String get authDomainWeb => _get('AUTHDOMAINWEB');
  static String get storageBucketWeb => _get('STORAGEBUCKETWEB');

  static String get apiKeyAndroid => _get('APIKEYANDROID');
  static String get appIdAndroid => _get('APPIDANDROID');
  static String get messagingSenderIdAndroid => _get('MESSAGINGSENDERIDANDROID');
  static String get projectIdAndroid => _get('PROJECTIDANDROID');
  static String get storageBucketAndroid => _get('STORAGEBUCKETANDROID');

  static String _get(String name) => dotenv.env[name] ?? '';
}