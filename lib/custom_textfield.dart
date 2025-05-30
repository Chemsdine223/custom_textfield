import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable input widget that supports validation,
/// custom styling, icons, labels, hint text, and error display.
class CustomTextfield extends StatefulWidget {
  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Called when the user changes the text.
  final ValueChanged<String?>? onChanged;

  /// Function that validates the input.
  final String? Function(String?)? validator;

  /// The focus node for managing focus state.
  final FocusNode focusNode;

  /// The maximum length of input text.
  final int? maxLength;

  /// Padding around the input field.
  final EdgeInsetsGeometry? padding;

  /// Text displayed when the input is empty.
  final String? hintText;

  /// Optional label displayed above the input field.
  final String? label;

  /// Title displayed inside the input field (as labelText).
  final String? title;

  /// Error text displayed for request-based errors.
  final String? requestErrorText;

  /// Widget to display before the input field.
  final Widget? prefixIcon;

  /// Widget to display after the input field.
  final Widget? suffixIcon;

  /// Formatters applied to the input field.
  final List<TextInputFormatter>? inputFormatters;

  /// Type of keyboard to use for the input.
  final TextInputType? keyboardType;

  /// Whether the input is read-only.
  final bool readOnly;

  /// Whether to show a request error border and message.
  final bool requestError;

  /// Whether the field should automatically gain focus.
  final bool? autofocus;

  /// Whether the field has an obscure text.
  final bool obscureText;

  /// Whether to display the character counter.
  final bool enableCounter;

  /// Mode for auto-validating the field.
  final AutovalidateMode? autovalidateMode;

  /// Font size of the input text.
  final double? fonSize;

  /// Font size of the error text.
  final double? errorFonSize;

  /// Font size of the hint text.
  final double? hintFonSize;

  /// Font size of the title text.
  final double? titleFonSize;

  /// Space between the input field and the error message.
  final double? errorGap;

  /// Border radius of the input field.
  final double? borderRadius;

  /// Font weight of the error text.
  final FontWeight? errorFontWeight;

  /// Font weight of the input text.
  final FontWeight? fontWeight;

  /// Font weight of the hint text.
  final FontWeight? hintFontWeight;

  /// Color of the input text.
  final Color? textColor;

  /// Color of the error text.
  final Color? errorTextColor;

  /// Color of the hint text.
  final Color? hintTextColor;

  /// Color of the cursor in the input field.
  final Color? cursorColor;

  /// Background color of the input container.
  final Color? backgroundColor;

  /// Border color when the field is focused.
  final Color? focusedBorderColor;

  /// Border color when the field is unfocused.
  final Color? unfocusedBorderColor;

  /// Border color when the field has an error.
  final Color? errorBorderColor;

  /// Color of the title text when there is no error.
  final Color? titleColor;

  /// Color of the title text when there is an error.
  final Color? titleErrorColor;

  /// List of box shadows to apply to the input container.
  final List<BoxShadow>? boxShadow;

