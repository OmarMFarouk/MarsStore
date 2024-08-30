import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/components/info_settenig_items.dart';
import 'package:mars/components/mood_app_button.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/custom/custom_titel_bar.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/screens/person_setting_screen.dart';
import 'package:mars/src/app_shared.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/style/style_text_hint.dart';
import 'package:mars/style/style_text_titel.dart';
import 'package:restart_app/restart_app.dart';
import 'package:share_plus/share_plus.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: ColorApp.backgroundColor,
        child: Column(
          children: [
            const CustomTitelBar(text: "setting_titel_msg"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // mood app
                    MoodAppButton(
                      onPressed: () {},
                    ),

                    // the language
                    InfoSettenigItems(
                      onPressed: () {},
                      titel: "language_app_setting_msg",
                      icon: iconApp.languageIcon,
                    ),

                    // mars faceBook page
                    InfoSettenigItems(
                      onPressed: () {},
                      titel: "msrs_faceBook_page_msg",
                      icon: iconApp.faceBookIcon,
                    ),

                    // mars Instagram page
                    InfoSettenigItems(
                      onPressed: () {},
                      titel: "msrs_instagram_page_msg",
                      icon: iconApp.instagramIcon,
                    ),

                    // mars whatsApp group
                    InfoSettenigItems(
                      onPressed: () {},
                      titel: "msrs_whatsApp_group_msg",
                      icon: iconApp.whatsAppIcon,
                    ),

                    // mars telegram group
                    InfoSettenigItems(
                      onPressed: () {},
                      titel: "msrs_telegram_group_msg",
                      icon: iconApp.telegramIcon,
                    ),

                    // shere mars app
                    InfoSettenigItems(
                      onPressed: () {
                        Share.share("share_mars_application_msg".tr(context));
                      },
                      titel: "share_mars_application_msg",
                      icon: iconApp.sharIcon,
                    ),

                    // shere mars app
                    InfoSettenigItems(
                      onPressed: () {
                        navgaterFunction(context, const PersonSettingScreen());
                      },
                      titel: "persin_titel_msg",
                      icon: iconApp.personIcon,
                    ),

                    // log out
                    InfoSettenigItems(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            content: Text(
                              'Are you sure?',
                              style: styleTextDescription(),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    await AppShared.localStorage
                                        .setBool('active', false);
                                    Restart.restartApp();
                                  },
                                  child: const Text('Logout')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'))
                            ],
                          ),
                        );
                      },
                      titel: "log_out_msg",
                      icon: iconApp.logoutIcon,
                    ),

                    // About the mars app
                    InfoSettenigItems(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            content: Column(
                              children: [
                                Text(
                                  'About us',
                                  style: styleTextTitel(),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Mars is egyptian store offering wide variaties of clothes, accessories and shoes',
                                  style: styleTextDescription(),
                                ),
                                Text(
                                  'We deliver to any inch in egypt fast and secure',
                                  style: styleTextDescription(),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Version 1.0.0',
                                  style: styleTextHint(),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Okay'))
                            ],
                          ),
                        );
                      },
                      titel: "about_mars_msg",
                      icon: iconApp.infoIcon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
