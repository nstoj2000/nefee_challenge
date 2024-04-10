import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';

class DemoFormTextField extends StatefulWidget {
  const DemoFormTextField({
    super.key,
    this.validator,
    required this.hintText,
    required this.name,
    this.onSubmitted,
    this.initialValue,
    this.label,
    this.expandedHeight,
    this.onChanged,
    this.fieldColor = AppColors.navyLight,
    this.suffixIcon,
    this.readOnly = false,
    this.onTapOutside,
    this.focusNode,
    required this.onEditingComplete,
  });

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final String hintText;
  final double? expandedHeight;
  final String name;
  final String? label;
  final Color fieldColor;
  final void Function(String?)? onSubmitted;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function(dynamic _)? onTapOutside;
  final FocusNode? focusNode;
  final VoidCallback onEditingComplete;
  @override
  State<DemoFormTextField> createState() => _DemoFormTextFieldState();
}

class _DemoFormTextFieldState extends State<DemoFormTextField> {
  bool visible = false;
  bool? valid;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent),
    );
    final isPassword = widget.name.contains('password');

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      constraints: BoxConstraints.loose(Size(450, 500)),
      margin: const EdgeInsets.only(bottom: 20),
      height: widget.expandedHeight ?? ((valid != null && !valid!) ? 100 : 65),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Expanded(
            child: FormBuilderTextField(
              onTapOutside: widget.onTapOutside,
              name: widget.name,
              readOnly: widget.readOnly,
              initialValue: widget.initialValue,
              validator: widget.validator,
              maxLines: widget.expandedHeight == null ? 1 : null,
              expands: widget.expandedHeight != null,
              onChanged: _onChanged,
              focusNode: widget.focusNode,
              textAlignVertical: widget.expandedHeight != null
                  ? TextAlignVertical.top
                  : TextAlignVertical.center,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: AppColors.grey),
                filled: true,
                fillColor: widget.fieldColor,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                errorBorder: border,
                errorStyle: const TextStyle(color: Colors.red),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: widget.expandedHeight != null ? 16 : 8,
                ),
              ),
              onEditingComplete: () {
                widget.onEditingComplete.call();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onSubmitted: widget.onSubmitted,
              obscureText: isPassword && !visible,
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(String? value) {
    widget.onChanged?.call(value);
    _validate(value);
  }

  void _validate(String? value) {
    final validated = widget.validator?.call(value);
    setState(() {
      valid = validated == null;
    });
  }
}
