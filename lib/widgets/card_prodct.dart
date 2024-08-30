import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mars/bloc/products_bloc/products_cubit.dart';
import 'package:mars/core/color_app.dart';
import 'package:mars/core/icon_app.dart';
import 'package:mars/core/localizations_app.dart';
import 'package:mars/core/size_app.dart';
import 'package:mars/functions/detlails_functions.dart';
import 'package:mars/functions/refresh_app_functions.dart';
import 'package:mars/package/loader.dart';
import 'package:mars/style/style_box_shadow.dart';

class CardProdct extends StatelessWidget {
  const CardProdct(
      {super.key,
      required this.prodctTitel,
      required this.productId,
      required this.price,
      required this.prodctImage,
      required this.onPressed,
      required this.isBookmarked});
  final String prodctTitel, price, prodctImage;
  final String productId;
  final VoidCallback onPressed;
  final bool isBookmarked;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Container(
            width: 145.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: ColorApp.backgroundColor,
              borderRadius: BorderRadius.circular(SizeApp.radiusSize as double),
              boxShadow: [styleBoxShadow.primerBoxShadow],
              image: refreshAppFunctions.isRefresh
                  ? null
                  : DecorationImage(
                      image: CachedNetworkImageProvider(prodctImage),
                      fit: BoxFit.fill,
                    ),
            ),
            child: refreshAppFunctions.isRefresh
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Loader(
                      dotOneColor: ColorApp.titelColor,
                      dotThreeColor: ColorApp.primerColor,
                      dotTwoColor: ColorApp.hintColor,
                    ),
                  )
                : null,
          ),
        ),
        ListTile(
          title: Text(
            textAlign: TextAlign.start,
            prodctTitel,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: ColorApp.titelColor, fontSize: 16),
          ),
          subtitle: Text(
            textAlign: TextAlign.start,
            '$price ${"currency".tr(context)}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorApp.descriptionColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () => BlocProvider.of<ProductsCubit>(context)
                .bookMarkProduct(productId: productId),
            icon: isBookmarked
                ? Icon(
                    Icons.bookmark,
                    color: ColorApp.primerColor,
                    size: 35,
                  )
                : SvgPicture.asset(
                    iconApp.bookMarkIcon,
                    color: ColorApp.primerColor,
                    width: 20.w,
                  ),
          ),
        ),
      ],
    );
  }
}
