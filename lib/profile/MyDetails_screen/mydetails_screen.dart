import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/profile/MyDetails_screen/controller/myProfile_controller.dart';
import 'package:newfigma/profile/edit_profile/editProfile.dart';
import 'package:newfigma/response/status.dart';
import 'package:newfigma/widgets/detailInfo.dart';
import 'package:newfigma/widgets/iconbutton.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  ProfileController pc = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    pc.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    // double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'My Details',
          style: TextStyle(color: ColorConstant.black),
        ),
        backgroundColor: ColorConstant.white,
        elevation: 3,
      ),
      body: Column(
        children: [
          Obx(
            () {
              switch (pc.rxRequestStatus.value) {
                case Status.LOADING:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.ERROR:
                  return Center(child: Text('Something went wrong'));

                case Status.COMPLETED:
                  final profile = pc.profileModel.value.customerWithUrl;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailInfo(text1: 'Name :', text2: '${profile?.name}'),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailInfo(
                            text1: 'Email :', text2: '${profile?.email}'),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailInfo(
                            text1: 'Mobile Number :',
                            text2: '${profile?.mobile}'),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailInfo(
                            text1: 'User Name :',
                            text2: '${profile?.username}'),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailInfo(
                            text1: 'Status :', text2: '${profile?.status}'),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailInfo(
                            text1: 'Updated at :',
                            text2: '${profile?.updatedAt}'),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                  );

                default:
                  return const Text('Unhandled status');
              }
            },
          ),
          Spacer(),
          IconButtonWidget(
            onPressed: () {
              Get.to(ChangeDetailsPage());
            },
            text: 'Change Details',
            width: width * 0.7,
            backgroundColor: ColorConstant.blue,
            textColor: ColorConstant.white,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}


//  Material(
//                       elevation: 8,
//                       borderRadius: BorderRadius.circular(10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           gradient: LinearGradient(colors: [Colors.red,ColorConstant.extralightOrange,],begin: Alignment.topCenter),
//                           border: Border.all(
//                             color: ColorConstant.textGrey
//                           )
//                         ),
//                         width: width*0.85,
//                         height: height*0.3,
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               DetailInfo(text1: 'Name', text2: '${profile?.name}'),
//                                  SizedBox(height: 15,),
//                                  DetailInfo(text1: 'Email', text2: '${profile?.email}'),
//                                  SizedBox(height: 15,),
//                                  DetailInfo(text1: 'Mobile No.', text2:'${profile?.mobile}' ),
                                
//                                 SizedBox(height: 15,),
//                                 DetailInfo(text1: 'Username', text2:'${profile?.username}' ),
//                                  SizedBox(height: 15,),
//                                 DetailInfo(text1: 'Status', text2:'${profile?.status}' ),
                                
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),