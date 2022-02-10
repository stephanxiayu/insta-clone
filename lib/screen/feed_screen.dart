

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/Widget/post_card.dart';
import 'package:instaclone/utilities/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset("lib/assets/ic_instagram.svg", color: primaryColor, height: 32,),

        actions: [IconButton(onPressed: (){},
          
          icon: Icon(Icons.message_outlined),),],
      ),
      body: const PostCard(),
    );
  }
}