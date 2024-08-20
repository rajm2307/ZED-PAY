import 'package:flutter/material.dart';
import 'package:zedpay/Login_page/create_account_modal_page.dart';
import 'package:zedpay/Login_page/login_page.dart';
// import 'package:zedpay/buttons/AppTextField.dart';
// import 'package:zedpay/pages/changePassword.dart';
// import 'package:zedpay/pages/changeTPIN.dart';
import 'package:zedpay/pages/forgetTPIN.dart';
// import 'package:zedpay/pages/successfully_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}



// import 'package:flutter/material.dart';

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   bool obscureText = true;
//   final _focusNodes = List<FocusNode>.generate(6, (int index) => FocusNode());
//   final _borderColors = List<Color>.filled(6, Colors.grey[300]!);

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < _focusNodes.length; i++) {
//       _focusNodes[i].addListener(() {
//         setState(() {
//           _borderColors[i] =
//               _focusNodes[i].hasFocus ? Colors.red : Colors.grey[300]!;
//         });
//       });
//     }
//   }

//   @override
//   void dispose() {
//     for (var focusNode in _focusNodes) {
//       focusNode.dispose();
//     }
//     super.dispose();
//   }

//   Widget _buildTextField({
//     required String labelText,
//     required FocusNode focusNode,
//     required int index,
//   }) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       decoration: BoxDecoration(
//         border: Border.all(color: _borderColors[index], width: 1.5),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: TextFormField(
//         focusNode: focusNode,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: InputBorder.none,
//           contentPadding:
//               EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height * 0.07),
//             Row(
//               children: [
//                 // //First Name Field
//                 Expanded(
//                   child: _buildTextField(
//                     labelText: 'First Name',
//                     focusNode: _focusNodes[0],
//                     index: 0,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 //// Last Name Field
//                 Expanded(
//                   child: _buildTextField(
//                     labelText: 'Last Name',
//                     focusNode: _focusNodes[1],
//                     index: 1,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             //// Email Field
//             _buildTextField(
//               labelText: 'Email',
//               focusNode: _focusNodes[2],
//               index: 2,
//             ),
//             SizedBox(height: 16.0),
//             // ////Phone Number Field
//             _buildTextField(
//               labelText: 'Phone Number',
//               focusNode: _focusNodes[3],
//               index: 3,
//             ),
//             SizedBox(height: 16.0),
//             // //Sponsor ID Field
//             _buildTextField(
//               labelText: 'Sponsor ID',
//               focusNode: _focusNodes[4],
//               index: 4,
//             ),
//             SizedBox(height: 16.0),
//             ////Password Field with Visibility Toggle
//             AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: _focusNodes[5].hasFocus
//                         ? Colors.red
//                         : Colors.grey[300]!,
//                     width: 1.5),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: TextFormField(
//                 obscureText: obscureText,
//                 focusNode: _focusNodes[5],
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: InputBorder.none,
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
//                   suffixIcon: IconButton(
//                     color: Colors.red,
//                     onPressed: () {
//                       setState(() {
//                         obscureText = !obscureText;
//                       });
//                     },
//                     icon: obscureText
//                         ? Icon(Icons.visibility_off_outlined)
//                         : Icon(Icons.visibility_outlined),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: RegistrationPage(),
//   ));
// }
