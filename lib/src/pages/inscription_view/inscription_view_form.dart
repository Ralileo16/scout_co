import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:scout_co/core/localization/generated/l10n.dart';
import 'package:scout_co/cubit/inscription_view_cubit.dart';
import 'package:scout_co/src/model/children_dto.dart';
import 'package:scout_co/src/model/parent_dto.dart';
import 'package:scout_co/src/utils/card_header_outline.dart';
import 'package:scout_co/src/utils/locator.dart';

//Form
class InscriptionViewForm extends StatefulWidget {
  const InscriptionViewForm({
    super.key,
  });

  @override
  State<InscriptionViewForm> createState() => _InscriptionViewFormState();
}

class _InscriptionViewFormState extends State<InscriptionViewForm> {
  final I10n i10n = locator<I10n>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InscriptionViewCubit, InscriptionViewState>(
      builder: (context, state) {
        if (state is InscriptionViewLoadedWithSelect) {
          ChildrenDto childrenDto = state.childrenDto;
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardHeaderOutline(
                  title: i10n.formCardHeaderPersonalInformations,
                  child: InscriptionViewChildInfoForm(
                    childrenDto: childrenDto,
                  ),
                ),
                CardHeaderOutline(
                  title: i10n.formCardHeaderParent1,
                  child: InscriptionViewParentInfoForm(
                    parentDto: childrenDto.parentDto1,
                  ),
                ),
                CardHeaderOutline(
                  title: i10n.formCardHeaderParent2,
                  child: InscriptionViewParentInfoForm(
                    parentDto: childrenDto.parentDto2,
                  ),
                ),
                InscriptionViewFormButtons(
                  childrenDto: childrenDto,
                )
              ],
            ),
          );
        } else if (state is InscriptionViewLoadedWithSelectCanEdit) {
          ChildrenDto childrenDto = state.childrenDto;
          bool canEdit = state.canEdit;
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardHeaderOutline(
                  title: i10n.formCardHeaderPersonalInformations,
                  child: InscriptionViewChildInfoForm(
                    canEdit: canEdit,
                    childrenDto: childrenDto,
                  ),
                ),
                CardHeaderOutline(
                  title: i10n.formCardHeaderParent1,
                  child: InscriptionViewParentInfoForm(
                    canEdit: canEdit,
                    parentDto: childrenDto.parentDto1,
                  ),
                ),
                CardHeaderOutline(
                  title: i10n.formCardHeaderParent2,
                  child: InscriptionViewParentInfoForm(
                    canEdit: canEdit,
                    parentDto: childrenDto.parentDto2,
                  ),
                ),
                InscriptionViewFormButtons(
                  childrenDto: childrenDto,
                )
              ],
            ),
          );
        } else {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardHeaderOutline(
                  title: i10n.formCardHeaderPersonalInformations,
                  child: InscriptionViewChildInfoForm(),
                ),
                CardHeaderOutline(
                  title: i10n.formCardHeaderParent1,
                  child: InscriptionViewParentInfoForm(),
                ),
                CardHeaderOutline(
                  title: i10n.formCardHeaderParent2,
                  child: InscriptionViewParentInfoForm(),
                ),
                const InscriptionViewFormButtons()
              ],
            ),
          );
        }
      },
    );
  }
}

//Form child
class InscriptionViewChildInfoForm extends StatelessWidget {
  InscriptionViewChildInfoForm({
    super.key,
    ChildrenDto? childrenDto,
    this.canEdit = false,
  }) : _childrenDto = childrenDto;

  final ChildrenDto? _childrenDto;
  final bool canEdit;

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
  final TextEditingController _textEditingControllerProvince =
      TextEditingController();
  final TextEditingController _textEditingControllerDateOfBirth =
      TextEditingController();
  final TextEditingController _textEditingControllerAge =
      TextEditingController();
  final TextEditingController _textEditingControllerNotes =
      TextEditingController();
  final TextEditingController _textEditingControllerAddress =
      TextEditingController();
  final TextEditingController _textEditingControllerCity =
      TextEditingController();
  final TextEditingController _textEditingControllerPostalCode =
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
      _textEditingControllerProvince.text = _childrenDto.province;
      _textEditingControllerAddress.text = _childrenDto.address;
      _textEditingControllerCity.text = _childrenDto.city;
      _textEditingControllerPostalCode.text = _childrenDto.postalCode;
    }

    final I10n i10n = locator<I10n>();

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
                  onChanged: (String text) {
                    _childrenDto!.firstName = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerFirstName,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldFirstName,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.lastName = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerLastName,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldLastName,
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
                  onChanged: (String text) {
                    _childrenDto!.phone = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerPhone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldPhone,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.email = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerEmail,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldEmail,
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
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.dateOfBirth =
                        DateTime.tryParse(text) ?? DateTime.now();
                    _textEditingControllerAge.text =
                        _childrenDto.age.toString();
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerDateOfBirth,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldDoB,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _childrenDto!.dateOfBirth,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        String formattedDate = '';
                        if (pickedDate != null) {
                          _childrenDto.dateOfBirth = pickedDate;
                          formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          _textEditingControllerDateOfBirth.text =
                              formattedDate;
                          _textEditingControllerAge.text =
                              _childrenDto.age.toString();
                        } else {}
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldAge,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.gender = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerGender,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldGender,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.province = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerProvince,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldState,
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
                  onChanged: (String text) {
                    _childrenDto!.address = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldAddress,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.city = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerCity,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldCity,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _childrenDto!.postalCode = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerPostalCode,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldZipCode,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onChanged: (String text) {
              _childrenDto!.notes = text;
            },
            enabled: canEdit,
            controller: _textEditingControllerNotes,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: i10n.formFieldNotes,
            ),
          ),
        ),
      ],
    );
  }
}

