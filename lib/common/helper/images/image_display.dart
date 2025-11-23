import '../../../core/constants/app_urls.dart';

class ImageDisplayHelper{
  static String generatePopularsImageURL(String title){
    return AppUrl.popularPlaceImage + title + AppUrl.alt;
  }

  /*static String generateProductImageURL(String title) {
    return AppUrl.productImage + title + AppUrl.alt;
  }*/
}