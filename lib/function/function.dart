import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson/login/login.dart';
import 'package:lesson/dialog/dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Login Page Content
Widget buildLogin(WidgetRef ref, context) {
  bool isChecked = ref.watch(isCheckedProvider);
  bool obscureText = ref.watch(obscureTextProvider);
  final emailController = ref.watch(emailControllerProvider);
  final passwordController = ref.watch(passwordControllerProvider);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Enter your email address',
            labelStyle: TextStyle(color: Colors.black),
            prefixIcon: const Icon(Icons.person_2_outlined),
            filled: true,
            fillColor: const Color.fromRGBO(245, 245, 245, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded border
              borderSide: BorderSide.none, // Remove border for a cleaner look
            ),
          ),
        ),
        SizedBox(height: 20.h),
        TextFormField(
          controller: passwordController,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            labelText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            suffixIcon: IconButton(
              onPressed: () {
                ref.read(obscureTextProvider.notifier).state =
                    !ref.read(obscureTextProvider);
              },
              icon: Icon(
                ref.watch(obscureTextProvider)
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.black,
              ),
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                ref.read(isCheckedProvider.notifier).state = !isChecked;
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isChecked ? Colors.black : Colors.transparent,
                      border: Border.all(width: 2.w),
                    ),
                    child: Center(
                      child: Icon(
                        isChecked ? Icons.check : null,
                        color: Colors.white,
                        size: 13.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Remind me',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(child: Text("Forgot Password ")),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () async {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
              } else {
                showLoadingDialog(context);
                await Future.delayed(const Duration(seconds: 3));
                Navigator.pushReplacementNamed(context, "/home");
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            child: Text("Sign In"),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Alreay have an acoount?"),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Log In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // This makes it circular
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/google.svg",
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // This makes it circular
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/facebook.svg",
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // This makes it circular
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/apple.svg",
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text("Skip In Later"),
      ],
    ),
  );
}

//Sign up page content
Widget buildSignup() {
  return Center(child: Text("Sign Up Page"),);
}

Widget bookList() {
  return SizedBox(
    height: 90.h,
    child: Card(
      child: Center(
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(
              8.0,
            ), // Adjust for rounded corners
            child: Container(
              //height: 70.h,
              color: Colors.pink[50], // Background color
              padding: EdgeInsets.all(8.0), // Padding for spacing
              child: Image.asset(
                "assets/book.png",
                width: 40.h, // Adjust size
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            "Mathematics Lessons",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Lessons 2/2"),
        ),
      ),
    ),
  );
}
