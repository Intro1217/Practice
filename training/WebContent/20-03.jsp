<%@ page contentType="text/html; charset=utf-8"
   import = "java.util.*, java.text.*, com.jspsmart.upload.*" %>

<html>
<head><title>上傳檔案結果</title>
</head>
<body>
<%
  //相對於document root的路徑
  String dirUpload = "/";
  int intNo = 0, i;
  long lngSize = 0;
  File file;
  //--- new SmartUpload 類別 ---
  SmartUpload su = new SmartUpload();
  //--- 初始化, 傳入 pageContext 隱含物件 ---
  su.initialize(pageContext);
  //--- 設定數字格式 ---
  DecimalFormat form1 = new DecimalFormat();
  form1.applyPattern("###,###,##0");
  try {
    //--- Upload ---
    su.upload();
    intNo = su.save(dirUpload);   //Save uploaded files
    //---
    lngSize = su.getFiles().getSize();
    out.println("<h2>共上載了 <font color='ff0000'><b>" + intNo);
    out.println("</b></font> 個檔案！ ");
    out.println("Total = <font color='ff0000'>");
    out.println(form1.format(lngSize) + "</font> bytes</h2>");
    out.println("分別是：<p>");
    intNo = su.getFiles().getCount();
    for (i = 0; i < intNo; i++) {
       file = su.getFiles().getFile(i);
       if (!file.isMissing()) {   //若檔案存在
          out.println(file.getFileName() + " = <font color=0000ff><b>");
          //out.println(File.FilePathName + "</b></font> (");
          out.println(file.getFilePathName() + "</b></font> (");
          out.println(form1.format(file.getSize()) + " bytes)<br>");
       }
    }
    out.println("<hr>");
  } catch (Exception e) { 
    out.println(e.toString());
  }

  //--- Show_Form from here ---
  Request req = su.getRequest();
  Enumeration enuName = req.getParameterNames();
  String strName, strValue, strSearch = "desc";
  out.println("其他的表單欄位有：<p>");
  while (enuName.hasMoreElements()) {
     strName = (String) enuName.nextElement();
     if (strName.indexOf(strSearch) != -1) {  //found
        strValue = req.getParameter(strName);
        if (!(strValue.trim().equals("")) && (strValue != null)) {
          out.println(strName + " = <font color='0000ff'><b>");
          out.println(strValue + "</b></font><br>");
        }
     }
  }

  out.println("<hr>");
  //--- Show_Form end here ---
%>
</body>
</html>