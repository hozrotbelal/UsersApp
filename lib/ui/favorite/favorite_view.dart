import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:usersapp/ui/favorite/favorite_controller.dart';

import '../../../utils/constants.dart';
import '../../../utils/helper/shimmer_helper.dart';
import '../../base/widget/appbar/custom_app_bar.dart';
import '../../base/widget/image_loader/image_load_view.dart';
import '../../data/remote/dto/users/users.dart';
import '../../utils/enum/enum.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        systemNavigationBarColor: colorWhite,
        statusBarColor: colorWhite,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        key: controller.favoriteKeyScaffolds,
        backgroundColor: colorBgGreyF8,
        //  appBar: buildAppBar(statusBarHeight),
        body: GetBuilder<FavoriteController>(
          builder: (controller) {
            return parentBody;
          },
        ),
      ),
    );
  }

  // Main Body
  Stack get parentBody => Stack(
        children: <Widget>[
          // background,
          Container(
            margin: const EdgeInsets.only(top: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  title: "Favorite",
                  isBackButtonExist: false,
                  paddindAppBar: EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                  horizontalChild: Expanded(
                    child: SizedBox(),
                  ),
                ),
                Expanded(
                  child: buildAllFavoriteUserItemList(),
                ),
              ],
            ),
          ),
        ],
      );

// Get User Favorite List
  buildAllFavoriteUserItemList() {
    if (controller.isInitial && controller.allFavoriteUsersList.isEmpty) {
      return SingleChildScrollView(child: ShimmerHelper().buildListShimmer());
    } else if (controller.allFavoriteUsersList.isNotEmpty) {
      return RefreshIndicator(
        color: colorPrimary,
        backgroundColor: Colors.white,
        displacement: 0,
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 2), () {
            controller.reset();
          });
        },
        child: SingleChildScrollView(
          controller: controller.xScrollController,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.allFavoriteUsersList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              // 3
              return FavoriteUserItem(
                  item: controller.allFavoriteUsersList[index],
                  onTap: () {},
                  onPressedRemoveFromFavorite: () {
                    controller.removeFavoriteFromUserList(controller.allFavoriteUsersList[index].id!);
                  });
            },
          ),
        ),
      );
    } else if (controller.allFavoriteUsersList.isEmpty) {
      return Center(
        child: Text(
          "no_data_available_mgs".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: colorLightGray1,
            fontFamily: fontFamilyQuicksand,
          ),
        ),
      );
    } else {
      return Container(); // should never be happening
    }
  }
}

class FavoriteUserItem extends StatelessWidget {
  final Users item;
  final VoidCallback onTap;
  final VoidCallback? onPressedRemoveFromFavorite;

  const FavoriteUserItem({
    Key? key,
    required this.item,
    required this.onTap,
    this.onPressedRemoveFromFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: colorStepLine),
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: colorStepLine.withOpacity(0.4),
              offset: const Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: Get.width * .20,
                    height: Get.width * .20,
                    alignment: Alignment.center,
                    child: ImageLoadView(
                      item.profilePicture!,
                      imageType: ImageType.network,
                      fit: BoxFit.cover,
                      //  padding: EdgeInsets.all(5),
                      // width: Get.width * .22,
                      // height: Get.width * .22,
                      alignment: Alignment.center,
                      shape: BoxShape.circle,
                      placeholder: loadingImage,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: Get.width * .010),
                        child: Text(
                          "${item.firstName ?? ""}  " " ${item.lastName ?? ""}",
                          textAlign: TextAlign.start,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorLightGray2,
                            fontSize: Get.width * .033,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: Get.width * .013),
                        child: Text(
                          "Phone : ${item.phone ?? ""}",
                          textAlign: TextAlign.start,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorLightGray2,
                            fontSize: Get.width * .033,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: Get.width * .013),
                        child: Text(
                          "Email : ${item.email ?? ""}",
                          textAlign: TextAlign.start,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorLightGray2,
                            fontSize: Get.width * .033,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: Get.width * .013),
                        child: Text(
                          "Gender : ${item.gender ?? ""}",
                          textAlign: TextAlign.start,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorLightGray2,
                            fontSize: Get.width * .033,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onPressedRemoveFromFavorite,
                        child: Container(
                          width: Get.width * .30,
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.fromLTRB(8, 5, 8, 6),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            // color: colorRed10,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: colorRed10, width: 1, style: BorderStyle.solid),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Remove",
                                textAlign: TextAlign.start,
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorTextGrey99,
                                  fontSize: Get.width * .037,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                width: 18,
                                height: 26,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(assetIcDelete),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(assetSvgIcHeartLikeRed),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
