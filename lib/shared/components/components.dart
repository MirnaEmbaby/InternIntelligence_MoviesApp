import 'package:flutter/material.dart';
import 'package:movies_app/shared/styles/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Widget defTextFormField({
  required bool isPass,
  required TextEditingController? controller,
  required String? text,
  required Function validate,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPass ? true : false,
    decoration: InputDecoration(
      hintText: text,
      suffixIcon: isPass
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_outlined,
              ),
            )
          : null,
    ),
    validator: (s) => validate(s),
  );
}

Widget defButton({
  required context,
  required String? text,
  required Function function,
}) {
  return MaterialButton(
    color: defPink,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    height: 50,
    padding: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 8.0,
    ),
    onPressed: () => function,
    child: Text(
      text!,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
