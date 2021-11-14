import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockinstagram/widgets/text_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _showHeader(),
      ],
    );
  }

  _showHeader() => SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11.0, right: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 43.0,
                  ),
                  _setUserFollowingData("22", "Posts"),
                  _setUserFollowingData("86", "Followers"),
                  _setUserFollowingData("164", "Following"),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SetTextWidget(
                    "Bahromjon Po'lat",
                    size: 12.0,
                    weight: FontWeight.w600,
                  ),

                  SetTextWidget(
                    "Digital goodies designer @bahromjon_polat",
                    size: 12.0,
                    weight: FontWeight.w400,
                  ),
                  SetTextWidget(
                    "Everything is designed",
                    size: 12.0,
                    weight: FontWeight.w400,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: SetTextWidget("Edit profile", weight: FontWeight.w600,),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  _setUserFollowingData(String topText, String bottomText,
          {bool isCenter = true}) =>
      Column(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          SetTextWidget(topText, size: 16.0, weight: FontWeight.w600),
          SetTextWidget(bottomText, size: 13.0, weight: FontWeight.w400),
        ],
      );
}
