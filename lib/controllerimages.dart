import 'modelimages.dart';

class ControllerImage {
  int _imgno = 0;
  List<ModelImage> _images = [
    ModelImage("Amitab_Bachhan.jpg", "Amir Khan", "Rajesh Hamal",
        "Akshya Kumar", "Amitab Bachhan", "Amitab Bachhan"),
    ModelImage("Loard_Shiva.jpg", "Load Bishnu", "Loard Krishna",
        "Loard Buddha", "Loard Shiva", "Amitab Bachhan"),
    ModelImage("Mata_Saraswoti.png", "Mata Saraswoti", "Mata Parbati",
        "Mata Sita", "Mata Devi", "Mata Saraswoti"),
    ModelImage("Narayan_Gopal.jpg", "Arun Joshi", "Narayan Gopal",
        "Rajesh Payal Rai", "Deep Shrestha", "Narayan Gopal"),
    ModelImage("Rajani_Kanth.jpg", "Rajani kantha", "Rajesh Hamal",
        "Akshya Kumar", "Anil Kapoor", "Rajani Kantha"),
    ModelImage("Rajesh_Hamal.jpg", "pal Sah", "Dhiren Shaky",
        "Rajesh Hamal", "Bhuean KC", "Rajesh Hamal"),
    ModelImage("Shree_Krishna.jpg", "Load Bishnu", "Loard Shiva",
        "Shree Krishna", "Loard Ram", "Shree Krishna")
  ];
  int gettotalimageno() {
    return _images.length;
  }

  int reset() {
    return _imgno = 0;
  }

  void nextimage() {
    if (_imgno < _images.length - 1) _imgno++;
  }

  bool isfinished() {
    if (_imgno < _images.length - 1)
      return false;
    else
      return true;
  }

  String getimagename() {
    return _images[_imgno].imagename;
  }

  String getanswer() {
    return _images[_imgno].answer;
  }

  List<String> getoptions() {
    List<String> opt = [
      _images[_imgno].opt1,
      _images[_imgno].opt2,
      _images[_imgno].opt3,
      _images[_imgno].opt4,
    ];
    return opt;
  }
}
