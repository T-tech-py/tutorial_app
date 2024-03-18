
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    required this.text,
    this.color, this.width,
    required this.onTap,  this.addBorder =false,this.bg = AppColor.transparent});
  final String text;
  final double? width;
  final Color? color;
  final Color? bg;
  final bool addBorder;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width:width?? 272,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:!addBorder? AppColor.primary:
            bg,
          borderRadius: BorderRadius.circular(12),
          border:addBorder? Border.all(color: AppColor.primary):
           Border.all(color:AppColor.transparent)
        ),
        child: Text(
          text,
          style: theme.textTheme.labelMedium!.copyWith(
            fontSize: 16,
            color: color,
          ),
        ),
      ),
    );
  }
}
