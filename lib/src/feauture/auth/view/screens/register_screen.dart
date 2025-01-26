import 'package:dapp/src/core/my_validtor.dart';
import 'package:dapp/src/feauture/auth/cubit/register_cubit.dart';
import 'package:dapp/src/feauture/auth/cubit/register_state.dart';
import 'package:dapp/src/feauture/auth/model/register_model.dart';
import 'package:dapp/src/feauture/auth/view/screens/login_screen.dart';
import 'package:dapp/src/feauture/auth/view/widget/custom_text_field.dart';
import 'package:dapp/src/feauture/auth/view/widget/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthData data = AuthData();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController profileImageController = TextEditingController();

  final registered = GlobalKey<FormState>();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.userData["status"] == "success") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.indigoAccent,
                  content: Text(state.userData["message"])));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            }
            if (state.userData["status"] == "error") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.userData["message"])));
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: registered,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  context.read<RegisterCubit>().image == null
                      ? MaterialButton(
                          onPressed: () {
                            context.read<RegisterCubit>().addImage();
                          },
                          child: const Icon(
                            Icons.camera,
                            size: 80,
                          ))
                      : Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(
                                  context.read<RegisterCubit>().image!),
                              fit: BoxFit.fill,
                            ),
                          )),
                  CustomTextField(
                    controller: nameController,
                    label: const Text("Name"),
                    hintText: 'enter your name',
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      return MyValidators.displayNameValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: emailController,
                    label: const Text("Email"),
                    hintText: 'enter your email',
                    prefixIcon: const Icon(Icons.mail),
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    label: const Text("Phone"),
                    hintText: 'enter your phone',
                    prefixIcon: const Icon(Icons.phone),
                    validator: (value) {
                      return MyValidators.phoneValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: nationalIdController,
                    label: const Text("National Id"),
                    hintText: 'enter your id',
                    prefixIcon: const Icon(Icons.cast_rounded),
                    validator: (value) {
                      return MyValidators.nationalIdValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GenderSelection(
                    genderController: genderController,
                  ),
                  const SizedBox(
                    height: 5,
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
                    hintText: 'enter your password',
                    prefixIcon: const Icon(Icons.password),
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        if (registered.currentState!.validate()) {
                          context.read<RegisterCubit>().postDataCubit(
                                nameData: nameController.text,
                                emailData: emailController.text,
                                phoneData: phoneController.text,
                                nationalIdData: nationalIdController.text,
                                genderData: genderController.text,
                                passwordData: passwordController.text,
                              );
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "already have an account? login",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
