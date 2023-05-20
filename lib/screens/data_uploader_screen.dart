import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/question_paper/data_uploader.dart';
import 'package:masterclass/firebase_ref/loading_status.dart';

class DataUploderScreen extends StatelessWidget {
  const DataUploderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GetBuilder<DataUploader>(builder: (controller) {
            return GestureDetector(
              onTap: () => controller.uploadData(),
              child: Text(controller.loadingStatus == LoadingStatus.loading
                  ? "Loading...."
                  : "Completed  "),
            );
          }),
        ),
      ),
    );
  }
}
