import 'package:flutter/material.dart';
import 'package:first_project/components/new_task_bottom_sheet.dart';
import 'package:first_project/screens/profile.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of tasks
  final List<Map<String, String>> initialTasks = [
    {
      'title': 'Clean the Porch',
      'subtitle': 'Do not use the detergent',
    },
    {
      'title': 'Smack Salman ass',
      'subtitle': 'Shake it well',
    },
    {
      'title': 'Wash my clothes',
      'subtitle': 'All my natives',
    },
  ];

  List<Map<String, String>> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = List.from(initialTasks); // Initialize tasks
  }

  // Method to remove a task
  void _markAsDone(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _newTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) => NewTaskBottomSheet(
        onTaskAdded: (Map<String, String> task) {
          setState(() {
            tasks.add(task);
          });
        },
      ),
    );
  }


  void _refreshTasks() {
    setState(() {
      tasks = List.from(initialTasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: _refreshTasks,
        child: const Icon(Icons.refresh),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Ensures it stays circular
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          "Today's Todo",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _newTask(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      Icons.album,
                      color: Colors.white,
                    ),
                    title: Text(
                      task['title']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      task['subtitle']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text(
                          'Mark as done',
                          style: TextStyle(color: Colors.yellow),
                        ),
                        onPressed: () {
                          _markAsDone(index);
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
