import 'package:diple/core/core.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:diple/views/components/buttons/secondary_button.dart';
import 'package:diple/views/components/drag_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSheet extends StatefulWidget {
  const AuthSheet({
    Key key,
  }) : super(key: key);

  @override
  _AuthSheetState createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragSheet(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: state is Unauthenticated ? _PhoneForm() : _CodeForm(),
            );
          },
        ),
      ),
    );
  }
}

class _CodeForm extends StatefulWidget {
  @override
  _CodeFormState createState() => _CodeFormState();
}

class _CodeFormState extends State<_CodeForm> {
  TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: true,
          keyboardType: TextInputType.number,
          controller: _codeController,
          decoration: InputDecoration(
            labelText: 'SMS Code',
          ),
        ),
        SizedBox(height: 32.0),
        SecondaryButton(
          child: Text(
            'Verify code',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            context.bloc<AuthBloc>().add(AuthenticatePhoneNumber(_codeController.text));
          },
        ),
      ],
    );
  }
}

class _PhoneForm extends StatefulWidget {
  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<_PhoneForm> {
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: '+47');
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: true,
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone number',
          ),
        ),
        SizedBox(height: 32.0),
        SecondaryButton(
          child: Text(
            'Send code',
          ),
          onPressed: () {
            context.bloc<AuthBloc>().add(VerifyPhoneNumber(_phoneController.text));
          },
        ),
      ],
    );
  }
}
