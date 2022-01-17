import 'dart:io';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/update_profile_model.dart';
import 'package:day1/Task2/model/view_profile.dart';
import 'package:day1/Task2/pages/profileScreen.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EditProfile> {
  Data data;
  bool circular = true;
  final _formKey = GlobalKey<FormState>();
  File _image;
  String pathImage ;
  final picker = ImagePicker();

  // UpdateUserProfileModel updateUserProfileModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.updateUserProfileModel = UpdateUserProfileModel();
  }

  Future getImage() async {
    final pickerFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        _image = File(pickerFile.path);
        setState(() {
          pathImage = pickerFile.path;
        });
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Edit Profile".text.xl.bold.make(),
        actions: [
          GestureDetector(
            onTap: () {
             /* if (updateProfile()) {
                setState(() {
                  Constants.isApiCallProcess = true;
                });
                APIServices()
                    .updateUserProfile(Constants.updateUserProfileModel, pathImage)
                    .then((UpdateProfileResponse response) {
                  setState(() {
                    Constants.isApiCallProcess = false;
                  });
                  print("update profile response ==>" +response.toString());

                  if (response.code == 200) {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      " Now profile updated",
                      response.message,
                      "Ok",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                    );
                  } else {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      "update Fail",
                      response.message,
                      "Ok",
                      () {
                        Navigator.of(context).pop();
                      },
                    );
                  }
                });
              }*/
              if (updateProfile()) {
                setState(() {
                  Constants.isApiCallProcess = true;
                });
                APIServices()
                    .updateUserProfile(Constants.updateUserProfileModel, pathImage);

              }
            },
            child: const Icon(Icons.done).px(10),
          )
        ],
      ),
      body: FutureBuilder<ViewProfileResponse>(
        future: APIServices().getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: _image == null
                                  ? NetworkImage(Constants.urlImage +
                                      snapshot.data.data.profile)
                                  : FileImage(File(_image.path)),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              getImage();
                            },
                            child: "Change profile photo"
                                .text
                                .xl
                                .extraBold
                                .make()),
                        const Divider(
                          thickness: 2,
                        )
                      ],
                    ),
                    10.heightBox,
                    Column(
                      children: [
                        TextFormField(
                          initialValue: snapshot.data.data.username,
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              Constants.updateUserProfileModel.username = input,
                          decoration: const InputDecoration(
                              hintText: "enter your Username",
                              labelText: "username",
                              border: OutlineInputBorder()),
                        ),
                        20.heightBox,
                        TextFormField(
                          initialValue: snapshot.data.data.email,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) =>
                              Constants.updateUserProfileModel.email = input,
                          decoration: const InputDecoration(
                              hintText: "enter your email",
                              labelText: "Email",
                              border: OutlineInputBorder()),
                        ),
                        20.heightBox,
                        TextFormField(
                          initialValue: snapshot.data.data.bio,
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              Constants.updateUserProfileModel.bio = input,
                          decoration: const InputDecoration(
                              hintText: "enter your bio",
                              labelText: "bio",
                              border: OutlineInputBorder()),
                        ),
                        20.heightBox,
                        TextFormField(
                          initialValue: snapshot.data.data.phoneNo,
                          keyboardType: TextInputType.number,
                          onSaved: (input) =>
                              Constants.updateUserProfileModel.phoneNo = input,
                          decoration: const InputDecoration(
                              hintText: "enter your Number",
                              labelText: "Number",
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ).px(16.0),
                    20.heightBox,
                    const Divider(
                      thickness: 2,
                    ),
                    "Account Provacy".text.make().objectCenterLeft().px(20),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.grey[800])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.lock),
                              10.widthBox,
                              "Private Account".text.make(),
                            ],
                          ),
                          FlutterSwitch(
                            height: 25.0,
                            width: 40.0,
                            padding: 4.0,
                            toggleSize: 15.0,
                            borderRadius: 10.0,
                            activeColor: Vx.blueGray400,
                            value: Constants.isToggled,
                            onToggle: (value) {
                              setState(() {
                                Constants.isToggled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ).p12()
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator().centered();
          }
        },
      ),
    );
  }

  bool updateProfile() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
