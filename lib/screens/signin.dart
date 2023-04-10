import 'package:flutter/material.dart';
import 'package:stals_frontend/screens/signup.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
    final GlobalKey<FormState> passKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final email = Form(
        key: emailKey,
        child: TextFormField(
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty!';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'E-mail',
          ),
        ));

    final password = Form(
        key: passKey,
        child: TextFormField(
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty!';
            }
            return null;
          },
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ));

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color.fromARGB(255, 67, 134, 221),
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 22),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        child: const Text('Login', style: TextStyle(color: Colors.white)),
      ),
    );

    final signupButton = ElevatedButton(
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromARGB(255, 67, 134, 221),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 13),
          textStyle: const TextStyle(fontSize: 12)),
      child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
    );

    final loginFields = Container(
      margin: const EdgeInsets.symmetric(horizontal: 300),
      child: Column(
        children: [
          email,
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          password,
          const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
          loginButton,
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          const Text(
            "No account yet?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
          signupButton
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            loginFields
          ],
        ),
      ),
    );
  }
}
