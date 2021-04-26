# RetroSnackMarket

옛날 과자 상점(쇼핑몰 프로젝트)

#서버주소 (www.--완성후 공개)

ModelAndView객체 @Autowired 의존성 주입으로 전역객체로 사용하던 오류(안좋은 코딩)를 감지 후 메서드 내부 일회성 객체로 코드 리팩토링 
싱글톤 개념 공부하면 좋을 것

Redirect시 Model객체에 보내는 데이터 세션을 이용할 수 있다는걸 알게됨

XSS 공격 방어를 위한 Front , Back-Server 유효성 검증

중복 삽입 데이터 최소화를 위한 테이블 정규화 진행

자바 메일 속도 문제점 개선을 위한 Async(비동기) 작업 구현
( 초기 : 메일 전송이 완료된 후에 이후의 로직 실행 -> 사용자 입장에서는 아무런 반응이 없으므로
         현재 진행상황을 몰라 다른 작업을 하게 됨 -> 서버 로직이 실행되고 있는 중이므로 오류 발생 -> 비동기처리로 코드 리팩토링
         -> 메일 전송(Async) -> 이후 로직 (메일 전송 유무와 관계없이) 실행

호스팅을 사용하여 서버 구조 및 Putty(서버 접근)개념 이해 , Putty를 이용한 서버배포 로그 확인 (진행중)

유저 데이터 정보를 위한 비밀번호 암호화

비밀번호 찾기 인증번호 검증시 악의적인 인증을 막기 위한 인증번호 HashCode 변환
