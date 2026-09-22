# 구현 계획

[요구사항](spec.md)이 구현 기준이다. 완료·남은 작업·재개 조건은 [현황](tasks.md)에만 기록한다.

## 기술 스택

- Java 17·Servlet 6.0(`jakarta.*`)·JSP·EL/JSTL 3.0·HTML/CSS, 서버 렌더링과 폼 요청.
- MVC Model2·JDBC·MySQL 8.0·UTF-8·DB UTC/화면 한국 시간.
- Dynamic Web Project·Maven WAR·Tomcat 10.1. JSON은 Jackson, 암호는 JDK PBKDF2.
- 로컬 Tomcat·MySQL 시연 필수. Spring·JPA·RDS·Docker·로드밸런서·오토스케일링·S3·CloudFront·CI/CD 사용 금지.

## 구현과 원본

- [MVC 구현](mvc-design.md): 화면과 API가 기존 Service·트랜잭션·권한 규칙을 공유한다. JSP는 조회 결과만 렌더링한다.
- 관리 입력 필드는 AdminService에 모으고, 온톨로지 변경·검토와 버전 갱신은 같은 Service 호출·트랜잭션에서 완료한다.
- [스키마](../sql/schema.sql)·[시연 자료](../sql/seed.sql)·[API](../src/main/java/kr/ac/siheung/tourpass/controller/ApiServlet.java): 저장 구조·초기 계정·JSON 계약의 원본.
- [추천 구현](tourism-semantics.md): 어노테이션·온톨로지·시맨틱 레이어·피드백 규칙의 코드/검사 안내.
- [실제 관광 자료](tourism-data.md): JSON→DRAFT 적재, 장소와 관계의 개별 관리자 검토.
- [Figma](https://www.figma.com/design/0dXeoLqriD0iYTPrNdK5ic/siheung-tourpass): 화면 설계 참고. 실행 화면의 원본은 [JSP](../src/main/webapp/WEB-INF/views/page.jsp).
- [README](../README.md): 초기화·실행·사용·검사. 제안서와 프로젝트 평가는 [평가 기준](evaluation.md).

## 남은 검증

자동 검사는 [README](../README.md#테스트)의 실행 코드로 유지한다. [C7](spec.md#검증완료-기준) 사용자 관찰·실측, Figma와 실행 화면의 정합성, 다른 팀원의 재현은 실제 수행 후에만 완료한다. 공식 과제와 충돌하면 요구사항부터 갱신한다.
