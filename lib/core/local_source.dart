//
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// final class LocalSource {
//   const LocalSource(this.box);
//
//
//   static Future<void> initHive() async{
//     await Hive.initFlutter();
//     if(!Hive.isBoxOpen('settings')) {
//       await Hive.openBox('settings');
//     }
//   }
//
//   final Box<dynamic> box;
//
//
//   void setHasPin({
//     required bool value,
//   }) {
//     box.put(AppKeys.pin, value);
//   }
//
//   bool get hasPin =>
//       box.get(AppKeys.pin, defaultValue: false) as bool;
//
//   Future<void> setPin({
//     required String pinCode,
//   }) async {
//     await box.put(AppKeys.pin, true);
//     await box.put(AppKeys.pinCode, pinCode);
//   }
//
//   String get getPin => box.get(AppKeys.pinCode) as String;
//
//
//
//
//
//
//
//
//
//   void setHasProfile({
//     required bool value,
//   }) {
//     box.put(AppKeys.hasProfile, value);
//   }
//
//   bool get hasProfile =>
//       box.get(AppKeys.hasProfile, defaultValue: false) as bool;
//
//   Future<void> setUser({
//     required String phone,
//     required String fcmToken,
//
//   }) async {
//
//   }
//
//
//
//
//
//   Future<void> setKey(String key, String value) async {
//     await box.put(key, value);
//   }
//
//   String getKey(String key) => box.get(key, defaultValue: '') as String;
//
//   Future<void> clear() async {
//     await box.clear();
//   }
//
//   Future<void> cartClear() async {
//     await box.delete(AppKeys.cart);
//     await box.delete(AppKeys.isEmptyCart);
//   }
// }
//
//
// sealed class AppKeys {
//   AppKeys._();
//
//   static const String isEmptyCart = 'isEmptyCart';
//   static const String cart = 'cart';
//
//
// }
