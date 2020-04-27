package com.lec.java.crawl11;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/* XML, JSON 파싱 연습
 * 
 * ■서울시 지하철 역사 정보
http://data.seoul.go.kr/dataList/datasetView.do?infId=OA-12753&srvType=A&serviceKind=1&currentPageNo=1

샘플url

XML 버젼
http://swopenAPI.seoul.go.kr/api/subway/4d46796d7366726f3833774a774955/xml/stationInfo/1/5/서울

JSON 버젼
http://swopenAPI.seoul.go.kr/api/subway/4d46796d7366726f3833774a774955/json/stationInfo/1/5/서울

 */
public class Crawl11Main {
	
	public static final String REQ_SERVICE = "stationInfo";
	public static final String API_KEY = "4d46796d7366726f3833774a774955"; // 너의 key 값은?
	
	public static void main(String[] args) throws IOException {
		System.out.println("서울시 지하철 역사(station) 정보");

		String url_address = "";
		StringBuffer sb;   // response 받은 텍스트
		
		// API url 에 필요한 parameter 들 
		int startIndex;	// 요청시작위치 정수 입력 (페이징 시작번호 입니다 : 데이터 행 시작번호) 
		int endIndex;		// 요청종료위치 정수 입력 (페이징 끝번호 입니다 : 데이터 행 끝번호) 
		String stationName;   // 지하철 역명   '역' 제외
		
		startIndex = 1;
		endIndex = 5;
		stationName = "시청";

		
		System.out.println("--- XML 파싱 ---");
		url_address = buildUrlAddress("xml", startIndex, endIndex, stationName);
		sb = readFromUrl(url_address);
		parseXML(sb.toString());
		
		System.out.println("--- JSON 파싱 ---");
		url_address = buildUrlAddress("json", startIndex, endIndex, stationName);
		sb = readFromUrl(url_address);
		parseJSON(sb.toString());
		
		System.out.println("\n프로그램 종료");
	} // end main()

	public static String buildUrlAddress(String reqType, int startIndex, int endIndex, String stationName) throws IOException{
		// 만약 URL 에 한글이 들어가야 하는 경우는 반드시 URL 인코딩을 해주어야 한다
		// java.net.URLEncoder 임포트
		// java.io.UnsupportedEncodingException 임포트
		
		String url_address = String.format("http://swopenAPI.seoul.go.kr/api/subway/%s/%s/%s/%d/%d/%s",
                API_KEY, reqType, REQ_SERVICE, startIndex, endIndex, URLEncoder.encode(stationName, "UTF-8"));
		
		System.out.println(url_address);
		
		return url_address;
	}
	
