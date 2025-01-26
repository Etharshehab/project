import 'package:dapp/src/core/my_validtor.dart';
import 'package:dapp/src/feauture/auth/cubit/register_cubit.dart';
import 'package:dapp/src/feauture/auth/cubit/register_state.dart';
import 'package:dapp/src/feauture/auth/view/screens/register_screen.dart';
import 'package:dapp/src/feauture/auth/view/widget/custom_text_field.dart';
import 'package:dapp/src/feauture/home/view/screens/home.dart';
import 'package:dapp/src/feauture/layoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.userData["status"] == "success") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.indigoAccent,
                  content: Text(state.userData["message"])));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }
            if (state.userData["status"] == "error") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.userData["message"])));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          }

          if (state is LoginFail) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Form(
            key: loginFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                CustomTextField(
                  controller: emailController,
                  label: const Text("Email"),
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    return MyValidators.displayNameValidator(value);
                  },
                  suffixIcon: const Icon(Icons.clear),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscureText: visible,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      visible ? Icons.visibility_off : Icons.remove_red_eye,
                    ),
                  ),
                  controller: passwordController,
                  label: const Text("Password"),
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.password),
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                  suffixIcon: const Icon(Icons.clear),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      context.read<RegisterCubit>().loginCubit(
                            nameData: emailController.text,
                            passwordData: passwordController.text,
                          );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "you don't have an account? sign up",
                      style: TextStyle(color: Colors.blue),
                    )),
                if (state is LoginLoad) const CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
