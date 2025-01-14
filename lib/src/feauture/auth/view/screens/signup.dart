import 'package:dapp/src/core/my_validtor.dart';
import 'package:dapp/src/feauture/auth/cubit/auth_cubit.dart';
import 'package:dapp/src/feauture/auth/view/widget/customtexfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final AuthCubit authCubit = AuthCubit();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController profileImageController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SucessState) {
                if (state.userdata["status"] == "success") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.indigoAccent,
                      content: Text(state.userdata["message"])));
                }
                if (state.userdata["status"] == "error") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.userdata["message"])));
                }
              }
            },
            builder: (context, state) {
              return Form(
                key: globalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(width: 200),
                    authCubit.image == null
                        ? MaterialButton(
                            onPressed: () {
                              authCubit.addImage();
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
                                image: FileImage(authCubit.image!),
                                fit: BoxFit.fill,
                              ),
                            )),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.person),
                      validator: (v) => MyValidators.displayNameValidator(v),
                      controller: nameController,
                      label: const Text('Name'),
                      hintText: 'Enter your full name',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.email),
                      validator: (v) => MyValidators.emailValidator(v),
                      controller: emailController,
                      label: const Text('Email'),
                      hintText: 'Enter your email address',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.phone),
                      validator: (v) => MyValidators.phoneValidator(v),
                      controller: phoneController,
                      label: const Text('Phone Number'),
                      hintText: 'Enter your phone number',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.lock),
                      validator: (v) => MyValidators.passwordValidator(v),
                      controller: passwordController,
                      label: const Text('Password'),
                      hintText: 'Enter your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.lock),
                      validator: (v) => MyValidators.repeatPasswordValidator(),
                      controller: passwordController,
                      label: const Text('Password'),
                      hintText: 'repeat your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.numbers),
                      validator: (v) => MyValidators.nationalIdValidator(v),
                      controller: nationalIdController,
                      label: const Text('National ID'),
                      hintText: 'Enter your national ID',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.person_outline),
                      validator: (v) {
                        try {
                          return MyValidators.genderValidator(value: v);
                        } catch (e) {
                          return e.toString();
                        }
                      },
                      controller: genderController,
                      label: const Text('Gender'),
                      hintText: 'Enter your gender',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.token),
                      validator: (v) {
                        try {
                          return MyValidators.tokenValidator(v);
                        } catch (e) {
                          return e.toString();
                        }
                      },
                      controller: tokenController,
                      label: const Text('Token'),
                      hintText: 'Enter your token',
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          authCubit.PostDataCubit(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            nationalId: nationalIdController.text,
                            gender: genderController.text,
                            password: passwordController.text,
                            token: tokenController.text,
                            profileImage:
                                " data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAKIArgMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABQYDBAcCCAH/xABFEAACAQQABAQDBgIFCAsAAAABAgMABAURBhIhMRNBUWEHFCIVMkJxgZFSYiMkM4KhNFNykrHBwuElJjVDY2V0g7Kz0f/EABsBAQACAwEBAAAAAAAAAAAAAAAEBQEDBgIH/8QANhEAAgEDAQQGBwgDAAAAAAAAAAECAwQRIQUSMUETUWFxsfAUIjKBkaHhBiMkM1LB0fE0QnL/2gAMAwEAAhEDEQA/AO40pUHnshcPKMNhpAMncLtpdcws4j0MrDtvuEU/eb2DEAbZz2HGU+yzlbH7Q3r5X5hfF3reuXe966/lUjVT4kw2HxfAWUs/l1FvHbSOGI5pHm19L8x6mQvog9y2qnLjJWuIx0EuZvYLb6VRnlkC8z67D1PQ9BQGnmcne/aUWKxHgLcGPx7i4mUutvHshfpBHMzEMB1AHKxPbR0JuJjw/efL8SXCG2mjaS1u44WBZl1zRMg3t+oK8vcb6fTs4uGcjFk5rnJKwJyZNxbDfX5ZD4aflvXPo9QZCPKtP4kW6SYGKdh9VvdI6/3gyf8AHXqEd6Sj1nipLdg5dRqX3xUCkjF8PXdwAejXM6QBh6gDmP7gVrwfFe8En9c4WkWP+K2v0kb9mVf9tUulWfoNPrZV+n1c8Edb4c49wHEFytnbXL21+Rv5K8TwpT37b6N2P3Se1WivnS8s4byNVl5ldDzRyodPGw7Mp8jW/wAOfF7LcOZD7K4uU5G1QgLeIOWZV10JHZx+x79TUOvbulryJ1vcqtpwZ3ylaGFzGOzuPjv8Rdx3Vs/Z0PY+hHcH2PWt+oxJFKUoBSlKAUpSgFKUoBSlKAVWfh3D/wBU7DITEyXuShS7u53+9LI6g7PsBoAdgAAKspOgTUFwGNcD8PD/AMstv/rWgNPNSW8nEMsmYuAuLw9pDeiDl3zzO8oVmA6ty+GOVQPvN5kDUhhLKaWZszlIuW/uF1HE2j8pCeojHox6FyO7dNkKutnKQYyPWTyUcI+UHP40g+5rqD7kHt6E9O9VnhbjaDJ529tLtRax3EivYGV+sn0hSh8g308wHXuf4TXpRk02lwPLnFNJvVkFxbYScK8aQZ/GxgRXYYyR9lZjrxUPpzfS4/mDH13p8T8XJxFjVs7O1nt7d2R5XnAWTmRg3KoBI1tR12djevWrX8Tr3H/Y32fK4a+aRJIUQjmj03Vj6ArzL77I9SOW3E8VtA887hI0G2Y+QqfbUozipyXAr7qrOEnCL4i4nitYWmuJFjjUbLMaip+KMTDr+sNIfREJ/wCVQckGV4wllngEdrirZtNc3Uoihi325mPdj/CNn0FaktvwvYjle+v8rLobNpGLaIH0DyBmP6otYqXrziHAzSsVjM3qXixvIr62W4t+fw27cykVoS8JT8YcQ3dnYvy3dtijcxKdcsjiQAIT5bDHXvryrz8PLTK5i1uoMPibq5ggm+hvEjAjDdQrOxUEjv0Hn27V2z4ecIScNwXd3kXjkyt8wMxiJKRIv3Y1J9Nkk6GyfYVivcRnRS5mbe3lTrN8j5o4d4izfB2WafGTSWs6NyTwSL9L8p6q6H9R6jrrRr6N+H3xOxHGCJayFbHLa62sjdJPeM/i/LuOvkN1XfjF8MGznPnuHoh9pKN3NsvT5gD8S/zj08x79+ZfDzgF+L3v44swMdk7BlIt5IDzHv8AVvmBGmGj06dKgFgfVNKo3Bg47xDw4zie3tsra/dXI21wPEjH/iB+UuPcDm/OrzQClKUApSlAKUpQClKUBq5S4W0xl3cuQqwwPISfIBSa1OFbVrHhjD2j75oLGCI79VQD/dWDjtHk4Jz6RglzjbgAAbJ/o26VL2zrJbROn3WQEflqgKD8Vb6YNY45diB1aaT+dgQFH6dT+ZU+Vc9ljjmjMcyLIjd1cbB/Su4cQ4Gyz9l8teh0Kncc0RAeM+o2CP0II9q5/a/DXIT3FxHJxDEiQzFNLj9sV0GB5jJreiPw63up9vc04Q3ZIr7i1qVKm9FlNmlitomklZUTfU+p/wB5qxYP4Z3fEphu+JWmssYCHjsF+mab3kP4B/L36/hNXjFcH8PcLRvlLpmnntkMjX1+wYxADqVAAVOnmoB9zWxj/n+JozeXUlzj8VKP6taxMYp5lPaSRx9Sb8lUggdySdDXXunUW7HRGyhaKm96WrK/8Qvh1w7d8H3PydjbY6bHWzzW80KhAOVdkP6g66k7Pn+dQ4S+BcF3Y2l/nspMBPEkptbeIIybAOizb9dHpXXrfhzFwDlMU843si7upbgE/wDuM1S1RCYR+CwuO4fxsePxFqltbR9Qq9yfMknqT7mpClKAVE3PDeLnzMOZFsIclEf8phPIzr5q+ujgjpo79tVLUoBSlKAUpSgFKUoBSlKAUpSgPMsaSxvHIoZHUqwPmDULwbKW4ctLd3LzWPNZSse7PCxjLfry835EVNkhQSxAA6knyqqfD28sMlaZfIYzZhucrM5c7/pOigNr0IAI9tUBanZURnchVUbJPYCtS21DHdXly4iSVvFPiHQjQKB1J7dF2fTZrbZQw0wBG99a59xt4GQ+IXC2IvC0+Ol8Y3do7nwnbkZouZOzEFD0O/KmMmG8G8itx3kIp3VhwvZyiSJTsfaUynoxHnCp6gdmPXqBV1rDPNbWNq01xLFb20K7Z5GCIij1J6AUtLq3vbdLmzuIriCQbSWFw6sPYjoaGTNSlKAUrHcXENrA89zKkUSDbO7aCj3NQ1/xPDj7Zr28x2QhxyaL3jxoqoD2JQt4gG9DqnTezobIAnaVWsxd32QxTLFiL1VfleOSOWJypUhlLKsn1JsDaqSWGx51px8UW+ExUWTybzxYu5tmmiW5O5beZV21uSx2zHTcoPUFHG9coAFxpWCwuReWNvdBSgmiWTlJ3rY3r/Gs9AKUpQClKUApSlAKUpQFL+KmUNpw+uNhflmybmFtHqIQNyH9RpPbnFRnweuAv25YDQ5Z4roADyeMJ/thNRfxOuWn4vjgOilpYpy+zSO3N/hGlafAeSjxXGEDXEqxW97byW8jOQqhlHiIST6BZB/eqYqX4be5kJ1vxW7y4fudZzOSgxGMnv7nfhxLsKO7seiqPcnQ/WuMxzZC+z1txFK6clnlbZrqQ9tyOI+Rf9FJPPsOXvupTjXiKbiHIw2mPQvbJIEtYjsGeU9Oc+g6n8l5ie+h449U4LgkYDHPzXc0Zlll19X0nmZvYsw0PQb192qy8uZ20qVvSWalRrTqitW/P7G2LVWTm36sfmzovGSL9m280qc8UN3Gzry77kqp17Mytvy1vyqrfMy4C6my2JiMsQf/AKSsYx/bDzdR/nQNH+cdD+Ei62M1rxDw7BNLGstpkbRWeNuzJInUH9DqqBeTXGGupFvXJnx/KLp21u4tCTyzjt1XqW9CJAB1U1Av41adSNeny089/wDBaW7jKLpyOl2d1BfWkN3aSrLbzoJI5F7MpGwaykgAknQHnXO+H8vBwje3mLvCVxs6vd45UHUPvckCjfUljzKB/Ew8q98ScSLexy2uVQY/EW0CXWSdpOYyoxKpB0H4mU8wG9gcvXmqwo3FOqouL4+WRqkJQznkSltkJM/cvfJGYsfDKRYzOQfGUAf0yqenU7Cs2/pGwPq3UxhxLf4lHv2MqySmWIsACYw/NGToDuAp7eej1qt8HZ2345tJZbOxurfGxyeG73CKomAH3FAJ6eR9unn0vNSHjkaY7z1Zr21la2ru9rAkPiHbiMcqsfUgdN+/esOThhuhDFNZNdFJFlQEAKjDsxJ9D6bPtXjKZi2xzLCVluLuRS0drbrzSOPXqQFHlzMQu+m9mo+LJ56Tnd7DHQjf9HEbt2Yj+ZgmlP5Bte9YSbMuSXEwW2Qy3DuMt1zlhafZ9siQyXlndNIY1Gl8R0aNdKO5IJ131oEi01X8hlrW94LyeQljIgS1uVnicb5Wj50kU+umVh71JYKdLrCY+4jcSJLbRurg75gVB3WD0b1KUoBSlKAUpSgFKUoDjHxQhuIeOy0Lqq3OPicc6cwYq7qR3Hba/vVXNv1FxkJ0kEX1gcvJGmvxaJPX3J/LVdQ+KmNhkmwGUuPEEEF58rctGwXljmHKGJ9A4j/esmN4RxGMnF2wluJY/qWS5k2I/cKNKCNd9bHrUa8+0Fvs2ChUi3LGV1P35/YizsZ1qm9FpL5kRwZhfkYpOIMwpgKxsYI5Rowxa2zsPJmA7dwOnQlhVYyl8+VyE97MpHinSofwIPur+3f3J9ameLeJFyzCzxzhrBCGeUdp2Hbl/kHffmdEdBtq5XvYFncVKk9pXi+8nwX6Y/Xw72Rr2rCKVClwXidJ+DN8bjgqOykdmmxlxLaOWHXQPMv6crL+1WPiLBQ5qBDziC8g5vl7jk5uXf3lZfxI2gGXz0CCCARzj4T33yXF+SxrkiPI2y3Mez08SM8rAe5Vgf7tdeqRWppSlB8Cwo1N6CmjlNpiZbiwhw+ejCZDEXEbBo5G+pVO45FboxDJtd+obfUGnFvCq8R475L5+a1TmVm0vPzlQwXezs/ePn6Vu8V5IrxJFk7bTW8TGwlRF20yrzM7jX+bYEAe0gGyy1KKyuoZCGUjYIOwRXJ3M5W9w3Rlpr9UXVKKq01vo3uFbu2x0FpgvlYbNI08O08JiUl0Nkdeofox0Sd6J2eut/N5KaGRMfjuU38y83Oy8y28fbxG/Xoq/iIPkGIqfEMslth7m8gUtNZqLqMAkbaIhwP15dfkasGPhmjiaW9KteznxLgr2Dfwr/Ko0o9hs9SavNmXErmm3PiitvYKjL1eYx9hDYRuIud5JW55p5W5pJn7czN5ny9AAAAAAKzzTR28Mk07hIo1Lux8lA2TVM4z+JeG4XnazCvf5BR9UELACM+jt5H2AJqX4NzkPHFnBe2tvLDZRtzXCyjvKp2sYP4gNBiR5co82AtG0iAoSkT2DxXh8Pw214hR5pGup4yQdPJKZWQ+oDMR7ivHCrmObN4/f0WWSdY9nssiJNr8gZWAHkAKnarnCjCfLcUXUZ3FJlBGp9THBEjfsysPzBrSSiyUpSgFKUoBSlKAUpSgIvifDQ8QcP3+JuNcl1CUDEb5G7q36MAf0rhcE91c2fy9+9wGiJhntJJmMaSIeVl5N8vQj0r6IrkXxLwxxXEaZSFdWeV0suuyXKr0/wBdB+6H1qRbbnSJTSf8kW7hJ08x5FZpSlXRSmMXpw+UxucQdcdciSTQ2fBb6ZAP7pP7V3PP5I2GFlurZlaVwsdsdcymRyFQ9O42wJ9gTXEYrWXIziwtoDcTTqR4Q7cvYsx8lG+pP5DZIBsdlfX+MxcGDzaAycN28lz4yseWaIIVhI6DYCmVSD2KD9Of2rdUaU3FSW/jOOfYXWzYynHDWmf7MkPLLfSmPZt7MfKW5ZuYnl14jb7klgFO/OPfnW1jrmawkmSaJhiwRyXBPSBiNlT6J2IbsCSOgA1r42H5ewt4i3Oyxjnfzdu7N+ZOz+tbNrkr6KyS3trKKFgG55LiTm+skkkIvdSST1ZT17VxlDoqk5urLC86+es66cJKEYxWpNyIsiMkihkYEMp8wah87ncjheErxI4Li4ycUfhWs0URk8XfQSHQOmA6kHQJHTodDRshk8dv5e4gniJ38q8Zjjj9oyOYoPY8wHYaqRuM7HaWr3F3byRpGNuwkj5R+rMP8dVttLuVrN9E1JP3EW4tOmit9YwcMwHCuQy2ahTL2+StbSSQtcXfyU0rAdz2Ukk+p9etfTPDeR4esba1wmIWW1hiQJDHNaSwq35M6gMxOyeuz1NVOxy1zmrfxIMXdWdqRvx75/BOuvUIpLEfmVBHnXnGXmQyRs7fFwyZhY7lGnyMCLFAEV+bozHTN0CnkJ11PQ6FWtG/r1KigoLt7CFO3pxjneL1xBmPs6BYLJBc5W5Jjs7UfjfQ2zeiLsFm8hodyAc3DuKXC4a2sBKZnQFppiNGWViWdz6bYk69684bERWL3F7LDD9pXreJdzoNlj2VQx6lVGlHbtvWyalKtyEKUpQClKUApSlAKUpQCo7iDD22ew9zjLzYjnTQdfvRsOquvuCAR+VSNKA+dcvBeY9pbG9Xkvba6hjl5R0b+kX6l/lZTsfnruDWWRiqjkQyOxCoi93YnSqPckgfrXRfi7g7e5xkGZVvCvLWaGMkD+3jMq/QfyJ5gfL6v4jVU4NtPnOJ7UsCY7WN7g+nN0RQf9cn+7Uy42h6PZVLmX+q+L5fHQqpWq6eNNcH4FitobbgjAtLKEnyl0R4jDp4smugHpGvX9N92brUbPKtecTEZaZ54MhA9lc7/s0LaKKB+EHquh/GN991tcVZE5LO3LA/0Nsxt4h6cp05/MsCPcKtY+FsF9sZiytpLQTYxZ/64X+79xnAPqSyjf59e4qk2bsiPoMrm61q1Vlt8VnVJdXLPw5Et3UldRhS9mPLxNvDTzW0r4TJN/XrRfpc9PmYeyyL69Oh9DUtW5xHw8sChMkssljDt7bJo2pbT2du46fj6qQNP6tCXGNnt7TxMrxNGmPP/fRQLDLID2HicxGz/KoJ8tVztzaShUxLRvv17seHI6uhdxcOvzzPVxfMbg2WOhN3fdOaJW0sQPZpG/CP3J8ga9W9gkWRiSZJM3nQOdLeJdRW2+zaJ5Yx/O5LHrrf3a2eFMfPxDaGPAIcRgEd0a71/WbhwdNyBt8vUHbvtvbfUdEw+IsMLafK4y2SCMsXfXVpGPdmY9WY+ZJJqytNlvjPRfN/x3EG4vt7SP0+pXrLgsXjrc8VypfuDtbCPfykf5qf7U+79PRRVuVVRQqAKoGgANACv2lXlOnCnHdgsIrpScnlilKV7PIpSlAKUpQClKUApSlAKUpQFB+Lt0UscTZo+jNdtI67+8iRt/xMlciuL24+0bmK3uJYoERI5VjYr4jdW0ddwAw6e/tXQvindCfi21tt/TZ2Bc+xlf8A/IR+9czt2EnizAhhLM7hh5jmOv8AACsX0tyxUf1Pw/osvs7aQutrZmsqEc+/l4m/jZ1gWdHOoo08Qew6717dB+9d34Mwn2NgbSKdNXjKZLg77SPosvuBpVB9FFcX4Ix7ZPjTGW/IWg+qSYjyVCrjfsSoX+9XV+OOObPhtTaxTW7ZBlB1K4CQg9i3XqfRR39qzb1ZVreEOLXnwNW2rWna7SrSisJ4fxSb+ZPZvOWGDtxNkJgpbfhxL1eQ+ij9uvYeZFcS4nv7a8yMuUt8TbQykFYYbeJQzHr1JA6sfM+gHp115MsmTu3uJ775m6lH1SSN9TAenYADr0HQdelWDhjhqfORi8nkktceesTIB4k/uNggJ7623loaJkV7i02dR6evPu569naUU3XuJ9HGOF26fEvfwqihj+H+HaCYTeNE00jj/OOzM4/RiV/SrZXN8bPF8O8itvK7jhnISfTLI/MLC4P8RPaN/Xsrb3oGukA7Gx2qvtbqld0lVpPKfnUsXFx0YpSlSDApSlAKUpQClKUApSlAKUpQClKUB88/EO9OQ4sy0aPuOS68FiPKKJFVl/WTmH+tVdupnh8NIowzSHkX0U6319tA/tW7eB7m7OSRXkS8MkxKgnReRpB09+c/tWtLHKs0UrxOsQDDnYa0x1rv19ah30K0qusW4xXu4Z8TsPs7VtKVj6tRKpOWHqs8cJY7vE82kt1j7uOTH3MsV4v1G6DfUg9vz9O3Q732OR18S5lupiZbmZi0k8h5ncnzJrXteeQi62AJUH0Edl6kfr16/wDLrnmlSGJpZW5UUbJqulKXs5Omo0KC+/cUn1vq7/m869Zu4ix+085jLExLMJbuMvG42pjVgz79uVWH66866jxJxWtg7WeMCSXK9HkYbSL2/mPt2Hn21VJxbLhrNjbkfalymp51P+Tp38JD69uZh59BvQI1x0GhUuz2BG9qRr3S9RcI9fa+zqXPjw4/M/tFtyNxdPoOWme7+zNkLq5yaOmSuJbpH+8krbQ/3fuj9BUpwdxpc8IqlhljLdYBekUwBeWxX0I7tGP3A9QBULSuqdnRUNyEVFLqWDmadzUhLezk79a3MF5bR3NpNHNBKoaOSNgysD5gjvWWuEcOZvI8KXJkxe5rFzufGs2kY/xRn8Df4Hz9R2PhzP47iPHLfYuYvHvlkjccskLjujr5Ef8AMbHWqyrRlSeGW9KtGqsxJSlKVqNopSlAKUpQClKUApSlAKUpQHzjh/8Asix/9NH/APEVmvADaTggEGNtg/lSlX8fY9xz0vbfeQdv/k8X+gP9lHVXlgR1DKZUBBGwfqFKVwtD86Pefdb7/Aqf8vwLDSlK70+DilKUAqW+G0jx/EtI43ZEmxrmVVOhIVYaLDz1vpulKi3n5TJdl+cjttKUqnLkUpSgFKUoBSlKAUpSgP/Z",
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
