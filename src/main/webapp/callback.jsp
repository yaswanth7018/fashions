<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.fashion.controller.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.paytm.pg.merchant.PaytmChecksum"%>
<%
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
  String paramName = (String)paramNames.nextElement();
  if(paramName.equals("CHECKSUMHASH")){
    paytmChecksum = mapData.get(paramName)[0];
  }else{
    parameters.put(paramName,mapData.get(paramName)[0]);
  }
}
parameters.remove("CHECKSUMHASH");
boolean verifySignature = false;
String outputHTML="";
String Paramdata="";

try{
  verifySignature = PaytmChecksum.verifySignature(parameters,Config.PAYTM_MERCHANT_KEY,paytmChecksum);
  if(!(parameters.isEmpty())){
    if(verifySignature && parameters.containsKey("RESPCODE")){
      if(parameters.get("RESPCODE").equals("01")){
        for (Map.Entry<String, String> entry : parameters.entrySet()) {
          Paramdata +="<tr><td>" + entry.getKey()  + "</td><td>" + entry.getValue() + "</td></tr>"; 
        } 
        outputHTML = "<h4 class='text-success text-left'>Checksum is verified.Transaction details are below</h4> <table class='table table-bordered'>"+Paramdata+"</table>";
      }
      else{
        outputHTML="<h4 class='text-danger text-left'>Payment Failed.</h4>";
      }
    }else{
       outputHTML = "<h4 class='text-danger text-left'>Checksum is not verified.</h4>";
    }
  }
  else{
    outputHTML = "<h4 class='text-danger text-left'>Empty POST Response.</h4>";
  }
}catch(Exception e){
  outputHTML=e.toString();
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Paytm Js Checkout - Java</title>
  </head>
  <body>
    <div class="container text-center">
      <div class="shadow p-3 mb-5 bg-white rounded">
        <%= outputHTML %>
      </div>
    </div>
  </body>
</html>
