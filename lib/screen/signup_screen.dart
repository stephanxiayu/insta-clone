import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/Widget/text_field_input.dart';
import 'package:instaclone/utilities/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          SvgPicture.asset(
            "lib/assets/ic_instagram.svg",
            color: primaryColor,
            height: 64,
          ),
          const SizedBox(
            height: 64,
          ),
          Stack(
            children: [
        const      CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1593314731059-d6eb89748e65?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"),
              ), Positioned(
                bottom: -10,
                left:80 ,
                
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo)))
            ],
          ),
           const SizedBox(
            height: 24,
          ),
          TextFieldInput(
              textEditingController: _usernameController,
              hinText: "Username eingeben",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
              textEditingController: _emailController,
              hinText: "Email-Adresse eingeben",
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            textEditingController: _passwordController,
            hinText: "Passwort",
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
              textEditingController: _bioController,
              hinText: "Bio eingeben",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              child: const Text("Login"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: blueColor),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("noch keinen Account?"),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
