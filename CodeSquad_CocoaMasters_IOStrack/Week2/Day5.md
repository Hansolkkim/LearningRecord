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