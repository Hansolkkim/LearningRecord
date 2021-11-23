### Week 4 Mon Review

모든 View들의 색깔 바꿔주기 코드가 아래와 같은데, 어떻게 동작하는건지 생각을 좀 해봐야겠다.

```swift
self.view.subview.forEach {$0.textColor = .gray }
```

------

### 강의 내용

* 운영체제 Operating System (OS)

  * OS? 다른 프로그램을 실행시켜주는 프로그램

  * 정의?

    1. 자원할당자(resource allocator): 하드웨어 자원을 관리하고 효율적으로 공정하게 사용 요청을 처리
    2. 제어 프로그램(control program): 에러와 적합하지 않은 컴퓨터 사용을 방지하면서 프로그램을 실행
    3. 컴퓨터에서 항상 실행되는 하나의 프로그램(커널, kernel)

  * 역할?

    1. 프로세스 관리
    2. 메모리 관리
    3. 젖아장치 관리
    4. 보호와 보안

  * 현대 운영체제 핵심 기능들

    * 시분할(Time-sharing) - 멀티태스킹(multitasking)
    * 사용자가 실행 중인 작업과 상호작용이 가능하도록 CPU가 작업을 매우 빈번하게 교체하여 실행(interactive computing)
    * 응답 시간(response time)이 1초 미만
    * 각 사용자는 하나 이상의 프로그램을 메모리에서 실행(process)
    * 실행 대기 중인 여러 개의 작업을 CPU 스케줄링으로 처리
    * 스와핑(swapping)과 가상 메모리(virtual memory)기술

  * 프로세스와 스레드

    * 프로세스(Process) : 실행 중인 프로그램
    * 수동적 개체 프로세스 : 순차적으로 실행되느 능동적 개체
    * Process에 속해있는 Thread를 여러개 만들 수 있음
    * 프로세스 관리 기능
      * CPU에 대해 여러 프로세스와 스레드의 스케줄링
      * 사용자 및 시스템 프로세스의 생성과 제거
      * 프로세스의 일시 중지(suspend)와 재실행(resume)
      * 프로세스 동기화를 위한 기법 제공(Mutual Exclusion - Mutex)
      * 프로세스 간 통신을 위한 기법 제공(IPC)
      * 교착상태(deadlock)를 처리하기 위한 기법 제공
        * Deadlock ? 다른 스레드들이 서로의 진행을 기다리고만 있는 상태

    ```swift
    /* 연습문제 - 스레드 생성하기 */
    
    class BackgroundWork {
    	var thread: Thread? = nil
    	
    	func doTimeConsumingOperation(operation: Any?) {
    		thread = Thread(target: self, selector: #selector(BackgroundWork.runHelper), object: operation)
    		thread?.start()
    	}
    
    	@objc func runHelper(operation : Any?) {
    			autoreleasepool { () in
    				//operation.doOperation()
    				print("Other thread is running...")
    			}
    	}
    }
    let some = BackgroundWork()
    some.doTimeConsumingOperation(operation: nil)
    ```

  * 메모리 관리

    * 가상 메모리를 관리하는 것을 의미한다.
    * 폰 노이만 방식 컴퓨터
    * 모든 명령과 데이터는 실행과 처리를 위해 메모리 상에 존재해야 한다.
    * 메모리는 CPU가 직접 접근할 수 있는 유일한 저장 장치
    * 메모리는 워드(word) 혹은 바이트(byte)의 큰 배열이며, 각각은 주소(address)에 의해 식별된다.

  * Shell

    * Shell이란?

      * OS와 대화하는 프로그램
      * 사용자가 OS한테 명령을 내릴 수 있는 명령어들이 모여있는 곳? → Terminal..

    * 파일 시스템 관련 쉘 명령들

      * pwd : print working directory, 현재 디렉토리를 확인

      * ls : List Directory, 디렉토리의 내용을 보여줌

      * mkdir : Make directory, 새로운 디렉토리 생성

      * cd : Change directory, 디렉토리 변경

        ~는 홈의 약자임

      * cat : 파일 내용 표시

      * echo : 값 입력 혹은 입력 값 출력

      * touch : 0바이트 파일 생성

      * history : 명령어 이력 표시

        → 명령어 이력 옆에 명령어 번호가 함께 출력되는데, ![명령어번호] 명령어로 그 번호의 명령어를 재실행할 수 있음

      ------

      [운영체제 관련 유튜브](https://www.youtube.com/watch?v=EdTtGv9w2sA)

------

## 책공부

### 1.타입 캐스팅

* 부모 클래스로부터 상속된 자식 클래스는 자기 자신의 타입이기도 하면서, 동시에 부모 클래스의 타입이기도 하다. 메소드를 오버라이딩했더라도 컴파일러가 클래스의 형태에서 중요하게 여기는 메소드의 이름, 매개변수 타입, 그리고 반환 타입이 바뀌지 않는 한 클래스 형식이 달라진 것은 아니다. 이 때문에 자식 클래스는 본래의 타입 대신 부모 클래스 타입으로 선언하여 사용할 수 있다.

  ```swift
  class Vehicle {
  	var currentSpeed = 0.0
  
  	func accelerate() {
  		self.currentSpeed += 1
  	}
  
  class Car: Vehicle {
  	var gear: Int {
  		return Int(self.currentSpeed / 20) + 1
  	}
  	func wiper() {
  		//창을 닦는다.
  	}
  }
  let trans: Vehicle = Car()
  ```

  마지막 구문에서 상수로 선언된 trans는 Car클래스의 인스턴스를 할당받지만 Vehicle 타입으로 선언됐다. Vehicle 클래스 타입에 구현되어 있어야하는 프로퍼티와 메소드가 상속을 통해 모두 구현되어 있으므로 Car 클래스는 형식상 Vehicle 타입으로 간주할 수 있다. 이 때문에 Car 클래스로 된 인스턴스를 Vehicle 타입의 상수에 할당할 수 있다.

  하지만 반대로 Vehicle 인스턴스를 Car 클래스 타입 변수나 상수에 할당할 수는 없다. Car 타입이 되기 위해 가져야 할 요소들 중 gear 프로퍼티나 wiper() 메소드가 Vehicle 클래스에는 정의되어있지 않기 때문이다.

  ```swift
  	let car: Car = Vehicle() //Error!!!!
  ```

  그런데 왜 상위 클래스의 타입으로 선언해서 사용할까? 함수나 메소드의 인자값을 정의할 때 하위 클래스 타입으로 선언하는 것보다 상위 클래스 타입으로 선언하면 인자값으로 사용할 수 있는 객체의 범위가 훨씬 넓어진다.

  ```swift
  func move(param: Vehicle){
  	param.accelerate()
  }
  ```

  위와 같이 move() 메소드의 인자값으로 Vehicle 클래스를 받는다면, 이 메소드는 Vehicle 클래스나 이를 상속받은 모든 클래스의 인스턴스를 인자값으로 사용할 수 있게 되므로 훨씬 적은 제약으로 객체를 사용할 수 있다.

  배열이나 딕셔녀리의 경우에도 상위 클래스를 아이템 타입으로 사용한다면, 그 클래스의 하위 클래스 인스턴스를 모두 저장할 수 있다.

  ```swift
  var list = [Vehicle]()
  
  list.append(Vehicle())
  list.append(Car())
  list.append(SUV())
  ```

------

* 타입 비교 연산

  swit는 비교 연산자  is 를 사용할 수 있다.

  ```swift
  인스턴스(또는 변수, 상수)is 비교대상타입
  
  1. 연산자 왼쪽 인스턴스 타입 = 오른쪽 인스턴스 타입 -> true
  2. 연산자 왼쪽 인스턴스의 타입이 오른쪽 인스턴스의 타입의 하위 클래스 일 경우 -> true
  3. 그 외 -> false
  
  Car() is Car // true
  Car() is Vehicle // true
  Vehicle() is Car // false
  ```

  타입을 비교 연산할 때, 연산자 왼쪽에 인스턴스가 아니라 인스턴스가 할당된 변수가 사용될 경우, 변수가 선언된 타입을 기준으로 비교하는 것이 아니라 변수에 할당된 실제 인스턴스를 기준으로 타입을 비교한다.

  ```swift
  let myCar: Vehicle = Car()
  
  if myCar is Car {
  	print("myCar 는 Car 타입")
  } else {
  	print("mtCar 는 Car 타입 아님")
  }
  // "myCar는 Car 타입"
  ```

------

* 타입 캐스팅 연산

  ```swift
  let someCar: Vehicle = SUV()
  ```

  위의 someCar 상수는 SUV 클래스의 인스턴스가 할당돼 있지만, 컴파일러는 이 상수를 Vehicle 타입으로 간주한다. 따라서 Vehicle 클래스에서 선언되지 않고 SUV 클래스에서만 선언된 프로퍼티나 메소드를 사용할 수 없다. someCar에서 SUV 클래스의 프로퍼티나 메소드를 사용하려면 타입 캐스팅(형 변환)이 필요.

  1. 업캐스팅 - 하위 클래스 타입 → 상위 클래스 타입

     ```swift
     객체 as 변환할 타입
     ```

  2. 다운캐스팅 - 상위 클래스 타입 → 하위 클래스 타입

     ```swift
     1. 옵셔널 캐스팅
     - 객체 as? 변환할 타입
     2. 강제 캐스팅
     - 객체 as! 변환할 타입
     ```

     ```swift
     if let anyCar = anyCar as? Car {
     	print("\\(anyCar) 캐스팅 성공!")
     }
     ```

------

* Any, AnyObject

  타입 캐스팅을 수행할 때 일반적으로 상속 관계에 있는 클래스들끼리만 캐스팅할 수 있다. 예외적으로 모든 클래스의 인스턴스는 Any, AnyObject 클래스 타입으로 선언된 상수나 변수에 할당 가능하다.

  ```swift
  var allVehicle: AnyObject = Vehicle()
  allVehicle = Car()
  
  var list = [AnyObject]()
  list.append(Vehicle())
  list.append(Car())
  ```

  Any 객체는, 클래스만 허용하는 AnyObject와 달리, Swift에서 제공하는 모든 타입(클래스, 원시 자료형, 구조체, 열거형, 함수,...)을 허용한다.

  ```swift
  var value: Any = "Sample String"
  value = 3
  value = false
  value = [1, 2, 3, 4, 5]
  value = {
  	print("")
  }
  ```

------

------

### 2. 초기화 구문

* init 초기화 메소드

  ```swift
  init(<매개변수> : <타입>, <매개변수>: <타입>,...) {
  	1. 매개변수의 초기화
  	2. 인스턴스 생성 시 기타 처리할 내용
  }
  ```

------

* 초기화 구문의 오버라이딩

  클래스에서는 초기화 구문도 일종의 메소드이므로, 자식 클래스에서 오버라이딩할 수 있다.

  ```swift
  class Base {
  }
  
  class ExBase: Base {
  	override init() {
  	}
  }
  ```

  하지만, 초기화 구문을 오버라이딩하면 더 이상 부모 클래스에서 정의한 초기화 구문이 실행되지않아, 부모 클래스 프로퍼티의 초기화가 누락된다. 이를 방지하고자 초기화 구문을 오버라이딩할 경우 부모 클래스에서 정의된 초기화 구문을 내부적으로 호출해야하는데, 이 때 오버라이딩된 초기화 구문 내부에 super.init 구문을 작성하면 된다.

  ```swift
  class Base {
  	var baseValue: Double
  	init(inputValue: Double) {
  		self.baseValue = inputValue
  	} 
  }
  
  class ExBase: Base {
  	override init(inputValue: Double) {
  		super.init(inputValue: 10.5)
  	}
  }
  ```

------

* 초기화 구문 델리게이션

  만약 ExBase를 상속받은 자식 클래스가 init() 구문을 다시 오버라이딩하면, 이 때도 마찬가지로 super.init()을 호출하여 부모 클래스의 초기화 구문을 호출해야한다. 호출된 부모 클래스의 초기화 구문은 다시 상위 클래스의 초기화 구문을 호출하고, 상위의 초기화 구문은 다시 그 상위 클래스의 초기화 구문을 호출한다. 이처럼 연쇄적으로 오버라이딩된 자식 클래스의 초기화 구문에서 부모 클래스의 초기화 구문에 대한 호출이 발생하는 것을 초기화구문 델리게이션(Initializer Delegation)이라고 한다.