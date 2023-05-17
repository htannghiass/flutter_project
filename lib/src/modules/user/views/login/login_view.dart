import 'package:fashion/export.dart';
import 'package:fashion/src/modules/user/views/login/components/login_with_social_media.dart';
import 'package:fashion/src/modules/user/views/login/widgets/text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldBackground,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 34.0),
                Text(
                  'Đăng nhập',
                  style: appStyle.copyWith(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 50.0),
                const TextFormFieldLogin(
                  title: "Email",
                  hintText: "Nhập Email",
                ),
                const SizedBox(height: 8.0),
                const TextFormFieldLogin(
                  title: "Password",
                  hintText: "Nhập mật khẩu",
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 32.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => AppRoutes.pushNamed(signUpPath),
                      child: Text(
                        'Đăng ký',
                        style: appStyle.copyWith(
                          fontSize: 14.0,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () => AppRoutes.pushNamed(profilePath),
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(8.0),
                      shadowColor: MaterialStatePropertyAll(
                          primaryColor.withOpacity(0.25)),
                      backgroundColor:
                          const MaterialStatePropertyAll(primaryColor),
                    ),
                    child: Text(
                      'ĐĂNG NHẬP',
                      style: appStyle.copyWith(
                        fontSize: 14.0,
                        color: lightColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const LoginWithSocialMedia(),
                const SizedBox(height: 45.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
