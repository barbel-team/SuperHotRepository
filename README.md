# SuperHotRepository

## 도커 컴포즈 파일이 있는 위치에서 컨테이너 구축
docker-compose up

## 호스트에 python, pip, docker, flask 라이브러리 설치
## 호스트가 우분투라면 아래 명령 차례로 실행
sudo apt-get update
sudo apt-get install python3
sudo apt-get upgrade python3
sudo apt install python3-pip
pip3 install docker
pip3 install flask

## 호스트에서 자원 관리 모듈 (resource_manager -> app.py) 실행
python app.py
## 홈페이지는 localhost:8080/ 으로 접속 가능

## 서비스가 켜진 후 서비스 자원 모니터링, 자동할당 회수 시작 -> Host의 /tmp 에서 resource_manager_logfile.log 로그 확인 가능
curl localhost:4050/startManage
## 서비스에 대한 헬스체크 시작 -> 컨테이너의 /tmp or Host의 /usr/local 에서 health_check_logfile 로그 확인 가능(volume 이용)
curl localhost:4000/startCheck

## 기본 서비스 시나리오 
## 회원가입 -> 로그인 -> 상품선택 -> 주문

## 시나리오 1 
## host 안의 resource_manager 가 진행

## 시나리오 2
## healthcheck 컨테이너가 startCheck 신호 받으면 시작
## 이상 발견시 host 의 resource_manger에게 신호 보내어 해당 컨테이너 재시작

## 시나리오 3
## 매 23시 healthcheck 컨테이너가 product 컨테이너에게 sync 신호를 주어 진행
## 수동으로 확인시 product write container 에 insert로 상품 입력 -> curl localhost:4002/sync 로 진행
