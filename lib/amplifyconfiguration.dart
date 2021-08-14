import 'package:flutter_config/flutter_config.dart';

final amplifyconfig = ''' {
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "${FlutterConfig.get('AWS_USER_POOL_ID')}",
                        "AppClientId": "${FlutterConfig.get('AWS_WEB_CLIENT_ID')}",
                        "Region": "${FlutterConfig.get('AWS_REGION')}"
                    }
                }
            }
        }
    }
}''';
