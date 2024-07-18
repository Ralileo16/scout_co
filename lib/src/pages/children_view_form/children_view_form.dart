import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_co/cubit/children_view_cubit.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/utils/card_header_outline.dart';
import 'package:intl/intl.dart';

class ChildrenViewForm extends StatefulWidget {
  const ChildrenViewForm({
    super.key,
  });

  @override
  State<ChildrenViewForm> createState() => _ChildrenViewFormState();
}

class _ChildrenViewFormState extends State<ChildrenViewForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildrenViewCubit, ChildrenViewState>(
      builder: (context, state) {
        if (state is ChildrenViewLoaded) {
          ChildrenDto childrenDto = state.childrenDto;
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardHeaderOutline(
                  title: 'Personal Informations',
                  child: ChildrenViewChildInfoForm(
                    childrenDto: childrenDto,
                  ),
                ),
                const CardHeaderOutline(
                  title: 'Parent 1',
                  child: ChildrenViewParentInfoForm(),
                ),
                const CardHeaderOutline(
                  title: 'Parent 2',
                  child: ChildrenViewParentInfoForm(),
                ),
                const ChildrenViewFormButtons()
              ],
            ),
          );
        } else {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardHeaderOutline(
                  title: 'Personal Informations',
                  child: ChildrenViewChildInfoForm(),
                ),
                const CardHeaderOutline(
                  title: 'Parent 1',
                  child: ChildrenViewParentInfoForm(),
                ),
                const CardHeaderOutline(
                  title: 'Parent 2',
                  child: ChildrenViewParentInfoForm(),
                ),
                const ChildrenViewFormButtons()
              ],
            ),
          );
        }
      },
    );
  }
}

class ChildrenViewChildInfoForm extends StatelessWidget {
  ChildrenViewChildInfoForm({
    super.key,
    ChildrenDto? childrenDto,
  }) : _childrenDto = childrenDto;

  final ChildrenDto? _childrenDto;

  final TextEditingController _textEditingControllerFirstName =
      TextEditingController();
  final TextEditingController _textEditingControllerLastName =
      TextEditingController();
  final TextEditingController _textEditingControllerPhone =
      TextEditingController();
  final TextEditingController _textEditingControllerEmail =
      TextEditingController();
  final TextEditingController _textEditingControllerGender =
      TextEditingController();
  final TextEditingController _textEditingControllerDateOfBirth =
      TextEditingController();
  final TextEditingController _textEditingControllerAge =
      TextEditingController();
  final TextEditingController _textEditingControllerNotes =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_childrenDto != null) {
      _textEditingControllerFirstName.text = _childrenDto.firstName;
      _textEditingControllerLastName.text = _childrenDto.lastName;
      _textEditingControllerPhone.text = _childrenDto.phone ?? "Not provided";
      _textEditingControllerEmail.text = _childrenDto.email ?? "Not provided";
      _textEditingControllerGender.text = _childrenDto.gender ?? "Not provided";
      _textEditingControllerDateOfBirth.text =
          DateFormat('yyyy-MM-dd').format(_childrenDto.dateOfBirth);
      _textEditingControllerAge.text = _childrenDto.age.toString();
      _textEditingControllerNotes.text = _childrenDto.notes ?? "";
    }
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerFirstName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerLastName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerPhone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
              ),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerGender,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerDateOfBirth,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date of Birth',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingControllerAge,
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: _textEditingControllerNotes,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Notes',
            ),
          ),
        ),
      ],
    );
  }
}

class ChildrenViewParentInfoForm extends StatelessWidget {
  const ChildrenViewParentInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChildrenViewFormButtons extends StatelessWidget {
  const ChildrenViewFormButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: const Text('Add new'),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: const Text('Edit'),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: const Text('Save'),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: const Text('Cancel'),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ),
      ],
    );
  }
}
