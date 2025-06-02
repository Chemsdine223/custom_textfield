# Custom Textfield Widget for Flutter

A flexible, feature-rich custom textfield field for Flutter that supports labels, validation, styling, icons, counters, and more.

---

## Features

- Custom labels, hint text, and titles
- Request and validation error support
- Prefix/suffix icons
- Character counter
- Custom border, colors, and font styling
- Form integration
- Autofocus and read-only modes

---

## Getting Started

No prerequisites needed.

---

## Showcase

![Image](https://github.com/user-attachments/assets/a4162a0b-4550-4cc4-b5b6-1746562b6294)

---

## Usage

Here's how to use the `CustomInput` widget in your project:

```dart
final controller = TextEditingController();
final focusNode = FocusNode();

CustomInput(
  controller: controller,
  focusNode: focusNode,
  hintText: 'Enter your email',
  label: 'Email',
  title: 'Email Address',
  maxLength: 50,
  keyboardType: TextInputType.emailAddress,
  prefixIcon: Icon(Icons.email),
  suffixIcon: Icon(Icons.check_circle_outline),
  onChanged: (value) => print(value),
  validator: (value) =>
      value != null && value.contains('@') ? null : 'Invalid email',
  fontWeight: FontWeight.w500,
  hintFontWeight: FontWeight.w300,
  errorFontWeight: FontWeight.w600,
)
```

---

## Parameters

| Parameter | Type | Description |
|----------|------|-------------|
| `controller` | `TextEditingController?` | Controls the text being edited |
| `onChanged` | `ValueChanged<String?>?` | Callback on input change |
| `validator` | `String? Function(String?)?` | Custom validation logic |
| `focusNode` | `FocusNode` | Manages focus for the input |
| `labelStyle` | `TextStyle` | TextStyle class for customizing the label TextStyle |
| `maxLength` | `int?` | Max input character count (default: `32`) |
| `padding` | `EdgeInsetsGeometry?` | Padding inside the input container |
| `hintText` | `String?` | Placeholder text |
| `label` | `String?` | Static label above the input |
| `title` | `String?` | Label displayed inside the input |
| `requestErrorText` | `String?` | Text for API/request error state |
| `prefixIcon` | `Widget?` | Widget to display before the input |
| `suffixIcon` | `Widget?` | Widget to display after the input |
| `inputFormatters` | `List<TextInputFormatter>?` | Input constraints |
| `keyboardType` | `TextInputType?` | Keyboard type (default: `TextInputType.text`) |
| `readOnly` | `bool` | Whether the field is read-only |
| `obscureText` | `bool` | Whether the field is obscure |
| `requestError` | `bool` | Toggles request error appearance |
| `autofocus` | `bool?` | Autofocuses the field on build |
| `enableCounter` | `bool` | Shows character counter |
| `autovalidateMode` | `AutovalidateMode?` | Validation trigger mode |
| `fontSize`, `hintFontSize`, `errorFontSize`, `titleFontSize` | `double?` | Font sizes |
| `errorGap` | `double?` | Space between input and error text |
| `borderRadius` | `double?` | Corner radius for input box |
| `focusedBorderWidth`, `unfocusedBorderWidth` | `double?` | Border width |
| `fontWeight`, `hintFontWeight`, `errorFontWeight` | `FontWeight` | Font weights |
| `textColor`, `hintTextColor`, `errorTextColor`, `cursorColor`, `backgroundColor`, `focusedBorderColor`, `unfocusedBorderColor`, `errorBorderColor`, `titleColor`, `titleErrorColor` | `Color?` | Custom color settings |
| `boxShadow` | `List<BoxShadow>?` | Box shadow styling |

---

## Additional Info

This package is simple to integrate. Download it, import into your project, and enjoy a hassle-free, reusable, highly customizable input field!

For questions, feedback, or contributions, feel free to reach out at chemsdine223@gmail.com or contribute directly via GitHub @Chemsdine223.
