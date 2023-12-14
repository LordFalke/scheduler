import "package:flutter/material.dart";

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo (vielleicht)

              // const SizedBox(height: 48,),

              // welcome message
              Text(
                "Wilkommen beim HSB-Scheduler!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              SizedBox(height: 6),

              Text(
                "swipe um fortzufahren",
                style: TextStyle(fontSize: 16, color: Colors.indigoAccent.shade400)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
