import 'package:flutter/material.dart';
import 'package:flutterprovider/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child:ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider(),
              child: Consumer<HomePageProvider>(
                builder: (context, provider, child){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(provider.eligibilityMessage.toString(),style: TextStyle(
                        color: (provider.isEligible == true) ? Colors.green : Colors.red
                      ),),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter Your Age!"
                        ),
                      onChanged: (val){
                          provider.checkEligibility(int.parse(val));
                      },
                      )

                    ],
                  );
                },
              ),
            )

          )
        ),
      ),
    );
  }
}