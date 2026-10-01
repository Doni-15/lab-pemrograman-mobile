import 'package:anime_verse/config/routes.dart';
import 'package:anime_verse/screens/auth/widgets/anime_auth_divider.dart';
import 'package:anime_verse/screens/auth/widgets/anime_auth_footer.dart';
import 'package:anime_verse/screens/auth/widgets/anime_auth_layout.dart';
import 'package:anime_verse/widgets/anime_app_button.dart';
import 'package:anime_verse/widgets/anime_app_google_button.dart';
import 'package:anime_verse/widgets/anime_app_password_field.dart';
import 'package:anime_verse/widgets/anime_app_snack_bar.dart';
import 'package:anime_verse/widgets/anime_app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimeAuthLayout(
      title: 'Selamat Datang Kembali',
      subtitle: 'Masuk untuk melanjutkan menonton anime favoritmu.',
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimeAppTextField(
            label: 'Email',
            hint: 'nama@email.com',
            controller: _emailController,
            prefixIcon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
          ),

          const SizedBox(height: 16),

          AnimeAppPasswordField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                AnimeAppSnackBar.comingSoon(context, 'Lupa kata sandi');
              },
              child: const Text('Lupa kata sandi?'),
            ),
          ),

          const SizedBox(height: 8),

          AnimeAppButton(
            label: 'Masuk',
            onPressed: () {
              AnimeAppSnackBar.success(
                context,
                'Berhasil masuk. Selamat datang!',
              );
              context.go(Routes.app);
            },
          ),

          const SizedBox(height: 20),
          const AnimeAuthDivider(),
          const SizedBox(height: 20),

          AnimeAppGoogleButton(
            onPressed: () {
              AnimeAppSnackBar.success(context, 'Berhasil masuk dengan Google');
              context.go(Routes.app);
            },
          ),
        ],
      ),
      footer: AnimeAuthFooter(
        prompt: 'Belum punya akun?',
        actionLabel: 'Daftar',
        onActionTap: () => context.go(Routes.register),
      ),
    );
  }
}
