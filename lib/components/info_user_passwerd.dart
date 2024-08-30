import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/show_passwerd/show_passwerd_bloc.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/functions/login_functions.dart';
import 'package:mars/widgets/input_text.dart';

class InfoUserPasswerd extends StatelessWidget {
  const InfoUserPasswerd({
    super.key,
    required this.validator,
    required this.hintTextMsg,
    required this.controller,
  });
  final String? Function(String?) validator;
  final String hintTextMsg;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPasswerdBloc, ShowPasswerdState>(
      builder: (context, state) {
        if (state is ShowPasswerdInitial) {
          return InputText(
            controller: controller,
            validator: validator,
            onChanged: (saveValue) {
              // FocusScope.of(context).nextFocus();
            },
            suffixOnPreesd: () => loginFunctions.showSuffixPressed(context),
            odscureText: true,
            hintTextMsg: hintTextMsg,
            prefixIcon: iconApp.passwedIcon,
            suffixIcon: iconApp.eyeOpen,
            keyboardType: TextInputType.visiblePassword,
          );
        } else if (state is ShowSuffixPressedState) {
          return InputText(
            controller: controller,
            validator: validator,
            onChanged: (saveValue) {},
            suffixOnPreesd: () => state.valuoBool
                ? loginFunctions.showSuffixPressed(context)
                : loginFunctions.hiteSuffixPressed(context),
            odscureText: state.valuoBool,
            hintTextMsg: hintTextMsg,
            prefixIcon: iconApp.passwedIcon,
            suffixIcon:
                state.valuoBool ? iconApp.eyeOpen : iconApp.eyeCrossedicon,
            keyboardType: TextInputType.visiblePassword,
          );
        }
        return const SizedBox();
      },
    );
  }
}
