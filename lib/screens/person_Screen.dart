import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/bloc/user_bloc/user_states.dart';
import 'package:mars/components/info_detiails_icon.dart';
import 'package:mars/components/info_person_viow_text.dart';
import 'package:mars/components/info_user_image.dart';
import 'package:mars/components/info_user_porfale_bar.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/screens/last_orders_screen.dart';
import 'package:mars/screens/person_setting_screen.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Scaffold(
            backgroundColor: ColorApp.backgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  InfoUserProfleBar(
                    titelScreenMsg: "persin_titel_msg",
                    endIcon: DetlailsIcon(
                      onPressed: () {
                        navgaterFunction(context, const PersonSettingScreen());
                      },
                      svgIcon: iconApp.settingsIcon,
                    ),
                  ),
                  InfoUserImage(
                    image: cubit.userModel.userinfo!.image!,
                  ),
                  InfoPersonViowText(
                    icon: iconApp.personIcon,
                    titel: "user_name_titel_msg",
                    supTitel: cubit.userModel.userinfo!.name!,
                  ),
                  InfoPersonViowText(
                    icon: iconApp.emailIcon,
                    titel: "user_email_titel_msg",
                    supTitel: cubit.userModel.userinfo!.email!,
                  ),
                  InfoPersonViowText(
                    icon: iconApp.phoneNumberIcon,
                    titel: "user_phone_titel_msg",
                    supTitel: cubit.userModel.userinfo!.phone!,
                  ),
                  InfoPersonViowText(
                    icon: iconApp.markerIcon,
                    titel: "user_address_titel_msg",
                    supTitel: cubit.userModel.userinfo!.userAddress!,
                  ),
                  MaterialButton(
                    onPressed: () {
                      navgaterFunction(context, const LastOrdersScreen());
                    },
                    padding: const EdgeInsets.all(0),
                    child: InfoPersonViowText(
                      icon: iconApp.orderIcon,
                      titel: "last_orders_titel_msg",
                      supTitel: "orders_for_last_month_msg".tr(context),
                      trailing: SvgPicture.asset(
                        iconApp.angleRightIcon,
                        color: ColorApp.textColor,
                      ),
                    ),
                  ),
                  InfoPersonViowText(
                    icon: iconApp.lastOrderIcon,
                    titel: "timer_orders_titel_msg",
                    supTitel: "20:1:54",
                  ),
                ],
              ),
            ),
          );
        });
  }
}


// ignore: must_be_immutable
