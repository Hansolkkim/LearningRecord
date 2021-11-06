## 연습문제 - 단위 변환 함수 만들기

### **미션1: inch를 cm로 바꾸는 함수**

함수명 : `convertToCM(fromInches : Float) -> Float`함수 내부에서 매개변수 fromInches 값을 cm 단위로 변환해서 return하세요.함수를 만들고 아래에서 다음과 값을 바꾸고 print 함수로 변환 결과를 출력하세요.

```swift
func convertToCM(fromInches : Float) -> Float {
    var result : Float = 0
    result = fromInches * 2.54
    return result
}
```

```swift
func convertToCM(fromInches : Float) -> Float {
    return fromInches * 2.54
}
```

### **미션2: cm를 inch로 바꾸는 함수**

함수명 : `convertToInches(fromCM : Float) -> Float`함수 내부에서 매개변수 fromCM 값을 inch 단위로 변환해서 return하세요.함수를 만들고 아래에서 다음과 값을 바꾸고 print 함수로 변환 결과를 출력하세요.

```swift
func convertToInches(fromCM : Float) -> Float {
    return fromCM / 2.54
}
```

### **미션3: m를 inch로 바꾸는 함수**

함수명 : `convertToInches(fromMeter : Float) -> Float`함수 내부에서 매개변수 fromMeter 값을 cm로 바꾸고inch 단위로 변환해서 return하세요.함수를 만들고 아래에서 다음과 값을 바꾸고 print 함수로 변환 결과를 출력하세요.

```swift
func convertToInches(fromMeter : Float) -> Float { 
    retur (fromMeter / 100) / 2.54
}
```

## 오늘 학습할 거리

- 다른 언어와 비교해서 스위프트 문법을 나름대로 정리해본다.
- Xcode Playground에서 원하는 형태로 함수를 선언하고 호출하는 코드를 연습한다.
- Swift 기본 타입 - Int, Float, Double, String, Boolean 에 대해서 학습하고 정리한다.

전에는 C와 Python을 주로 이용해 코딩을 배웠어서, Swift의 문법이 조금 어색했다. 먼저, 변수와 상수의 자료형을 선언해주는 방법이 달랐다. 기존에는 int x = 0 과 같이 선언을 했지만, Swift에서는 var x : int = 0 , let x : float = 0 과 같이 변수, 상수를 선언해줄 수 있었다.(type을 선언하지 않으면, 초기화된 값으로 swift가 알아서 type을 판단한다.) 그리고 var 😀 = 1 과 같이 유니코드로도 변수, 상수 이름을 설정해줄 수 있다.

그리고 범위 연산자가 달랐다. 기존에는 x < = y 과 같이 표현했지만, Swift에서는 범위 연산자를 ... , ..< 으로, x...y , x..<y 와 같이 표현할 수 있다.

추가미션을 수행하면서, 다른 언어보다 형변환이 조금 복잡하다는 것을 알게 됐다. StringValue를 FloatValue로 형변환하기 위해서는 FloatValue = (StringValue as NSString).floatValue로, FloatValue를 StringValue로 형변환하기 위해서는 StringValue = String(describing: floatValue)로 변환할 수 있었다.

그리고, String의 특정 자릿수(index)의 Charater를 읽어오는게 조금 복잡했던거 같다.                                  str[str.index(str.startIndex, offsetBy: 2)]와 같은 방식으로 특정 index에 위치한 Character를 불러와 사용할 수 있었다.

### 추가미션

