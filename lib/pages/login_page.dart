import 'package:first_app/config/app_roots.dart';
import 'package:first_app/config/app_strings.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  AppStrings.helloWelcome,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 233, 238, 252),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 233, 238, 252),
                  ),
                ),
                const Spacer(),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print('Forgot password button pressed');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 236, 239, 249),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 40, 33, 243),
                        decorationThickness: 2.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Direct navigation to Mainpage
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.main);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 240, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),

                const Spacer(),
                const Text(
                  'Or Sign in with',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 20),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print('Google is clicked');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/Google.png',
                              height: 28,
                              width: 28,
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              'Log in with Google',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 253, 245, 245),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print('Facebook is clicked');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/facebook.png',
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Log in with Facebook',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 244, 240, 240),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 243, 240, 33),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
