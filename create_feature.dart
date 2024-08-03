import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a feature name.');
    return;
  }

  final featureName = arguments[0];
  final directories = [
    'lib/features/$featureName/ui',
    'lib/features/$featureName/controller',
  ];

  for (var dir in directories) {
    Directory(dir).createSync(recursive: true);
  }

  final files = {
    'lib/features/$featureName/ui/${featureName}_screen.dart': 'import \'package:flutter/material.dart\';\n\nclass ${capitalize(featureName)}Screen extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n    return Scaffold(\n      appBar: AppBar(\n        title: Text(\'${capitalize(featureName)}\'),\n      ),\n      body: Center(\n        child: Text(\'${capitalize(featureName)} Screen\'),\n      ),\n    );\n  }\n}\n',
    'lib/features/$featureName/controller/${featureName}_controller.dart': 'class ${capitalize(featureName)}Controller {\n  // Add your controller logic here\n}\n'
  };

  files.forEach((path, content) {
    File(path).writeAsStringSync(content);
  });

  print('Feature $featureName created with ui and controller subfolders and Dart files.');
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
