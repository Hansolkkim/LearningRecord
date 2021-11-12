- Week2 Wed Review

  - 공부할 환경을 만들어놓는게 좋을 거다!
  - 과제의 경우는 모르겠지만, 대부분의 경우 함수의 매개변수, return 타입은 내가 정하는 경우가 많을테니, 어떤 타입을 사용해야할지 평소에 잘 생각해보자.
  - stride(from: ,through/to: ,by: )
  - 공식문서의 키워드 등을 체계화시켜 나만의 언어로 정리해놓는 것도 중요하다.
  - 함수를 만들 때, 상위 함수에서 하위 함수를 차례대로 호출하며 진행되는 형태로 함수를 만드는 것이 좋음(왜냐하면 나중에는 상위 함수 내의 하위 함수들이 여러 struct/class에서 분리된 함수인 경우도 많기 때문에, 하위 함수들끼리 호출하는 함수를 사용하게 되면 어려워짐)
  - 함수를 만들 때, 최소한 입력, 처리, 출력하는 하위 함수를 분리해서 만들어보는 연습을 해보자.

- Week2 Thu Revies

  - [Swift RoadMap](https://raw.githubusercontent.com/godrm/mobile-developer-roadmap/master/Images/Swift_programming_roadmap_v0.9.png) - 노란 부분에서 모르는게 있으면 더 찾아보면서 공부해야할 필요가 있겠다.

  - struct ? - 데이터와 함수를 함꼐 다루는 타입(데이터와 함수를 함께 추상화했다.)

    ```swift
    //딸기우유, 바나나우유, 초코우유를 일반화 + 추상화하고 Swift 코드로 표현해보기
    //우유 객체 추상화 구조체
    enum milkType {
    	case strawberry
    	case bansns
    	case chocolate
    }
    struct Milk {
    	let brand : String
    	let amount : Int
    	let title : String
    	let type : .milkType
    }
    
    //우유 객체 인스턴스 생성
    let 딸기우유1 = Milk(brand: "서울우유", amount: 150, title: "딸기우유", type: .strawberry)
    let 바나나우유1 = Milk(brand: "빙그레", amount: 200, title: "뚱비", type: .banana)
    let 초코우유1 = Milk(brand: "매일우유", amount: 150, title: "에너지초코우유", type: .chocolate)
    ```

  - class ? struct와 유사하지만, 상속(상위 class에서 하위 class로 property,func을 물려줌)이 가능하고, init() 함수를 반드시 포함해야함

    [Struct VS class](https://www.notion.so/f7e1e6b96ecb4414b677948e825c694f)

    (property : 값 이라고 생각하면 되고, fucntion : method라고 하면 됨)

    (init() → Struct는 인스턴스의 초기화 선언시 init()함수가 없어도 컴파일러가 자동으로 만들어놓고 저장함)

    ```swift
    var myPen = NSPen()
    ```

    myPen이라는 변수가 NSPen의 인스턴스를 "참조"하고 있음

    ```swift
    var whichPen = myPen
    ```

    whichPen은 myPen과 같은 인스턴스를 참조하고 있음 → Identity가 같음

    ⇒ whichPen === myPen

    ```swift
    var yourPen = NSPen()
    ```

    myPen과 다른 인스턴스를 참조하는 yourPen → Identity가 다름

    하지만, 만약 myPen과 yourPen의 Property값이 똑같다면 Equality가 같음

    ⇒ myPen == yourPen

  - Value와 Reference

    ```swift
    let origin = CGPoint(x:0, y:0)
    var other = origin
    other.x += 5
    ```

    값 타입인 Struct의 경우, 위와 같이 other = origin 을 해놓고 other의 x 값을 바꾸더라도, origin의 x값은 여전히 0 이다.

    ```swift
    var myMilk = chocoMilk()
    myMilk.amount = 300
    var yourMilk = myMilk
    yourMilk.amount = 100
    ```

    하지만 참조 타입인 Class의 경우, 위와 같이 yourMilk = myMilk 를 해놓고 yourMilk의 amount 값을 바꾼다면 myMilk의 amount 값 또한 바뀌게 된다.

    → 값 타입의 경우, other = origin 같이 선언하게 되면 인스턴스를 복사해 하나 새로 만드는 것이기 때문에 서로의 property에 영향을 주지 않지만, 참조 타입의 경우에는 yourMilk = myMilk와 같이 선언하게 되면 두 변수는 같은 인스턴스를 "참조"하게 되므로, 한쪽의 property가 변화하면, 같은 인스턴스를 참조하고 있는 변수의 property 또한 변하게 된다.

- Swift 기본 문법 공부

  1. Dictionary

     - 고유 키와 그에 대응하는 값을 연결하여 데이터를 저장하는 자료형

     - 선언과 초기화

       ```swift
       1. Dictionary <키의 타입, 값의 타입> ()
       let someDictionary = Dictionary<String, String>()
       
       2.[키로 사용할 타입 : 값으로 사용할 타입] ()
       let someDictionary = [String : String]()
       ```

     - 값 할당

       ```swift
       1. someDictionary.updateValue("김", for Key: "성")
       2. someDictionary["이름"] = "한솔"
       ```

     - 저장된 아이템 제거

       ```swift
       1. someDictionary.removeValue("김", for Key: "성")
       2. someDictionary["이름"] = nil
       ```

     - 키와 값에 대한 보장이 없음. 배열(Array)는 값을 저장할 때 만들어져 있지 않은 인덱스라면 오류를 발생해버리면 되니 배열에서 인덱스를 호출한다는 것은 그 안의 값을 꺼내오기만 하면 된다는 것이고, 설령 값이 아직 저장되지 않았더라도 초기화될 때 적용한 기본값이라도 저장되어 있을 것임.

       하지만 딕셔너리는 키를 호출해 저장된 값을 불러올 때 없는 키를 호출했을 가능성을 항상 염두해두어야 함. 그래서 Swift는 딕셔너리로부터 키를 호출해서 저장된 값을 불러올 때 Optional 타입의 값을 반환함.

     - 순회탐색

       ```swift
       for (key, value) in someDictionary {
       	print("현재 데이터는 \\(key) : \\(value)입니다.")
       } //데이터는 우리가 생각한 순서대로 저장되지 않을 수 있음을 주의
       ```

1. Optional

   - nil을 사용할 수 있는 타입

   - Unwrapping 방법

     1. Forced Unwrapping

        optionalVal! 과 같이 ! 기호만 붙여서 Unwrapping할 수 있지만, 값이 nil인 옵셔널 변수에 !를 붙이면 오류가 발생함. 옵셔널 변수/상수를 사용하기에 Forced Unwrapping은 위험한 방법임.

     2. Optional Binding

        -조건문 내에서 일반 상수에 옵셔널 값을 대입하는 방식(반드시 조건문에서 사용해야함)

        ```swift
        //if let 구문 사용
        var str = "Swift"
        if let intFromStr = Int(str) {
        	print("값이 변환되었습니다. 변환된 값은 \\(intFromStr)입니다.")
        } else {
        	print("값 변환에 실패했습니다.)
        }
        
        //guard let 구문 사용
        func intStr(str: String) {
        	guard let intFromStr = Int(Str) else {
        		print("값 변환에 실패했습니다.")
        		return
        	}
        	print("값이 변환되었습니다. 변환된 값은 \\(intFromStr)입니다."
        }
        ```

        -guard let 구문은 조건에 맞지 않으면 무조건 함수의 실행을 종료시키는 특성이 있기 때문에, 실행 흐름상 옵셔널 값이 해제되지 않으면 더 이상 진행이 불가능할 정도로 큰 일이 생길 때에만 사용하는 것이 좋음.

     3. 컴파일러에 의한 옵셔널 자동 해제

        -옵셔널 객체의 값을 비교 연산자를 사용하여 비교하는 경우, 명시적으로 옵셔널 객체를 강제 해제하지 않아도 한쪽이 옵셔널, 다른 한 쪽이 일반 타입이라면 자동으로 옵셔널 타입을 해제하여 연산을 수행함.

        ```swift
        let tempInt = Int("123") //Int()메소드의 리턴값의 타입은 OptionalInt
        
        tempInt == 123             //true
        tempInt == Optional(123)   //true
        tempInt! == 123            //true
        tempInt! = Optional(123)   //true
        ```

        비교연산을 처리할 때는 옵셔널 타입 여부에 구애받지 않고 일반 자료형처럼 값을 비교하면 됨.

     4. Implicitly Unwrapped Optional (옵셔널의 묵시적 해제)

        ```swift
        //명시적 옵셔널 선언
        var str: String? = "Swift Optional"
        print(str) // Optional("Swift Optional")
        
        //묵시적 옵셔널 선언
        var str: String! = "Swift Optional"
        print(str) // Swift Optional
        ```

        형식상 옵셔널로 정의해야 하지만, 실제로 사용할 때는 절대 nil 값이 대입될 가능성이 없는 변수일 때 사용해야함.

        실제로 IUO가 유용하게 사용되는 경우는 클래스 또는 구조체 내에서, 멤버 변수를 정의할 때 선언과 초기화를 분리시켜야하는 경우임.

2. 함수

   - 리턴값이 없는 함수에서  return 을 사용하면, 명시적으로 그 함수를 종료시킴을 의미함.

     ```swift
     func hello(name: String?) {
     	guard let _name = name else {
     		return
     	}
     
     	print("\\(_name)님, 안녕하세요.")
     }
     //옵셔널 바인딩에 실패했을 때 return 구문을 실행하여 함수를 종료.
     ```

   - typealias를 이용해 새로운 축약형 타입을 정의해, 리턴 타입이 튜플인 함수의 리턴 값을 간결한 형태로 받을 수 있음

     ```swift
     typealias infoResult = (Int, Character, String)
     
     func getUserInfo() -> infoResult {
     	let gender: Character = "M"
     	let height = 178
     	let name = "한솔"
     	
     	return (height, gender, name)
     }
     
     let info = getUserInfo()
     info.0 // 178
     info.1 // "M"
     info.2 // "한솔"
     ```

   - 외부 매개변수를 사용해 함수를 정의할 수도 있음.

     ```swift
     func printHello(to name: String, welcomeMessage msg: String) {
     	print("\\(name)님, \\(msg)")
     }
     
     printHello(to: "홍길동", welcomeMessage: "안녕하세요")
     //"홍길동님, 안녕하세요"
     ```

   - 가변 인자를 매개변수로 받는 함수를 정의할 수 있음.

     ```swift
     func avg(score: Int...) -> Double {
     	var total = 0
     	for r in score {
     		total += r
     	}
     	return (Double(total) / Double(score.count))
     }
     
     print(avg(score:10,20,30,40)) //25.0
     ```

   - 기본값을 갖는 함수 선언이 가능함.

     ```swift
     func echo(message: String, newline: Bool -> true) {
     	if newline == true {
     		print(message, true) //true -> 줄바꿈을 함
     	} else {
     		print(message,false) //false -> 줄바꿈 안함
     	}
     }
     ```

   - InOut 매개변수로, 입력된 변수의 값을 변경시켜줄 수도 있음.

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

   - 변수나 상수에 함수를 대입할 수 있음.

     ```swift
     func boo1(age: Int) -> String {
     	return "\\(age)"
     }
     
     let t = boo1
     t(17) // "17"
     let fn1: (Int) -> String = boo1
     
     func boo2(age: Int, gender: String) -> String {
     	return "\\(age)살, \\(gender)"
     }
     
     let fn2: (Int, String) -> String = boo2
     let fn3: boo2(age:gender:)
     
     func boo3() {
     	print("empty")
     }
     
     let fn4: () -> () = boo3
     let fn4: () -> Void = boo3
     ```

   - 함수의 반환 타입으로 함수를 사용할 수 있음.

     ```swift
     func desc() -> String {
     	return "this is desc()"
     }
     
     func pass() -> () -> String {
     	return desc
     }
     
     let p = pass()
     p() // "this is desc()"
     ```

     -pass함수의 반환 타입은 함수 타입인 () → String 으로 정의됨. 이는 pass 함수가 desc함수를 반환하기 때문으로, () → String 은 desc 함수의 타입 표현에 해당함.

     -상수 p는 pass함수의 실행 결과값을 할당받고 있으므로, 상수 p는 desc 함수나 마찬가지임.

     ```swift
     func plus(a: Int, b: Int) -> Int {
     	return a+b
     }
     func minus(a: Int, b: Int) -> Int {
     	return a-b
     }
     
     func calc(_ operand: String) -> (Int, Int) -> Int {
     	switch operand {
     	case "+" :
     		return plus
     	case "-" :
     		return minus
     	}
     }
     
     let c = calc("+")
     c(3,4) // plus(3,4) = 7
     ```

   - 함수의 인자값으로 함수를 사용할 수 있음.

     ```swift
     func successThrough() {
     	print("연산처리가 성공했습니다.")
     }
     func failThrough() {
     	print("처리 과정에서 오류가 발생했습니다.")
     }
     
     func divide(base: Int, success sCallback: () -> Void, fail fCallBack: () -> Void) -> Int {
     	guard base != 0 else {
     		fCallBack()
     		return 0
     	}
     
     	defer {
     		sCallBack()
     	}
     	return 100 / base
     }
     
     divide(base: 30, success: successThrough, fail: failThrough)
     ```

     -함수가 성공 또는 실패했을 때의 처리 과정을 외부에서 제어할 수 있게 됨. → 함수 내부의 코드를 건드리지 않고도 외부에서 실행 흐름을 추가하기 위한게 가장 큰 목적.

     -defer 블록은 함수나 메소드에서 코드의 흐름과 상관없이 가장 마지막에 실행되는 블록임. 함수를 종료하기 전에 처리해야 하는 변수나 상수들 중에서 처리 시점이 모두 달라서 적절한 처리 시점을 잡기 어려울 때 defer 구문을 통해 처리하면 됨.

   - 클로저(Closure)

     클로저 표현식은 함수와 달리 생략되는 부분이 많다. func 키워드와 함수명을 제외한 나머지 부분만 작성하는 경량 문법을 클로저 표현식이라고 한다.

     그리고, 일반적인 함수 정의라면 반환 타입이 표현된 다음에는 실행 블록의 시작을 알리는 { 가 와야하지만, 클로저 표현식에서는 시작 부분에서 이미 중괄호가 선언된 상태이므로 in 키워드로 실행 블록의 시작을 표현한다.

     ```swift
     { () -> Void in
     	print("클로저가 실행됩니다.")
     }
     
     let f = { () -> Void in
     	print("클로저가 실행됩니다.")
     }
     f() //"클로저가 실행됩니다."
     
     //할당받을 상수 f마저 생략하고 함수를 실행시키고 싶을 때 이렇게 실행시킬 수 있음.
     ({ () -> Void in
     	print("클로저가 실행됩니다.")
     }) () //"클로저가 실행됩니다."
     ```

     ```swift
     func order(s1: Int, s2:Int) -> Bool {
     	if s1 > s2 {
     		return true
     	} else {
     		return false
     	}
     }
     var value = [1, 9, 5, 7, 3, 2]
     value.sort(by: order) //[9, 7, 5, 3, 2, 1]
     ```

     order함수를 클로저 표현식으로 표현하기

     ```swift
     value.sort(by: {
     	(s1: Int, s2: Int) -> Bool in 
     	if s1 > s2 {
     		return  true
     	} else {
     		return false
     	}
     })
     ```

     ```swift
     value.sort(by: {(s1: Int, s2: Int) -> Bool in return s1 > s2})
     
     // 반환값 정의인 Bool을 생략가능함.(컴파일러가 자동으로 추론함)
     value.sort(by: {(s1: Int, s2: Int in return s1 > s2})
     
     //매개변수 타입 정의 또한 컴파일러의 추론 덕분에 생략 가능
     value.sort(by: {s1, s2 in return s1 > s2})
     
     //매개변수 또한 생략하여, $0, $1, $2와 같은 이름으로 할당된 내부 상수를 이용할 수 있음.
     //매개변수가 생략되면, 클로저 선언 부분과 실행 부분을 분리할 필요가 없어지므로 in 또한 생략가능
     value.sort(by: {return $0 > $1})
     
     //어짜피 Bool 값을 반환할 것을 컴파일러가 알고 있으며(sort 메소자의 인자값 타입을 통해), return까지 생략 가능함.
     value.sort(by: {$0 > $1})
     
     //연산자 함수(Operator Function): 연산자만을 사용하여 의미하는 바를 정확이 나타낼 수 있을 때 사용되는 함수
     value.sort(by: > )
     ```

     Trailing Closure(클로저 꼬리?)

     함수의 마지막 인자값이 클로저일 때, 이를 함수의 뒤에 꼬리처럼 붙일 수 있는 문법을 의미한다. 이 때, 인자 레이블은 생략된다.

     ```swift
     value.sort(by: {(s1, s2) in
     	return s1 > s2
     })
     ->
     value.sort() { (s1, s2) in
     	return s1 > s2
     }
     
     //인자값이 하나일 경우, 함수의 () 까지 생략 가능
     value.sort { (s1, s2) in
     	return s1 > s2
     }
     ```

     @escaping 속성

     인자값으로 전달된 클로저를 저장해 두었다가, 나중에 다른 곳에서도 실행할 수 있도록 허용해주는 속성

     ```swift
     func divide(base: Int, success sCallback: () -> Void) -> Int {
         defer {
             sCallBack()
         }
         return 100 / base
      }
     
     divide(base: 30) {
     	
     	print("Closure가 실행됐습니다.")
     }
     ```

     위와 같이, Trailing Closure 표현으로 divide함수를 호출할 수 있다. 하지만 아래와 같이 바뀐다면 오류가 발생한다.

     ```swift
     func divide(base: Int, success sCallback: () -> Void) -> Int {
     
     		let s = sCallBack //Non-escaping parameter 'sCallBack' may only be called 오류 발생
     
         defer {
             s()
         }
         return 100 / base
      }
     
     divide(base: 30) {
     	
     	print("Closure가 실행됐습니다.")
     }
     ```

     Swift에서 함수의 인자값으로 전달된 클로저는 기본적으로 함수 내에서 직접 실행을 위해서만 사용되어야 한다. 따라서 함수 내부라 할지라도 변수나 상수에 대입할 수 없다. 변수나 상수에 대입된다면 내부 함수를 통한 캡처 기능을 이용해 클로저가 함수 바깥으로 탈출할 수 있기 때문이다. 이 때, @escaping을 클로저에 붙여주면, 해당 클로저는 탈출이 가능한 인자값으로 설정된다.

     ```swift
     func divide(base: Int, success sCallback:@escaping () -> Void) -> Int {
     
     		let s = sCallBack
     
         defer {
             s()
         }
         return 100 / base
      }
     
     divide(base: 30) {
     	
     	print("Closure가 실행됐습니다.")
     }
     ```

     @autoclosure 속성

     인자값으로 전달된 일반 구문이나 함수 등을 클로저로 래핑(Wrapping)하는 역할을 하는 속성.

     즉, 일반 구문을 인자값으로 넣더라도 컴파일러가 알아서 클로저로 만들어 사용한다.

     이 속성을 적용하면, 인자값을 {} 형태가 아니라 ()형태로 사용할 수 있다.

     ```swift
     //@autoclosure 미사용
     
     func condition1(stmt: () -> Bool) {
     	if stmt() == true {
     		print("결과가 참")
     	} else {
     		print("결과가 거짓")
     	}
     }
     
     condition1(stmt: {
     	4 > 2
     })
     
     condition1 {
     	4 > 2
     }
     
     //@autoclosure 사용
     
     func condition2(stmt:@autoclosure () -> Bool) {
     	if stmt() == true {
     		print("결과가 참")
     	} else {
     		print("결과가 거짓")
     	}
     }
     condition(stmt: (4 > 2))
     ```

     ```swift
     var arr = [String]()
     
     func addVars(fn: @autoclosure () -> Void) {
     	arrs = Array(repeating: "", count: 3)
     	fn()
     }
     
     arr.insert("KR", at:1)
     
     //arr는 초기화가 되어있을 뿐, addVars(fn:)함수가 실행되기 전까지 이 함수의 인덱스는 0까지 밖에 없음. 따라서 인덱스1에 값을 입력하면 오류가 발생함.
     
     addVars(fn: arr.insert("KR", at:1))
     //함수 내에 작성된 구문은 함수가 실행되기 전까지는 실행되지 않음.
     //@autoclosure 속성을 갖는 인자값은 컴파일러에 의해 클로저로 감싸지기 때문에, addVars(fn:)함수가 실행되기 전까지는 arr.insert("KR", at:1)이 실행되지 않음.
     //이를 지연실행이라고 한다.
     ```