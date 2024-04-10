import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_event.dart';
import 'package:nefee_dev_challenge/features/profile/widgets/demo_form_text_field.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final key = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final user = context.read<ProfileBloc>().state.user;
    return FormBuilder(
      key: key,
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DemoFormTextField(
              label: 'Name',
              hintText: 'Add your name',
              name: 'name',
              initialValue: user.name,
              onEditingComplete: () => _updateProp('name'),
            ),
            DemoFormTextField(
              label: 'Title',
              hintText: 'Add your job title',
              name: 'title',
              initialValue: user.title,
              onEditingComplete: () => _updateProp('title'),
            ),
            DemoFormTextField(
              label: 'Phone Number',
              hintText: 'Add Phone Number',
              initialValue: user.phoneNumber,
              name: 'phoneNumber',
              onEditingComplete: () => _updateProp('phoneNumber'),
            ),
            DemoFormTextField(
              label: 'Email',
              initialValue: user.email,
              hintText: 'Add your Email',
              name: 'email',
              onEditingComplete: () => _updateProp('email'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProp(String propName) {
    final propValue = key.currentState?.fields[propName]?.value as String?;
    if (propValue != null && propValue != '') {
      context.read<ProfileBloc>().add(PropertyChangeEvent(propName, propValue));
    }
  }
}
