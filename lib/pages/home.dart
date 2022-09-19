import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    // Ovo se okida kod inicijalnog loada, ali ne i kada se koristi Navigator.pop()
    // Ovaj ternary nam treba jer se build funkcija okida kada se dodje na home. S obzirom da na
    // home widget dolazim s dvije strane, a svaki put se okida build, ne zelim da mi se build
    // okine kada dolazim sa choose_location jer sam upravo promijenio state ove mape!
    print(data.isNotEmpty);
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    // Set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.blue[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: SizedBox(height: 50.0,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$bgImage'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          print('usao sam u OnPressed');
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          print(result);
                          print('prosao sam dynamic result?');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDayTime': result['isDayTime'],
                              'flag': result['flag']
                            };
                          });
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                        ),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(
                          color: Colors.grey[300],
                          )
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 42.0,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
