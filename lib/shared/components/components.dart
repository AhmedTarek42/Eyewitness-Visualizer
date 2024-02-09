import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';



Widget defualtButton({
  required VoidCallback onPress,
  double width = 327,
  double height=48,
   int backgroundColor=0 ,
  int boxShadowColor=0 ,
  required Color textColor ,
  bool isUpperCase = true,
  bool isImage = true,
  required String text,
  double borderSideOpacity=0.15000000596046448,
  String image='',

}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPress,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isImage? Container(
              width: 16,
              height: 16,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(children: [
                Image.asset(image)
              ]),
            ):const SizedBox(width: 0.0),
            isImage?const SizedBox(width: 8):const SizedBox(width: 0.0),
            Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.0,
            ),
          ),]
        ),
      ),
      decoration: ShapeDecoration(
        gradient: RadialGradient(
          center: Alignment(1, 0.25),
          radius: 0,
          colors: [Colors.white.withOpacity(0), Color(backgroundColor)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(borderSideOpacity),
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        shadows: [
          BoxShadow(
            color: Color(boxShadowColor),
            blurRadius: 25,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
    );

Widget defualtTextButton({
  required VoidCallback? function,
  required String text,
  required Color textColor,
}) => TextButton(
    onPressed: function,
    child: Text(text,style: TextStyle(color:textColor ),)
);

Widget defualtTextFeildForm(
    {
      required TextEditingController controller,
      required TextInputType type,
      required final FormFieldValidator<String> validate,
      required String label,
      required IconData prefixIcon,
      bool isPassword = false,
      IconData? suffix,
      VoidCallback? suffixPress,
      ValueChanged<String>? onSubmit,
      VoidCallback? onTap,
      Function? onChange,
    }) =>
    SizedBox(
      width: 327,
      height: 68,
      child: TextFormField(
        style: TextStyle(color: Color(0xFFFF7F37)),

        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: (s) {
          onChange!(s);
        },
        validator: validate,
        onTap: onTap,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 1, color: Color(0xFF353542),
              )),
          focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(width: 1, color: Color(0xFFFF7F37),
                )),
          labelStyle: TextStyle(color: Color(0xFF666680)),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(top: 20.0),
          prefixIcon: Icon(
            prefixIcon,
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.focused)
              ? Color(0xFFFF7F37)
              : Color(0xFF666680)),
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
            ),
            onPressed: suffixPress,
          ),
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.focused)
              ? Color(0xFFFF7F37)
              : Color(0xFF666680)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 1, color: Color(0xFF353542),
            ),
          ),

        ),
      ),
    );

Future navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

Future navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);

void showToast({
  required String text,
  required ToastStates state,
})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

//enum
enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {

    case ToastStates.SUCCESS:
      color= Colors.green;
      break;
    case ToastStates.ERROR:
      color= Colors.red;
      break;
    case ToastStates.WARNING:
      color= Colors.amber;
      break;
  }
  return color;
}

Widget buildStrengthIndicator(String password) {
  int strength = calculatePasswordStrength(password: password);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 75,
        height: 3.5,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength == 1 ? Colors.red : strength == 2 ? Colors.orange : strength == 3 ? Colors.yellow:strength == 4 ? Colors.green : Color(0xFF353542),

        ),
      ),
      Container(
        width: 75,
        height: 3.5,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength == 2 ? Colors.orange : strength == 3 ? Colors.yellow:strength == 4 ? Colors.green: Color(0xFF353542),
        ),
      ),
      Container(
        width: 75,
        height: 3.5,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength == 3 ? Colors.yellow :strength == 4 ? Colors.green: Color(0xFF353542),
        ),
      ),
      Container(
        width: 75,
        height: 3.5,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength >= 4 ? Colors.green : Color(0xFF353542),
        ),
      ),
    ],
  );
}

int calculatePasswordStrength({required String password}) {
  int strength = 0;
  // Example criteria: Check for at least 8 characters
  if (password.length >= 8) {
    strength++;
  }

  if (RegExp(r'[A-Z]').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'[0-9]').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    strength++;
  }

  return strength;
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

