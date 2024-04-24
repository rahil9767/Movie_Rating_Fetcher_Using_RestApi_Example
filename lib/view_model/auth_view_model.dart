

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:interview110/view_model/user_view_model.dart';

import 'package:provider/provider.dart';
import '../model/user_model.dart';
import '../respository/auth_repository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi({
    required String username,
    required String loginPassword,
    required BuildContext context,
  }) async {
    setLoading(true);

    try {
      final value = await _myRepo.loginApiRequestModel(context,
        username: username,
        loginPassword: loginPassword,
      );

      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      if (value.data?.token != null) {
        userPreference.saveUser(
          UserModel(
            token: value.data!.token.toString(),
          ),
        );


        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);

        if (kDebugMode) {
          print(value.toString());
        }
      } else {
        Utils.flushBarErrorMessage('Invalid response format', context);
      }
    } catch (error) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);

      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

//   Future<void> signUpApi(dynamic data , BuildContext context) async {
//
//     setSignUpLoading(true);
//
//     _myRepo.signUpApi(data).then((value){
//       setSignUpLoading(false);
//       Utils.flushBarErrorMessage('SignUp Successfully', context);
//       Navigator.pushNamed(context, RoutesName.home);
//       if(kDebugMode){
//         print(value.toString());
//
//       }
//     }).onError((error, stackTrace){
//       setSignUpLoading(false);
//       Utils.flushBarErrorMessage(error.toString(), context);
//       if(kDebugMode){
//         print(error.toString());
//       }
//
//     });
//   }
//
}