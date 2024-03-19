import 'package:capstone/src/views/profileScreen/widgets/widgets/CurrentEventScreen.dart';
import 'package:capstone/src/views/profileScreen/widgets/widgets/UpcomingEventScreen.dart';
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});
  static const String routeName = "/profileActivities";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aktiviteler",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
        child: Column(
          children: [
            const Text(
                "Aktiviteler",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpcomingEventScreen()),
                  );
                },
                child: const Text(
                  'Upcoming Events',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 10.0),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrentEventScreen()),
                  );
                },
                child: const Text(
                  'Current Events',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
