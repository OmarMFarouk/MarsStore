import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/bloc/user_bloc/user_states.dart';
import 'package:mars/components/info_edit_user_image.dart';
import 'package:mars/components/info_user_porfale_bar.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/custom/custom_welcome_bar.dart';
import 'package:mars/widgets/hero_button.dart';
import 'package:mars/widgets/input_text.dart';

class PersonSettingScreen extends StatelessWidget {
  const PersonSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          cubit.emailCont.text = localUserData.userinfo!.email!;
          cubit.phoneCont.text = localUserData.userinfo!.phone!;
          cubit.addressCont.text = localUserData.userinfo!.userAddress!;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      InfoUserProfleBar(
                        titelScreenMsg: "persin_setting_titel_msg",
                        endIcon: SizedBox(width: 60.w),
                      ),
                      CustomWelcomeBar(),
                      InfoEditUserImage(
                        image: cubit.pickedImage,
                        onPressed: () {
                          cubit.pickImage();
                        },
                      ),
                      SizedBox(height: 20.h),
                      InputText(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "*Empty";
                          }
                          return null;
                        },
                        controller: cubit.emailCont,
                        odscureText: false,
                        hintTextMsg: 'hint_email',
                        suffixIcon: iconApp.removTextIcon,
                        prefixIcon: iconApp.emailIcon,
                        suffixOnPreesd: () {
                          cubit.emailCont.text = "";
                        },
                        onChanged: (a) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.h),
                      InputText(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "*Empty";
                          }
                          return null;
                        },
                        controller: cubit.phoneCont,
                        odscureText: false,
                        hintTextMsg: 'hint_phone',
                        suffixIcon: iconApp.removTextIcon,
                        prefixIcon: iconApp.phoneNumberIcon,
                        suffixOnPreesd: () {
                          cubit.phoneCont.text = "";
                        },
                        onChanged: (a) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.h),
                      InputText(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "*Empty";
                          }
                          return null;
                        },
                        controller: cubit.addressCont,
                        odscureText: false,
                        hintTextMsg: 'hint_address',
                        suffixIcon: iconApp.removTextIcon,
                        prefixIcon: iconApp.markerIcon,
                        suffixOnPreesd: () {
                          cubit.addressCont.text = "";
                        },
                        onChanged: (a) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.h),
                      // InputText(
                      //   validator: (passwerd) {
                      //     return "";
                      //   },
                      //   onChanged: (s) {},
                      //   suffixOnPreesd: () {
                      //     inputTextController.userPasswerdController.text = "";
                      //   },
                      //   controller: inputTextController.userPasswerdController,
                      //   odscureText: false,
                      //   hintTextMsg:
                      //       inputTextController.userPasswerdController.text,
                      //   suffixIcon: iconApp.removTextIcon,
                      //   prefixIcon: iconApp.passwedIcon,
                      //   keyboardType: TextInputType.text,
                      // ),
                      SizedBox(height: 10.h),
                      HeroButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            EasyLoading.show(status: 'loading...');
                            await cubit.updateUserData();
                            EasyLoading.dismiss();
                          }
                        },
                        text: "verify_otp_buttom_msg",
                        svgIcon: "",
                        isBorder: false,
                        isIcon: false,
                        widthSize: SizeApp.screenWidth! * 1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
