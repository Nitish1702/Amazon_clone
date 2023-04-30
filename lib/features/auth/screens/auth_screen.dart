import 'package:amazon_clone/common/custom_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/common/custom_textfield.dart';

enum Auth{
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String routeName='/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth= Auth.signup;
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  GlobalKey<FormState> _signUpformkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            // color: GlobalVariables.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome',
                style: TextStyle(fontWeight: FontWeight.w500,fontSize:22,),),
                ListTile(title: const Text('createAccount',style: TextStyle(fontWeight: FontWeight.bold),),
                  tileColor: _auth==Auth.signup ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (val){
                      setState(() {
                        _auth=val!;
                      });
                    } ,
                  ),
                ),
                if(_auth==Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Form(
                          key: _signUpformkey,
                          child: Column(
                            children: [
                              CustomTextfield(hinText:'Name',controller: _nameController,),
                              SizedBox.fromSize(size:const Size(0,8),),
                              CustomTextfield(hinText:'Email',controller: _emailController,),
                              SizedBox.fromSize(size:const Size(0,8),),
                              CustomTextfield(hinText:'Password',controller: _passwordController,),
                            ],
                          ),
                        ),
                      const SizedBox(height:8),
                      CustomButton(callback: (){}, text: 'Sign Up',),
                      ],
                    ),
                  ),
                ListTile(title: Text('SignIn',style: TextStyle(fontWeight: FontWeight.bold)),
                  tileColor: _auth==Auth.signin ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (val){
                        setState(() {
                          _auth=val!;
                        });
                        },
                      ),

                  ),
                if(_auth==Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Form(
                          key: _signUpformkey,
                          child: Column(
                            children: [
                              CustomTextfield(hinText:'Email',controller: _emailController,),
                              // SizedBox.fromSize(size:const Size(0,8),),
                              // CustomTextfield(hinText:'Name',controller: _nameController,),
                              SizedBox.fromSize(size:const Size(0,8),),
                              CustomTextfield(hinText:'Password',controller: _passwordController,),
                            ],
                          ),
                        ),
                        const SizedBox(height:8),
                        CustomButton(callback: (){}, text: 'Sign In',),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
