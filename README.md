# Spring MVC를 활용한 학사관리 프로그램

### Controller

	1. CourseController
		- @RequestMapping을 사용하여 mapping에 해당하는 url 접근시 실행되는 메서드들이 있음.
		  메서드들에게 request가 올때 post, get 모두 Binding 되어 Course 객체로 값이 전달된다. 
          Course 값에 대해 Buffer기능과 필요에 따라 Valid 기능을 사용하고 Model에 설정한 regexp값에
          따라 View를 다르게 보여주기도 한다. 각 메서드들은 model 객체를 가지고 있으며 addattribute를 
          통해 객체를 View로 전달할 수 있다.

    2. HomeController
    	- 프로그램이 처음 실행되었을때 '/'이 불리며 이는 HomeController의 showHome() 메서드를 실행 
    	  시킨다. 이를 통해 home 값을 return 해주며 context에서 prefix 로 View가 존재하는 path값과
          surfix로 확징자명인 .jsp를 붙여주어 View가 home.jsp 실행된다. 위의 CourseController 도
          이와 같은 방식임.


### Model
	1. Course
		- 멤버변수 id, year, term, subject, subjectCode, separation, credit을 가지며, 
		  Hibernate-Validator를 이용하여 해당 멤버변수에 제약조건을 넣을수 있으며 이에 대한 Error
          Message에 대해 입력할 수 있다.

### DAO
	1. CourseDAO
		- jdbc.properties에 있는 정보를 통해 database에 연결이 가능하다. sql을 통해 CRUD가 가능하며 
		  이러한 데이터를 Mapper를 통해 model 객체에 저장할 수 있다. Mapper는 검색한 데이터의 행수에 맞게
          반복 실행된다.

### Service
	1. CustomerService
		- CourseDAO와 연결되어 있으며 controller에서 불려진 메서드에 따라 DAO의 메서드를 호출한다.
		  insert나 update에 대한 명형에 대해서는 boolean 값을 리턴하여 성공과 실패에 대해 나눴고,
          select 같은 경우는 List를 리턴한다. controller는 해당 List model.attribute 로 View에서
          처리할 수 있도록 한다.

### view
	1. home
		- home은 페이지의 대문 역할을 하며 side menu를 통해 메뉴를 이동할 수 있다. 테마는 bootstrap을
		  이용하여 각 페이지마다 반복이 되어 header와 footer를 따로 만들dj include 하였다.

	2. semestercredit
		- 학기별 이수학점에 대해 열람할 수 있는 페이지 이며 Course값을 받아 학기별로 이수한 학점에 대해 보여준다.
		  년도와 학기를 묶어서 학점의 SUM값을 도출하였고 링크를 가지고 있으며 링크를 통해 년도값과 학기 값을
          넘겨준다.

    3. semestercreditlink
    	- 학기별 이수학점에서 링크를 통해 접근이 가능하며 get방식으로 년도와 학기를 넘겨받아 과목에 대해 검색된
    	  결과를 View에서 보여준다. 뒤로가기 버튼이 추가 되어있다.

    4. searchcredit
    	- 이수 구분별로 학점을 나눈 내용이며 구분별로 검색하여 해당 구분의 학점을 더한값을 받아 보여주는 역할
    	  을 한다.

    5. addcourse
    	- 과목 리스트를 확인하여 수강신청이 가능하며 수강신청 리스트가 보이고 이에 대한 과목코드를 입력하여
    	  수강신청이 가능하다. 과목코드는 Valid 기능을 활용하여 코드가 맞게 쓰인 경우만 신청이 완료된다.
          form:error를 통해 error 메세지를 띄워준다.

	6. dberror
		- addcoure에서 이미 과목에 대한 코드와 없는 과목 코드를 입력했을 경우 실행되며 값이 틀린 경우를
		  위한 페이지이다. 뒤로가기 버튼이 추가 되어있다.

	7. searchcourse
		- addcourse에서 신청된 과목에 대해서 보여주는 페이지이다. 년도, 학기, 과목, 구분, 학점에 대한
		  정보를 열람할 수 있다.
