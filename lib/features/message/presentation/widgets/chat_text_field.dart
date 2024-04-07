import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/image_pick.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final MyAppDarkColor _appDarkColor = MyAppDarkColor();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _appDarkColor.secondaryText),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: _appDarkColor.secondaryText),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: "Message",
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  filled: true,
                  fillColor: MyAppDarkColor().bottomNavigationBarBackground,
                ),
                style: Theme.of(context).textTheme.labelLarge,
              )),
              const SizedBox(width: 10),
              _ChatIconButton(
                icon: IconlyBold.image_2,
                callback: () {
                  ImagePick().getImage();
                },
                darkColor: _appDarkColor,
              ),
              const SizedBox(width: 10),
              _ChatIconButton(
                callback: () {},
                icon: IconlyBold.send,
                darkColor: _appDarkColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatIconButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData icon;
  final MyAppDarkColor darkColor;
  const _ChatIconButton(
      {required this.icon, required this.callback, required this.darkColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyAppDarkColor().secondaryText),
        borderRadius: BorderRadius.circular(100),
        color: MyAppDarkColor().bottomNavigationBarBackground,
      ),
      child: IconButton(
        onPressed: () {
          callback();
        },
        icon: Icon(
          icon,
          size: 25,
          color: MyAppDarkColor().primaryText,
        ),
      ),
    );
  }
}