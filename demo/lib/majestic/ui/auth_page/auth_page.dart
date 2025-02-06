import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import './colors.dart';
import 'widgets/oauth_button.dart';
import 'widgets/section_separator.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: MediaQuery.of(context).size.height * .45,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffD9313E),
              Color(0xffA72734),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/logo-small.png',
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            const Text(
              'Majestic UI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Beautifully designed Flutter widgets that you can copy and paste into your apps.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mutedForegroundColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    Widget oAuthView() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OAuthButton(
            child: Image.network(
              'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/google-icon.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          OAuthButton(
            child: Image.network(
              'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/apple-icon.png',
              fit: BoxFit.contain,
            ),
          )
        ],
      );
    }

    Widget phoneNumberFieldView() {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: mutedForegroundColor,
                  blurRadius: 2,
                  offset: Offset.zero,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your phone number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: themeAccentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    }

    Widget footerView() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('By continuing you agree to our'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              {
                "label": "Terms of Service",
                "onClick": () => {print("Tapped Terms of Service!")}
              },
              {
                "label": "Privacy Policy",
                "onClick": () => {print("Tapped Privacy Policy!")}
              },
              {
                "label": "Content Policy",
                "onClick": () => {print("Tapped Content Policy!")}
              }
            ]
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.only(right: 6),
                    child: GestureDetector(
                      onTap: item["onClick"] as VoidCallback,
                      child: Text(
                        item["label"] as String,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      );
    }

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            header(),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Your heading goes here
                    const AutoSizeText(
                      'Get ready for best in class Flutter widgets.',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),

                    // A simple section separator
                    const SectionSeparator(text: 'Log in or sign up'),

                    // Phone number field view, this can even be separated into a stateful widget
                    phoneNumberFieldView(),

                    // Section separator yet again.
                    const SectionSeparator(text: "or"),

                    // oAuth button row
                    oAuthView(),
                    const SizedBox(height: 16),

                    // Simple Footer
                    footerView(),
                    const SizedBox(height: 8),
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
