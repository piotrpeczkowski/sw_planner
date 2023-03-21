import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sw_planner/features/add_task/widgets/task_deadline_date_picker.dart';
import 'package:sw_planner/features/add_task/widgets/task_deadline_time_picker.dart';
import 'package:sw_planner/features/add_task/widgets/task_priority_dropdown_list.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskContentController = TextEditingController();
  final TextEditingController taskDateController = TextEditingController();
  final TextEditingController taskTimeController = TextEditingController();
  final FocusNode taskDateFocusNode = FocusNode();
  final FocusNode taskTimeFocusNode = FocusNode();

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskPriorityValue = '';
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');
    final valueDateText = dateFormat.format(selectedDate);
    final valueTimeText = timeFormat.format(selectedTime);
    widget.taskDateController.text = valueDateText;
    widget.taskTimeController.text = valueTimeText;

    return AddTaskBody(
      taskTitleController: widget.taskTitleController,
      taskContentController: widget.taskContentController,
      taskDateController: widget.taskDateController,
      taskTimeController: widget.taskTimeController,
      taskDateFocusNode: widget.taskDateFocusNode,
      taskTimeFocusNode: widget.taskTimeFocusNode,
      taskPriorityValue: taskPriorityValue,
      onPriorityChanged: (value) {
        setState(() {
          taskPriorityValue = value!;
        });
      },
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      onDeadlineDateChanged: () async {
        widget.taskDateFocusNode.unfocus();
        final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2100));
        if (pickedDate != null && pickedDate != selectedDate) {
          setState(() {
            selectedDate = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              selectedDate.hour,
              selectedDate.minute,
            );
          });
        }
      },
      onDeadlineTimeChanged: () async {
        widget.taskTimeFocusNode.unfocus();
        final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child!,
              );
            },
            initialTime: TimeOfDay.fromDateTime(selectedTime));
        if (pickedTime != null &&
            (selectedDate.hour != pickedTime.hour ||
                selectedDate.minute != pickedTime.minute)) {
          setState(() {
            selectedTime = DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          });
        }
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
    required this.taskTimeController,
    required this.taskDateFocusNode,
    required this.taskTimeFocusNode,
    required this.taskPriorityValue,
    required this.onPriorityChanged,
    required this.onDeadlineDateChanged,
    required this.onDeadlineTimeChanged,
    required this.selectedDate,
    required this.selectedTime,
  });

  final Function() onSave;
  final TextEditingController taskTitleController;
  final TextEditingController taskContentController;
  final TextEditingController taskDateController;
  final TextEditingController taskTimeController;
  final FocusNode taskDateFocusNode;
  final FocusNode taskTimeFocusNode;
  final String taskPriorityValue;
  final void Function(String?) onPriorityChanged;
  final void Function() onDeadlineDateChanged;
  final void Function() onDeadlineTimeChanged;
  final DateTime selectedDate;
  final DateTime selectedTime;

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
            child: DeadlineDatePicker(
              taskDateController: taskDateController,
              taskDateFocusNode: taskDateFocusNode,
              selectedDate: selectedDate,
              onDeadlineDateChanged: onDeadlineDateChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: DeadlineTimePicker(
              taskTimeController: taskTimeController,
              taskTimeFocusNode: taskTimeFocusNode,
              selectedTime: selectedTime,
              onDeadlineTimeChanged: onDeadlineTimeChanged,
            ),
          )
        ],
      ),
    );
  }
}
