import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';

import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/model/children_dto_repository.dart';

class PDFHealthSheet extends StatefulWidget {
  const PDFHealthSheet({super.key, required this.childrenDto});

  final ChildrenDto childrenDto;

  @override
  PDFHealthSheetState createState() => PDFHealthSheetState();
}

class PDFHealthSheetState extends State<PDFHealthSheet> {
  Future<void> generatePDF() async {
    final pdf = pw.Document();

    final netImageLogo = await networkImage(
        'https://static.vecteezy.com/system/resources/previews/023/527/936/non_2x/a-hiking-logo-design-with-a-male-hiker-walking-through-a-trail-surrounded-by-trees-and-mountains-vector.jpg');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                height: 48,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Image(netImageLogo),
                    pw.Row(
                      children: [
                        pw.Text(
                          'FEUILLE ',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.normal, fontSize: 32),
                        ),
                        pw.Text(
                          'SANTÉ',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 32),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 42,
                child: pw.Text(
                  "Informations de l'enfant",
                  style: pw.TextStyle(
                    decoration: pw.TextDecoration.underline,
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 28,
                    fontStyle: pw.FontStyle.italic,
                  ),
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text('Nom Complet:'),
                    ),
                    pw.Expanded(
                      flex: 8,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'FullName',
                          value:
                              '${widget.childrenDto.firstName} ${widget.childrenDto.lastName}',
                          defaultValue: 'Error loading FullName',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 5,
                      child: pw.Text('Date de Naissance:'),
                    ),
                    pw.Expanded(
                      flex: 8,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'DateOfBirth',
                          value: DateFormat('yyyy-MM-dd')
                              .format(widget.childrenDto.dateOfBirth),
                          defaultValue: 'Error loading DateOfBirth',
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      width: 8,
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Text('Sexe: '),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'Gender',
                          value: widget.childrenDto.gender,
                          defaultValue: 'Error loading Gender',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 5,
                      child: pw.Text('Adresse:'),
                    ),
                    pw.Expanded(
                      flex: 8,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'Address',
                          value:
                              '${widget.childrenDto.address}, ${widget.childrenDto.city}, ${widget.childrenDto.province}',
                          defaultValue: 'Error loading Address',
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      width: 8,
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Text('Code Postal:'),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'PostalCode',
                          value: widget.childrenDto.postalCode,
                          defaultValue: 'Error loading PostalCode',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: pw.Text('Téléphone:'),
                    ),
                    pw.Expanded(
                      flex: 5,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'Phone',
                          value: widget.childrenDto.phone,
                          defaultValue: 'Error loading Phone',
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      width: 8,
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text('E-mail:'),
                    ),
                    pw.Expanded(
                      flex: 7,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          name: 'Email',
                          value: widget.childrenDto.email,
                          defaultValue: 'Error loading Email',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 42,
                child: pw.Text(
                  "Informations additionelles",
                  style: pw.TextStyle(
                    decoration: pw.TextDecoration.underline,
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 20,
                    fontStyle: pw.FontStyle.italic,
                  ),
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 16),
                child: pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                            color: const PdfColor.fromInt(0xFF000000),
                          ),
                        ),
                        child: pw.TextField(
                          height: 112,
                          name: 'Notes',
                          value: widget.childrenDto.notes,
                          defaultValue: 'Error loading Notes',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 42,
                child: pw.Text(
                  "Informations des parents",
                  style: pw.TextStyle(
                    decoration: pw.TextDecoration.underline,
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 20,
                    fontStyle: pw.FontStyle.italic,
                  ),
                ),
              ),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Text(
                      "Parent 1",
                      style: pw.TextStyle(
                        decoration: pw.TextDecoration.underline,
                        fontWeight: pw.FontWeight.normal,
                        fontSize: 16,
                        fontStyle: pw.FontStyle.italic,
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 8,
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      "Parent 2",
                      style: pw.TextStyle(
                        decoration: pw.TextDecoration.underline,
                        fontWeight: pw.FontWeight.normal,
                        fontSize: 16,
                        fontStyle: pw.FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 16),
                          child: pw.Container(
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text('Nom complet:'),
                                ),
                                pw.Expanded(
                                  flex: 5,
                                  child: pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.TextField(
                                      name: 'FullNameParent1',
                                      value: widget.childrenDto.parentDto1 !=
                                              null
                                          ? '${widget.childrenDto.parentDto1!.firstName} ${widget.childrenDto.parentDto1!.lastName}'
                                          : '',
                                      defaultValue:
                                          'Error loading FullNameParent1',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 16),
                          child: pw.Container(
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text('Téléphone:'),
                                ),
                                pw.Expanded(
                                  flex: 5,
                                  child: pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.TextField(
                                      name: 'PhoneParent1',
                                      value: widget.childrenDto.parentDto1 !=
                                              null
                                          ? widget.childrenDto.parentDto1!.phone
                                          : '',
                                      defaultValue:
                                          'Error loading PhoneParent1',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 16),
                          child: pw.Container(
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text('Email:'),
                                ),
                                pw.Expanded(
                                  flex: 5,
                                  child: pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.TextField(
                                      height: 42,
                                      name: 'EmailParent1',
                                      value: widget.childrenDto.parentDto1 !=
                                              null
                                          ? widget.childrenDto.parentDto1!.email
                                          : '',
                                      defaultValue:
                                          'Error loading EmailParent1',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(
                    width: 8,
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 16),
                          child: pw.Container(
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text('Nom complet:'),
                                ),
                                pw.Expanded(
                                  flex: 5,
                                  child: pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.TextField(
                                      name: 'FullNameParent2',
                                      value: widget.childrenDto.parentDto2 !=
                                              null
                                          ? '${widget.childrenDto.parentDto2!.firstName} ${widget.childrenDto.parentDto2!.lastName}'
                                          : '',
                                      defaultValue:
                                          'Error loading FullNameParent2',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 16),
                          child: pw.Container(
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text('Téléphone:'),
                                ),
                                pw.Expanded(
                                  flex: 5,
                                  child: pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.TextField(
                                      name: 'PhoneParent2',
                                      value: widget.childrenDto.parentDto2 !=
                                              null
                                          ? widget.childrenDto.parentDto2!.phone
                                          : '',
                                      defaultValue:
                                          'Error loading PhoneParent2',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 16),
                          child: pw.Container(
                            child: pw.Row(
                              children: [
                                pw.Expanded(
                                  flex: 3,
                                  child: pw.Text('Email:'),
                                ),
                                pw.Expanded(
                                  flex: 5,
                                  child: pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.TextField(
                                      height: 42,
                                      name: 'EmailParent2',
                                      value: widget.childrenDto.parentDto2 !=
                                              null
                                          ? widget.childrenDto.parentDto2!.email
                                          : '',
                                      defaultValue:
                                          'Error loading EmailParent2',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
    String path =
        "C:/Users/Ralileo/Downloads/${widget.childrenDto.firstName}_${widget.childrenDto.lastName}.pdf"; //TODO ajouter un champs dans la page settings pour specifier le chemin d'accès
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    // Check if the widget is still mounted before showing the dialog
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('PDF Generated'),
          content: Text('PDF has been saved to $path'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: generatePDF,
      child: const Icon(Icons.more_horiz),
    );
  }
}

class PDFAttendance extends StatefulWidget {
  const PDFAttendance({super.key});

  @override
  PDFAttendanceState createState() => PDFAttendanceState();
}

class PDFAttendanceState extends State<PDFAttendance> {
  Future<void> generatePDF(List<ChildrenDto> childrenDtoList) async {
    final pdf = pw.Document();

    final netImageLogo = await networkImage(
        'https://static.vecteezy.com/system/resources/previews/023/527/936/non_2x/a-hiking-logo-design-with-a-male-hiker-walking-through-a-trail-surrounded-by-trees-and-mountains-vector.jpg');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                height: 48,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Image(netImageLogo),
                    pw.Row(
                      children: [
                        pw.Text(
                          'FEUILLE ',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.normal, fontSize: 32),
                        ),
                        pw.Text(
                          'PRÉSENCE',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 32),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 42,
                child: pw.Text(
                  "Liste des enfants",
                  style: pw.TextStyle(
                    decoration: pw.TextDecoration.underline,
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 28,
                    fontStyle: pw.FontStyle.italic,
                  ),
                ),
              ),
              pw.Container(
                child: pw.Column(
                  children: childrenDtoList.map(
                    (ChildrenDto c) {
                      return pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('${c.firstName} ${c.lastName}'),
                            pw.Container(
                              child: pw.Row(
                                children: [
                                  pw.Text('AM: '),
                                  pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.Checkbox(
                                      name: '${c.id}AM',
                                      value: false,
                                    ),
                                  ),
                                  pw.Text(' PM: '),
                                  pw.Container(
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                        color:
                                            const PdfColor.fromInt(0xFF000000),
                                      ),
                                    ),
                                    child: pw.Checkbox(
                                      name: '${c.id}PM',
                                      value: false,
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.only(left: 8),
                                    child: pw.Container(
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(
                                          color: const PdfColor.fromInt(
                                              0xFF000000),
                                        ),
                                      ),
                                      child: pw.TextField(
                                        height: 42,
                                        width: 225,
                                        name: '${c.id}Notes',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
    String path = "C:/Users/Ralileo/Downloads/example.pdf";
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    // Check if the widget is still mounted before showing the dialog
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('PDF Generated'),
          content: Text('PDF has been saved to $path'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Text('Attendance'),
      onPressed: () {
        const List<String> category = <String>[
          'Castors',
          'Louveteaux',
          'Aventuriers',
          'Routiers'
        ];
        String dropdownValue = category.first;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Select a Category'),
            content: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(40, 40)),
              child: Center(
                child: DropdownMenu<String>(
                  initialSelection: dropdownValue,
                  onSelected: (String? value) {
                    setState(
                      () {
                        dropdownValue = value!;
                      },
                    );
                  },
                  dropdownMenuEntries: category.map(
                    (String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('CANCEL'),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final childrenDtoRepository = ChildrenDtoRepository();
                      final childrenDtoList =
                          await childrenDtoRepository.fetchAllChildrenDto();
                      switch (dropdownValue) {
                        case 'Castors':
                          generatePDF(childrenDtoList
                              .where((e) => e.age <= 8)
                              .toList());
                          break;
                        case 'Louveteaux':
                          generatePDF(childrenDtoList
                              .where((e) => e.age <= 12 && e.age > 8)
                              .toList());
                          break;
                        case 'Aventuriers':
                          generatePDF(childrenDtoList
                              .where((e) => e.age <= 17 && e.age > 12)
                              .toList());
                          break;
                        case 'Routiers':
                          generatePDF(childrenDtoList
                              .where((e) => e.age > 17)
                              .toList());
                          break;
                        default:
                          generatePDF(childrenDtoList);
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
