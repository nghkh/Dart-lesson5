import 'dart:math';

void main() {
  Flutter flutter =
      Flutter(className: 'Flutter', studentNumber: 11, studentList: ['A', 'B']);
  flutter.ShowInformation();
  flutter.Remaining();
  print('=======================');
  Android android = Android(
      className: 'Android', studentNumber: 12, studentList: ['B', 'C', 'D']);
  android.ShowInformation();
  android.Remaining();
  print('=======================');
  iOS ios =
      iOS(className: 'ios', studentNumber: 13, studentList: ['D', 'E', 'F']);
  ios.ShowInformation();
  ios.Remaining();
  print('=======================');
  Web web = Web(className: 'web', studentNumber: 14, studentList: ['F']);
  web.ShowInformation();
  web.Remaining();
}

class ClassInformation {
  final String className;
  final int studentNumber;
  final List<String> studentList;
  int _numberofSession = 10;
  ClassInformation(
      {required this.className,
      required this.studentNumber,
      required this.studentList});
  void ShowInformation() {
    print('Class name: $className');
    print('Student number: $studentNumber');
    print('Student list: $studentList');
  }

  void Remaining() {
    if (studentList.length < studentNumber) {
      int remain = studentNumber - studentList.length;
      print('Số lượng học viên còn lại là: $remain');
    }
  }

  dynamic addMoreStudent(int remain, ClassInformation studentList) {
    for (int i = 0; i < remain; i++) {
      int rd = Random().nextInt(25);
      String char = String.fromCharCode(rd + 65);
      while (studentList.studentList.contains(char)) {
        rd = Random().nextInt(25);
        char = String.fromCharCode(rd + 65);
      }
      studentList.addStudent(char);
    }
    print(studentList);
  }

  void addStudent(String char) {
    studentList.add(char);
  }

  set numberofSession(int value) {
    assert(value > 10, "Số buổi học không thể < 10");

    _numberofSession = value;

    ClassInfoChecker().updateSoBuoiHocByClassInfo(this);
  }

  int get numberofSession => _numberofSession;
}

class Flutter extends ClassInformation
    with buildandroid, buildios, buildweb, buildesktop {
  Flutter({required className, required studentNumber, required studentList})
      : super(
            className: className,
            studentNumber: studentNumber,
            studentList: studentList);
  @override
  void build() {
    print('test');
  }
}

class Android extends ClassInformation with buildandroid {
  Android({required className, required studentNumber, required studentList})
      : super(
            className: className,
            studentNumber: studentNumber,
            studentList: studentList);
}

class iOS extends ClassInformation with buildios {
  iOS({required className, required studentNumber, required studentList})
      : super(
            className: className,
            studentNumber: studentNumber,
            studentList: studentList);
}

class Web extends ClassInformation with buildweb {
  Web({required className, required studentNumber, required studentList})
      : super(
            className: className,
            studentNumber: studentNumber,
            studentList: studentList);
}

mixin buildandroid {
  void build() {}
}
mixin buildios {}
mixin buildweb {}
mixin buildesktop {}

const sbhAndroidInterval = 5;
const sbhIosInterval = 3;
const sbhWebInterval = 2;

class ClassInfoChecker {
  static final ClassInfoChecker _instance = ClassInfoChecker._internal();
  ClassInfoChecker._internal();
  factory ClassInfoChecker() => _instance;
  final List<ClassInformation> _classInfoArr = [];

  bool isUpdatingSBH = false;

  void updateSoBuoiHocByClassInfo(ClassInformation ClassInformation) {
    if (_classInfoArr.isEmpty) return;

    if (isUpdatingSBH) return;

    isUpdatingSBH = true;

    final int _rootSBH = _flutterSBH(ClassInformation);

    _classInfoArr.whereType<Flutter>().first.numberofSession = _rootSBH;
    _classInfoArr.whereType<Android>().first.numberofSession =
        _rootSBH + sbhAndroidInterval;
    _classInfoArr.whereType<iOS>().first.numberofSession =
        _rootSBH + sbhIosInterval;
    _classInfoArr.whereType<Web>().first.numberofSession =
        _rootSBH + sbhWebInterval;
    isUpdatingSBH = false;
  }

  void add(ClassInformation classInformation) {
    if (_classInfoArr.contains(classInformation)) return;

    _classInfoArr.add(classInformation);
  }

  int _flutterSBH(ClassInformation classInformation) {
    int _flutterSBH = 0;

    if (classInformation is Flutter) {
      _flutterSBH = classInformation.numberofSession;
    } else if (classInformation is Android) {
      _flutterSBH = classInformation.numberofSession - sbhAndroidInterval;
    } else if (classInformation is iOS) {
      _flutterSBH = classInformation.numberofSession - sbhIosInterval;
    } else if (classInformation is Web) {
      _flutterSBH = classInformation.numberofSession + sbhWebInterval;
    }

    return _flutterSBH;
  }

  @override
  String toString() {
    String ret = "";
    for (var element in _classInfoArr) {
      ret += "${element.className}: ${element.numberofSession}, ";
    }

    return ret;
  }
}
