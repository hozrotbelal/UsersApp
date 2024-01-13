import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usersapp/data/remote/dto/users/users.dart';

import '../../../../base/widget/image_loader/image_load_view.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/enum/enum.dart';
import '../../../../utils/helper/text.dart';

class UserItem extends StatelessWidget {
  final Users item;
  final VoidCallback onTap;
  final VoidCallback? onPressedAddedToFavorite;

  const UserItem({
    Key? key,
    required this.item,
    required this.onTap,
    this.onPressedAddedToFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var address = "";
    if (TextUtil.isNotEmpty(item.street)) {
      address = "${item.street!},";
    }
    if (TextUtil.isNotEmpty(item.state)) {
      address = "$address${item.state!},";
    }
    if (TextUtil.isNotEmpty(item.city)) {
      address = "$address${item.city!},";
    }
    if (TextUtil.isNotEmpty(item.country)) {
      address = "$address${item.country!}";
    }
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

                      Padding(
                        padding: EdgeInsets.only(bottom: Get.width * .013),
                        child: Text(
                          "Address : $address",
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
                      //  SizedBox(width: 5),
                      GestureDetector(
                        onTap: onPressedAddedToFavorite,
                        child: Container(
                          width: Get.width * .35,
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.fromLTRB(8, 5, 8, 6),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: colorGreen51, width: 1, style: BorderStyle.solid),
                          ),
                          child: Text(
                            "Add to Favorite",
                            textAlign: TextAlign.start,
                            style: Get.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorPrimary,
                              fontSize: Get.width * .037,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
