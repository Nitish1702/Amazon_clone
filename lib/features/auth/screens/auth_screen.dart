import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8),
            color: GlobalVariables.backgroundColor,
            child: Column(
              children: [
                const Text('Welcome',
                style: TextStyle(fontWeight: FontWeight.w500,fontSize:22),),
                ListTile(title: Text('createAccount',style: TextStyle(fontWeight: FontWeight.bold),),
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
                ListTile(title: Text('SignIn',style: TextStyle(fontWeight: FontWeight.bold),),
                  leading: Radio(
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (val){
                      setState(() {
                        _auth=val!;
                      });
                    } ,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
