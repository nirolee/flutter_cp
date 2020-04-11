import 'package:chucp/common/localization/language_base.dart';

class LangeuageZh extends LanguageBase{
  @override
  String app_name = "处cp";
   @override
  String app_ok = "确定";
  @override
  String app_cancel = "取消";
  @override
  String login_text = "登录";
  @override
  String login_success = "登录成功";
  @override
  String network_error = "网络错误";
   @override
  String network_error_401 = "[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]";
  @override
  String network_error_403 = "403权限错误";
  @override
  String network_error_404 = "404错误";
  @override
  String network_error_timeout = "请求超时";
  @override
  String network_error_unknown = "其他异常";
}