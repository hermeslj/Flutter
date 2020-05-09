import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

initiate(String strUrl) async{
  List<Map<String, String>> mapData = [];
  var client = Client();
  Response response = await client.get(strUrl);
  var document = parse(response.body);
  List<Element> leags = document.querySelectorAll("div.shortagDiv.tghov>span.shortTag");
  List<Element> rows0 = document.querySelectorAll("span.homeTeam>span");
  List<Element> rows1 = document.querySelectorAll("span.awayTeam>span");
  List<Element> dateList = document.querySelectorAll("span.date_bah");
  List<Element> probablityList = document.querySelectorAll("td.tnms");
  for( int i = 0; i < rows0.length; i++ ) {
    String leag = leags.elementAt(i).innerHtml;
    String homeTeam = rows0.elementAt(i).innerHtml;
    String awayTeam = rows1.elementAt(i).innerHtml;
    String datetime = dateList.elementAt(i).innerHtml;
    Element elem = probablityList.elementAt(i).nextElementSibling;
    String probone = elem.innerHtml.replaceAll("<b>", "").replaceAll("</b>", "");
    elem = elem.nextElementSibling;
    String probtwo = elem.innerHtml.replaceAll("<b>", "").replaceAll("</b>", "");
    elem = elem.nextElementSibling;
    String probthree = elem.innerHtml.replaceAll("<b>", "").replaceAll("</b>", "");
    elem = elem.nextElementSibling;
    String forebet = "";
    if (elem.firstChild != null)
      forebet = elem.firstChild.text;
    elem = elem.nextElementSibling;
    String corescore = elem.innerHtml;
    elem = elem.nextElementSibling;
    String avggoals = elem.innerHtml;
    elem = elem.nextElementSibling;
    String weather = "";
    if (elem.firstChild != null)
      weather = elem.firstChild.text;
    elem = elem.nextElementSibling;
    String odds = "";
    if (elem.firstChild != null)
      odds = elem.firstChild.text;
//    strReturn = homeTeam + "|" + awayTeam + "|" + datetime + "|" + probone + "|" + probtwo + "|" + probthree
//        + "|" + forebet + "|" + corescore + "|" + avggoals + "|" + weather ;
    if (int.parse(probone) >= 40 || int.parse(probtwo) >= 40  || int.parse(probthree) >= 40 ) {
      String probability = "";
      int.parse(probone) > int.parse(probthree) ? probability = probone : probability = probthree;
      if( int.parse(probone) < int.parse(probtwo ) && int.parse(probthree) < int.parse(probtwo ) )
        probability = probtwo;
      //avggoals = double.parse(avggoals).toInt().toString();
      mapData.add({
        "leag": leag,
        "homeTeam": homeTeam,
        "awayTeam": awayTeam,
        "datetime": datetime,
        "probablity": probability,
        "probablity1": probone,
        "probablity2": probtwo,
        "probablity3": probthree,
        "forebet": forebet,
        "corescore": corescore,
        "avggoals": avggoals,
        "weather": weather,
        "odds": odds
      });
    }
  }
//  print(strReturn);
  return mapData;
}