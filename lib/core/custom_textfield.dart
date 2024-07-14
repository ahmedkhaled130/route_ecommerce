import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Expanded(
          child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(
                        color: Color(0xff004182), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff004182), width: 2.0),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  hintText: 'what do you search for?',
                  hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 18),
                  prefixIcon: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Image.asset(
                        'assets/images/🦆 icon _search_.png'),
                  ))),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Image.asset(
              'assets/images/🦆 icon _shopping cart_.png'), //sea u
        )
      ],
    );}
  }

