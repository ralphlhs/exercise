/// errorMessage : {"status":200,"total":7}
/// realtimeArrivalList : [{"totalCount":7,"rowNum":1,"selectedCount":5,"subwayId":"1002","updnLine":"외선","trainLineNm":"성수행 - 역삼방면","subwayHeading":"오른쪽","statnFid":"1002000223","statnTid":"1002000221","statnId":"1002000222","statnNm":"강남","ordkey":"01000성수0","subwayList":"1002,1077","statnList":"1002000222,1077000687","barvlDt":"35","btrainNo":"8457","bstatnId":"88","bstatnNm":"성수","recptnDt":"2022-01-06 21:16:30.0","arvlMsg2":"강남 출발","arvlMsg3":"교대","arvlCd":"2"},null]

class SubwayJson {
  SubwayJson({
      ErrorMessage? errorMessage, 
      List<RealtimeArrivalList>? realtimeArrivalList,}){
    _errorMessage = errorMessage;
    _realtimeArrivalList = realtimeArrivalList;
}

  SubwayJson.fromJson(dynamic json) {
    _errorMessage = json['errorMessage'] != null ? ErrorMessage.fromJson(json['errorMessage']) : null;
    if (json['realtimeArrivalList'] != null) {
      _realtimeArrivalList = [];
      json['realtimeArrivalList'].forEach((v) {
        _realtimeArrivalList?.add(RealtimeArrivalList.fromJson(v));
      });
    }
  }
  ErrorMessage? _errorMessage;
  List<RealtimeArrivalList>? _realtimeArrivalList;

