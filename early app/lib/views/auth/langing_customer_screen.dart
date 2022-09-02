import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor/controllers/auth_controller.dart';
import 'package:multi_vendor/controllers/snack_bar_controller.dart';
import 'package:multi_vendor/views/auth/customer_login_screen.dart';
import 'package:multi_vendor/views/customer_home_screen.dart';

class LandingCustomerScreen extends StatefulWidget {
  @override
  State<LandingCustomerScreen> createState() => _LandingCustomerScreenState();
}

class _LandingCustomerScreenState extends State<LandingCustomerScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisible = false;
  bool isLoading = false;

  Uint8List? _image;

  pickimageFromGalery() async {
    Uint8List img = await _authController.pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  pickimageFromCamera() {
    Uint8List img = _authController.pickimage(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }

  signup() async {
    setState(() {
      isLoading = true;
    });
    String res = await _authController.signUpUsers(_fullNameController.text,
        _emailController.text, _passwordController.text, _image);
    setState(() {
      isLoading = false;
    });

    if (res != 'Account Created') {
      return snackBar(res, context);
    } else {
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return CustomerLoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create Customer Account",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotoBold",
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.cyan,
                            backgroundImage: MemoryImage(
                              _image!,
                            ),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.cyan,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pickimageFromCamera();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pickimageFromGalery();
                            },
                            icon: Icon(
                              Icons.photo,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        signup();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Center(
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign Up !',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "RobotoBold",
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already Have An Account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: "RobotoItalic",
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CustomerLoginScreen();
                            }));
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: "RobotoBold",
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        fontFamily: "RobotoBoldItalic",
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create A Seller Account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            fontFamily: "RobotoItalic",
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ], //children
                ),
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}
