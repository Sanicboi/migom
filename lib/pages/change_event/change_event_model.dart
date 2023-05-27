import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ChangeEventModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? image;

  List<DocumentReference> category = [];
  void addToCategory(DocumentReference item) => category.add(item);
  void removeFromCategory(DocumentReference item) => category.remove(item);
  void removeAtIndexFromCategory(int index) => category.removeAt(index);

  DateTime? time;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for onlainoffline widget.
  bool? onlainofflineValue;
  FormFieldController<bool>? onlainofflineValueController;
  // State field(s) for Limited widget.
  bool? limitedValue;
  // State field(s) for ogranechenie widget.
  String? ogranechenieValue;
  FormFieldController<String>? ogranechenieValueController;
  // State field(s) for LimitedPlaces widget.
  bool? limitedPlacesValue;
  // State field(s) for limitPlaces widget.
  TextEditingController? limitPlacesController;
  final limitPlacesMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)? limitPlacesControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Repeated widget.
  bool? repeatedValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // State field(s) for FulText widget.
  TextEditingController? fulTextController;
  String? Function(BuildContext, String?)? fulTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  final textFieldMask2 = MaskTextInputFormatter(mask: '######');
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Paid widget.
  bool? paidValue;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  final textFieldMask3 = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for Private widget.
  bool? privateValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    limitPlacesController?.dispose();
    fulTextController?.dispose();
    textController4?.dispose();
    textController5?.dispose();
  }

  /// Additional helper methods are added here.

}