- 문자열에서 값 뒤에 붙어있는 단위와 그 이후에 변환할 단위를 붙이면 해당하는 변환 함수를 호출해서 변환하도록 구현한다.
  - 예를 들어 "18cm inch"라고 입력하면 센티미터를 인치로 바꾸는 함수를 호출한다.
  - "25.4inch m"라고 입력하면 인치를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 미터로 바꾸는 함수를 호출한다.
  - "0.5m inch"라고 입력하면 미터를 센티미터로 바꾸는 함수를 호출하고, 다시 센티미터 단위를 인치로 바꾸는 함수를 호출한다.
  - "183cm"처럼 숫자 다음에 cm만 붙어있으면 센티미터 값을 미터로 변환하고 출력한다.
  - "3.14m"처럼 숫자 다음에 m가 붙어있으면 미터 값을 센티미터로 변환하고 출력한다.
  - "2.54inch"처럼 숫자 다음에 inch만 붙어있으면 센티미터 값으로 변환하고 출력한다.

→연습문제에서 만들었던 함수들을 이용해서 추가미션을 수행하려고 했다.

```swift
import Foundation

func convertToCM(fromInches : Float) -> Float { //inch - > cm converter function
    var result : Float = 0
    result = fromInches * 2.54
    return result
}

func convertToInches(fromCM : Float) -> Float { //cm -> inch converter function
    var result : Float = 0
    result = fromCM / 2.54
    return result
}

func convertToInches(fromMeter : Float) -> Float { //meter -> inch converter function
    var result : Float = 0
    result = (fromMeter / 100) / 2.54
    return result
}

var str = readLine()! //사용자 키보드로 입력받는 함수
var cnt = str.count
for x in 0...cnt{
    if str[str.index(str.startIndex, offsetBy: x)] == "i"
    {
        if (x + 5) < cnt //뒤에 변환할 단위가 주어진다면
        {
            if str[str.index(str.startIndex, offsetBy: x + 5)] == "c"
            {
                print(String(describing: (convertToCM(fromInches: (str as NSString).floatValue))) + "cm")
                break
                
            }else if str[str.index(str.startIndex, offsetBy: x + 5)] == "m"
            {
                print(String(describing: (convertToCM(fromInches: (str as NSString).floatValue) / 100)) + "m")
                break
            }else if str[str.index(str.startIndex, offsetBy: x + 5)] == "i"
            {
                print(String(describing: ((str as NSString).floatValue)) + "inch")
                break
            }
        }else //뒤에 변환할 단위가 주어지지 않는다면
        {
            print(String(describing: (convertToCM(fromInches: (str as NSString).floatValue))) + "cm")
            break
        }
    }else if str[str.index(str.startIndex, offsetBy: x)] == "c"
    {
        if (x + 3) < cnt //뒤에 변환할 단위가 주어진다면
        {
            if str[str.index(str.startIndex, offsetBy: x + 3)] == "m"
            {
                print(String(describing: ((str as NSString).floatValue / 100)) + "m")
                break
                
            }else if str[str.index(str.startIndex, offsetBy: x + 3)] == "i"
            {
                print(String(describing: (convertToInches(fromCM: (str as NSString).floatValue))) + "inch")
                break
            }else if str[str.index(str.startIndex, offsetBy: x + 3)] == "c"
            {
                print(String(describing: ((str as NSString).floatValue)) + "cm")
                break
            }
        }else //뒤에 변환할 단위가 주어지지 않는다면
        {
            print(String(describing: ((str as NSString).floatValue / 100)) + "m")
            break
        }
    }else if str[str.index(str.startIndex, offsetBy: x)] == "m"
    {
        if (x + 2) < cnt //뒤에 변환할 단위가 주어진다면
        {
            if str[str.index(str.startIndex, offsetBy: x + 2)] == "c"
            {
                print(String(describing: ((str as NSString).floatValue * 100)) + "cm")
                break
                
            }else if str[str.index(str.startIndex, offsetBy: x + 2)] == "i"
            {
                print(String(describing: (convertToInches(fromCM: (str as NSString).floatValue * 100))) + "inch")
                break
            }else if str[str.index(str.startIndex, offsetBy: x + 2)] == "m"
            {
                print(String(describing: ((str as NSString).floatValue)) + "m")
                break
            }
        }else //뒤에 변환할 단위가 주어지지 않는다면
        {
            print(String(describing: ((str as NSString).floatValue * 100)) + "cm")
            break
        }
    }
}
```

