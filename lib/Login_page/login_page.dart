import 'package:flutter/material.dart';
import 'package:zedpay/Login_page/create_account_modal_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obscureText = true;
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();

  void _createAccountOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: create_account_modal_page(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromRGBO(245, 245, 245, 1),
                const Color.fromRGBO(245, 245, 245, 1),
                const Color.fromRGBO(247, 220, 220, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/image.png'),
              backgroundColor: Colors.white,
              radius: 55.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 380,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.w400),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 1),
                  width: 380,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    controller: _controller2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color.fromRGBO(183, 28, 28, 1),
                          )),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.w400),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      border: InputBorder.none,
                    ),
                    obscureText: obscureText,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Forget Password logic
                      },
                      child: Text(
                        'Forget Password',
                        style: TextStyle(color: Color.fromRGBO(183, 28, 28, 1)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                ),
                Container(
                  width: 380,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    height: 60,
                    elevation: 0,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(183, 28, 28, 1),
                    onPressed: () {
                      print('MaterialButton pressed');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _createAccountOverlay();
                      },
                      child: Text(
                        'Create account',
                        style: TextStyle(
                            color: Color.fromRGBO(183, 28, 28, 1),
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
