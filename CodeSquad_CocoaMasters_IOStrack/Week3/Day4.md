- 강의 내용

  - 어려운 문제 = 복잡한 문제 → 복잡할수록 더 간단하고 자잘한 문제로 나누어, 각각 하나의 함수로 나누어 구현해보고 합쳐봐라.

  ### 함수형 프로그래밍(Functional Programming)

  여기서 함수는 수학적인 함수를 뜻하고, 함수형 프로그래밍이란 (수학적인)함수로 표현 가능한 프로그래밍 패러다임이다. 옛날에는 수학적인 함수로 프로그래밍하기가 어려웠기 때문에 등장한 패러다임이다.

  함수형 프로그래밍은 함수가 First-class citizen/Object이다. 1등 시민이 되기 위해서는 메개변수로 함수를 전달할 수 있어야하고, 반환값으로도 함수를 사용할 수 있어야한다. 그리고 함수의 타입으로 함수를 지정할 수도 있어야한다.

  함수형 프로그래밍에서는 자료 처리를 수학적 함수의 계산으로 취급하고(순수함수Pure Function), 상태와 가변 데이터 대신 불변 데이터(Immutable 타입)을 사용한다.

  여기서 순수함수란 부작용(Side Effect)가 없는 함수를 뜻한다. 외부의 값을 변형시키지 않고, 외부 상태에 의존적이지 않는 함수이다. 값을 변경시키는 대신 값을 반환하는 함수이다.

  ```swift
  var list = [1, 2, 3, 7, 4]
  list.sort()
  let sortedList = list.sorted()
  ```

  위의 sort()함수는 list를 직접 수정하여 변경시킨다. 하지만 sorted()는 list는 바뀌지 않고, 변경된 list를 return한다. Swift의 함수들 중에 함수명 끝에 ed가 붙은 함수들은 값을 변경시키지 않고 return 값이 있을거라는 의미를 내포한다고 한다.

  함수형 프로그래밍에서는 closure를 사용한다. closure는 이름없는 함수로 작성이 가능하고, 선언된 범위(scope)의 변수를 캡처해서 저장하고 닫는다는 뜻에서 이름을 정했다고 한다.

  ```swift
  var intValue = 10
  let increment = {
  	intValue = intValue + $0
  }
  increment(5)
  print(intValue) // 15
  ```

  ```swift
  let result1 = numberArray.map({ (n:Int)->Int in return n*n })
  let result2 = numberArray.map({(n:Int)->Int in n*n})
  //한줄 표현 클로저에서는 return 구문을 생략해도 된다.
  let result3 = numberArray.map({n in return n*n})
  //클로저에서 사용하는 변수 타입은 생략할 수 있따. in 지시어를 사용해 변수를 명시할 수 있다.
  let result4 = numberArray.map({ n in n * n })
  //rerturn 구문은 생략 가능하다.
  let result5 = numberArray.map( {$0*$0} )
  //클로저 내부에서는 축약 변수를 인자 값 순서에 따라서 $0부터 사용할 수 있다.
  let result6 = numberArray.map() {$0*$0}
  //함수 인자 중 마지막 인자 값이 클로저인 경우엔 후행 클로저로 판단하고 함수 괄호 다음에 빼서 선언할 수 있다.
  let result7 = numberArray.map { $0 * $0 }
  //함수에 대한 인자값이 없는 경우 괄호는 생략 가능
  ```

  고차 함수란 함수 또는 클로저를 인자값 또는 리턴값으로 사용하는 함수를 말한다.

  고차함수 중 하나인 map은 다음과 같이 동작한다고 이해하면 편하다.

  ```swift
  [ x1, x2, ... , xn].map(f) -> [f(x1), f(x2), ... , f(xn)]
  ```

  배열 내의 인자값들을 map의 매개변수에 해당하는 함수(클로저)를 거쳐 새로운 배열을 만들어준다.

  ```swift
  func map(closure: (Int) -> Int {
  	var result = []
  	for element in self {
  		result.append(closure(element))
  	}
  	return result
  }
  ```

  map의 식이 위와 같다고 생각하면 편하다.

  ------

  ### 동기와 비동기

  동기는 타이밍을 맞추기위해 기다리는 걸 의미한다.

  ```swift
  func foo2(input: Int) -> Int {
  	return 10 * Input
  }
  func foo1(x1: Int, x2: Int) -> Int {
  	let x10 = foo2(input: x1)
  	let x20 = foo2(input: x2)
  	return x10+x20
  }
  ```

  위와 같은 함수가 있다면, foo1에서 함수가 진행될 때, x10을 선언하기 위해 foo2함수가 호출된다. 이 때 foo1함수는 foo2함수가 끝나서 반환값을 받을 때까지 기다리고, foo2함수가 끝나면 foo1함수의 다음 코드가 진행된다. 이렇게 foo1처럼 기다리면서 반환을 기다리거나 타이밍을 기다리는 걸 동기라고 한다.

  반대로 비동기는 타이밍을 맞추기위해 기다리지 않고 독단적으로 진행되는 걸 의미한다. Timer클로저가 대표적이다.

  ```swift
  Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
  	(timer) in
  		print("Timer on every second!")
  }
  ```

  위의 Timer 클로저는 다른 함수들의 진행과 상관없이 매 1초마다 실행이 되므로, 비동기의 특성을 가진다고 할 수 있다.

------

- 강의 중 몰랐던 내용

  - forEach문

    반복 실행하려는 코드를 파라미터로 받고, 저장된 요소는 클로저 상수로 전달되는 문법이다.

    ```swift
    let nums: [Int] = [1,2,3,4]
    nums.forEach {
    	print{$0)
    }
    ```

    내가 전달한 print함수를 찍는 클로저를 nums 요소의 갯수만큼 반복한다.

    - for-in 문과 다른 점

      for-in문에서만 continue, break를 사용할 수 있고, forEach문에서는 return을 이용해 continue처럼 사용할 수 있다.

------

- 복습한 내용

  1. 과제를 하면서, 매개변수를 변경시켜줄 수 없어서 함수 밖에 새로운 변수를 설정하고 계속 변경시켜주는 헛짓거리를 했는데, 저번주에 공부한 내용 중에 InOut이라는 키워드를 사용함으로써 입력된 변수의 값 또한 변경시켜줄 수 있음을 "다시" 알게 됐다.

     ```swift
     var cnt = 30
     func foo(value: Int) -> Int {
     	var value = value
     	value += 1
     	
     	return value
     }
     print(foo(value: cnt)) //함수 내부의 value변수값 : 31
     print(cnt) //외부에서 정의된 cnt 변수값 : 30
     
     func foo2(value: InOut Int) -> Int {
     	value += 1
     	return value
     }
     print(foo2(value: cnt)) // 함수 내부의 value 변수값 : 31
     print(cnt) //외부에서 정의된 cnt 변수값 : 31
     ```

     공부했더라도 어떤 상황에 쓰는지 생각을 안하고 공부하면 이렇게 다시 공부하는 일이 많아질 것 같다.