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
        // print the number of bytes in the file
        List<int> bytes = config.readAsBytesSync();
        print("${bytes.length} $fileName");
        break;
      // print the number of lines in the file
      case "-l":
        List<String> lines = await config.readAsLines();
        print("${lines.length} $fileName");
        break;
      // print the number of words in the file
      case "-w":
        var lines = await config.readAsLines();
        int count = 0;
        for (String line in lines) {
          List<String> words = line.split(" ");
          for (String word in words) {
            if (word.isNotEmpty) {
              count++;
            }
          }
        }
        print("$count $fileName");
        break;
    }
  } else {
    print("Please enter an appropriate command");
  }
}
