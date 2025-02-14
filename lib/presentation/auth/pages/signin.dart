import 'package:dart01/common/widgets/snackbar/basic_snackbar.dart';
import 'package:dart01/presentation/root/pages/root.dart';
import 'package:dart01/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dart01/common/widgets/appbar/app_bar.dart';
import 'package:dart01/common/widgets/button/basic_app_button.dart';
import 'package:dart01/core/configs/assets/app_vectors.dart';
import 'package:dart01/data/models/auth/signin_user_req.dart';
import 'package:dart01/domain/usecases/auth/signin.dart';
import 'package:dart01/presentation/auth/pages/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({
    super.key,
  });

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscurtext = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _signinText(),
            _clickHere(context),
            SizedBox(height: 25),
            _emailField(context),
            SizedBox(height: 20),
            _passwordField(context),
            SizedBox(height: 10),
            _rePassword(),
            SizedBox(height: 10),
            BasicAppButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ),
                  );
                  result.fold((l) {
                    basicSnackBar(context, l);
                  }, (r) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => RootPage(),
                        ),
                        (route) => false);
                  });
                },
                title: 'Sign In'),
            SizedBox(height: 20),
            _orDeco(),
            SizedBox(height: 10),
            _loginGgFb(),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      'Sign In',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _clickHere(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'If You Need Any Support',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Click here',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.green),
          ),
        ),
      ],
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: InputDecoration(hintText: 'Enter email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: _obscurtext,
      controller: _password,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              setState(() {
                _obscurtext = !_obscurtext;
              });
            },
            icon: Icon(_obscurtext ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _rePassword() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {},
        child: Text(
          'Recovery Password',
          style: TextStyle(
            color: Color(0xff383838),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _orDeco() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
          ),
          SizedBox(width: 15),
          Text('Or'),
          SizedBox(width: 15),
          Expanded(
            child: Divider(
              thickness: 1,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginGgFb() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppVectors.google,
          ),
        ),
        SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset(
              AppVectors.facebook,
            ),
          ),
        ),
      ],
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignUpPage(),
                ),
              );
            },
            child: Text(
              'Register Now',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
