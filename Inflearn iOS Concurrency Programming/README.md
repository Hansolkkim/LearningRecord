# iOS Concurrency Programming Course

## 강의 내용 정리

### GCD - 1. GCD/Operation에 앞서

* [OT](https://github.com/Hansolkkim/LearningRecord/issues/7)
* [왜 동시성 프로그래밍이 필요할까?](https://github.com/Hansolkkim/LearningRecord/issues/8)
* [간단한 GCD/ Operation 소개](https://github.com/Hansolkkim/LearningRecord/issues/9)
* [Synchronous(동기) VS Asynchronous(비동기)](https://github.com/Hansolkkim/LearningRecord/issues/10)
* [Serial(직렬) VS Concurrent(동시)](https://github.com/Hansolkkim/LearningRecord/issues/11)



### GCD - 2. 디스패치큐(GCD)의 종류와 특성

* [메인큐](https://github.com/Hansolkkim/LearningRecord/issues/12)
* [글로벌큐와 QoS(서비스 품질)에 대한 이해](https://github.com/Hansolkkim/LearningRecord/issues/13)
* [프라이빗(커스텀)큐](https://github.com/Hansolkkim/LearningRecord/issues/14)



### GCD - 3. 디스패치큐(GCD) 사용시 주의해야할 사항

* [반드시 메인큐에서 처리해야하는 작업](https://github.com/Hansolkkim/LearningRecord/issues/16)
* [sync 메서드에 대한 주의 사항](https://github.com/Hansolkkim/LearningRecord/issues/17)
* [weak, strong 캡처 주의](https://github.com/Hansolkkim/LearningRecord/issues/18)
* [컴플리션핸들러의 존재이유](https://github.com/Hansolkkim/LearningRecord/issues/19)
* [동기적함수를 비동기함수처럼 만드는 방법](https://github.com/Hansolkkim/LearningRecord/issues/20)
* [번외) 캡처리스트의 [weak self]에 대한 이해](https://github.com/Hansolkkim/LearningRecord/issues/21)



### GCD - 4. 디스패치 그룹

* [디스패치 그룹의 개념](https://github.com/Hansolkkim/LearningRecord/issues/22)
* [디스패치 그룹의 사용 (비동기 디스패치 그룹)](https://github.com/Hansolkkim/LearningRecord/issues/23)
* [(참고)Dispatch Work Item(디스패치 워크 아이템)](https://github.com/Hansolkkim/LearningRecord/issues/24)
* [(심화)Dispatch Semaphore(세마포어)에 대한 이해](https://github.com/Hansolkkim/LearningRecord/issues/25)



### GCD - 5. (참고) GCD 프로젝트 살펴보기

* [실제 GCD 프로젝트 사례를 통한 활용]()



### GCD - 6. (심화) Thread-safe한 코드의 구현과 방법

* [TSan 사용법(경쟁 상황 발견하는 Tool)]()
* [시리얼큐와 Sync]()
* [디스패치 배리어(Dispatch Barrier)]()
* [객체 설계시 주의할 점]()

