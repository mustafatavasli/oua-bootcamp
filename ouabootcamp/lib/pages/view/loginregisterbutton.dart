import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularCharts extends StatefulWidget {
  const CircularCharts({super.key});

  @override
  State<CircularCharts> createState() => _CircularChartsState();
}

class _CircularChartsState extends State<CircularCharts>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isButton1Active = true;
  int selectedToggle = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void monthlySelected() {
    if (!_isButton1Active) {
      setState(() {
        _isButton1Active = true;
      });
    }
  }

  void yearlySelected() {
    if (_isButton1Active) {
      setState(() {
        _isButton1Active = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 44,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.4),
              borderRadius: BorderRadius.circular(100)),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              AnimatedAlign(
                alignment: _isButton1Active
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color(0xff9ba0fc),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        monthlySelected();
                      },
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                  InkWell(
                      onTap: () {
                        yearlySelected();
                      },
                      child: Text("Yearly",
                          style:
                          TextStyle(color: Colors.black, fontSize: 15)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}