import 'package:flutter/material.dart';
import '../../../util/textStyles.dart';
import 'CustomKeyboard.dart';

class AddScoreBottomSheet extends StatefulWidget {
  final TextEditingController scoreController;
  final VoidCallback onSubmit;

  const AddScoreBottomSheet(
      {super.key, required this.scoreController, required this.onSubmit});

  @override
  _AddScoreBottomSheetState createState() => _AddScoreBottomSheetState();
}

class _AddScoreBottomSheetState extends State<AddScoreBottomSheet> {
  String input = '';

  void _onKeyTap(String value) {
    setState(() {
      if (value == '<') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else {
        input = value;
      }
      widget.scoreController.text = input;
    });
  }

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
                    controller: widget.scoreController,
                    decoration: InputDecoration(
                      labelText: "Puan Ekle",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
                CustomKeyboard(onKeyTap: _onKeyTap),
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
                        "Gönder",
                        style: buttonNameStyle,
                      ),
                      onPressed: widget.onSubmit,
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
