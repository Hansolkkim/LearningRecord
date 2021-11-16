- 강의 내용

  - 우리가 만드는 Program은 2가지를 다룸 → Value(What) , Fuction(How)
  - 이 value를 다루는 데이터 구조에는 Primitive Type과 Derived Type이 있는데, Primitive Type에는 Byte, Shor, Int, Long, Float, Double, Boolean, Character, String, (Decimal) 등이 있고, Derived Type에는 List, Array, Stack, Queue, Tree, Graph 등이 있다.
    - Array는 일단 연속되게 틀을 만들어놓고, 그 틀에 값들을 채워넣는다. 그런데, index = 1 의 값이 삭제되었다고 하더라도 index = 2 의 값이 index = 1 로 오지는 않기 때문에 삽입, 삭제가 어렵다고 한다. CotiguousArray라는 struct로 구현할 수 있다.
    - List는 Array와는 다르게 값들이 연속적으로 구성되어있는게 아니라, 값이 들어있는 메모리에 다음 index를 가리키는 메모리까지 함께 들어있다. 따라서 삽입, 삭제 등이 간단하지만 포인터 값 떄문에 메모리 용량을 Array대비 많이 차지한다.
    - Stack은 LIFO 구조로 동작하는 데이터 구조이다.
    - Queue는 FIFO 구조로 동작하는 데이터 구조이다.
    - Tree는 파인더의 폴더와 같다고 생각하면 이해가 편하다.
  - 알고리즘(Algorithm)은 이런 데이터 값을 계산하는 흐름이기 때문에 개발자에게 반드시 필요한 지식이다.
  - 데이터 구조 별로 구현해보기 = 데이터 구조마다 연산 구현해보기

- 책 공부

  ### 1. 상속

  한 클래스가 다른 클래스에서 저의된 프로퍼티나 메소드를 물려받아 사용하는 것을 의미한다.

  1. 서브클래싱(Subclassing) - 기존에 있는 클래스를 기반으로 새로운 클래스를 작성하는 과정

     ```swift
     class A {
     	var name = "Class A"
     	
     	func foo() {
     		print("\\(self.name)'s method foo is called")
     	}
     }
     
     class B: A {
     	var prop = "Class B"
     	
     	func boo() -> String {
     		return "Class B prop = \\(self.prop)"
     	}
     }
     let b = B()
     b.prop // "Class B"
     b.name // "Class A"
     b.foo() // "Class A's method foo is called"
     b.name = "Class C"
     b.foo() // "Class C's method foo is called"
     ```

     클래스 B에서는 name프로퍼티와 foo()메소드가 정의되지 않았음에도 클래스 B의 인스턴스에서호출할 수 있다. 클래스 A로부터 물려받았기 때문이다.

  2. 오버라이딩 - 자식 클래스에서 재정의된 메소드나 프로퍼티는 부모 클래스로부터 물려받은 내용을 덮어쓰는 과정

     오버라이딩한 내용은 자기 자신 또는 자신을 서브클래싱한 하위 클래스에서만 적용된다.

     스위프트에서는 오버라이딩하려는 메소드나 프로퍼티의 선언 앞에 override 키워드를 붙여야 함.

     1. 프로퍼티 오버라이딩

        ```swift
        class Vehicle {
        	var currentSpeed = 0.0
        	var description: String {
        		return "시간당 \\(self.currentSpeed)의 속도로 이동하고 있습니다."
        	}
        }
        
        class Car: Vehicle {
        	var gear = 0
        	var engineLevel = 0
        	override var currentSpeed: Double {
        		get {
        			return Dobule(self.engineLevel * 50)
        		}
        		set {
        		}
        	}
        	override var description: String {
        		get {
        			return "Car : engineLevel = \\(self.engineLevel), so currentSpeed = \\(self.currentSpeed)"
        		}
        		set {
        			print("New Value is \\(newValue)")
        		}
        	}
        }
        let c = Car()
        c.engineLevel = 5
        c.currentSpeed // 250
        c.description = "New Class Car"
        print(c.description) // "New Value is New Car"
        										// "Car : engineLevel = 5, so currentSpeed = 250"
        ```

        위처럼 부모 클래스의 저장 프로퍼티(currentSpeed)를 연산 프로퍼티로 overriding 하는 것도 가능하다. 하지만 오버라이딩한 프로퍼티의 set 구문이 생략되서는 안된다. currentSpeed가 원래 저장 프로퍼티였으므로 오버라이딩할 때도 읽고 쓰기가 모두 가능하게 만들어줘야 하기 때문이다.

     2. 메소드 오버라이딩

        메소드 오버라이딩의 경우 조금 까다롭다. 오버라이딩 대상이 되는 메소드의 매개변수 개수나 타입, 반환 타입은 변경할 수 없고 내부 구문만 변경할 수 있다.

     상속받은 부모 클래스의 인스턴스를 참조할 수 있도록 super 객체와 점 구문을 함께 사용하면 부모 클래스의 프로퍼티나 메소드를 호출할 수 있다.

     Override를 막기 위해 final 키워드를 사용할 수 있다.

     ```swift
     class Vehicle {
     	final var currentSpeed = 0.0
     	final var description: String {
     		get {
     			return "시간당 \\(self.currentSpeed)의 속도로 이동하고 있음."
     		}
     	}
     	final func makeNoise() {
     	}
     }
     
     class Car {
     	var gear = 0
     	var engineLevel = 0
     	
     	override var currentSpeed:... //오류 발생
     }	
     ```

     또한 final을 클래스 앞에 붙인다면 상속 자체가 차단된다.