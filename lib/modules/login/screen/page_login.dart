import 'package:app/common/widgets/button.dart';
import 'package:app/common/widgets/text_input.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masuk',
                style: CustomTextStyle.heading4Medium,
              ),
            ),
          ),
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextInput(
              label: 'Email',
              hint: 'Masukkan Email',
            ),
          ),
          const SizedBox(height: 26),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextInput(
              label: 'Password',
              hint: 'Masukkan Password',
              obscureText: true,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              textButton: 'Login',
              onTap: () async {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum mempunyai akun?',
                style: CustomTextStyle.body2Regular,
              ),
              InkWell(
                onTap: () {
                  if (kDebugMode) {
                    print('Daftar');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  child: Text(
                    ' Daftar',
                    style: CustomTextStyle.body2SemiBold.copyWith(
                      color: CustomColor.primary,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}