import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/auth_elevated_button.dart';
import 'login_page.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _isLoading = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String _getCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  Future<void> _verifyCode() async {
    final otpCode = _getCode();
    if (otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit code.")),
      );
      return;
    }

    final url = Uri.parse("https://buga-api-1.onrender.com/api/v1/auth/verify");
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({"otpCode": otpCode});

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      setState(() {
        _isLoading = false;
      });

      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(responseBody["message"] ?? "Login successful!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(responseBody["message"] ?? "Verification failed.")),
        );
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context)
            .unfocus(); // Dismiss the keyboard on the last box
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Verify Login",
        backAllowed: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Enter the 6-digit code sent to you',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        onChanged: (value) => _onChanged(value, index),
                        decoration: const InputDecoration(
                          counterText: "", // Hides the character counter
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                AuthElevatedButton(
                  buttonText: _isLoading ? "Verifying..." : "Verify Code",
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  color: Theme.of(context).colorScheme.onSecondary,
                  onPressed: _isLoading ? null : _verifyCode,
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/footerdecor.png"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