	/**
	 * 
	 * @param urlAddress : 주어진 url주소
	 * @return  서버로부터 받은 텍스트데이터(HTML) 리턴
	 */
	public static StringBuffer readFromUrl(String urlAddress) {
		
		StringBuffer sb = new StringBuffer();  // response 받은 데이터 담을 객체
		
		URL url = null;    // java.net.URL
		HttpURLConnection conn = null; // java.net.HttpURLConnection
		
		InputStream in = null;
		InputStreamReader reader = null;   // byte 스트림 --> 문자기반 Reader
		BufferedReader br = null; 
		
		char [] buf = new char[512];   // 문자용 버퍼
		
		// BufferedReader <- InputStreamReader <- InputStream <- HttpURLConnection 
		
		try {
			url = new URL(urlAddress);
			conn = (HttpURLConnection)url.openConnection();  // Connection 객체 생성
			
			if(conn != null) {
				conn.setConnectTimeout(2000);  // 2초이내에 '연결' 이 수립안되면
											// java.net.SocketTimeoutException 발생
				
				conn.setRequestMethod("GET");  // GET 방식 request
				// "GET", "POST" ...
				conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
				conn.setUseCaches(false);  // 캐시사용안함
				
				System.out.println("request 시작: " + urlAddress);
				conn.connect();    // request 발생 --> 이후 response 받을때까지 delay
				System.out.println("response 완료");
				
				// response 받은후 가장 먼저 response code 값 확인
				int responseCode = conn.getResponseCode();
				System.out.println("response code : " + responseCode);
				// 참조 : https://developer.mozilla.org/ko/docs/Web/HTTP/Status
				if(responseCode == HttpURLConnection.HTTP_OK) {
					
					in = conn.getInputStream();  // InputStream <- HttpURLConnection 
					reader = new InputStreamReader(in, "utf-8"); // InputStreamReader <- InputStream
					br = new BufferedReader(reader);  // BufferedReader <- InputStreamReader
					
					int cnt;  // 읽은 글자 개수
					while((cnt = br.read(buf)) != -1) {
						sb.append(buf, 0, cnt);  // response 받은 텍스트를 StringBuffer 에 추가
					}
					
				} else {
					System.out.println("response 실패");
					return null;
				}
			} else {
				System.out.println("conn null");
				return null;
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(conn != null) conn.disconnect();   // 작업 끝나고 Connection 해제
		}
		
		
		return sb;
	}

	
	public static void parseXML(String xmlText) {
		  // XML 파싱
	    DocumentBuilderFactory dbFactory;
	    DocumentBuilder dBuilder;

        try {
            // DOM parser 객체 생성
            dbFactory = DocumentBuilderFactory.newInstance();
            dBuilder = dbFactory.newDocumentBuilder();
            
            // String -> InputStream 변환
            InputStream stream = new ByteArrayInputStream(xmlText.getBytes("utf-8"));  // UnsupportedEncodingException 처리
            
            // org.w3c.dom.Document : DOM 객체
            Document dom = dBuilder.parse(stream);  // SAXException, IOException

            // 사실 굳이 String 을 안거치고, 바로 아래와 같이 해도 되었다.
            //  Document doc = dBuilder.parse(conn.getInputStream());  // 곧바로 InputStream 으로부터 받아 파싱
            
            Element docElement = dom.getDocumentElement();   // dom 의 최상위 document element 
            docElement.normalize();   // 흩어진 text node 들을 정렬하는 등의 절차, XML 파싱하기전에 꼭 normalize() 부터 해주자
            
            NodeList nList = dom.getElementsByTagName("row");  // 서울시 지하철 역사 정보<row>~</row> 로 구성됨
            
            // 테스트
            System.out.println("<row> 개수 : " +  nList.getLength());
            
            System.out.println();
            for(int i = 0; i < nList.getLength(); i++) {
            	Node node = nList.item(i);   // Node 는 interface 다.  DOM 의 다양한 Node객체들은 Node를 구현(상속)받은 객체들이다
            	
            	// 당연히 element node 이겠지만, 체크해보자
            	if(node.getNodeType() != Node.ELEMENT_NODE) continue; 
            	
            	Element rowElement = (Element)node;  // node 를 Element로 형변환
            	
            	int rowNum = Integer.parseInt(
            			rowElement.getElementsByTagName("rowNum").item(0).getChildNodes().item(0).getNodeValue());
            	String statnNm = 
            			rowElement.getElementsByTagName("statnNm").item(0).getChildNodes().item(0).getNodeValue();
            	String subwayId =
                        rowElement.getElementsByTagName("subwayId").item(0).getChildNodes().item(0).getNodeValue();
            	String subwayNm =
                        rowElement.getElementsByTagName("subwayNm").item(0).getChildNodes().item(0).getNodeValue();
            	
            	System.out.println(rowNum + ": " + statnNm + "역 " + subwayId + " " + subwayNm);
            } // end for
            
            
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // end parseXML()
	
	public static void parseJSON(String jsonText) {
		

		JSONObject jObj = new JSONObject(jsonText);  // JSON 파싱 --> JSONObject 로 변환
		JSONArray stationList = jObj.getJSONArray("stationList");
		
		System.out.println("station 의 개수: " + stationList.length());
		System.out.println();
		
		for(int i = 0; i < stationList.length(); i++) {
			JSONObject station = stationList.getJSONObject(i);
			
			int rowNum = station.getInt("rowNum");
			String statnNm = station.getString("statnNm");
			String subwayId = station.getString("subwayId");
			String subwayNm = station.getString("subwayNm");
		
			System.out.println(rowNum + ": " + statnNm + "역 " + subwayId + " " + subwayNm);
		}
		
	} // end parseJSON()

} // end class















