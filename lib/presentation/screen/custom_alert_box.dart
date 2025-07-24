import 'package:crud_bloc_api_test/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../consts/custom_button.dart';
import '../../consts/custom_textfield.dart';
import '../bloc/home_crud_bloc.dart';
import '../service_controller/home_crud_service_controller.dart';

class CustomAlertBox extends StatefulWidget {
  const CustomAlertBox({super.key});

  @override
  State<CustomAlertBox> createState() => _CustomAlertBoxState();
}

class _CustomAlertBoxState extends State<CustomAlertBox> {
  final HomeCrudBloc homeCrudBloc = HomeCrudBloc(HomeCrudServiceController());
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userContactController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userAddressController = TextEditingController();

  @override
  void dispose() {
    homeCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCrudBloc, HomeCrudState>(
      bloc: homeCrudBloc,
      listener: (context, state) {
        if (state is HomeCrudUserCreateSuccess) {
          Utils.toastMessage("User created successfully!");
          Navigator.pop(context); // close dialog after success
        } else if (state is HomeCrudUserNotCreateError) {
          Utils.toastMessage("Failed to create user!", isError: true);
        } else if (state is HomeCrudError) {
          Utils.toastMessage("Something went wrong while fetching!", isError: true);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Colors.grey[200],
          titlePadding: EdgeInsets.all(0),
          actionsPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          title: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 5,
                left: 0,
                right: -240,
                child: Transform.translate(
                  offset: Offset(0, -2),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 28,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Add Data',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                            width: 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 300,
                            child: CustomTextfield(
                              controller: userNameController,
                              hintText: 'Name',
                              onChanged: (String value) {},
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextfield(
                              controller: userContactController,
                              hintText: 'Contact',
                              onChanged: (String value) {},
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextfield(
                              controller: userEmailController,
                              hintText: 'Email',
                              onChanged: (String value) {},
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextfield(
                              controller: userAddressController,
                              hintText: 'Address',
                              onChanged: (String value) {},
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomButton(
                              title: "Submit",
                                cilcked: () {
                                  final name = userNameController.text.trim();
                                  final contact = userContactController.text.trim();
                                  final email = userEmailController.text.trim();
                                  final address = userAddressController.text.trim();

                                  if (name.isEmpty || contact.isEmpty || email.isEmpty || address.isEmpty) {
                                    Utils.toastMessage("All fields are required!", isError: true);
                                    return;
                                  }

                                  homeCrudBloc.add(DataSubmitted(
                                    userName: name,
                                    userContact: contact,
                                    userEmail: email,
                                    userAddress: address,
                                  ));
                                }
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
