import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/features/features_project&tasks/cubit/edit_add_task_cubit/edit_add_task_cubit_cubit.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({
    Key? key,
    this.restorationId,
    required this.initialDate,
  }) : super(key: key);

  final String? restorationId;
  final DateTime initialDate;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample>
    with RestorationMixin {
  late TextEditingController dateTextEditingController;
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture;

  @override
  void initState() {
    super.initState();
    dateTextEditingController = TextEditingController(
        text: widget.initialDate.toString().substring(0, 10));
    _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
      onComplete: _selectDate,
      onPresent: (NavigatorState navigator, Object? arguments) {
        return navigator.restorablePush(
          _datePickerRoute,
          arguments: _selectedDate.value.millisecondsSinceEpoch,
        );
      },
    );
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        dateTextEditingController.text =
            _selectedDate.value.toLocal().toString().substring(0, 10);
        context
            .read<AddTaskCubit>()
            .setDueDate(_selectedDate.value.toIso8601String());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      icon: const Icon(Icons.calendar_today),
      label: Text(dateTextEditingController.text),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0x3EFFFFFF).withOpacity(0.2),
        ),
      ),
    );
  }

  @override
  String? get restorationId =>
      null; // Return null to remove restorationId getter
}
