import 'package:cuidapet_mobile/app/core/ui/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:flutter/material.dart';

class LoginRegisterButtons extends StatelessWidget {
  const LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 12,
      children: [
        RoundedButtonWithIcon(
          onTap: () {},
          icon: CuidapetIcon.facebook,
          title: 'Facebook',
          color: const Color(0xFF4267B3),
          width: .42.sw,
        ),
        RoundedButtonWithIcon(
          onTap: () {},
          icon: CuidapetIcon.google,
          title: 'Google',
          color: const Color(0xFFE15031),
          width: .42.sw,
        ),
        RoundedButtonWithIcon(
          onTap: () => Navigator.pushNamed(context, '/auth/register'),
          icon: Icons.email,
          title: 'Cadastre-se',
          color: context.primaryColorDark,
          width: .42.sw,
        ),
      ],
    );
  }
}
