import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usersapp/ui/details/user_details_controller.dart';

import '../../../utils/constants.dart';
import '../../base/widget/appbar/custom_app_bar.dart';
import '../../base/widget/image_loader/image_load_view.dart';
import '../../utils/enum/enum.dart';
import '../../utils/helper/toast.dart';

class UserDetailsView extends GetView<UserDetailsController> {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: GetBuilder<UserDetailsController>(
          builder: (controller) {
            return parentBody;
          },
        ),
      ),
    );
  }

  // Main Body
  Stack get parentBody => Stack(children: <Widget>[
        // background,
        Container(
          margin: const EdgeInsets.only(top: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: "User Details",
                isBackButtonExist: true,
                paddindAppBar: EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
                horizontalChild: Expanded(
                  child: SizedBox(),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topCenter,
                                    width: Get.width,
                                    height: Get.width * .65,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: ImageLoadView(
                                        controller.usersObj?.profilePicture ?? "",
                                        imageType: ImageType.network,
                                        fit: BoxFit.fill,
                                        width: Get.width,
                                        height: Get.width * .65,
                                        alignment: Alignment.center,
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => IconBtn(
                                      icon: controller.isFavorite.value ? Icons.favorite_sharp : Icons.favorite_border,
                                      isFavourite: controller.isFavorite.value,
                                      press: () async {
                                        var removeFavouriteUser = await controller.removeFromFavorite(controller.usersObj?.id ?? 0);
                                        if (removeFavouriteUser) {
                                          controller.reset();
                                          ToastUtil.show("Remove succesfully");
                                        } else {
                                          controller.addOrUpdateUserFavorite(controller.usersObj!);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                                  padding: const EdgeInsets.only(left: 5, right: 10, top: 15, bottom: 10),
                                  width: Get.width,
                                  decoration: BoxDecoration(color: const Color(0xffeae8e8), borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Name",
                                              "${controller.usersObj?.firstName ?? ""}  " " ${controller.usersObj?.lastName ?? ""}",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Job",
                                              controller.usersObj?.job ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Phone",
                                              controller.usersObj?.phone ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Email",
                                              controller.usersObj?.email ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Gender",
                                              controller.usersObj?.gender ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Street",
                                              controller.usersObj?.street ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "State",
                                              controller.usersObj?.state ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "City",
                                              controller.usersObj?.city ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            bulildHorizontalView(
                                              "Country",
                                              controller.usersObj?.country ?? "---",
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]);

  Container bulildHorizontalView(String title1, String title2, Color title2Color, {double fontSize1 = 13, double fontSize2 = 13, FontWeight fontWeight1 = FontWeight.w600, FontWeight fontWeight2 = FontWeight.w600}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              title1,
              textAlign: TextAlign.left,
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: fontWeight1,
                fontSize: 14,
                color: colorBlock00,
                fontFamily: fontFamilyQuicksand,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              ":",
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: fontWeight2,
                fontSize: fontSize2,
                color: title2Color,
                fontFamily: fontFamilyQuicksand,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title2,
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: fontWeight2,
                fontSize: fontSize2,
                color: title2Color,
                fontFamily: fontFamilyQuicksand,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback press;
  final bool isFavourite;
  const IconBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.isFavourite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 35,
        height: 35,
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.38),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Icon(
          icon,
          size: 20,
          color: isFavourite ? colorRed10 : colorTextGrey5A,
        ),
      ),
    );
  }
}
