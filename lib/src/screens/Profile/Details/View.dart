import 'package:flutter/material.dart';
import 'package:frontend/src/screens/Profile/Details/Form.dart';
import 'package:frontend/src/screens/Profile/Details/index.dart';
import 'package:frontend/src/screens/Profile/Details/Preface.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<ProfileView> {
  FormStateToProps props = FormStateToProps();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    TextStyle _titleStyle =
        TextStyle(color: Color(0xFFffffff), fontSize: size.height * .035);

    return StreamBuilder(
        stream: props.getStatusToEdit,
        builder: (context, snapshot) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: [
                Container(
                  margin: EdgeInsets.only(right: size.width * .01),
                  child: IconButton(
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                      size: size.width * .07,
                    ),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (Route<dynamic> route) => false),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: size.width * .02),
                  child: (snapshot.data ?? false)
                      ? null
                      : IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: size.width * .07,
                          ),
                          disabledColor: Colors.red,
                          onPressed: () => props.setStatusToEdit.add(true),
                        ),
                ),
              ],
              title: Text('Perfil', style: _titleStyle),
            ),
            body: ProfileSection(
              isEditing: snapshot.data ?? false,
              cancelEdit: (bool value) => props.setStatusToEdit.add(value),
            ),
          );
        });
  }
}

// ////////////////////////////////////////////////////////////////////

class ProfileSection extends StatefulWidget {
  final bool isEditing;
  final Function cancelEdit;

  const ProfileSection({
    Key key,
    this.cancelEdit,
    this.isEditing = false,
  }) : super(key: key);

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Preface(),
        SectionForm(
          isEditing: widget.isEditing,
          cancelEdit: widget.cancelEdit,
        ),
      ],
    );
  }
}
