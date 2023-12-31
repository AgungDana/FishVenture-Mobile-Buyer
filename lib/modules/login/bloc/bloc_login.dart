import 'package:app/core/auth/bloc/bloc_auth.dart';
import 'package:app/core/auth/bloc/event.dart';
import 'package:app/modules/login/model/input/input_login.dart';
import 'package:app/modules/login/repo/repo_login.dart';
import 'package:flutter/foundation.dart';
import 'package:sstream/sstream.dart';

class LoginBLoc {
  LoginBLoc(this._repo) {
    if (kDebugMode) {
      email.add('rosiandana@gmail.com');
      password.add('rosiandana');
    }
  }

  final LoginRepo _repo;

  final email = "".stream;
  final password = "".stream;

  Future<void> login() async {
    try {
      final emailVal = email.value;
      if (emailVal == '') {
        throw 'error';
      }
      final passVal = password.value;
      if (passVal == '') {
        throw 'error';
      }
      final token = await _repo.login(
        LoginInput(
          email: emailVal,
          password: passVal,
          applicationType: 'buyer',
        ),
      );
      AuthBloc().raise(EventAuthLogin(token));
    } catch (e) {
      rethrow;
    }
  }
}
