 One major issue still remains: your Web Forms directives are still invalid.
  Each .aspx/Global.asax currently starts with just Inherits="...", but must use proper directives (<%@ Page ... %>,
  <%@ Application ... %>), otherwise the app won’t parse those files.
