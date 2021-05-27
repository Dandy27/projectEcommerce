import 'package:flutter/material.dart';
import 'package:projectecommerce/components/custom_surffix_icon.dart';
import 'package:projectecommerce/components/default_button.dart';
import 'package:projectecommerce/components/form_error.dart';
import 'package:projectecommerce/components/no_account_text.dart';
import 'package:projectecommerce/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04,),

            Text(
              "Forgot Password",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Please enter your email and we will send \nyou a link to return toyour account",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1,),
            ForgotPassForm(),
          ]),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onSaved: (newValue) => email = newValue!,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kEmailNullError)) {
              setState(() {
                errors.remove(kEmailNullError);
              });
            } else if (emailValidatorRegExp.hasMatch(value) &&
                errors.contains(kInvalidEmailError)) {
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
            // ignore: avoid_returning_null_for_void
            return null;
          },
          validator: (value) {
            if (value!.isEmpty && !errors.contains(kEmailNullError)) {
              setState(() {
                errors.add(kEmailNullError);
              });
            } else if (!emailValidatorRegExp.hasMatch(value) &&
                !errors.contains(kInvalidEmailError)) {
              setState(() {
                errors.add(kInvalidEmailError);
              });
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Enter your email',
            labelText: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustonSurffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30),),
        FormError(errors: errors),
        SizedBox(height: SizeConfig.screenHeight * 0.1,),
        DefaultButton(text: "Continue", press: () {}),
        SizedBox(height: SizeConfig.screenHeight * 0.1,),

        NoAccountText(),
      ],
    );
  }
}
