import 'package:flutter/material.dart';
import 'package:mars/style/style_text_description.dart';
import 'package:mars/style/style_text_hint.dart';
import 'package:mars/widgets/text_localization.dart';

class MembershipButton extends StatelessWidget {
  const MembershipButton({
    super.key,
    required this.onPressed,
    required this.isLogin,
  });
  final bool isLogin;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextLocalization(
          text: isLogin ? "not_a_mamber_msg" : "already_a_member_msg",
          style: styleTextDescription(),
        ),
        TextButton(
          onPressed: onPressed,
          child: TextLocalization(
            text: isLogin ? "register_now_msg" : "login_now_msg",
            style: styleTextHint(),
          ),
        ),
      ],
    );
  }
}
