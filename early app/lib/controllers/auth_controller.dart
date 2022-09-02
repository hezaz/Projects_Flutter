import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

// function to upload the picked image to the storage

  uploadImageToStorage(Uint8List? image) async {
    Reference ref =
        _firebaseStorage.ref().child('profiles').child(_auth.currentUser!.uid);

    UploadTask uploadtask = ref.putData(image!);

    TaskSnapshot snap = await uploadtask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  // function to pick image from galery or camero

  pickimage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(source: source);

    if (_file != null) {
      return _file.readAsBytes();
    } else {
      print('no image selected');
    }
  }

  Future<String> loginUser(String email, String password) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'Loged In';
        print('Loged In');
        

      } else {
        res = 'Please fields must be not empty';
        print('Please fields must be not empty');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signUpUsers(
      String fullName, String email, String password, Uint8List? image) async {
    String res = 'some error occured';
    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await uploadImageToStorage(image);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullName': fullName,
          'email': email,
          'image': downloadUrl,
          'moderator' : false,
        });
        res = 'Account Created';
        print('Account Created');
      } else {
        res = 'Please fields must be not empty';
        print('Please fields must be not empty');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
