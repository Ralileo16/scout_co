import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:scout_co/src/settings/settings_controller.dart';
import 'package:scout_co/src/utils/card_header_outline.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key, required this.controller});

  final SettingsController controller;

  final TextEditingController textEditingControllerPDF =
      TextEditingController();
  final TextEditingController textEditingControllerAPI =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingControllerPDF.text = controller.pdfPath;
    textEditingControllerAPI.text = controller.apiPath;
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CardHeaderOutline(
                    title: 'Couleur du thème',
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 32.0,
                            left: 8.0,
                            right: 8.0,
                            bottom: 8.0,
                          ),
                          child: BlockPicker(
                            pickerColor: controller.themeColor,
                            onColorChanged: controller.updateThemeColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<ThemeMode>(
                            value: controller.themeMode,
                            onChanged: controller.updateThemeMode,
                            items: const [
                              DropdownMenuItem(
                                value: ThemeMode.light,
                                child: Text('Light Theme'),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.dark,
                                child: Text('Dark Theme'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardHeaderOutline(
                    title: "Chemin d'accès",
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 32.0,
                        left: 24.0,
                        right: 24.0,
                        bottom: 16.0,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: textEditingControllerPDF,
                              onChanged: (text) {
                                controller.updatePDFPath(text);
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Chemin de sauvegarde PDF',
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    String? selectedDirectory = await FilePicker
                                        .platform
                                        .getDirectoryPath();

                                    if (selectedDirectory != null) {
                                      textEditingControllerPDF.text =
                                          selectedDirectory;
                                    }
                                    controller.updatePDFPath(
                                        textEditingControllerPDF.text);
                                  },
                                  icon: const Icon(Icons.folder),
                                ),
                              ),
                            ),
                          ),
                          APITextField(
                            textEditingControllerAPI: textEditingControllerAPI,
                            controller: controller,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class APITextField extends StatefulWidget {
  const APITextField({
    super.key,
    required this.textEditingControllerAPI,
    required this.controller,
  });

  final TextEditingController textEditingControllerAPI;
  final SettingsController controller;

  @override
  State<APITextField> createState() => _APITextFieldState();
}

class _APITextFieldState extends State<APITextField> {
  bool _isEditable = false;

  void _toggleEditable(bool b) {
    setState(() {
      _isEditable = b;
    });
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you really want to modify the API value?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      _toggleEditable(true);
    }
    if (confirmed == false) {
      _toggleEditable(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.textEditingControllerAPI,
              onChanged: (text) {
                if (_isEditable) {
                  widget.controller.updateAPIPath(text);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adresse API',
              ),
              enabled: _isEditable,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).hintColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: IconButton(
                onPressed: () => {
                  if (!_isEditable)
                    _showConfirmationDialog(context)
                  else
                    _toggleEditable(false)
                },
                icon: const Icon(Icons.lock),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
