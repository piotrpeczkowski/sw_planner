import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/add_task/widgets/task_priority_dropdown_list.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskContentController = TextEditingController();
  final TextEditingController taskDateController = TextEditingController();
  final FocusNode taskDateFocusNode = FocusNode();

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskPriorityValue = '';

  @override
  Widget build(BuildContext context) {
    return AddTaskBody(
      taskTitleController: widget.taskTitleController,
      taskContentController: widget.taskContentController,
      taskDateController: widget.taskDateController,
      taskDateFocusNode: widget.taskDateFocusNode,
      taskPriorityValue: taskPriorityValue,
      onPriorityChanged: (value) {
        setState(() {
          taskPriorityValue = value!;
        });
      },
      onSave: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({
    super.key,
    required this.onSave,
    required this.taskTitleController,
    required this.taskContentController,
    required this.taskDateController,
    required this.taskDateFocusNode,
    required this.taskPriorityValue,
    required this.onPriorityChanged,
  });

  final Function() onSave;
  final TextEditingController taskTitleController;
  final TextEditingController taskContentController;
  final TextEditingController taskDateController;
  final FocusNode taskDateFocusNode;
  final String taskPriorityValue;
  final void Function(String?) onPriorityChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dodaj zadanie', style: GoogleFonts.kanit()),
        actions: [
          IconButton(
            onPressed: onSave,
            tooltip: 'Zapisz',
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextField(
            controller: taskTitleController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
            maxLength: 120,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              label: Text(
                'Tytuł zadania',
                style: GoogleFonts.lato(),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 13, 71, 161),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: taskContentController,
              keyboardType: TextInputType.multiline,
              minLines: 10,
              maxLines: 15,
              maxLength: 600,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text(
                  'Treść zadania',
                  style: GoogleFonts.lato(),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 13, 71, 161),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TaskPriorityDropdownList(
              taskPriorityValue: taskPriorityValue,
              onPriorityChanged: onPriorityChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextField(
              controller: taskDateController,
              focusNode: taskDateFocusNode,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: Text(
                  'Planowana data zakończenia',
                  style: GoogleFonts.lato(),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 13, 71, 161),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () {
                taskDateFocusNode.unfocus();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
