import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.isLoading,
      required this.onPressed,
      required this.title})
      : super(key: key);
  final bool isLoading;
  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.maxFinite,
      child: isLoading
          ? Container(
              color: Colors.indigoAccent[400],
              width: double.infinity,
              child: const Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))))
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigoAccent),
              ),
              onPressed: () {
                onPressed();
              },
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              )),
    );
  }
}
