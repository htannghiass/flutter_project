import 'package:fashion/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Hoặc đăng ký với'),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildButtonSocial(
              icon: SvgPicture.asset("assets/icons/google.svg"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonSocial({required Widget icon}) {
    return Container(
      width: 92.0,
      height: 64.0,
      padding: const EdgeInsets.fromLTRB(34, 20, 34, 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(24.0),
        ),
        color: lightColor,
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 8.0,
          )
        ],
      ),
      child: icon,
    );
  }
}
