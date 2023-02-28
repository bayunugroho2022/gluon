import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon/app/utils/number_to_word.dart';

class HomeController extends GetxController {
  final inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isButtonActive = false.obs;
  final focusInputNode = FocusNode();
  final word = ''.obs;
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    inputController.dispose();
  }

  void onSubmit() {
    if (inputController.text.isEmpty) {
      word.value = '';
      return;
    }

    setWord(inputController.text);
  }

  void onChangeInput(String val) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    if (val.isEmpty && isButtonActive.isFalse) {
      word.value = '';
      return;
    }

    if (isButtonActive.isTrue) {
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 100), () {
      setWord(val);
    });
  }

  void onChangeSwitchButton(bool val) {
    isButtonActive.value = val;
    word.value = '';
    inputController.text = '';
  }

  void setWord(String value) {
    try {
      word.value = ConvertNumberToWords.number(int.parse(value));
    } catch (e) {
      word.value = e.toString();
    }
  }
}
