import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class create_account_modal_page extends StatefulWidget {
  const create_account_modal_page({super.key});

  @override
  State<create_account_modal_page> createState() =>
      _create_account_modal_pageState();
}

class _create_account_modal_pageState extends State<create_account_modal_page> {
  final _focusNodes = List<FocusNode>.generate(6, (int index) => FocusNode());
  final _borderColors = List<Color>.filled(6, Colors.grey[300]!);
  bool obscureText = true;

  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        setState(() {
          _borderColors[i] =
              _focusNodes[i].hasFocus ? Colors.red : Colors.grey[300]!;
        });
      });
    }
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Widget _buildTextField({
    required String labelText,
    required FocusNode focusNode,
    required int index,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(color: _borderColors[index], width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              color: const Color.fromARGB(255, 146, 146, 146),
              fontWeight: FontWeight.w300),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(25),
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Text(
            'Create Account',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              left: 20.0,
              bottom: 20.0,
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  children: [
                    // //First Name Field
                    Expanded(
                      child: _buildTextField(
                        labelText: 'First Name',
                        focusNode: _focusNodes[0],
                        index: 0,
                      ),
                    ),
                    SizedBox(width: 10),
                    //// Last Name Field
                    Expanded(
                      child: _buildTextField(
                        labelText: 'Last Name',
                        focusNode: _focusNodes[1],
                        index: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                //// Email Field
                _buildTextField(
                  labelText: 'Email',
                  focusNode: _focusNodes[2],
                  index: 2,
                ),
                SizedBox(height: 16.0),
                // ////Phone Number Field
                _buildTextField(
                  labelText: 'Phone Number',
                  focusNode: _focusNodes[3],
                  index: 3,
                ),
                SizedBox(height: 16.0),
                // //Sponsor ID Field
                _buildTextField(
                  labelText: 'Sponsor ID',
                  focusNode: _focusNodes[4],
                  index: 4,
                ),
                SizedBox(height: 16.0),
                ////Password Field with Visibility Toggle
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _focusNodes[5].hasFocus
                            ? Colors.red
                            : Colors.grey[300]!,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    obscureText: obscureText,
                    focusNode: _focusNodes[5],
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 184, 184, 184),
                          fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 14.0),
                      suffixIcon: IconButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: obscureText
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                      ),
                    ),
                  ),
                ),
                SizedBox(),
                Column(
                  children: [
                    const ValidationRow(
                      text: 'Must be at least 8 charactes',
                      icon: Icons.check_circle,
                    ),
                    const ValidationRow(
                      text: 'Must contain one special character',
                      icon: Icons.check_circle,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'By creating an account I accept the ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Terms and Conditions ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle terms and conditions tap
                                        },
                                    ),
                                    TextSpan(
                                      text: 'ZedPay Business ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'and ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Data Privacy Policy ZedPay Business',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle privacy policy tap
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isChecked
                                ? () {
                                    // Handle account creation
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              backgroundColor: _isChecked
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.4),
                            ),
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                color: _isChecked ? Colors.white : Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ValidationRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const ValidationRow({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 23.0,
        ),
        SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
