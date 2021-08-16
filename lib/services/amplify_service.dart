import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import '../amplifyconfiguration.dart';

class AmplifyService {
  static configureAmplify() async {
    Amplify.addPlugins([AmplifyAuthCognito()]);

    try {
      await Amplify.configure(amplifyconfig);
      print('Amplify Configured');
    } catch (e) {
      print("Tried to reconfigure Amplify");
    }
  }
}
