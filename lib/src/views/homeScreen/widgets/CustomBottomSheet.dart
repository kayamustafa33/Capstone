import 'package:capstone/src/util/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddScoreBottomSheet extends StatelessWidget {
  const AddScoreBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36.0),
      child: IconButton(
        icon: Icon(Icons.add_circle_outline),
        iconSize: 40,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
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
                            padding: EdgeInsets.only(top: 10),
                            child: TextField(
                              decoration: new InputDecoration(
                                labelText: "Score to be added",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ], // Only numbers can be entered
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blueAccent)),
                                child: Text(
                                  "Add",
                                  style: buttonNameStyle,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
