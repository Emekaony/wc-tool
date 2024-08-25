import 'dart:io';

void main(List<String> args) async {
  // step 1: print number of bytes in the file
  String? command;
  String fileName = "text.txt";
  if (args.isNotEmpty) {
    command = args[0];
    File config = File("files/test.txt");
    switch (command) {
      case "-c":
        // the task for -c is to print the number of bytes in the file
        List<int> bytes = config.readAsBytesSync();
        print("${bytes.length} $fileName");
        break;
      case "-l":
        List<String> lines = await config.readAsLines();
        print("${lines.length} $fileName");
    }
  } else {
    print("Please enter an appropriate command");
  }
}
