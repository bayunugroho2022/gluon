import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gluon/app/constan/string_constan/string_constant.dart';
import 'package:gluon/app/widgets/custom_text_field.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        actions: [
          Row(
            children: [
              Text('use button'),
              Obx(
                () => Switch(
                  value: controller.isButtonActive.value,
                  onChanged: (val) {
                    controller.onChangeSwitchButton(val);
                  },
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstant.label,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              label: 'Input',
              hint: 'Input',
              focusNode: controller.focusInputNode,
              inputController: controller.inputController,
              onChanged: (val) {
                controller.onChangeInput(val);
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Output',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            Obx(
              () => Text(
                controller.word.value,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Obx(() => Visibility(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.onSubmit();
                    },
                    child: Text('  Convert  '),
                  ),
                ),
              ),
              visible: controller.isButtonActive.value,
            )),
          ],
        ),
      ),
    );
  }
}
