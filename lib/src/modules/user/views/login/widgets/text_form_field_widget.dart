import 'package:fashion/export.dart';

class TextFormFieldLogin extends StatefulWidget {
  const TextFormFieldLogin(
      {super.key, required this.title, required this.hintText});
  final String title;
  final String hintText;

  @override
  State<TextFormFieldLogin> createState() => _TextFormFieldLoginState();
}

class _TextFormFieldLoginState extends State<TextFormFieldLogin> {
  String get _title => widget.title;

  String get _hintText => widget.hintText;

  late ValueNotifier<bool> _showClearIcon;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _showClearIcon = ValueNotifier(false);
  }

  @override
  void dispose() {
    //Gỡ bỏ sự kiện lắng nghe khi widget bị gỡ bỏ
    _showClearIcon.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: borderStyle,
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.05),
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: appStyle.copyWith(
              color: textDisable,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4.0),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: _showClearIcon,
              builder: (context, bool isShow, Widget? child) {
                final Widget? icon = isShow
                    ? IconButton(
                        alignment: const Alignment(0, 1),
                        padding: const EdgeInsets.only(bottom: 5.0),
                        onPressed: () {
                          _controller.clear();
                          _showClearIcon.value = !isShow;
                        },
                        icon: const Icon(
                          Icons.clear,
                          size: 20,
                        ),
                      )
                    : null;
                return TextFormField(
                  controller: _controller,
                  style: appStyle.copyWith(
                    fontSize: 14.0,
                    color: darkColor,
                  ),
                  onChanged: (value) {
                    // if đầu dùng dể kiểm tra xem showIcon là false và giá trị input không rỗng thì
                    // bật showClearIcon và if dưới ngc lại
                    if (!isShow && value.isNotEmpty) {
                      _showClearIcon.value = !isShow;
                    }
                    if (isShow && value.isEmpty) {
                      _showClearIcon.value = !isShow;
                    }
                  },
                  decoration: inputDecoration.copyWith(
                    isDense: true,
                    hintStyle: appStyle.copyWith(
                      fontSize: 14.0,
                      color: textDisable,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: icon,
                    suffixIconColor: darkColor,
                    hintText: _hintText,
                    contentPadding: EdgeInsets.zero,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
