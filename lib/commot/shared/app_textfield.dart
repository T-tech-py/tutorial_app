
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';

enum TextFieldType {
  password,
  plainText,
}

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.suffix,
    this.prefixIcon,
    this.textInputType,
    this.focusNode,
    this.fillColor,
    this.borderRadius,
    this.suffixIcon,
    this.maxLines = 1,
    this.textFieldType = TextFieldType.plainText,
    this.readOnly = false,
    this.inputFormatters,
    this.onTap,
    this.enable,
    this.hitTextCollor, this.maxLength, this.onEditingComplete, this.heading,
  }) : super(key: key);
  final TextFieldType textFieldType;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? heading;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? hitTextCollor;
  final BorderRadius? borderRadius;
  final int maxLines;
  final int? maxLength;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool? enable;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final border = OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide:  BorderSide(color: AppColor.black.withOpacity(0.4)),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.heading != null)
        Text(widget.heading??'',
        style: theme.textTheme.bodySmall!.copyWith(
          fontSize: 12
        ),),
        const SizedBox(height: 5,),
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          autocorrect: false,
          enabled: widget.enable,
          onTap: widget.onTap,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          onEditingComplete: widget.onEditingComplete,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          readOnly: widget.readOnly,
          textCapitalization: widget.textCapitalization,
          keyboardType: widget.textInputType,
          obscureText:
          // ignore: avoid_bool_literals_in_conditional_expressions
          widget.textFieldType == TextFieldType.password ? _hideText : false,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            border: border,
            focusedBorder: border,
            enabledBorder: border,
            filled: false,
            fillColor: widget.fillColor,
            floatingLabelStyle: const TextStyle(color: Colors.grey),
            labelStyle: theme.textTheme.bodySmall!.copyWith(
              //color: AppColors.greyA3,
              fontSize: 12,
              // fontSize: 13.fontSize,
            ),
            hintStyle: theme.textTheme.labelSmall!.copyWith(
              color: widget.hitTextCollor,
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
            suffix: widget.suffix,
            suffixIcon: _suffix,
            prefixIcon: widget.prefixIcon,
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }

  Widget? get _suffix {
    if (widget.textFieldType == TextFieldType.password) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            _hideText = !_hideText;
          });
        },
        child: _hideText
            ? const Icon(
          Icons.visibility_off,
          color: AppColor.grey81,
        )
            : const Icon(
          Icons.visibility,
          color: AppColor.grey81,
        ),
      );
    }
    return widget.suffixIcon;
  }
}