import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockinstagram/components/size_config.dart';
import 'package:mockinstagram/components/size_spacing.dart';
import 'package:mockinstagram/constants/colors.dart';
import 'package:mockinstagram/widgets/buttons.dart';
import 'package:mockinstagram/widgets/text_widgets.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() => ListView.separated(
      itemBuilder: (context, index) {
        if (index == 0) {
          return _showStories();
        }
        return SizedBox();
      },
      separatorBuilder: (context, index) {
        return Column(
          children: [
            _setPostHeader(),
            Image.network(
              "https://source.unsplash.com/random/55",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            _showPostFooter(),
          ],
        );
      },
      itemCount: 5);

  _showStories() => SizedBox(
        height: getProportionateScreenHeight(98.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 11.5),
                    alignment: Alignment.center,
                    width: getProportionateScreenWidth(62.0),
                    height: getProportionateScreenWidth(62.0),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: Colors.red, width: 2.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                      ),
                    ),
                  ),
                  setHeight(8.0),
                  SetTextWidget("Your story", size: 12.0)
                ],
              );
            }),
      );

  ListTile _setPostHeader() => ListTile(
        leading: const CircleAvatar(
          radius: 16.0,
        ),
        title: SetTextWidget(
          "joshua_l",
          weight: FontWeight.w600,
          size: 13.0,
        ),
        subtitle: SetTextWidget(
          "Tokyo, Japan",
          weight: FontWeight.w400,
          size: 11.0,
        ),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          color: kColorBlack,
        ),
      );
  
  _showPostFooter() =>
      Row(
        children: [
          setIconButton((){}, CupertinoIcons.heart),
          setIconButton((){}, CupertinoIcons.chat_bubble),
          setIconButton((){}, CupertinoIcons.arrowshape_turn_up_right),
          const Spacer(),
          setIconButton(() { }, Icons.bookmark_outline)
        ],


  );
}
