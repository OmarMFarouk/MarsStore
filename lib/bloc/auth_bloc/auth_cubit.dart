import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/auth_bloc/auth_states.dart';
import 'package:mars/src/app_shared.dart';

import '../../services/api/auth_api.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController loginCredentialCont = TextEditingController();
  TextEditingController loginPasswordCont = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  loginUser() async {
    emit(AuthLoading());
    await AuthApi()
        .loginUser(
            credential: loginCredentialCont.text.trim().toLowerCase(),
            password: loginPasswordCont.text.trim())
        .then((response) {
      if (response['success'] == true) {
        emit(AuthSuccess(msg: response['message']));
        clearAndSave(credential: loginCredentialCont.text.trim().toLowerCase());
      } else if (response['success'] == false) {
        emit(AuthFail(msg: response['message']));
      } else {
        AuthFail(msg: 'No Internet Connection');
      }
    });
  }

  registerUser() async {
    emit(AuthLoading());
    await AuthApi()
        .registerUser(
            userName: userNameController.text.trim(),
            email: emailController.text.trim().toLowerCase(),
            phone: phoneController.text.trim(),
            password: passwordCont.text.trim())
        .then((response) {
      if (response['success'] == true) {
        emit(AuthSuccess(msg: response['message']));
        clearAndSave(credential: emailController.text.trim().toLowerCase());
      } else if (response['success'] == false) {
        emit(AuthFail(msg: response['message']));
      } else {
        AuthFail(msg: 'No Internet Connection');
      }
    });
  }

  clearAndSave({required String credential}) async {
    await AppShared.localStorage.setString('credential', credential);
    await AppShared.localStorage.setBool('active', true);

    emailController.clear();
    passwordCont.clear();
    confirmPasswordCont.clear();
    userNameController.clear();
    loginCredentialCont.clear();
    loginPasswordCont.clear();
  }
}
