import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/auth_bloc/auth_cubit.dart';
import 'package:mars/bloc/auth_bloc/auth_states.dart';
import 'package:mars/components/info_user_passwerd.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/register_function.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/input_text.dart';
import 'package:mars/widgets/logo_box_mars.dart';
import 'package:mars/widgets/text_localization.dart';

import '../../components/snig_up_button.dart';
import '../../functions/intro_functions.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is AuthSuccess) {
        registerFunction.registerButton(context, true, state.msg);
      }
      if (state is AuthFail) {
        registerFunction.registerButton(context, false, state.msg);
      }
    }, builder: (context, state) {
      final formKey = GlobalKey<FormState>();
      var cubit = AuthCubit.get(context);

      return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              // logo app
              const LogoBoxMars(),
              SizedBox(height: 40.h),

              // welcome titel
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: TextLocalization(
                  text: "welcome_loginScreen_msg",
                  style: styleTextDescription(),
                ),
              ),
              SizedBox(height: 15.h),

              // inpout user name
              InputText(
                validator: (userNmae) => registerFunction
                    .validatorRegisterUserName(userNmae, context),
                onChanged: (s) {},
                suffixOnPreesd: () {
                  cubit.userNameController.text = "";
                },
                controller: cubit.userNameController,
                odscureText: false,
                hintTextMsg: "hint_user_name_msg",
                suffixIcon: iconApp.removTextIcon,
                prefixIcon: iconApp.personIcon,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 15.h),

              // inpout user emil adres
              InputText(
                formatters: [FilteringTextInputFormatter.deny(' ')],
                validator: (userEmail) =>
                    registerFunction.validatorRegisterEmail(userEmail, context),
                onChanged: (s) {},
                suffixOnPreesd: () {
                  cubit.emailController.text = "";
                },
                controller: cubit.emailController,
                odscureText: false,
                hintTextMsg: "hint_user_email_msg",
                suffixIcon: iconApp.removTextIcon,
                prefixIcon: iconApp.emailIcon,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15.h),
              // inpout user phone number
              InputText(
                formatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                validator: (phoneNumber) => registerFunction
                    .validatorRegisterPhoneNumber(phoneNumber, context),
                onChanged: (s) {},
                suffixOnPreesd: () {
                  cubit.phoneController.text = "";
                },
                controller: cubit.phoneController,
                odscureText: false,
                hintTextMsg: "hint_user_phone_number_msg",
                suffixIcon: iconApp.removTextIcon,
                prefixIcon: iconApp.phoneNumberIcon,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15.h),
              // inpout user passwerd
              InfoUserPasswerd(
                hintTextMsg: "hint_agin_passwerd_msg",
                controller: cubit.passwordCont,
                validator: (passwerd) => registerFunction
                    .validatorRegisterPasswerd(passwerd, context),
              ),
              SizedBox(height: 15.h),
              // inpout agin passwerd
              InfoUserPasswerd(
                hintTextMsg: "hint_agin_passwerd_msg",
                controller: cubit.confirmPasswordCont,
                validator: (value) {
                  if (value != cubit.passwordCont.text) {
                    return '*Passwords Mismatch';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              // register button
              HeroButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.registerUser();
                  }
                },
                widthSize: SizeApp.screenWidth! * 1,
                text: "register_now_msg",
                svgIcon: iconApp.loginIcon,
                isBorder: false,
                isIcon: true,
              ),
              MembershipButton(
                isLogin: false,
                onPressed: () => introFunctions.goToLogin(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
