import 'package:app/common/widgets/button.dart';
import 'package:app/common/widgets/text_input.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/core/route/bloc_route.dart';
import 'package:app/core/route/route_page.dart';
import 'package:app/modules/register/bloc/bloc_register.dart';
import 'package:app/modules/register/repo/repo_register.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocRegister = RegisterBloc(RegisterRepo());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 108.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daftar',
                  style: CustomTextStyle.heading4Medium,
                ),
              ),
            ),
            const SizedBox(height: 48.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextInput(
                sStream: blocRegister.name,
                label: 'Nama',
                hint: 'Masukkan Nama',
              ),
            ),
            const SizedBox(height: 26.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextInput(
                sStream: blocRegister.email,
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                hint: 'Masukkan Email',
              ),
            ),
            const SizedBox(height: 26.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextInput(
                sStream: blocRegister.password,
                label: 'Password',
                hint: 'Masukkan Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 26.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextInput(
                sStream: blocRegister.konfirmPassword,
                label: 'Konfirmasi Password',
                hint: 'Masukkan Password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomButton(
                textButton: 'Daftar',
                onTap: () async {
                  await blocRegister.register();
                  final snackBar = SnackBar(
                    content: Text('Berhasil!!!'),
                  );
                  RouteBloc().pop();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun?',
                  style: CustomTextStyle.body2Regular,
                ),
                InkWell(
                  onTap: () => RouteBloc().pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 8.0),
                    child: Text(
                      'Login',
                      style: CustomTextStyle.body2SemiBold.copyWith(
                        color: CustomColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
