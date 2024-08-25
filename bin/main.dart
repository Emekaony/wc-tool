import 'dart:io';
import "package:wc_tool/punctuation.dart";

void main(List<String> args) async {
  // step 1: print number of bytes in the file
  String? command;
  String fileName = "text.txt";

  if (args.isNotEmpty) {
    command = args[0];
    File config = File("files/hello.txt");
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
          // remove punctuations
          for (String word in words) {
            // assumt it's not a word
            bool isWord = false;
            // because we had things like '****', best way would be to
            // iterate over every word and see if it's filled up with punctuations
            // if so, then disregard it, else count it.
            print("current word is $word");
            for (int i = 0; i < word.length; i++) {
              if (!isPunctation(word[i])) {
                // if we encounter a character, this means we have a valid word
                // handles edge cases like '[emeka' & '***'
                isWord = true;
                break;
              }
            }
            if (isWord) {
              count++;
            }
          }
        }
        print("$count $fileName");
    }
  } else {
    print("Please enter an appropriate command");
  }
}
