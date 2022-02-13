import 'package:flutter/material.dart';
import 'package:instaclone/Widget/comment_card.dart';
import 'package:instaclone/utilities/colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kTextTabBarHeight,
        margin: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1554109394-7e351053be0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=463&q=80"),
              radius: 18,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Comment Username', border: InputBorder.none),
              ),
            )),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'Posten',
                  style: TextStyle(color: blueColor),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
