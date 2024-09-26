git page deploy link : [https://goeunleee.github.io/SimpleCrochetCounter/]

Flutter를 사용해 만든 크로셰 카운터 앱 입니다.
웹툰 클론 코딩 프로젝트에서 배운 상태관리와 캐시 기능을 적용하여 실생활에서 사용할 수 있는 크로셰 카운터 기능을 구현했습니다.
해당 코드는
웹툰 클론 코딩 프로젝트 : https://github.com/goeunleee/webtoon

- git actions를 사용해 배포 브랜치에 빌드 파일이 자동으로 푸시됩니다.

# 사용 기술

- Flutter: 크로스플랫폼 모바일 앱 개발
- Dart: 앱의 로직 구현
- Shared Preferences: 로컬 데이터 저장 및 관리
- Roulette 패키지: 무작위 룰렛 기능 구현(각 룰렛 필드 편집기능 TBD)
- Slider : 모바일에 최적화된 리스트 편집 기능을 구현.

# 기능

- 로컬 캐시 기능을 통해 사용자의 값을 저장하여 앱을 종료한 이후에도 데이터가 유지됨
- 리스트로 다수의 프로젝트를 기록/수정/삭제 할 수 있음 (실용성, 성능적 효율성을 고려하여 5개로 제한 했습니다.)
- 버튼 이벤트로 룰렛과 정보 확인 기능 추가
- ios은 safari, android은 chrome에서 배포 주소에 접속해 홈 화면에 추가하면 애플리케이션처럼 사용할 수 있습니다. (fwa)

flutter build web
build/web 이동해서 경로지정 후 commit push
setting/pages에서 브랜치 save
