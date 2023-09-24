import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/screens/add_field.dart';


//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});


  // sign user out method
  void signUserOut() {
    supabase.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15)
            )
          ),
          title: const Text("GERER SES PARCELLES", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(64, 212, 0, 1),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
            )
          ], 
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
              /* const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom:15.0),
                  child: Text("Ajoute ta première parcelle.",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0, right: 18.0),
                      child: Image.asset("assets/Images/arrow_add.png", height: 250),
                    ),
                  ],
                ),
              ), */
              Align(
                alignment: Alignment.bottomRight,
                child:
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(), 
                      padding: const EdgeInsets.all(10),
                      backgroundColor: const Color.fromRGBO(64, 212, 0, 1),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddField()));},
                  ),
              ),
            ],
          ),
        )
        
        ),
    );
  }
}
