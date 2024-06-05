import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../util/textStyles.dart';

class AddScoreBottomSheet extends StatelessWidget {
  final TextEditingController scoreController;
  final VoidCallback onSubmit;

  const AddScoreBottomSheet(
      {super.key, required this.scoreController, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: scoreController,
                    decoration: InputDecoration(
                      labelText: "Add Score",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        // Allow only values between 0 and 10
                        if (newValue.text.isEmpty) {
                          return newValue;
                        }
                        final value = int.tryParse(newValue.text);
                        if (value != null && value >= 0 && value <= 10) {
                          return newValue;
                        }
                        return oldValue;
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueAccent,
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: buttonNameStyle,
                      ),
                      onPressed: onSubmit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
