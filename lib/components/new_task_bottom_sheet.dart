import 'package:flutter/material.dart';

class NewTaskBottomSheet extends StatelessWidget {
  final void Function(Map<String, String> task) onTaskAdded;

  const NewTaskBottomSheet({Key? key, required this.onTaskAdded}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add New Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter task name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: subtitleController,
            decoration: InputDecoration(
              hintText: 'Enter subtitle (optional)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                print(subtitleController.text);
                if (titleController.text.isNotEmpty) {
                  onTaskAdded({
                    'title': titleController.text,
                    'subtitle': subtitleController.text,
                  });
                  Navigator.pop(context); // Close the bottom sheet
                }
              },
              child: const Text(
                'Add Task',
                style: TextStyle(color: Colors.white), // Optional to ensure text is visible
              ),
            ),
          ),
        ],
      ),
    );
  }
}
