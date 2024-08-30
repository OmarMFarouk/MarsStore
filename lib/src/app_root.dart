import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mars/bloc/auth_bloc/auth_cubit.dart';
import 'package:mars/bloc/cart_bloc/cart_cubit.dart';
import 'package:mars/bloc/intro_screen/intro_bloc.dart';
import 'package:mars/bloc/navgater_bar/navigator_bloc.dart';
import 'package:mars/bloc/onboeding_screen/onbording_bloc.dart';
import 'package:mars/bloc/orders_bloc/orders_cubit.dart';
import 'package:mars/bloc/otp_screen/otp_bloc.dart';
import 'package:mars/bloc/products_bloc/products_cubit.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/localization_function.dart';
import 'package:mars/screens/auth/intro_screen.dart';
import 'package:mars/screens/auth/onbordeing_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mars/screens/auth/splash_screen.dart';
import 'package:mars/src/app_shared.dart';
import 'package:mars/theme/theme_app_data.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  // checkConnection() async {
  //   final connectionChecker = InternetConnectionChecker();

  //   return connectionChecker.onStatusChange.listen(
  //     (InternetConnectionStatus status) {
  //       if (status == InternetConnectionStatus.disconnected) {
  //         showDialog(
  //             context: context,
  //             builder: (context) => Dialog(
  //                   child: Container(
  //                     height: 50,
  //                     child: Center(
  //                       child: CircularProgressIndicator(
  //                         color: ColorApp.primerColor,
  //                       ),
  //                     ),
  //                   ),
  //                 ));
  //       }
  //     },
  //   );
  // }

  @override
  void initState() {
    // checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeApp().init(context);
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IntroBloc()),
        BlocProvider(create: (context) => OtpBloc()),
        BlocProvider(create: (context) => NavigatorBarBloc()),
        BlocProvider(create: (context) => NavigatorBarBloc()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => OrdersCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
        BlocProvider(create: (context) => OnbordingBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // project app name
            title: "Mars Store",

            // localization data
            supportedLocales: localizationFunction.supportedLocales,
            localizationsDelegates: localizationFunction.localizationsDelegates,
            localeResolutionCallback: (deviceLocale, supportedLocales) =>
                localizationFunction.localizationFunction(
              deviceLocale,
              supportedLocales,
            ),

            // theme app data
            theme: themeAppData.thmeAppData(),
            themeMode: ColorApp.moodApp ? ThemeMode.light : ThemeMode.dark,
            builder: EasyLoading.init(),
            // build app screen
            home: child,
          );
        },

        // root start app
        child: BlocProvider(
          create: (context) => OnbordingBloc(),
          child: AppShared.localStorage.getBool('onboarded') == true
              ? AppShared.localStorage.getBool('active') == true
                  ? const SplashScreen()
                  : const IntroScreen()
              : const OnbordeingScreen(),
        ),
      ),
    );
  }
}
