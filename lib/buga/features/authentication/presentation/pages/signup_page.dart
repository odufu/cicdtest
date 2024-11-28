import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/auth_elevated_button.dart';
import '../../../../core/widgets/auth_text_field.dart';
import '../../../../core/widgets/drop_down_text_field.dart';
import 'login_page.dart';
import 'verification_code_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessAddressController =
      TextEditingController();
  bool _isLoading = false;

  String businessType = "wholesale";

  Future<void> _signUp() async {
    if (fullNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        businessAddressController.text.trim().isEmpty ||
        businessAddressController.text.trim().isEmpty) {
      _showSnackbar("Please provide Empty Fields.", Colors.red);
      return;
    }
    const String baseUrl =
        "https://buga-api-1.onrender.com/api/v1"; // Replace with actual baseUrl
    final String endpoint = "$baseUrl/auth/signup";
    final Map<String, dynamic> requestBody = {
      "name": fullNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "businessName": businessNameController.text.trim(),
      "businessType": businessType,
      "businessAddress": businessAddressController.text.trim(),
    };

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      setState(() {
        _isLoading = false;
      });

      final responseData = json.decode(response.body);

      if (response.statusCode == 201 && responseData['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Registration successful!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to OTP verification page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationCodePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message'] ?? 'Registration failed.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
        title: "Sign Up",
        backAllowed: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Let's Get You Started",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AuthTextField(
                      leadingIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      hintText: "Full Name",
                      labelText: "Enter Your Full Name",
                      controller: fullNameController,
                    ),
                    AuthTextField(
                      leadingIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      hintText: "Email",
                      labelText: "Enter Your Email",
                      controller: emailController,
                    ),
                    AuthTextField(
                      isObscure: true,
                      leadingIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      hintText: "Password",
                      labelText: "Enter Your Password",
                      controller: passwordController,
                    ),
                    AuthTextField(
                      leadingIcon: Icon(
                        Icons.business,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      hintText: "Business Name",
                      labelText: "Enter Your Business Name",
                      controller: businessNameController,
                    ),
                    AuthTextField(
                      leadingIcon: Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      hintText: "Business Address",
                      labelText: "Enter Your Business Address",
                      controller: businessAddressController,
                    ),
                    DropdownTextField(
                      hintText: 'Business Type',
                      labelText: 'Select Business Type',
                      items: ["Producer", "Wholesaler", "Retailer"],
                      selectedValue: businessType,
                      onChanged: (value) {
                        setState(() {
                          businessType = value ?? "Producer";
                        });
                      },
                    ),
                    AuthElevatedButton(
                      buttonText: _isLoading ? "Signing Up..." : "Sign Up",
                      onPressed: _isLoading ? null : _signUp,
                      isActive: true,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an account?"),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "LOGIN",
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