  /// Creates a [CustomTextfield] widget.
  const CustomTextfield({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    required this.focusNode,
    this.maxLength = 32,
    this.padding,
    this.hintText = '',
    this.label,
    this.title,
    this.requestErrorText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.requestError = false,
    this.autofocus = false,
    this.obscureText = false,
    this.enableCounter = false,
    this.autovalidateMode,
    this.fonSize,
    this.errorFonSize,
    this.hintFonSize,
    this.titleFonSize,
    this.errorGap,
    this.borderRadius,
    this.errorFontWeight,
    this.fontWeight,
    this.hintFontWeight,
    this.textColor,
    this.errorTextColor,
    this.hintTextColor,
    this.cursorColor,
    this.backgroundColor,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    this.errorBorderColor,
    this.titleColor,
    this.titleErrorColor,
    this.boxShadow,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  /// Indicates whether the input field currently has focus.
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    // Listen for changes in focus.
    widget.focusNode.addListener(_onFocusChange);
  }

  /// Updates the state when the focus changes.
  void _onFocusChange() {
    setState(() {
      hasFocus = widget.focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    // Clean up the focus listener when the widget is removed.
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final currentValue = widget.controller?.text ?? value ?? '';
        return widget.validator?.call(currentValue);
      },
      builder: (state) {
        /// Whether the input field has a validation error.
        bool hasError = state.hasError;

        /// Whether there is a request-based error.
        bool requestError = widget.requestError;

        /// The current input value.
        final currentText = widget.controller?.text ?? state.value ?? '';

        /// The length of the current input text.
        final currentLength = currentText.length;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Optional label text
            if (widget.label != null && widget.label!.isNotEmpty)
              Text(
                widget.label ?? '',
                style: TextStyle(
                  color: widget.textColor ?? Colors.black,
                  fontSize: widget.fonSize ?? 16,
                  fontWeight: widget.errorFontWeight,
                ),
              ),
            if (widget.label != null && widget.label!.isNotEmpty)
              const SizedBox(height: 4),

            // Input container with decoration and optional icons
            Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                boxShadow: widget.boxShadow,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                border: Border.all(
                  width: (hasFocus || hasError || requestError) ? 1 : .5,
                  color: hasError || requestError
                      ? widget.errorBorderColor ?? Colors.red
                      : (hasFocus
                          ? widget.focusedBorderColor ?? Colors.black
                          : widget.unfocusedBorderColor ??
                              Colors.grey.shade400),
                ),
                color: widget.backgroundColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 4),
                  if (widget.prefixIcon != null) widget.prefixIcon!,
                  const SizedBox(width: 4),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Main input field
                        TextFormField(
                          onTapOutside: (event) {
                            widget.focusNode.unfocus();
                          },
                          textInputAction: TextInputAction.done,
                          readOnly: widget.readOnly,
                          keyboardType: widget.keyboardType,
                          inputFormatters: widget.inputFormatters,
                          cursorColor: state.hasError
                              ? widget.errorTextColor ?? Colors.red
                              : widget.cursorColor ?? Colors.black,
                          style: TextStyle(
                            fontSize: widget.fonSize ?? 16,
                            color: state.hasError || requestError
                                ? widget.errorTextColor ?? Colors.red
                                : widget.textColor ?? Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                          obscureText: widget.obscureText,
                          maxLength: widget.maxLength,
                          autofocus: widget.autofocus!,
                          controller: widget.controller,
                          focusNode: widget.focusNode,
                          decoration: InputDecoration(
                            counterText: '',
                            label: widget.title != null
                                ? Text(
                                    widget.title ?? '',
                                    style: TextStyle(
                                      fontSize: widget.fonSize,
                                      color: state.hasError || requestError
                                          ? widget.titleErrorColor ?? Colors.red
                                          : widget.titleColor ?? Colors.black,
                                      fontWeight: widget.fontWeight,
                                    ),
                                  )
                                : null,
                            border: InputBorder.none,
                            hintText: widget.hintText!,
                            hintStyle: TextStyle(
                              fontWeight: widget.hintFontWeight,
                              fontSize: widget.hintFonSize,
                              color: hasError || requestError
                                  ? widget.errorTextColor ??
                                      Theme.of(context).colorScheme.error
                                  : widget.hintTextColor ??
                                      Theme.of(context).disabledColor,
                            ),
                          ),
                          onChanged: (value) {
                            if (widget.onChanged != null) {
                              widget.onChanged!(value);
                            }
                            state.didChange(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  if (widget.suffixIcon != null) widget.suffixIcon!,
                ],
              ),
            ),

            // Optional error message and character counter
            SizedBox(height: widget.errorGap ?? 2),
            Row(
              children: [
                if (hasError || requestError)
                  Expanded(
                    flex: 8,
                    child: Text(
                      state.errorText ?? widget.requestErrorText ?? '',
                      style: TextStyle(
                        color: widget.errorTextColor ?? Colors.red,
                        fontSize: widget.errorFonSize ?? 16,
                        height: 0,
                        fontWeight: widget.errorFontWeight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                const Spacer(flex: 1),
                if (widget.enableCounter)
                  Text(
                    '$currentLength / ${widget.maxLength}',
                    textAlign: TextAlign.end,
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
