import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends ModularState<LoginForm, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CuidapetTextFormField(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres'),
            ]),
            // suffixIcon: IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.lock_open,
            //   ),
            // ),
          ),
          const SizedBox(
            height: 16,
          ),
          CuidapetDefaultButton(
            label: 'Entrar',
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                controller.login(_loginEC.text, _passwordEC.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
