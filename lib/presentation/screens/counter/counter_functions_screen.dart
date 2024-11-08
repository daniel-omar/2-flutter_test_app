import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Counter functions'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(
                Icons.refresh_outlined,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                clickCounter > 1 ? 'Clicks' : 'Click',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              Icons.refresh_outlined,
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
              shapeBorder: const StadiumBorder(),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              Icons.exposure_minus_1_outlined,
              onPressed: () {
                if (clickCounter == 0) return;
                clickCounter--;
                setState(() {});
              },
              backgroundColor: Colors.amber,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              Icons.plus_one,
              onPressed: () {
                clickCounter++;
                setState(() {});
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;

  final Color? backgroundColor;
  final ShapeBorder? shapeBorder;
  final VoidCallback? onPressed;

  const CustomButton(this.icon,
      {super.key, this.onPressed, this.backgroundColor, this.shapeBorder});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: backgroundColor,
      enableFeedback: true,
      shape: shapeBorder,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
