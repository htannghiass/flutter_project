import 'package:fashion/export.dart';
import 'package:fashion/src/modules/user/views/login/components/login_with_social_media.dart';
import 'package:fashion/src/modules/user/views/login/widgets/text_form_field_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                InkWell(
                  onTap: () => AppRoutes.pop(),
                  radius: 5.0,
                  child: const Icon(Icons.arrow_back, size: 24.0),
                ),
                const SizedBox(height: 34.0),
                Text(
                  'Đăng ký',
                  style: appStyle.copyWith(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 50.0),
                const TextFormFieldLogin(
                  title: "Tên hiển thị",
                  hintText: "Nhập tên",
                ),
                const SizedBox(height: 8.0),
                const TextFormFieldLogin(
                  title: "Email",
                  hintText: "Nhập email",
                ),
                const SizedBox(height: 8.0),
                const TextFormFieldLogin(
                  title: "Mật khẩu",
                  hintText: "Nhập mật khẩu",
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 32.0,
                  ),
                  child: InkWell(
                    onTap: () => AppRoutes.pop(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn đã có tài khoản ?',
                          style: appStyle.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(width: 7.0),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(8.0),
                      shadowColor: MaterialStatePropertyAll(
                          primaryColor.withOpacity(0.25)),
                      backgroundColor:
                          const MaterialStatePropertyAll(primaryColor),
                    ),
                    child: Text(
                      "ĐĂNG KÝ",
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
