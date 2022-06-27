void main() {
  List<String> hvFlutter = HocVien.hv.sublist(0, 2);
  Flutter m = Flutter(TenLop: 'FLutter', slhv: 11, HV: hvFlutter);
  m.test();
  m.conlai();
print('=====================');
  List<String> hvAndroid = HocVien.hv.sublist(1, 4);
  Android n = Android(TenLop: 'Android', slhv: 12, HV: hvAndroid);
  n.test();
  n.conlai();
print('=====================');
  List<String> hvios = HocVien.hv.sublist(3, 6);
  ios o = ios(TenLop: 'ios', slhv: 13, HV: hvios);
  o.test();
  o.conlai();
print('=====================');
  List<String> hvweb = HocVien.hv.sublist(5, 6);
  web p = web(TenLop: 'web', slhv: 14, HV: hvweb);
  p.test();
  p.conlai();
}

class LopHoc {
  final String TenLop;
  final int slhv;
  final List HV;
  const LopHoc({required this.TenLop, required this.slhv, required this.HV});
  void test() {
    print('Tên lớp: $TenLop');
    print('Số Lượng học viên: $slhv');
    print('Thành viên học viên: $HV');
  }

  void conlai() {
    print('Số lượng học viên còn lại là: ${slhv.reMain(HV.length, slhv)}');
  }
}

class Flutter extends LopHoc
    implements buildandroid, buildios, buildweb, buildesktop {
  Flutter({required TenLop, required slhv, required HV})
      : super(TenLop: TenLop, slhv: slhv, HV: HV);
  @override
  void build() {
    print('test');
  }
}

class Android extends LopHoc implements buildandroid {
  Android({required TenLop, required slhv, required HV})
      : super(TenLop: TenLop, slhv: slhv, HV: HV);
  @override
  void build() {
    print('test');
  }
}

class ios extends LopHoc implements buildios {
  ios({required TenLop, required slhv, required HV})
      : super(TenLop: TenLop, slhv: slhv, HV: HV);
}

class web extends LopHoc implements buildweb {
  web({required TenLop, required slhv, required HV})
      : super(TenLop: TenLop, slhv: slhv, HV: HV);
}

abstract class buildandroid {
  void build() {}
}

abstract class buildios {}

abstract class buildweb {}

abstract class buildesktop {}

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

extension re on int {
  num reMain(int a, b) {
    if (a < b) ;
    return b - a;
  }
}
