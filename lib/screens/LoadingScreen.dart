import 'package:first_project/screens/Homepage.dart';
import 'package:flutter/material.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {

  void initState() {
    super.initState();
    loadHomepage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.cover, // Adjust the fit of the image
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadHomepage() async {
    await Future.delayed(const Duration(seconds: 2));

    if(context.mounted) {

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Homepage();
      }));
    }

  }
}
