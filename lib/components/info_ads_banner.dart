import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars/bloc/home_screen/indecatorads_bloc.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/font_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/home_functions.dart';
import 'package:mars/functions/navgater_function.dart';
import 'package:mars/models/ads_banner_model.dart';
import 'package:mars/package/indecator_babel_packge.dart';
import 'package:mars/style/style_box_shadow.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Container(
            width: SizeApp.screenWidth! * 1,
            height: SizeApp.screenHeight! / 4.5,
            decoration: BoxDecoration(
              // color: ColorApp.backgroundColor,
              boxShadow: [styleBoxShadow.backBoxShadow],
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
            ),
            child: PageView.builder(
              onPageChanged: (value) => homeFunctions.onChanged(value, context),
              itemCount: adsBannerModel.adsBannerList.length,
              itemBuilder: (context, index) => IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => navgaterFunction(
                  context,
                  adsBannerModel.adsBannerList[index].screen,
                ),
                icon: Container(
                  decoration: BoxDecoration(
                    color: ColorApp.backgroundColor,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.dstATop,
                      ),
                      image: AssetImage(
                        adsBannerModel.adsBannerList[index].imageSrc,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [styleBoxShadow.primerBoxShadow],
                    borderRadius: BorderRadius.circular(
                      SizeApp.radiusSize as double,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      adsBannerModel.adsBannerList[index].titelBannerMsg
                          .tr(context),
                      style: TextStyle(
                        fontSize: SizeApp.bigTextSize,
                        fontFamily: fontApp.heroText,
                        fontWeight: FontWeight.w700,
                        color: ColorApp.titelColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<IndecatoradsBloc, IndecatoradsState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  adsBannerModel.adsBannerList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IndecatorBabelPackge(
                      isActive: index == homeFunctions.indecatorIndex,
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