  ErrorMessage? get errorMessage => _errorMessage;
  List<RealtimeArrivalList>? get realtimeArrivalList => _realtimeArrivalList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_errorMessage != null) {
      map['errorMessage'] = _errorMessage?.toJson();
    }
    if (_realtimeArrivalList != null) {
      map['realtimeArrivalList'] = _realtimeArrivalList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// totalCount : 7
/// rowNum : 1
/// selectedCount : 5
/// subwayId : "1002"
/// updnLine : "외선"
/// trainLineNm : "성수행 - 역삼방면"
/// subwayHeading : "오른쪽"
/// statnFid : "1002000223"
/// statnTid : "1002000221"
/// statnId : "1002000222"
/// statnNm : "강남"
/// ordkey : "01000성수0"
/// subwayList : "1002,1077"
/// statnList : "1002000222,1077000687"
/// barvlDt : "35"
/// btrainNo : "8457"
/// bstatnId : "88"
/// bstatnNm : "성수"
/// recptnDt : "2022-01-06 21:16:30.0"
/// arvlMsg2 : "강남 출발"
/// arvlMsg3 : "교대"
/// arvlCd : "2"

class RealtimeArrivalList {
  RealtimeArrivalList({
      int? totalCount, 
      int? rowNum, 
      int? selectedCount, 
      String? subwayId, 
      String? updnLine, 
      String? trainLineNm, 
      String? subwayHeading, 
      String? statnFid, 
      String? statnTid, 
      String? statnId, 
      String? statnNm, 
      String? ordkey, 
      String? subwayList, 
      String? statnList, 
      String? barvlDt, 
      String? btrainNo, 
      String? bstatnId, 
      String? bstatnNm, 
      String? recptnDt, 
      String? arvlMsg2, 
      String? arvlMsg3, 
      String? arvlCd,}){
    _totalCount = totalCount;
    _rowNum = rowNum;
    _selectedCount = selectedCount;
    _subwayId = subwayId;
    _updnLine = updnLine;
    _trainLineNm = trainLineNm;
    _subwayHeading = subwayHeading;
    _statnFid = statnFid;
    _statnTid = statnTid;
    _statnId = statnId;
    _statnNm = statnNm;
    _ordkey = ordkey;
    _subwayList = subwayList;
    _statnList = statnList;
    _barvlDt = barvlDt;
    _btrainNo = btrainNo;
    _bstatnId = bstatnId;
    _bstatnNm = bstatnNm;
    _recptnDt = recptnDt;
    _arvlMsg2 = arvlMsg2;
    _arvlMsg3 = arvlMsg3;
    _arvlCd = arvlCd;
}

  RealtimeArrivalList.fromJson(dynamic json) {
    _totalCount = json['totalCount'];
    _rowNum = json['rowNum'];
    _selectedCount = json['selectedCount'];
    _subwayId = json['subwayId'];
    _updnLine = json['updnLine'];
    _trainLineNm = json['trainLineNm'];
    _subwayHeading = json['subwayHeading'];
    _statnFid = json['statnFid'];
    _statnTid = json['statnTid'];
    _statnId = json['statnId'];
    _statnNm = json['statnNm'];
    _ordkey = json['ordkey'];
    _subwayList = json['subwayList'];
    _statnList = json['statnList'];
    _barvlDt = json['barvlDt'];
    _btrainNo = json['btrainNo'];
    _bstatnId = json['bstatnId'];
    _bstatnNm = json['bstatnNm'];
    _recptnDt = json['recptnDt'];
    _arvlMsg2 = json['arvlMsg2'];
    _arvlMsg3 = json['arvlMsg3'];
    _arvlCd = json['arvlCd'];
  }
  int? _totalCount;
  int? _rowNum;
  int? _selectedCount;
  String? _subwayId;
  String? _updnLine;
  String? _trainLineNm;
  String? _subwayHeading;
  String? _statnFid;
  String? _statnTid;
  String? _statnId;
  String? _statnNm;
  String? _ordkey;
  String? _subwayList;
  String? _statnList;
  String? _barvlDt;
  String? _btrainNo;
  String? _bstatnId;
  String? _bstatnNm;
  String? _recptnDt;
  String? _arvlMsg2;
  String? _arvlMsg3;
  String? _arvlCd;

  int? get totalCount => _totalCount;
  int? get rowNum => _rowNum;
  int? get selectedCount => _selectedCount;
  String? get subwayId => _subwayId;
  String? get updnLine => _updnLine;
  String? get trainLineNm => _trainLineNm;
  String? get subwayHeading => _subwayHeading;
  String? get statnFid => _statnFid;
  String? get statnTid => _statnTid;
  String? get statnId => _statnId;
  String? get statnNm => _statnNm;
  String? get ordkey => _ordkey;
  String? get subwayList => _subwayList;
  String? get statnList => _statnList;
  String? get barvlDt => _barvlDt;
  String? get btrainNo => _btrainNo;
  String? get bstatnId => _bstatnId;
  String? get bstatnNm => _bstatnNm;
  String? get recptnDt => _recptnDt;
  String? get arvlMsg2 => _arvlMsg2;
  String? get arvlMsg3 => _arvlMsg3;
  String? get arvlCd => _arvlCd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalCount'] = _totalCount;
    map['rowNum'] = _rowNum;
    map['selectedCount'] = _selectedCount;
    map['subwayId'] = _subwayId;
    map['updnLine'] = _updnLine;
    map['trainLineNm'] = _trainLineNm;
    map['subwayHeading'] = _subwayHeading;
    map['statnFid'] = _statnFid;
    map['statnTid'] = _statnTid;
    map['statnId'] = _statnId;
    map['statnNm'] = _statnNm;
    map['ordkey'] = _ordkey;
    map['subwayList'] = _subwayList;
    map['statnList'] = _statnList;
    map['barvlDt'] = _barvlDt;
    map['btrainNo'] = _btrainNo;
    map['bstatnId'] = _bstatnId;
    map['bstatnNm'] = _bstatnNm;
    map['recptnDt'] = _recptnDt;
    map['arvlMsg2'] = _arvlMsg2;
    map['arvlMsg3'] = _arvlMsg3;
    map['arvlCd'] = _arvlCd;
    return map;
  }

}

/// status : 200
/// total : 7

class ErrorMessage {
  ErrorMessage({
      int? status, 
      int? total,}){
    _status = status;
    _total = total;
}

  ErrorMessage.fromJson(dynamic json) {
    _status = json['status'];
    _total = json['total'];
  }
  int? _status;
  int? _total;

  int? get status => _status;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total'] = _total;
    return map;
  }

}