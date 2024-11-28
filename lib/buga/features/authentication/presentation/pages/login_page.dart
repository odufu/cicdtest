import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/auth_elevated_button.dart';
import '../../../../core/widgets/auth_text_field.dart';
import '../../../home/presentation/pages/home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static route() => MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String baseUrl = "https://buga-api-1.onrender.com/api/v1";
  bool _isLoading = false;

  Future<void> _login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackbar("Email and password cannot be empty.", Colors.red);
      return;
    }

    final Uri url = Uri.parse('$baseUrl/auth/login');
    final Map<String, String> requestBody = {
      "email": email,
      "password": password,
    };

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          final Map<String, dynamic> user = responseData['data']['user'];
          await _saveUserData(user);
          _showSnackbar("Login successful!", Colors.green);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          _showSnackbar(responseData['message'] ?? "Login failed.", Colors.red);
        }
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        _showSnackbar(errorData['message'] ?? "An error occurred.", Colors.red);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showSnackbar(e.toString(), Colors.red);
    }
  }

  Future<void> _saveUserData(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", user['name']);
    await prefs.setString("email", user['email']);
    await prefs.setString("userType", user['userType']);
  }

  void _showSnackbar(String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Sign In",
        backAllowed: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Image.asset("assets/images/bugawelcome2a.png"),

            // AUTH FIELDS
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.2),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("Please, enter your details to Login"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      leadingIcon: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      hintText: "Email",
                      labelText: "Please Enter Your Email",
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    AuthTextField(
                      leadingIcon: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.lock,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      hintText: "Password",
                      isObscure: true,
                      labelText: "Please Enter Your Password",
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20),
                    AuthElevatedButton(
                      buttonText: _isLoading ? "Signing In..." : "Sign In",
                      onPressed: _isLoading ? null : _login,
                      isActive: true,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't Have an account?"),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/images/footerdecor.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
