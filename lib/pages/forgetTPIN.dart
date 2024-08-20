import 'package:flutter/material.dart';
import 'package:zedpay/buttons/AppTextField.dart';
import 'package:zedpay/buttons/PrimaryButton.dart';
import 'package:zedpay/pages/successfully_page.dart';
// import 'package:zedpay/buttons/PrimaryButton.dart';

class forgetTPIN extends StatefulWidget {
  const forgetTPIN({super.key});

  @override
  State<forgetTPIN> createState() => _forgetTPINState();
}

class _forgetTPINState extends State<forgetTPIN> {
  bool _isValid = false;

  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isSubmitted = false;

  final TextEditingController _passwordController4 = TextEditingController();
  final TextEditingController _passwordController5 = TextEditingController();
  final TextEditingController _passwordController6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController4.addListener(_validateInput);
  }

  void _validateInput() {
    // final text = _passwordController4.text;
    setState(() {
      _isValid = RegExp(r'^ZP \d{8}$').hasMatch(_passwordController4.text);
      
    });
    // print(_isValid);
    _isSubmitted = false;
  }

  @override
  void dispose() {
    _passwordController4.dispose();
    _passwordController5.dispose();
    _passwordController6.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      _isSubmitted = true;
    });
  }

  void _handleButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => successfully_page(),
      ),
    );
  }

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
              }),
        ),
        title: Text(
          "Forget T-PIN",
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 139, 139, 139)
                        .withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _passwordController4,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.person_rounded),
                  labelText: 'User ID/Mobile Number',
                  hintText: 'ZP 43573985',
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(108, 50, 50, 50),
                    fontSize: 14,
                  ),
                  // hintText: hintText,
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(''),
                _isValid
                    ? Text(
                        'Sunny Kharwar',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(183, 28, 28, 1)),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 20),
            if (!_isSubmitted && _isValid)
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: _isValid
                    ? () {
                        _handleSubmit();
                      }
                    : null,
                color: _isValid
                    ? Color.fromRGBO(183, 28, 28, 1)
                    : Color.fromRGBO(171, 171, 171, 1),
                child: Text('Submit',
                    style: TextStyle(
                      color: _isValid
                          ? Color.fromRGBO(255, 255, 255, 1)
                          : Color.fromRGBO(127, 127, 127, 1),
                    )),
                minWidth: double.infinity,
                height: 50,
              ),
            if (!_isSubmitted && !_isValid)
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: _isValid
                    ? () {
                        _handleSubmit();
                      }
                    : null,
                color: _isValid
                    ? Color.fromRGBO(183, 28, 28, 1)
                    : Color.fromRGBO(171, 171, 171, 1),
                child: Text('Submit',
                    style: TextStyle(
                      color: _isValid
                          ? Color.fromRGBO(255, 255, 255, 1)
                          : Color.fromRGBO(127, 127, 127, 1),
                    )),
                minWidth: double.infinity,
                height: 50,
              ),
            if (_isSubmitted && _isValid) ...[
              AppTextField(
                controller: _passwordController5,
                labelText: 'New T-PIN',
                isPassword: _isObscure1,
                onChangedCallBack: (String value) {
                  print("Password: $value");
                },
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure1 ? Icons.visibility_off : Icons.visibility),
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
                controller: _passwordController6,
                labelText: 'Confirm New T-PIN',
                isPassword: _isObscure2,
                onChangedCallBack: (String value) {
                  print("Password: $value");
                },
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure2 ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscure2 = !_isObscure2;
                    });
                  },
                ),
                textInputType: TextInputType.text,
                enableInteractiveSelection: false,
                maxLength: 20,
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
          ],
        ),
      ),
    );
  }
}
