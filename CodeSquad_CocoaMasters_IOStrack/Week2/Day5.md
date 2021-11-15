## 금요일 알고리즘 문제 풀면서 궁금했던 사항

```swift
func howManyDividable(_ arr:[Int], _ divisor: Int) -> [Int] {
        
        var dividableArray = [Int]()
        for number in arr {
            
            if number % divisor == 0 {
                dividableArray.append(number)
            }
        }
        if dividableArray.count == 0 {
            dividableArray.append(-1)
        }
        
        return dividableArray.sorted()
    }
```

위의 풀이는 [프로그래머스 12910번 문제](https://programmers.co.kr/learn/courses/30/lessons/12910?language=swift)인 "나누어 떨어지는 숫자 배열" 이다. 답은 맞췄지만, 이번 금요일 알고리즘 풀이의 주제가 공간 복잡도와 시간 복잡도를 고려하는 것이었기 때문에, for문의 시간 복잡도는 당연히 높을테고, 다른 사람의 풀이 중 간단한 것과 비교해서 코드의 길이도 길고, if문도 두번이나 사용됐기 때문에 공간 복잡도 또한 높을 것이라 조금 공부가 필요하다고 생각했다.

다른 사람의 풀이 중 가장 짧게 만든 코드는 다음과 같았다.

```swift
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let array = arr.sorted().filter{ $0 % divisor == 0 }
    return  array == [] ? [-1] : array
}
```

아직 filter개념도 모르고, filter와 for의 시간 복잡도에 관해서도 잘 모르지만, 길이나 if문의 사용 유무 등에서 이 코드가 공간 복잡도는 내 코드보다 훨씬 나을거라고 생각이 됐다. filter에 대해서 공부를 해야겠다.

```swift
func dayIn2016(_ a: Int, _ b: Int) -> String {
        let day = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
        let month = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        var myDay = 0
        for index in 0..<a {
            myDay += month[index]
        }
        myDay += b
        
        return day[myDay % 7]
    }
```

위의 풀이는 [프로그래머스 12901번 문제](https://programmers.co.kr/learn/courses/30/lessons/12901?language=swift)인 "2016년" 이다.  이번 코드 또한 for문을 사용했는데, 다른 사람의 코드를 보니 for문 없이 reduce 를 사용해서 문제를 푼 것을 봤고, reduce에 대해서 공부해봐야겠다는 생각을 했다.

```swift
func solution(_ a:Int, _ b:Int) -> String {

    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDay = monthDay[0..<a-1].reduce(0, +) + b

    return w[totalDay % 7]
}
```

---



## Swift 기본 문법 공부

1. 구조체와 클래스

   - 구조체와 클래스 내부에 정의된 상수, 변수는 프로퍼티(Property)라고 부르고, 구조체와 클래스 내부에 정의된 함수는 메소드(Method)라고 불린다. 이는 변수,상수,함수가 구조체나 클래스 안에 들어가면서 특별한 성격을 갖기 때문이다. 이 둘을 합쳐서 구조체나 클래스의 멤버(Member)라고 부른다.

     (구조체나 클래스, 열거형, 프로토콜 등 객체는 대문자로 시작하는 카멜 표기법을, 객체 내에서 프로퍼티나 메소드를 선언할 때는 소문자로 시작하는 카멜 표기법을 사용함)

   - 구조체를 사용하는 것이 좋은 경우

     - 서로 연관된 몇 개의 기본 데이터 타입들을 캡슐화하여 묶는 것이 목적일 때
     - 캡슐화된 데이터에 상속이 필요하지 않을 때
     - 캡슐화된 데이터를 전달하거나 할당하는 과정에서 참조 방식보다는 값이 복사되는 것이 합리적일 때
     - 캡슐화된 원본 데이터를 보존해야 할 때

   - 프로퍼티 : 클래스나 구조체의 프로퍼티가 하는 정확한 역할은 **값을 제공**하는 것이다.

     프로퍼티 중 일부는 값을 저장하지는 않지만 값을 제공하는 특성을 가지기 때문. 그리고 이것을 기준으로 프로퍼티를 두 종류로 나눌 수 있다.

        1. 저장 프로퍼티
        - 입력된 값을 저장하거나 저장된 값을 제공하는 역할
        - 상수 및 변수를 사용해서 정의 가능
        - 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없음
        2. 연산 프로퍼티
        - 특정 연산을 통해 값을 만들어 제공하는 역할
        - 변수만 사용해서 정의 가능
        - 클래스, 구조체, 열거형 모두에서 사용 가능

     또한, 프로퍼티를 사용하려면 인스턴스가 필요한데, 인스턴스를 생성한 다음 이 인스턴스를 통해서 프로퍼티를 참조하거나 값을 할당할 수 있다. 이렇게 인스턴스에 소속되는 프로퍼티를 인스턴스 프로퍼티라고 하고, 예외적으로 일부 프로퍼티는 클래스와 구조체 자체에 소속되어 값을 가지기도 한다. 이를 타입 프로퍼티라고 한다.

    1. 저장 프로퍼티
    
        클래스 내에서 선언된 변수나 상수를 부르는 이름. 프로퍼티 선언 시 초깃값이 할당되지 않은 저장 프로퍼티는 반드시 옵셔널 타입으로 선언해줘야한다.(스위프트에서는 클래스의 프로퍼티에 값이 비어있으면 인스턴스를 생성할 때 무조건 nil값으로 초기화하기 때문)
    
        초깃값을 할당하지 않은 프로퍼티는 오류가 발생하므로, 아래의 세 방법으로 해결할 수 있다.
    
            1. 초기화 구문 작성
        
                ```swift
                class User {
                        var name: String
                
                        init() {
                            self.name = ""
                        }
                }
                ```
        
                초기화 구문 내부에서 멤버 변수로 정의된 name을 참조할 때, 앞에 self 키워드가 필요하다. 클래스에서 선언된 프로퍼티나 메소드는 self 키워드를 붙여서 구분한다. 
        
            2. 프로퍼티를 옵셔널 타입으로 선언
        
                ```swift
                class User {
                        var name: String?
                }
                //또는
                class User {
                        var name: String!
                }
                ```
        
                기본 옵셔널 타입과 묵시적 옵셔널 해제 타입을 사용할 수 있는데, 프로퍼티 값이 nil이 되지 않을 자신이 있다면 묵시적 옵셔널 해제 타입을 사용하는 것이 편함.
        
            3. 프로퍼티에 직접 초깃값을 할당
        
                ```swift
                class Useer {
                        var name: String = ""
                }
                ```
        
    
        -지연 저장 프로퍼티
    
            일반적으로 저장 프로퍼티는 클래스 인스턴스가 처음 생성될 때 초기화 되지만, 저장 프로퍼티 앞에 lazy 라는 키워드가 붙으면 예외임. 만약 이 지연 저장 프로퍼티에 클래스나 구조체 인스턴스가 대입된다면, 해당 프로퍼티가 호출되기 전까지는 해당 인스턴스는 초기화되지 않는다.
    
            ```swift
            class OnCreat {
                    init() {
                            print("OnCreate!!")
                    }
            }//LazyTest class의 인스턴스가 생성되면 print() 실행되는 class
            
            class LazyTest {
                    var base = 0
                    lazy var late = OnCreate()
            
                    init() {
                            print("지연 테스트")
                    }
            }
            
            let lz = LazyTest()  //"지연 테스트"
            //인스턴스가 생성되어, "지연 테스트"라는 출력 구문이 표시되지만, 아직 OnCreate의 출력구문이 보이지 않는 것을 보면, late 프로퍼티가 초기화되지 않았다는 것을 알 수 있다.
            lz.late //"OnCreate!!"
            //이제 "OnCreate!!"라는 출력 구문이 출력되는 것을 보면, late 프로퍼티가 호출된 후에야 초기화됨을 알 수 있다.
            ```
    
        -클로저를 이용한 저장 프로퍼티 초기화
    
            저장 프로퍼티 중 일부는 연산이나 로직 처리를 통해 얻어진 값을 이용하여 초기화해야하는 경우가 있음. 스위프트에서는 이와 같은 경우 클로저를 사용하여 필요한 로직을 실행한 다음 반환되는 값을 이용해 저장 프로퍼티를 초기화할 수 있도록 지원함. 이렇게 정의된 프로퍼티는 로직을 통해 값을 구한다는 점에서 연산 프로퍼티와 유사하지만, 참조될 때마다 매번 값이 재평가되는 연산 프로퍼티와 달리 최초 한 번만 값이 평가된다는 차이를 가진다.
    
                ```swift
                class PropertyInit {
                        
                        //저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
                        var value01: String! = {
                                print("value01 execute")
                                return "value01"
                        }()
                }
                
                let s = PropertyInit()
                //"value01 execute" 출력됨
                
                s.value01
                //실행결과 없음
                ```
    
            변수를 사용한 저장 프로퍼티를 정의했는데, 그 값은 클로저 구문을 이용해 초기화하고 있다. 클로저 구문 내에는 출력 구문을 추가하여, 클로저가 실행될 때마다 로그를 통해 확인할 수 있도록 했다. PropertyInit의 인스턴스를 생성했을 때 "value01 execute" 라는 출력구문이 출력되는걸 보면, 인스턴스 생성 시점이 저장 프로퍼티의 값이 평가되는 시점이라는 걸 알 수 있다. 하지만 저장 프로퍼티를 참조만 하면 아무런 출력이 없는걸 보면, 저장 프로퍼티에 저의된 클로저 구문이 더이상 실행되지 않는다는 것을 알 수 있다.
    
            클로저 구문을 실행하여 결과값을 저장 프로퍼티에 대입하고 싶지만 처음부터 클로저를 실행하는 저장 프로퍼티의 특성이 부담스러울 경우, lazy 구문을 사용하면 된다.
    
                ```swift
                class PropertyInit {
                        
                        //저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
                        lazy var value01: String! = {
                                print("value01 execute")
                                return "value01"
                        }()
                }
                let s = PropertyInit() //실행결과 없음
                s.value01 // "value01 execute" 출력됨
                s.value01 //실행결과 없음 -> 두 번째 참조에서는 클로저가 실행되지 않음.
                ```
    
            이렇게 value01을 lazy 구문을 이용해 선언하면, 실제로 값이 참조되는 시점에서 초기화된다.
    
    2. 연산 프로퍼티
    
        연산 프로퍼티는 실제 값을 저장했다가 반환하지는 않고 대신 다른 프로퍼티의 값을 연산 처리하여 간접적으로 값을 제공한다. 
    
        ```swift
        struct UserInfo {
                var birth: Int!
                var thisYear: Int! {
                        get {
                                let df = DateFormatter()
                                df.dateFormat == "yyyy"
                                return Int(df.string(from: Date()))
                        }
                }
                var age: Int {
                        get {
                                return (self.thisYear - self.birth) + 1
                        }
                }
        }
        let info = UserInfo(birth: 1980)
        print(info.age) // 37
        ```
        
        지금 배운 연산 프로퍼티를 활용해, 코코아 Week1의 화요일 미션을 다시 작성해보았다.
    
        ```swift
        struct Position {
            var x: Double = 0
            var y: Double = 0
        }
        struct Size {
            var width: Double = 0
            var height: Double = 0
        }
        struct Rect {
            var origin = Position() //좌측 하단을 기준으로 한 사각형 기준 좌표
            var size = Size() //가로 세로 길이
            var center: Position {
                get {
                    let centerX = self.origin.x + 1/2 * self.size.width
                    let centerY = self.origin.y + 1/2 * self.size.height
                    return Position(x: centerX, y: centerY)
                }
            }
            
        }
        
        let myPosition = Position(x: 0.0, y: 0.0)
        let mySize = Size(width: 10, height: 10)
        
        var square = Rect(origin: myPosition, size: mySize)
        print("square.centerX = \(square.center.x), square.centerY = \(square.center.y)") //square.centerX = 5, square.centerY = 5
        ```
        
        연산 프로퍼티의 set 구문은 활용하기에 따라 다른 저장 프로퍼티의 값을 변경시키는 데도 사용할 수 있다. 위의 새로운 코드를 기준으로 보면, 원래 중심 좌표는 origin의 좌표나 size에 따라 정해진다. 하지만, 중심 좌표를 옮김으로써 origin의 좌표가 바뀔 수도 있을 것이다. 이를 이용해 위의 Rect 구조체의 center 연산 프로퍼티의 정의를 다음과 같이 바꿀 수 있다.
    
        ```swift
        var center: Position {
                get {
                    let centerX = self.origin.x + 1/2 * self.size.width
                    let centerY = self.origin.y + 1/2 * self.size.height
                    return Position(x: centerX, y: centerY)
                }
                        set(newCenter) {
                                self.origin.x = newCenter.x + 1/2 * size.width
                                self.origin.y = newCenter.y + 1/2 * size.width
                        }
        }
        //이때 center 프로퍼티에 값이 대입된다면, 프로퍼티에 할당된 값은 set 다음에 오는 괄호의 인자값(newCenter)으로 전달된다. 만약 set() 괄호 안에 매개변수가 생략된다면 "newValue"라는 기본 인자명이 사용된다.
        ```
    
        다음의 방법으로 center 연산 프로퍼티의 set()구문을 이용할 수 있다.
    
        ```swift
        square.center = Position(x: 20, y: 20)
        print("square.centerX = \(square.center.x), square.centerY = \(square.center.y)") //square.centerX = 15, square.centerY = 15
        ```
    
    3. 프로퍼티 옵저버 (Property Observer)
    
        특정 프로퍼티를 계속 관찰하고 있다가 프로퍼티의 값이 변경되면 알아차리고 호출됨.
    
        1. willSet 옵저버
        
            willSet 옵저버를 구현해 둔 프로퍼티에 값을 대입하면 그 값이 프로퍼티에 대입되기 직전에 willSet 옵저버가 실행된다.
        
            ```swift
            var <프로퍼티 명> : <타입> [ = <초깃값> ] {
                    willSet [ (<인자명> ) ] {
                            <프로퍼티 값이 변경되기 전에 실행할 내용>
                    }
            } //[]의 인자명은 생략해도 되고, 생략되있으면 newValue라는 이름으로 매개상수 형태로 전달됨
            ```
        
        2. didSet 옵저버
        
            didSet옵저버를 구현해 둔 프로퍼티에 값을 대입하면 그 값이 프로퍼티에 대입되고 난 직후에 didSet 옵저버가 실행된다.
        
            ```swift
            var <프로퍼티 명> : <타입> [ = <초깃값> ] {
                    didset [ (<인자명> ) ] {
                            <프로퍼티 값이 변경되고 난 후에 실행할 내용>
                    }
            } //[]의 인자명은 생략해도 되고, 새로 할당된 값이 아닌 기존에 저장되어있던 값이 매개상수 형태로 전달됨. 생략되어있다면 oldValue라는 이름으로 전달.
            ```
        
    
            ```swift
            struct Job {
                    var income: Int = 0 {
                            willSet(newIncome) {
                                    print("이번 달 월급은 \(newIncome)원 입니다. ")
                            }
                            didSet {
                                    if income > oldValue {
                                            print("월급이 \(income - oldValue)원 증가했습니다.")
                                    } else {
                                            print("원급이 삭감되었습니다.")
                                    }
                            }
                    }
            }
            var myjob = Job(income: 1000000)
            myjob.income = 2000000
            /* 이번 달 월급은 2000000원 입니다.
                    월급이 1000000원 증가했습니다." */
            ```
    
            myjob 인스턴스의 income 프로퍼티를 변경 시켜줄 때 다음과 같은 흐름으로 실행된다.
    
            프로퍼티 값 변경 시작 → willSet구문 실행 → 프로퍼티 값 변경 → didSet구문 실행
    
    4. 타입 프로퍼티
    
        앞에서 공부한 저장 프로퍼티나 연산 프로퍼티는 클래스 또는 구조체 인스턴스를 생성한 후 이 인스턴스를 통해서만 참조할 수 있는 프로퍼티(인스턴스 프로퍼티)였다. 하지만 경우에 따라서는 인스턴스에 관련된 값이 아니라 클래스나 구조체, 또는 열거형과 같은 객체 자체에 관련된 값을 다루어야 할 때도 있는데, 이 때는 인스턴스를 생성하지 않고 클래스나 구조체 자체에 값을 저장하게 되고, 이를 타입 프로퍼티(Type Property)라고 한다.
        
        타입 프로퍼티는 클래스나 구조체 자체에 속하는 값이므로 인스턴스를 생성하지 않고 클래스나 구조체 자체에 저장하게 되고, 저장된 값은 모든 인스턴스가 공통으로 사용할 수 있다.
        
        타입 프로퍼티를 선언하기 위해서는 타입 프로퍼티로 사용할 프로퍼티 앞에 static 키워드만 추가해주면 된다.
        클래스의 경우, 타입 연산 프로퍼티로 class 라는 키워드를 추가할 수 있는데, 이는 하위 클래스에서 재정의할 수 있는 타입 프로퍼티이다.
