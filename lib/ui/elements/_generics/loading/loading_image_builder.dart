import 'package:flutter/material.dart';

import '../theme/my_colors.dart';

Widget messageImageLoadingBuilder(
        BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
    loadingProgress == null
        ? child
        : Center(
            child: CircularProgressIndicator(
              color: MyColors.burgundy,
              value: loadingProgress.expectedTotalBytes != null &&
                      loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );

Widget avatarImageLoadingBuilder(
        BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
    loadingProgress == null
        ? child
        : SizedBox(
            width: 90,
            height: 90,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
