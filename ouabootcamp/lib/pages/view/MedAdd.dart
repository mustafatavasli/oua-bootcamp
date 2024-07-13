import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class MedAdd extends StatefulWidget {
  @override
  State<MedAdd> createState() => _MedAddState();
}

class _MedAddState extends State<MedAdd> {
  late final TextEditingController _dateController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _reasonController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  TimeOfDay selectedTime = TimeOfDay.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        initializeDateFormatting('tr-TR', '')
            .then((_) => (_dateController.text = DateFormat.yMd('tr-TR').format(selectedDate)));
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Transform.translate(
                  offset: Offset(0, -20),
                  child: Image.asset('assets/images/Logo.png', height: 124, alignment: Alignment.topCenter),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText:'Tarih',
                      suffixIcon: Icon(Icons.date_range),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);

                    },
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'Saat',
                      suffixIcon: Icon(Icons.access_time_rounded),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () async{
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode:TimePickerEntryMode.dial,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                          );
                        },
                      );
                      if(timeOfDay != null) {
                        setState(() {
                          selectedTime = timeOfDay;
                          _timeController.text = "${selectedTime.hour}:${selectedTime.minute}";
                        });
                      }
                    },
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'İlaç Adı',
                      suffixIcon: Icon(Icons.drive_file_rename_outline),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _reasonController,
                    decoration: InputDecoration(
                      labelText: 'Kullanım Nedeni',
                      suffixIcon: Icon(Icons.question_mark),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: Offset(-15, 0),
                    child: SizedBox(
                      width: 120,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF353A48),
                        ),
                        onPressed: () {
                          if (_dateController.text.isNotEmpty &&
                              _timeController.text.isNotEmpty &&
                              _nameController.text.isNotEmpty &&
                              _reasonController.text.isNotEmpty) {

                            Map<String, String> yakinData = {
                              'date': DateFormat.MMMEd('tr-TR').format(selectedDate),
                              'time': _timeController.text,
                              'name': _nameController.text,
                              'reason': _reasonController.text,
                            };
                            Navigator.pop(context, yakinData);
                          }
                        },
                        child: Text(
                          'İlaç Ekle',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


