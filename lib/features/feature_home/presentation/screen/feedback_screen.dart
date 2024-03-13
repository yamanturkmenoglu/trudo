import 'package:flutter/material.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/textstyle.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.black,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColor.black,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 16,
                        right: 16),
                    child: Image.asset('assets/images/feedbackImage.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Your FeedBack',
                        style: poppinsSemiBoldExtraLarge.copyWith(
                            color: AppColor.purple)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Give your best time for this moment.',
                        textAlign: TextAlign.center,
                        style: poppinsMediumSmall.copyWith(
                            color: AppColor.grifortext)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildComposer(),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('Send',
                                    style: poppinsMediumSmall.copyWith(
                                        color: AppColor.black)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: AppColor.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {},
                style: poppinsMediumNormal,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your feedback...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
