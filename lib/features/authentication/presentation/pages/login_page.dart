import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text('Teachica',
                style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.orange),
      body: Center(
        child: Column(children: [
          const Spacer(),
          const Flexible(
              flex: 10,
              child: Text(
                  'Hello World !', textAlign: TextAlign.center)),
          const Spacer(),
          Flexible(
            flex: 2,
            child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(LogIn());
                },
                child: const Text('Login')),
          )
        ]),
      ),
    );
  }
}
