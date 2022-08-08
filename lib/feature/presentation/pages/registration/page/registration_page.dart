// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/presentation/pages/registration/controller/sign_in_cubit.dart';
import 'package:test_app/feature/presentation/pages/registration/controller/sign_in_state.dart';

// Project imports:

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        if (state is SignInLoading) {
          return SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff47B5FF),
                    Color(0xff1363DF),
                  ],
                ),
              ),
              child: const Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else if (state is SignInError) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('Error!!')],
                ),
              ),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: Column(
                  children: <Widget>[
                    const Spacer(
                      flex: 7,
                    ),
                    const Text(
                      'Авторизация',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(
                      flex: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 29, right: 29, bottom: 10),
                      child: TextField(
                        controller: _userNameController,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xffF2F2F2)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xffF2F2F2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xffF2F2F2),
                            ),
                          ),
                          hintText: "Логин",
                          hintStyle: const TextStyle(
                              fontSize: 16, color: Color(0xffF2F2F2)),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 29, right: 29, top: 10),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xffF2F2F2)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xffF2F2F2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xffF2F2F2),
                            ),
                          ),
                          hintText: "Пароль",
                          hintStyle: const TextStyle(
                              fontSize: 16, color: Color(0xffF2F2F2)),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff333333)),
                          minimumSize:
                              MaterialStateProperty.all(const Size(262, 65)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if ((_userNameController.text != "" ||
                              _passwordController.text != "")) {
                            context.read<SignInCubit>().signInUser(
                                  _userNameController.text,
                                  _passwordController.text,
                                  context,
                                );
                          }
                        },
                        child: const Text(
                          'Вход',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
