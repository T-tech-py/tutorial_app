
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppCustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final String? value;
  // final Widget Function(String value)? itemBuilder;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final VoidCallback? onTap;
  final bool isTransparent;
  final Color? backgroundColor;
  final double? radius;
  final double? iconSize;
  final double? fontSize;

  const AppCustomDropdown({
    Key? key,
    required this.items,
    this.value,
    // required this.itemBuilder,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.isTransparent = false,
    this.backgroundColor,
    this.radius,
    this.iconSize,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: BorderSide(color: AppColor.black.withOpacity(0.4)),
    );
    return DropdownButtonFormField<T>(

      isExpanded: true,
      // value: null,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColor.black.withOpacity(0.73),
        size: iconSize ?? 16,
      ),
      dropdownColor: AppColor.white,
      // padding: EdgeInsets.zero,
      decoration: InputDecoration(
        // labelText: labelText?.tr(),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        filled: true,
        fillColor: isTransparent
            ? AppColor.transparent
            : backgroundColor ?? AppColor.white,
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.all(14),
        hintText: hintText,
      ),

      // hint: const AppText('Select from category'),
      selectedItemBuilder: (context) {
        return List.generate(
          items.length,
              (index) {
            final item = items[index];
            return Text(
              item.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize:  13,
              ),
            );
          },
        );
      },
      items: List.generate(
        items.length,
            (index) {
          final item = items[index];
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              item.toString(),
              style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize:  13,
              ),
            ),
          );
        },
      ),
      onChanged: onChanged,
      validator: (value) {
        return null;
        // if (value == null || value.isEmpty) {
        //   return 'required_field_validation_error'.tr();
        // }
        // return null;
      },
    );
  }
}

class AppTitleCustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final String? value;
  final String title;
  // final Widget Function(String value)? itemBuilder;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final VoidCallback? onTap;
  final bool isTransparent;
  final Color? backgroundColor;
  final double? radius;
  final double? iconSize;
  final double? fontSize;

  const AppTitleCustomDropdown({
    Key? key,
    required this.items,
    this.value,
    // required this.itemBuilder,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.isTransparent = false,
    this.backgroundColor,
    this.radius,
    this.iconSize,
    this.fontSize, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: BorderSide(color: AppColor.black.withOpacity(0.4)),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 12,

          ),),
        const SizedBox(height: 5,),
        DropdownButtonFormField<T>(

          isExpanded: true,
          // value: null,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColor.black.withOpacity(0.73),
            size: iconSize ?? 16,
          ),
          dropdownColor: AppColor.white,
          // padding: EdgeInsets.zero,
          decoration: InputDecoration(
            // labelText: labelText?.tr(),
            border: border,
            focusedBorder: border,
            enabledBorder: border,
            filled: true,
            fillColor: isTransparent
                ? AppColor.transparent
                : backgroundColor ??  AppColor.transparent,
            floatingLabelStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.all(14),
            hintText: hintText,
          ),

          // hint: const AppText('Select from category'),
          selectedItemBuilder: (context) {
            return List.generate(
              items.length,
                  (index) {
                final item = items[index];
                return Text(
                  item.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize:  13,
                  ),
                );
              },
            );
          },
          items: List.generate(
            items.length,
                (index) {
              final item = items[index];
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.toString(),
                  style:  Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize:  13,
                  ),
                ),
              );
            },
          ),
          onChanged: onChanged,
          validator: (value) {
            return null;
            // if (value == null || value.isEmpty) {
            //   return 'required_field_validation_error'.tr();
            // }
            // return null;
          },
        ),
      ],
    );
  }
}