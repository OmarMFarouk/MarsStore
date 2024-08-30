import 'package:mars/data/ads_banner_data.dart';
import 'package:mars/screens/categories/accssories_screen.dart';
import 'package:mars/screens/categories/clothes_screen.dart';
import 'package:mars/screens/categories/shoes_screen.dart';

class AdsBannerModel {
  List<AdsBannerData> adsBannerList = [
    AdsBannerData(
      titelBannerMsg: "clothes_ads_msg",
      imageSrc: "assets/images/wallpaper-image.jpg",
      screen: const ClothesScreen(),
    ),
    AdsBannerData(
      titelBannerMsg: "shoes_ads_msg",
      imageSrc: "assets/images/wallpaper-image.jpg",
      screen: const ShoesScreen(),
    ),
    AdsBannerData(
      titelBannerMsg: "accessories_ads_msg",
      imageSrc: "assets/images/wallpaper-image.jpg",
      screen: const AccssoriesScreen(),
    ),
  ];
}

AdsBannerModel adsBannerModel = AdsBannerModel();
