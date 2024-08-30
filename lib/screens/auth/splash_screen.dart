import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/cart_bloc/cart_cubit.dart';
import 'package:mars/bloc/intro_screen/intro_bloc.dart';
import 'package:mars/bloc/orders_bloc/orders_cubit.dart';
import 'package:mars/bloc/products_bloc/products_cubit.dart';
import 'package:mars/bloc/user_bloc/user_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/image_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/intro_functions.dart';
import 'package:mars/services/firebase_msg.dart';
import 'package:mars/widgets/hero_animated_widget.dart';
import 'package:mars/widgets/logo_box_mars.dart';

import '../../controllers/animated_controller.dart';
import '../../src/app_shared.dart';
import '../../src/mars_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialApiRequest();
    if (AppShared.localStorage.getBool('permissionGranted') == true) {
      NotificationService().initFCM();
    }
    super.initState();
  }

  initialApiRequest() async {
    await initialUserDataFetching();
    await Future.wait([
      initialCartFetching(),
      initialProductsFetching(),
      initialOrdersFetching()
    ]);
    animationTimer!.cancel();
    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MarsApp()));
    });
  }

  Future initialCartFetching() async {
    await BlocProvider.of<CartCubit>(context).fetchCartData();
  }

  Future initialProductsFetching() async {
    await BlocProvider.of<ProductsCubit>(context).fetchProducts();
  }

  Future initialOrdersFetching() async {
    await BlocProvider.of<OrdersCubit>(context).fetchOrdersData();
  }

  Future initialUserDataFetching() async {
    await BlocProvider.of<UserCubit>(context).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    animatedController.introAnimatedController(context);
    return Container(
      width: SizeApp.screenWidth,
      height: SizeApp.screenHeight,
      decoration: BoxDecoration(
        color: ColorApp.titelColor,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.1),
            BlendMode.dstATop,
          ),
          image: AssetImage(imageApp.wallpaper),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<IntroBloc, IntroState>(
              builder: (context, state) {
                state = IntroAnimatedLogoState(isAnimated: true);
                return HeroAnimatedWidget(
                  crossFadeState: introFunctions.isIntro,
                  firstChild: Container(),
                  secondChild: const LogoBoxMars(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
