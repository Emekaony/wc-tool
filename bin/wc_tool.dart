import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

void main(List<String> args) {
  // step 1: print number of bytes in the file
  String? command;
  if (args.isNotEmpty) {
    command = args[0];
    File config = File("files/test.txt");
    switch (command) {
      case "-c":
        // the task for -c is to print the number of bytes in the file
        List<int> bytes = config.readAsBytesSync();
        print("number of bytes: ${bytes.length}");
    }
  } else {
    print("Please enter an appropriate command");
  }
}
