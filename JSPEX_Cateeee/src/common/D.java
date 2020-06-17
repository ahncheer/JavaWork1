package common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	public static final String USERID = "scott0316";  // DB 접속 계정 정보
	public static final String USERPW = "tiger0316";
	
	//특정 depth 의 특정 parent 인 카테고리 읽어오기
	public static final String SQL_CATEGORY_BY_DEPTH_N_PARENT
			="SELECT ca_uid, ca_name, ca_depth, ca_parent, ca_order FROM TEST_CATEGORY " + 
					"WHERE CA_DEPTH =? AND CA_PARENT =? " + 
					"ORDER BY CA_ORDER ASC";
	
	//필요한 쿼리문 만들어보기 
	
	public static final String SQL_CATEGORY_BY_DEPTH_N_PARENT2
	="SELECT ca_uid, ca_name, ca_depth, ca_parent, ca_order FROM TEST_CATEGORY " + 
			"WHERE CA_DEPTH = ? " + 
			"ORDER BY CA_ORDER ASC";
	
	public static final String SQL_CATEGORY_BY_DEPTH_N_PARENT3
	="SELECT ca_uid, ca_name, ca_depth, ca_parent, ca_order FROM TEST_CATEGORY " + 
			"ORDER BY CA_ORDER ASC";
	
	public static final String SQL_11 = "select ca_uid, ca_name, ca_depth, ca_parent, ca_order from test_category where ca_depth = ? and CA_PARENT =?";
}




























