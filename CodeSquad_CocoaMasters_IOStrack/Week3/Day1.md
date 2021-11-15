- 미션하다가 모르는 것들

  ### 1. 프로젝트 이름 바꾸기

  생각보다 프로젝트 이름 바꾸는게 복잡했는데, [이 페이지](https://zeddios.tistory.com/286)를 보면서 따라했더니 잘 바뀌었다.

  ### 2. readLine() 다루기

  readLine() 으로 값 받아오는 건 할 때마다 헷갈리는 것 같다.

  먼저, 공백있는 숫자를 입력받아 String → [Int] 하는 방법은 다음과 같다.

  ```swift
  var numberArray = readLine()!.split(separator: " ").map{ Int($0)! }
  ```

  그리고 찾아보다 보니, 공백 없는 숫자의 자릿수를 모두 [Int]로 받아오는 방법도 있었다.

  ```swift
  var numberArray = Array(readLine()!).amp{ Int(String($0))! }
  ```

  이 때,  Int($0) 보다,  Int(String($0)) 이 속도가 더 빠르다고 한다.

  [참조사이트](https://thoonk.tistory.com/2)

  ### 3.진수 변환

  진수를 직접 변환할 수도 있고, String() 메소드의  radix 매개변수를 이용해 변환할 수도 있다.

  직접 진수 변환을 할 때는 나눌 수 없을 때까지 바꾸고 싶은 진수로 나누어주며 나머지를 저장하고, 저장된 나머지를 거꾸로 출력해주면 된다.

  ```swift
  var num = 33
  var numArray = [Int]()
  while (num != 0) {
  	numArray.appen(num%2)
  	num /= 2
  }
  print(numArray.reversed().map{String($0)}.reduce("", +)) //100001
  ```

  String() 메소드의 radix 매개변수를 이용하면 간단하게 진수 변환이 가능하다.

  ```swift
  var num = 33
  print(String(num, radix:2)) //100001
  ```

  그리고 2진수를 10진수로 진수 변환하기 위해서는 Int() 메소드의 radix 매개변수를 이용하면 된다.

  ```swift
  var binaryNum = "100001"
  print(Int(binaryNum, radix: 2)!)
  ```

  ### 4. Button 비활성화

  button을 Outlet으로 선언해준 다음, 조건을 if문으로 주고, 다음 코드를 추가하면 Button을 비활성화 시킬 수 있었다.

  ```swift
  if waitinNum >= 20 {
  	waitingButton.isEnable = false
  }
  ```

  reduce와 filter 등 고차함수에 대해서 더 공부해봐야겠다..

------

- 나머지 공부

  ### 1. Filter

  filter는 데이터를 추출하고자 할 때 사용한다. 기존 컨테이너에서 내부의 값을 걸러 새로운 컨테이너를 만든다. filter의 기본 형태는 다음과 같다.

  ```swift
  array.filter(isincluded: T throws -> T)
  ```

  T타입의 isIncluded를 받아 새로운 T형태의 컨테이너를 생성한다.

  ```swift
  let stringArray = ["가수", "대통령", "개발자", "선생님", "의사"]
  var threeCountArray = [String]()
  for st in stringArray {
  	if st.count == 3 {
  		threeCountArray.append(st)
  	}
  }
  print(threeCountArray) //["대통령", "개발자", "선생님"]
  ```

  for in 구문을 이용해서 만든 위 코드를 filter를 이용해 짧게 나타낼 수 있다.

  ```swift
  let stringArray = ["가수", "대통령", "개발자", "선생님", "의사"]
  var threeCountArray = stringArray.filter { $0.count == 3 }
  print(threeCountArray) //["대통령", "개발자", "선생님"]
  ```

  ### 2.reduce

  reduce는 데이터를 합쳐주기 위해서 사용한다. 기존 컨테이너에서 내부의 값들을 결합하여 새로운 값을 만든다.

  ```swift
  let numberArray = [1,2,3,4,5,6,7,8,9,10]
  var sum = 0
  for number in numberArray {
  	sum += number 
  }
  print(sum) //55
  ```

  ```swift
  let numberArray = [1,2,3,4,5,6,7,8,9,10]
  let sum = numberArray.reduce(0) { $0 + $1 }
  print(sum)
  ```