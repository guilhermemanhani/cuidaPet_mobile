import 'package:cuidapet_mobile/app/core/helpers/environments.dart';
import 'package:cuidapet_mobile/app/core/push_notification/push_notification.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widget/login_form.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widget/login_register_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    PushNotification().getDeviceToken().then((token) => print(token));
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    // Loader.show();
    // Future.delayed(Duration(seconds: 2), () => Loader.hide());
    // Messages.alert('Mesagem de alerta');
    // Future.delayed(
    //     Duration(seconds: 2), () => Messages.info('message de info'));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 1.statusBarHeight + 30, left: 16, right: 16),
          width: 1.sw,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Environments.param('base_url') ?? 'Não configurado'),
              Image.asset(
                'assets/images/logo.png',
                width: 150.w,
                fit: BoxFit.fill,
              ),
              const LoginForm(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: context.primaryColor,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'ou',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: context.primaryColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const LoginRegisterButtons()
            ],
          ),
        ),
      ),
    );
  }
}
