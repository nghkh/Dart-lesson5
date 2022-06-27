void main() {
  var flutter = Flutter();
  flutter.Remaining();
  print('================================');
  var android = Android();
  android.Remaining();
  print('================================');
  var iOS = ios();
  iOS.Remaining();
  print('================================');
  var Web = web();
  Web.Remaining();
}

class Flutter
    implements buildandroid, buildios, buildweb, buildesktop, remaining {
  final String TenLop = 'Flutter';
  final int slhv = 11;
  final List HVFlutter = HocVien.hv.sublist(0, 2);
  Flutter() {
    print(TenLop);
    print(slhv);
    print(HVFlutter);
  }
  @override
  void build() {
    print('hocvien');
  }

  @override
  int remain = 0;
  void Remaining() {
    var count = HVFlutter.length;
    if (count < slhv) {
      remain = slhv - count;
      print('Số lượng học viên còn thiếu: $remain');
    }
  }
}

class Android implements buildandroid, remaining {
  final String TenLop = 'Android';
  final int slhv = 12;
  List<String> HVAndroid = HocVien.hv.sublist(1, 4);
  Android() {
    print(TenLop);
    print(slhv);
    print(HVAndroid);
  }
  @override
  void build() {
    print('hocvien');
  }

  @override
  int remain = 0;
  void Remaining() {
    var count = HVAndroid.length;
    if (count < slhv) {
      remain = slhv - count;
      print('Số lượng học viên còn thiếu: $remain');
    }
  }
}

class ios implements buildios, remaining {
  final String TenLop = 'ios';
  final int slhv = 13;
  List<String> HVios = HocVien.hv.sublist(3, 6);
  ios() {
    print(TenLop);
    print(slhv);
    print(HVios);
  }

  @override
  int remain = 0;
  void Remaining() {
    var count = HVios.length;
    if (count < slhv) {
      remain = slhv - count;
      print('Số lượng học viên còn thiếu: $remain');
    }
  }
}

class web implements buildweb, remaining {
  final String TenLop = 'web';
  final int slhv = 14;
  List<String> HVweb = HocVien.hv.sublist(5, 6);
  web() {
    print(TenLop);
    print(slhv);
    print(HVweb);
  }

  @override
  int remain = 0;
  void Remaining() {
    var count = HVweb.length;
    if (count < slhv) {
      remain = slhv - count;
      print('Số lượng học viên còn thiếu: $remain');
      // var randomItem = (HocVien.hv..shuffle()).first;
    }
  }
}

abstract class buildandroid {
  void build() {}
}

abstract class buildios {}

abstract class buildweb {}

abstract class buildesktop {}

abstract class remaining {
  int remain = 0;
  void Remaining() {}
}

class HocVien {
  static List<String> hv = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'N',
    'M',
    'O'
  ];
}