//Form parent
class InscriptionViewParentInfoForm extends StatelessWidget {
  InscriptionViewParentInfoForm({
    super.key,
    ParentDto? parentDto,
    this.canEdit = false,
  }) : _parentDto = parentDto;

  final ParentDto? _parentDto;
  final bool canEdit;

  final TextEditingController _textEditingControllerParentFirstName =
      TextEditingController();
  final TextEditingController _textEditingControllerParentLastName =
      TextEditingController();
  final TextEditingController _textEditingControllerParentPhone =
      TextEditingController();
  final TextEditingController _textEditingControllerParentEmail =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_parentDto != null) {
      _textEditingControllerParentFirstName.text = _parentDto.firstName;
      _textEditingControllerParentLastName.text = _parentDto.lastName;
      _textEditingControllerParentPhone.text =
          _parentDto.phone ?? "Not provided";
      _textEditingControllerParentEmail.text =
          _parentDto.email ?? "Not provided";
    }

    final I10n i10n = locator<I10n>();

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
                  onChanged: (String text) {
                    _parentDto!.firstName = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerParentFirstName,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldFirstName,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _parentDto!.lastName = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerParentLastName,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldLastName,
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
                  onChanged: (String text) {
                    _parentDto!.phone = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerParentPhone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldPhone,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: (String text) {
                    _parentDto!.email = text;
                  },
                  enabled: canEdit,
                  controller: _textEditingControllerParentEmail,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: i10n.formFieldEmail,
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

//Form buttons
class InscriptionViewFormButtons extends StatefulWidget {
  const InscriptionViewFormButtons({
    super.key,
    this.childrenDto,
  });

  final ChildrenDto? childrenDto;

  @override
  State<InscriptionViewFormButtons> createState() =>
      _InscriptionViewFormButtonsState();
}

class _InscriptionViewFormButtonsState
    extends State<InscriptionViewFormButtons> {
  final I10n i10n = locator<I10n>();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: i10n.formButtonsAddNewTooltip,
              child: OutlinedButton(
                onPressed: () {
                  final childrenDtoCubit = context.read<InscriptionViewCubit>();
                  childrenDtoCubit.onAddNewPressed();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: i10n.formButtonsEditTooltip,
              child: widget.childrenDto != null
                  ? OutlinedButton(
                      onPressed: () {
                        final childrenDtoCubit =
                            context.read<InscriptionViewCubit>();
                        childrenDtoCubit.onEditPressed();
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.yellow,
                      ),
                    )
                  : const OutlinedButton(
                      onPressed: null,
                      child: Icon(
                        Icons.edit,
                        color: Colors.yellow,
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: i10n.formButtonsSaveTooltip,
              child: widget.childrenDto != null
                  ? OutlinedButton(
                      onPressed: () {
                        final childrenDtoCubit =
                            context.read<InscriptionViewCubit>();
                        if (widget.childrenDto != null) {
                          childrenDtoCubit.onSavePressed(widget.childrenDto!);
                        }
                      },
                      child: const Icon(
                        Icons.save,
                        color: Colors.green,
                      ),
                    )
                  : const OutlinedButton(
                      onPressed: null,
                      child: Icon(
                        Icons.save,
                        color: Colors.green,
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: i10n.formButtonsCancelTooltip,
              child: widget.childrenDto != null
                  ? OutlinedButton(
                      onPressed: () {
                        final childrenDtoCubit =
                            context.read<InscriptionViewCubit>();
                        childrenDtoCubit.onCancelPressed();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    )
                  : const OutlinedButton(
                      onPressed: null,
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: i10n.formButtonsPaidTooltip,
              child: widget.childrenDto != null
                  ? OutlinedButton(
                      onPressed: () {
                        final childrenDtoCubit =
                            context.read<InscriptionViewCubit>();
                        childrenDtoCubit.onPaidPressed(widget.childrenDto!);
                      },
                      child: Icon(
                        Icons.payment,
                        color: widget.childrenDto!.isPaid
                            ? Colors.red
                            : Colors.green,
                      ),
                    )
                  : const OutlinedButton(
                      onPressed: null,
                      child: Icon(
                        Icons.payment,
                        color: Colors.green,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