```swift
import Foundation

func convertToCM(fromInches : Float) -> Float { //inch - > cm converter function
    var result : Float = 0
    result = fromInches * 2.54
    return result
}

func convertToInches(fromCM : Float) -> Float { //cm -> inch converter function
    var result : Float = 0
    result = fromCM / 2.54
    return result
}

func convertToInches(fromMeter : Float) -> Float { //meter -> inch converter function
    var result : Float = 0
    result = (fromMeter / 100) / 2.54
    return result
}

var str = readLine()! //사용자 키보드로 입력받는 함수
var cnt = str.count
var cntblank = 0
if str.contains(" ")
{
    cntblank = cntblank + 1
}
if cntblank == 0
{
    if str.contains("cm")
    {
        print(String(describing: ((str as NSString).floatValue / 100)) + "m")
    }else if str.contains("inch")
    {
        print(String(describing: (convertToCM(fromInches: (str as NSString).floatValue))) + "cm")
    }else if (str.contains("m")) && !(str.contains("c"))
    {
        print(String(describing: ((str as NSString).floatValue * 100)) +  "cm")
    }
}else
{
    let devidedStr = str.split(separator: " ")
    var target : String = ""
    let characterSet = "abcdefghijklmnopqrstuvwxyz"
    for char in devidedStr[0]
    {
        if characterSet.contains(char)
        {
            target.append(char)
        }
    }
    switch (target, devidedStr[1])
    {
    case("cm", "inch") :
        print(String(describing: (convertToInches(fromCM: (str as NSString).floatValue))) + "inch")
    case("m", "inch") :
        print(String(describing: (convertToInches(fromCM: (str as NSString).floatValue * 100))) + "inch")
    case("inch", "cm") :
        print(String(describing: (convertToCM(fromInches: (str as NSString).floatValue))) + "cm")
    case("inch", "m") :
        print(String(describing: (convertToCM(fromInches: (str as NSString).floatValue) / 100)) + "m")
    case("cm", "m") :
        print(String(describing: ((str as NSString).floatValue / 100)) + "m")
    case("m", "cm") :
        print(String(describing: ((str as NSString).floatValue * 100)) + "cm")
    default:
        print("Error")
    }
```

먼저, 뒷쪽에 변환할 단위가 주어지는 경우와 안주어지는 경우로 나누었다. 입력받은 문자열에 " "(띄워쓰기)가 있다면 변환 단위가 주어진 경우고, 없다면 안주어진 경우이므로, 띄워쓰기 유무에 따라 두 경우로 나누었다.

 변환할 단위가 안주어진 경우, (str as NSString).floatValue 를 이용해 입력받은 값의 float부분을 분리해냈고, str.contains()함수를 이용해 cm는 m로, inch는 cm로, m는 cm로 각각 바꾸어주어주는 함수의 매개변수에 (str as NSString).floatValue를 입력했다. 그리고 그 값을 String(describing: 매개변수) 함수의 매개변수에 입력한 후 각 단위를 더해 출력했다.

 변환할 단위가 주어진 경우, str.split(separator: " ")함수를 이용해 변환할 단위와 그 앞부분을 분리했다. 앞부분의 단위는, 먼저 모든 소문자 알파벳을 가지는 characterSet 문자열을 선언하여, 앞부분의 문자열에 위치한 소문자 알파벳을 찾아내 이 값을 target이라는 문자열 변수에 입력하여 원래의 단위를 저장했다. 그 후에 switch 문을 활용하여, target(원래 단위)과 devidedStr[1](변환할 단위)에 따라 case를 나누어, 각각의 값을 위에서 선언한 단위를 변환하는 함수에 입력해 원하는 결과를 출력했다.