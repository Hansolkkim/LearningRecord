- Week2 Mon's Review

  - 다양한(남이 작성한) code를 많이 보는게 좋다. 작성만 많이 해서는 더 성장하기 어렵다.
  - Peer Session → 그 코드를 왜 그렇게 짜게 됐는지, 생각하게된 과정도 준비해보고, 물어보는게 좋다.
  - Github → 조금이라도 바뀌었으면 commit하면서 그 과정을 남겨놔라.
  - Code 간결하게 할 수 있는걸 생각해보자

  ```swift
  if max - row >= col {
  	rowArray.append(false)
  }
  // == 
  rowArray.append(max - row < col)
  ```

  - 함수의 이름은 함수의 기능을 *명확히*할 수 있는 문자로 지정( 동사 - 목적어 서순 )

- Week2 Tue Session

  - Foundation 프레임워크? - 모든 Apple 기기에서 사용되며 미리 만들어놓은 함수들의 집합

  - Library? - 미리 만들어 놓은 함수들의 집합

  - 프레임워크와 Library는 비슷한 맥락..

  - Enum (Enumerate 열거형)

    서로 관련이 있는(맥락이 같은) 값을 묶고싶다.

    1. struct로 묶기
    2. enum으로 묶기

  - 옵셔널 Optional ? - 선언한 변수나 상수에 값이 있을 수도 있고, 없을 수도 있다.

    nil : 값이 없는 상태

    ```swift
    var OptionalValue: Int? // ?: Boxing한다.(값이 있는지 없는지는 열어봐야 알 수 있음)
    ```

    1. Optional Binding

       val! → val이 nil일 경우 error발생 (code를 읽다가 !가 보인다 = 조심해야겠네)

       val! 보다는 Optional Binding을 권장함

       ```swift
       let possibleNum = "123"
       if let actualNum = Int(PossibleNum) {
       	print("사용 가능")
       } else {
       	print("사용 불가")
       }
       ```

    2. IUO(Implicitly Unwrapped Optionals) 명시적으로 unwrap된 Optional

       ```swift
       let assumedString: String! // 데이터타입! :얘는 값이 있을거야. 나중에 언젠가 setting이 될 거야
       ```

       ```swift
       let possibleString: String? = "An optional string"
       let forcedString: String = possibleString!
       
       let assumnedString: String! = "An implicitly unwrapped optional string"
       let implicitString: String = assumedString
       ```

- Code 짜다가 궁금했던 내용들

  1. CharacterSet : 입력 문자열에 포함되면 안되는 문자열이 있는지 검사할 때 사용됨.

     - 검색에 유용한 method(Combining Character Set)
       - 집합 관련 method로 두 개의 CharacterSet 간의 비교 가능 : union, subset, superset (isSubset, isSuperset)
     - insert(): CharacterSet요소 추가
     - String으로 초기화 가능 → String에 있는 모든 character를 요소로 한 CharacterSet Instance를 만들 수 있음

     ```swift
     let numberCharacteset: CharacterSet = CharacterSet(charactersIn:"0123456789") //String으로 초기화하기
     // ==
     let numberCharacterset: CharacterSet = CharacterSet.decimalDigits // 기본 제공되는 CharacterSet
     
     let letterCharacterset: CharacterSet = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
     // ==
     let letterCharacterset: CharacterSet = CharacterSet.alphanumerics
     ```