import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageUploadGallery()async{
  
  
    final XFile? file=  await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 90);
    if(file !=null){
    return File(file.path);
  }
  
  

}


fileUploadGallery([isSvg=true])async{
 
   
    // ignore: unused_local_variable
    FilePickerResult? result= await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:isSvg? [
      "svg",
      "SVG",
    ]:[
      "png",
      "PNG",
      "jpg",
      "jpeg",
      "gif"
    ]
  );

  if(result !=null){
   
    return File(result.files.single.path!);
  }else{
    return null;
  }
   
 
}