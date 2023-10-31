import 'package:flutter/material.dart';

class CancelReasonDialog extends StatefulWidget {
  const CancelReasonDialog({super.key});

  @override
  State<CancelReasonDialog> createState() => _CancelReasonDialogState();
}

class _CancelReasonDialogState extends State<CancelReasonDialog> {

  String? _cancelReason;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.black, spreadRadius: 1),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'ඔබ අවලංගු කළේ ඇයි?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                RadioListTile<String>(
                  title: const Text('ලබා දීමට තවදුරටත් සේවාව නොමැත'),
                  value: 'I expected a shorter wait time',
                  groupValue: _cancelReason,
                  onChanged: (value) {
                    setState(() {
                      _cancelReason = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('මට ස්ථානය සොයා ගැනීමට නොහැකි විය'),
                  value: 'I could not find the location',
                  groupValue: _cancelReason,
                  onChanged: (value) {
                    setState(() {
                      _cancelReason = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('මම දැනට සේවය දෙන්න සූදානම් නැහැ'),
                  value: 'I was not ready to give the service at the moment',
                  groupValue: _cancelReason,
                  onChanged: (value) {
                    setState(() {
                      _cancelReason = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('මම ප්‍රදේශයෙන් පිටත සිටිමි'),
                  value: 'I am out of area',
                  groupValue: _cancelReason,
                  onChanged: (value) {
                    setState(() {
                      _cancelReason = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('මගේ හේතුව ලැයිස්තුගත කර නැත'),
                  value: 'My reason is not listed',
                  groupValue: _cancelReason,
                  onChanged: (value) {
                    setState(() {
                      _cancelReason = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(const Size(200, 60)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  ),
                  child: const Text('ඉදිරිපත් කරන්න', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
