## 알고리즘 문제

### 알고리즘 문제 풀기

- 자신의 GitHub에 `Friday-algorithm` 저장소를 생성한다.
- Xcode에서 Command Line Tool 프로젝트 템플릿으로 프로젝트를 저장소 디렉토리 아래에 생성한다.
- 소스트리에서 프로젝트 생성에서 만들어진 파일들을 추가해서 커밋하고 푸시해서 리모트에 반영한다.
- main.swift 파일 이외에 문제별로 다른 파일(`p1000.swift`, `p1008.swift`)을 추가하고, 필요한 함수를 구현하고 main에서 호출하는 방식을 권장한다.
- 문제를 해결할 때마다 커밋하고 푸시한다.

### 문제

- **백준 1000번**

  #### 문제1

  ```
  두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
  ```

  #### 입력

  ```
  첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)
  ```

  #### 출력

  ```
  첫째 줄에 A+B를 출력한다.
  ```

  https://www.acmicpc.net/problem/1000

  - 코드

    ```swift
    import Foundation
    
    func plusTwoThings() {
        let input: String? = readLine() //키보드로 입력되는 String이 Optional 이기 때문에 input 상수의 데이터타입을 String?으로 지정
    		//문제 조건에 값이 2개만 입력된다 돼있으므로 이렇게 if문을 작성했음(필요없는듯)
        if (input?.count == 3) || (input?.count == 4) {
            
            let A = Int(input?.split(separator: " ")[0] ?? "0")!, B = Int((input?.split(separator: " ")[1] ?? "0")!)
            //띄워쓰기를 기준으로 input을 두 변수(A,B)에 지정
            print( A + B! ) //A, B값이 Optional 이기 때문에 A+B!로 print
            
        }else {
            
            print("Error")
            
        }
    }
    ```

    Optional에 대해서 공부해야 겠다고 생각했다. 그리고 이 문제를 풀 때는 map에 대해서 몰랐기 때문에 split 메서드만 이용해 입력된 값을 띄워쓰기를 기준으로 2개로 나눠줬는데, 다른 수강생([dale](https://github.com/sungju-kim/algorithmSolving/blob/main/p1000.swift))의 코드를 보니 map을 이용했다는 것을 알게 됐고, A와 B를 선언해주는 부분을 아래와 같이 바꿀 수 있다는 것을 알게 됐다.

    ```swift
    let arr = readLine()!.components(separatedBy: " ").map{Int($0)!}
    print(arr[0] + arr[1])
    ```

  ------

- **백준 1008번**

  #### 문제2

  ```
  두 정수 A와 B를 입력받은 다음, A/B를 출력하는 프로그램을 작성하시오.
  ```

  #### 입력

  ```
  첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)
  ```

  #### 출력

  ```
  첫째 줄에 A/B를 출력한다. 실제 정답과 출력값의 절대오차 또는 상대오차가 10-9 이하이면 정답이다.
  ```

  https://www.acmicpc.net/problem/1008

  - 코드

    ```swift
    import Foundation
    
    func divideTwoThings() {
        
        let input: String? = readLine()
    
        if (input?.count == 3) || (input?.count == 4) {
            
            let A = Double(input?.split(separator: " ")[0] ?? "0")!, B = Double((input?.split(separator: " ")[1] ?? "0")!)
            print(A / B!)
            
        }else {
            
            print("Error")
            
        }
    }
    ```

    1000번 문제와 같은 방식으로 풀었다.

  ------

- **백준 2438번**

  #### 문제3

  ```
  첫째 줄에는 별 1개, 둘째 줄에는 별 2개, N번째 줄에는 별 N개를 찍는 문제
  ```

  #### 입력

  ```
  첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.
  ```

  #### 출력

  ```
  첫째 줄부터 N번째 줄까지 차례대로 별을 출력한다.
  ```

  https://www.acmicpc.net/problem/2438

  - 코드

    ```swift
    import Foundation
    
    func drawStars() {
        
        let starCount = Int(readLine()!) //입력되는 값이 Optional 하기 때문에 readLine()!을 Int메서드에 대입
        var starString: String = ""
        
        for _ in 1...starCount!{
            
            starString += "*"
            print(starString)
        
        }
    }
    ```

    이번 문제에서는 위의 문제들과 달리 하나의 정수만 입력된다고 했기 때문에 Int(readLine()!)을 이용해 문제를 풀었다. 그저께 풀어본 print 방식과는 다르게, String에 "*"을 하나씩 입력하여 print하는 방식을 사용해봤다.

  ------

- **백준 2920번**

  #### 문제4

  ```
  다장조는 c d e f g a b C, 총 8개 음으로 이루어져있다. 이 문제에서 8개 음은 다음과 같이 숫자로 바꾸어 표현한다. c는 1로, d는 2로, ..., C를 8로 바꾼다.
  1부터 8까지 차례대로 연주한다면 ascending, 8부터 1까지 차례대로 연주한다면 descending, 둘 다 아니라면 mixed 이다.
  연주한 순서가 주어졌을 때, 이것이 ascending인지, descending인지, 아니면 mixed인지 판별하는 프로그램을 작성하시오.
  ```

  #### 입력

  ```
  첫째 줄에 8개 숫자가 주어진다. 이 숫자는 문제 설명에서 설명한 음이며, 1부터 8까지 숫자가 한 번씩 등장한다.
  ```

  #### 출력

  ```
  첫째 줄에 ascending, descending, mixed 중 하나를 출력한다.
  ```

  https://www.acmicpc.net/problem/2920

  - 코드

    ```swift
    import Foundation
    
    func scaleNotation() {
        
        let input: String = readLine() ?? "" //키보드로 입력되는 값이 Optional 하기 때문에, 입력 값이 없을 경우 ""를 input에 대입
        //입력된 input을 띄워쓰기를 기준으로 나누고, 나눈 값(String)을 Int로 변환 후 배열로 만들어 inputArray에 입력
        let inputArray = input.components(separatedBy: " ").map{ (value:String) -> Int in return Int(value)! }
        
        if inputArray == inputArray.sorted() { //inputArray의 원소가 sorted된 상태와 일치하면 (문제의 조건에 1~8의 숫자만 사용한다하여 이와 같은 조건 사용)
            print("ascending")
        }else if inputArray == inputArray.sorted(by: >) { //inputArray의 원소가 역방향 sorted된 상태라면
            print("dscending")
        }else {
            print("mixed")
        }
    }
    ```

    위 문제들과 다른 방식으로 readLine()의 Optional을 처리해봤다. 차이점은 모르겠으니 공부해야겠다. 그리고 inputArray를 만들기 위해 map을 이용했는데, 아직 어떻게 처리되는지 이해 못 했다.

    (sort와 sorted의 차이점은, sort는 기존 함수를 변형시키지만 sorted는 변형시키지 않는다는 점이다.)

  ------

- **백준 8958번**

  #### 문제5

  ```
  "OOXXOXXOOO"와 같은 OX퀴즈의 결과가 있다. O는 문제를 맞은 것이고, X는 문제를 틀린 것이다. 문제를 맞은 경우 그 문제의 점수는 그 문제까지 연속된 O의 개수가 된다. 예를 들어, 10번 문제의 점수는 3이 된다.
  "OOXXOXXOOO"의 점수는 1+2+0+0+1+0+0+1+2+3 = 10점이다.
  OX퀴즈의 결과가 주어졌을 때, 점수를 구하는 프로그램을 작성하시오.
  ```

  #### 입력

  ```
  첫째 줄에 테스트 케이스의 개수가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있고, 길이가 0보다 크고 80보다 작은 문자열이 주어진다. 문자열은 O와 X만으로 이루어져 있다.
  ```

  #### 출력

  ```
  각 테스트 케이스마다 점수를 출력한다.
  ```

  https://www.acmicpc.net/problem/8958

  - 코드

    ```swift
    import Foundation
    
    func quizOX() {
        //입력된 값을 Int로 변환
        let howManyTimes = Int(readLine()!)!
        
        for _ in 1...howManyTimes{ //첫 줄에 입력된 값인 howManyTimes 변수의 크기만큼 반복
            let quizResult: String = readLine()!
            var countContinuos: Int = 0, totalScore: Int = 0 //countContinuos변수에 "O"가 연속된 횟수를 저장, totalScore에 총점수를 저장
            for i in 0..<quizResult.count-1 { //마지막 index의 원소는 index+1에 값이 없으므로 0...quizResult.count-2까지만 반복
                let myAnswer = quizResult[quizResult.index(startIndex, offsetBy: i)]
    						let nextAnswer = quizResult[quizResult.index(startIndex, offsetBy: i+1)]
                
                if myAnswer == "O"{ //현재 "O"라면
                    countContinuos += 1
                    totalScore += countContinuos
                    
                    if nextAnswer == "X"{
                        countContinuos = 0
                    }
                }
            }
            if quizResult[quizResult.index(before: quizResult.endIndex)] == "O" { //마지막 index의 원소에 따라 총점에 추가하기 위한 조건문
                countContinuos += 1
                totalScore += countContinuos
            }
            print(totalScore)
        }
    }
    ```

    처음에는 이렇게 myAnswer과 nextAnswer을 비교해주는 if문이 있었는데, 생각해보니 countContinuos 변수와 동작이 겹친다는 것을 알게 됐다. 그래서 다음과 같이 코드를 수정했다.

    ```swift
    import Foundation
    
    func quizOX() {
        //입력된 값을 Int로 변환
        let howManyTimes = Int(readLine()!)!
        
        for _ in 1...howManyTimes{ //첫 줄에 입력된 값인 howManyTimes 변수의 크기만큼 반복
            let quizResult: String = readLine()!
            var countContinuos: Int = 0, totalScore: Int = 0 //countContinuos변수에 "O"가 연속된 횟수를 저장, totalScore에 총점수를 저장
            for i in quizResult {
                
                if i == "O"{
                    countContinuos += 1
                    totalScore += countContinuos
                }else {
                    countContinuos = 0
                }
                
            }
            
            print(totalScore)
        }
    }
    ```

    그리고 howManyTimes 변수를 readLine으로 읽어오기 위해 위 문제와 같은 방법으로 map을 이용했는데, 한자리 정수라면 위와 같이 변형해도 된다고 생각해 수정했다.

  ------

- **백준 11654번**

  #### 문제6

  ```
  알파벳 소문자, 대문자, 숫자 0-9중 하나가 주어졌을 때, 주어진 글자의 아스키 코드값을 출력하는 프로그램을 작성하시오.
  ```

  #### 입력

  ```
  알파벳 소문자, 대문자, 숫자 0-9 중 하나가 첫째 줄에 주어진다.
  ```

  #### 출력

  ```
  입력으로 주어진 글자의 아스키 코드 값을 출력한다.
  ```

  https://www.acmicpc.net/problem/11654

  - 코드

    ```swift
    import Foundation
    
    func printASCII() {
        let inputChar = Character(readLine()!)
        let valueASCII = inputChar.asciiValue! //Character를 해당 ASCII code로 변환해주는 메서드
        print(valueASCII)
    }
    ```

    아스키코드로 변환해주는 메서드를 사용했다. 아래와 같이 더 간단하게 줄일 수도 있다.

    ```swift
    func printASCII() {
    		print(Character(readLine()!).asciiValue!)
    }
    ```

## 문제 풀다가 궁금했던 점 공부

## 1. Optional

Optional은 보통의 Int나 String처럼 값(value)을 나타낼 뿐만이 아니라, 값(value)이 없음을 나타낼 수도 있는 데이터 타입이다.

그리고 Optional 값을 이용하기 위해서는 Optional을 풀어낼(unwrapped) 필요가 있다.

- Implicitly Unwrapped Optional

  ```swift
  var optionalVal: String? = "Sol"
  
  var unwrappedVal = optionalVal!
  print("The value is \\(unwrappedVal)")
  ```

  위와 같이 optionalVal 변수 마지막에 느낌표(!)가 컴파일러에게 Optional안의 값을 강제로 풀어달라고 한다. 하지만, 만약 Optional의 값이 nil이면 runtime error가 발생한다.

  안전하게 Optional을 풀기 위해서 다음과 같이 if문을 사용할 수 있다.

  ```swift
  if optionalVal != nil {
  		var unwrappedVal = optionalVal!
  		print("The value is \\(unwrappedVal)")
  } else {
  		print("The value is \\(optionalVal)")
  }
  ```

- Optional Binding (If let Binding)

  ```swift
  if let unwrappedVal = optionalVal {
  		print("The value is \\(unwrappedVal)")
  } else {
  	print("The value is \\(optionalVal)")
  }
  ```

  (느낌표가 사라져있음) 만약 optionalVal 변수에 값이 있다면 unwrappedVal 변수는 Optional을 풀어낼 값을 가지게 된다. OptionalVal 변수가 nil이라면 else 구문이 실행되고 unwrappedVal 변수는 아예 존재하지도 않게 된다.

  ```swift
  var optionalName: String? = "한솔"
  var optionalEmail: String? = "hskim6521@naver.com"
  
  if let name = optionalName, email = optionalEmail {
  
  } else {
  
  }
  ```

  위와 같이 두 Optional에 대해서 if let 을 사용하면, 모든 Optional 값이 존재해야 if문 안으로 진입한다.

- Optional Chaining

  ```swift
  let array: [String]? = []
  var isEmptyArray = false
  
  if let array = array, array.isEmpty {
  	isEmptyArray = true
  } else {
  	isEmptyArray = false
  }
  
  isEmptyArray
  ```

  옵셔널로 선언된 어느 배열이 '빈 배열'인지 검사하려면 위와 같이 확인할 수 있다.

  이를 옵셔널 체이닝을 사용해 간결하게 쓸 수 있다.

  ```swift
  let isEmptyArray = array?.isEmpty == true
  ```

  위처럼, 옵셔널 바인딩 과정을  ? 키워드로 줄여줄 수 있는데, 나올 수 있는 값이 3가지 경우의 수가 있다.

  1. array 가  nil 인 경우

     ```swift
     array?.isEmpty
     ~~~~~~
     까지 실행되고 'nil'을 반환
     ```

  2. array 가 빈 배열인 경우

     ```swift
     array?.isEmpty
     ~~~~~~~~~~~~~~
     까지 실행되고 'true'를 반환
     ```

  3. array 에 요소가 있는 경우

     ```swift
     array?.isEmpty
     ~~~~~~~~~~~~~~
     까지 실행되고 'false'를 반환
     ```

- Nil 합치기(nil Coalescing)

  ```swift
  var optionalInt: Int? = 22
  var value = optionalInt ?? 0
  ```

  Nil 합치기는 위 코드의 ??를 의미한다. 만약 optionalInt가 nil이면 0, 값이 있다면 그 값을 value에 넘겨주게 된다.

## 2. Closure

클로저는 중괄호로 감싸진 '실행 가능한 코드 블럭'을 의미한다. func 키워드와 함께 이름이 없는 함수이기도 하므로 "익명함수"라고 부르기도 한다.

아래처럼 함수 이름 정의가 따로 존재하지 않는다. 하지만 파라미터를 받을 수 있고, 반환 값이 존재할 수 있다는 점에서 함수와 동일하다. 함수처럼 파라미터를 괄호로 싸서 정의하고,  → 를 사용해서 반환 타입을 명시한다. 조금 다른 점은  in 키워드를 사용해, 파라미터, 반환 타입 영역과 실제 클로저의 코드를 분리하고 있다.

```swift
let names: [String] = ["hana", "eric", "yagom", "sol"]

let reversed: [String]

reversed = names.sorted(by: { (left: String, right: String) -> Bool in
	return left > right })

print(reversed)
```

이제 이 클로저를 여러 가지 단계로 축약하겠다.

- 후행 클로저

  어떤 함수나 메서드의 맨 마지막으로 클로저를 받아오면 중첩되는 괄호를 생략해서 아래 예제의 후행 클로저와 같은 모습으로 바뀌게 된다. 또한, 메소드의 소괄호까지도 생략할 수 있다.

```swift
// 후행 클로저(Trailing Closure) 사용
let reversed: [String] = names.sorted() { (left: String, right: String) -> Bool in
	return left > right
}

// sorted(by:) 메서드의 소괄호까지 생략 가능
let reversed: [String] = names. sorted { (left: String, right: String) -> Bool in
	return left > right
}
```

- 매개 변수 타입과 반환 타입 생략 가능

  클로저의 매개 변수 타입과 반환 타입을 생략해서 표현할 수 있다. sorted라는 메서드에서 타입을 알고 있기 때문이다.(Swift의 타입 추론)

```swift
// 클로저의 매개 변수 타입과 반환 타입을 생략
let reserved: [String] = names.sorted { (left,right) in
	return left > right
}
```

- return 키워드 생략 및 축약된 전달 인자 이름 사용 가능

  앞서  left ,  right 로 지정했던 매개 변수 이름도 생략하고 단축 인자를 사용할 수 있다. 내부에 한 줄만 있다면  return 키워드 없이도 반환 타입이 된다.

```swift
// 단축 인자 이름 사용
let reversed: [String] = names.sorted {
	return $0 > $1
}

// 암시적 반환 표현 사용
let reversed: [String] = names.sorted { $0 > $1 }
```

## 3. Map

map은 컬렉션 내부의 기존 데이터를 변형해서 새로운 컬렉션을 생성하는 함수다. 내부의 자료에 변형을 가하기 위해 함수의 각 요소에 함수를 적용해서 새로운 컬렉션을 만들어준다. 잘 사용하면 for문을 사용하지 않고도 작업할 수 있다.

```swift
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\\(number)")
}

print(doubledNumbers)
print(strings)
```

위와 같은 로직으로 map을 적용해보면 아래와 같다. map을 사용하면 number라는 배열에 map을 통해 함수를 적용해서 요소 하나하나에 변형을 가해줘서 기존 요새에 2배를 한 새로운 배열이 만들어진다.

```swift
// map 메서드 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})
strings = numbers.map({ (number: Int) -> String in
    return "\\(number)"
})
```

클로저에서 말한 생략 기법을 사용하면 좀 더 가독성이 높아진다.

```swift
// 매개변수, 반환 타입, 반환 키워드(return) 생략
// 후행 클로저
doubledNumber = numbers.map { $0 * 2 }
strings = number.map { "\\($0)" }
```

(참조 : https://academy.realm.io/kr/posts/closure-and-higher-order-functions-of-swift/)