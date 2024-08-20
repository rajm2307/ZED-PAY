import 'package:flutter/material.dart';
import 'package:zedpay/buttons/AppTextField.dart';
import 'package:zedpay/buttons/PrimaryButton.dart';
// import 'package:zedpay/buttons/PrimaryButton.dart';

class changeTPIN extends StatefulWidget {
  const changeTPIN({super.key});

  @override
  State<changeTPIN> createState() => _changeTPINState();
}

class _changeTPINState extends State<changeTPIN> {
  void _handleButtonTap() {
    print("Button was tapped!");
  }

  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _passwordController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(183, 28, 28, 1),
        toolbarHeight: 80,
        leading: Container(
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 255, 255, 255)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 0, 0, 0),
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Change T-PIN",
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            AppTextField(
              controller: _passwordController1,
              labelText: 'Current T-PIN',
              isPassword: _isObscure1,
              onChangedCallBack: (String value) {
                print("Password: $value");
              },
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure1 ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure1 = !_isObscure1;
                  });
                },
              ),
              textInputType: TextInputType.text,
              enableInteractiveSelection: false,
              maxLength: 20,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              controller: _passwordController2,
              labelText: 'New T-PIN',
              isPassword: _isObscure2,
              onChangedCallBack: (String value) {
                print("Password: $value");
              },
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure2 ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure2 = !_isObscure2;
                  });
                },
              ),
              textInputType: TextInputType.text,
              enableInteractiveSelection: false,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              controller: _passwordController3,
              labelText: 'Confirm New T-PIN',
              isPassword: _isObscure3,
              onChangedCallBack: (String value) {
                print("Password: $value");
              },
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure3 ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure3 = !_isObscure3;
                  });
                },
              ),
              textInputType: TextInputType.text,
              enableInteractiveSelection: false,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: PrimaryButton(
                textWidget: Text(
                  'Update T-PIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                onTap: _handleButtonTap,
                color: Color.fromRGBO(183, 28, 28, 1),
                disableColor: Colors.grey,
                isEnabled: true,
                disableToastMsg: 'The button is disabled',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
