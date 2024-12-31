import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // Navigate back on press
        ),
        title: const Text(
          'Your Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Black background container
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            width: double.infinity,
            height: 250.0, // Fixed height for the black background
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Center(
                  child: Text(
                    'Emma Simons',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          // Card container positioned to create intersection effect
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Transform.translate(
              offset: const Offset(0, -70),
              child: Container(
                height: 200.0,
                child: Card(
                  color: Colors.yellow[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'This is where user details can be displayed.',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
