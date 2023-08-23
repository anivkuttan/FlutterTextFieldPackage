import 'package:flutter/material.dart';

class HedderAndBody extends StatelessWidget {
  final bool isEdit;
  final String? titleText;
  final String? bodyText;
  final Function(String)? textFieldOnChanged;
  final Function(String)? dropDownOnChanged;
  final bool validate;
  final String? errorMessage;
  final List<DropdownMenuItem<String>>? items;
  HedderAndBody({
    super.key,
    this.isEdit = false,
    this.validate = false,
    this.items,
    this.textFieldOnChanged,
    this.dropDownOnChanged,
    this.titleText = 'TITLE',
    this.bodyText = 'Body Text',
    this.errorMessage,
  }) {
    assert(
      items == null && bodyText != null && titleText != null,
    );
  }
  HedderAndBody.dropDown({
    super.key,
    required this.titleText,
    required this.items,
    required this.validate,
    required this.isEdit,
    required this.dropDownOnChanged,
    this.textFieldOnChanged,
    this.errorMessage,
    required this.bodyText,
  }) {
    assert(items != null);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: isEdit
          ? ((items == null)
              ? _textField(border: const UnderlineInputBorder())
              : _dropDown())
          : _textColumn(),
    );
  }

  Column _textColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titleText ?? '',
//              style: AppStyle.style16BoldappBlueColor
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          bodyText ?? '',
//           style: AppStyle.style14RegularBlack,
        ),
      ],
    );
  }

  Column _textField({InputBorder? border}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titleText ?? '',
//              style: AppStyle.style16BoldappBlueColor
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: bodyText,
          validator: (v) {
            if (validate) {
              if (v == null) {
                return errorMessage ?? '';
              }
            }
            return null;
          },
          onChanged: (value) {
            textFieldOnChanged!(value);
          },
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Phone',
            border: border ?? const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Column _dropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'hello1',
//                    style: AppStyle.style16BoldappBlueColor
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField<String>(
          value: bodyText,
          menuMaxHeight: 300,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) {
            if (v == null) {
              return 'Please select';
            } else {
              return null;
            }
          },
          items: items,
          onChanged: (value) {
            // var selectedItem =
            //     items!.where((element) => element.value == value);
            // dropDownOnChanged!();
          },
          decoration: const InputDecoration(
            hintText: 'Phone',
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
