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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimeAuthLayout(
      title: 'Buat Akun Baru',
      subtitle: 'Daftar untuk menyimpan anime favorit dan melacak tontonanmu.',
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimeAppTextField(
            label: 'Nama Lengkap',
            hint: 'Nama kamu',
            controller: _nameController,
            prefixIcon: Icons.person_outline_rounded,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
          ),

          const SizedBox(height: 16),

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
            hint: 'Buat kata sandi',
            textInputAction: TextInputAction.next,
          ),

          const SizedBox(height: 16),

          AnimeAppPasswordField(
            controller: _confirmController,
            label: 'Konfirmasi Kata Sandi',
            hint: 'Ulangi kata sandi',
            textInputAction: TextInputAction.done,
          ),

          const SizedBox(height: 24),

          AnimeAppButton(
            label: 'Daftar',
            onPressed: () {
              AnimeAppSnackBar.success(
                context,
                'Akun berhasil dibuat. Selamat datang!',
              );
              context.go(Routes.app);
            },
          ),

          const SizedBox(height: 20),
          const AnimeAuthDivider(),
          const SizedBox(height: 20),

          AnimeAppGoogleButton(
            label: 'Daftar dengan Google',
            onPressed: () {
              AnimeAppSnackBar.success(
                context,
                'Berhasil mendaftar dengan Google',
              );
              context.go(Routes.app);
            },
          ),
        ],
      ),
      footer: AnimeAuthFooter(
        prompt: 'Sudah punya akun?',
        actionLabel: 'Masuk',
        onActionTap: () => context.go(Routes.login),
      ),
    );
  }
}
