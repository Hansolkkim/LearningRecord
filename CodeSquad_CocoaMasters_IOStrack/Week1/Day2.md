## **학습 목표**

- 기본 데이터 타입과 복잡한 데이터 구조 이해하기
- 프로그램 실행 흐름 제어하기
- Xcode 디버깅 환경 경험하기

### Operator&(연산자)

1. = , - , * , / , & , || , ??

   - 대입연산자 =

     수학에서의 "=" 등호와 헷갈린다. 프로그래밍에서는, left Value에 right Value를 대입한다는 의미로 해석하면 된다.

     ```swift
     intValue1 = 5
     intValue2 = 10
     ```

   - 덧셈(+), 뺄셈(-) 연산자

   - 곱하기(*), 나누기(/) 연산자

   - 나머지(%) 연산자

     배수인지를 확인할 때 사용하는 연산자다. 만약 intValue1가 3의 배수라면 0이, 아니라면 0이 아닌 값이 결과로 나올 것이다.

     ```swift
     result = intValue1 % 3 // 2
     result = intValue1 % 5 // 0 ->5의 배수임
     ```

   - 계산하는 대입 연산자

     ```swift
     intValue += 5 //intValue = 10
     intValue = 5 + intValue //위와 같은 의미
     ```

2. 단항 연산자

   - - , -

   - !

     Bool 타입에 대해 결과값이 반대로 됨

     ```swift
     val flag = true
     let unflag = !flag // False
     let toggled = flag.toggle() //False
     //요즘은 toggle()을 더 많이 사용함(더 명확하게 표시 가능) 
     ```

3. 연산자 계산 순서

   대부분의 계산은 왼쪽에서 오른쪽으로 진행됨

   ```swift
   1+2*3
   (1+2)*3
   ```

   [Untitled](https://www.notion.so/96e074d2feeb4d4b957ae6afe27ddbd0)

4. 비교 연산자

   [Untitled](https://www.notion.so/a571c3d0c7054cb6b14b7822a02ad8ed)

5. 논리 연산자

   - && : AND - 둘 다 참일 때 참
   - || : OR - 둘 중 하나라도 참일 때 참

6. 삼항 연산자

   > 변수 = (boolean조건식) ? 참 일 때 값 : 거짓 일 때 값

   doBlindDateFlag = (point≥80) ? true일 때 값 : false일 때 값

### 복잡한 데이터 구조

1. 배열(Array)

   -동일한 데이터 타입을 연속해서 담아놓고 순서대로 접근하는 콜렉션

   ```swift
   var ageArray = [10, 20, 30, 40, 50]
   print(ageArray[0]) //이렇게 Index로 각 원소에 접근 가능
   ```

2. 사전(Dictionary)

   -동일한 데이터 타입을 키 값과 함께 담아놓고, 키 값으로 접근하는 콜렉션

   ```swift
   var gradeDic = ["a" : 90 , "b" : 80 , "c" : 70]
   print(gradeDic["a"] ?? 0) //여기서 ??는 입력된 키 값이 없는 키 값일 경우를 대비해 사용하는 Optional연산자
   //print(gradeDic["f"] ?? 0) 이라면 "f"키는 없으므로 0이 출력됨
   ```

3. 집합(Set)

   -동일한 데이터 타입을 순서없이 담아놓고 포함되어 있는지 확인하는 콜렉션

   ```swift
   var aSet: Set = [11, 12, 13]
   aSet.contains(12)
   //이 때, contains가 set에서는 array보다 더 빨리 동작함(복잡도 낮)
   ```

4. Tuples

   -여러 값을 한꺼번에 묶어서 사용하는 타입

   ```swift
   let http404Error = (404, "Not found")
   let (StatusCode, StatusMessage) = http404Error
   ```

5. Struct

   - 값을 저장하기 위한 [Property](https://the-brain-of-sic2.tistory.com/6?category=779576) 선언

     -구조체 등 내의 변수, 상수는 많은 역할을 할 수 있고, 여러 특성이 있기 때문에 Property라 따로 명명

     Stored Property, Computed Property, Type Property등이 있음

     상수 구조체 인스턴스일 경우, 저장 property는 변경 불가능하다. 구조체 인스턴스가 상수로 정의됐다면, 그 인스턴스의 모든 property들도 상수로 정의되는 것이다. *(상수 클래스 인스턴스의 경우, 저장 property를 변경할 수 있음. 참조 타입의 클래스 인스턴스가 상수로 정의되었어도, 인스턴스에 저장된 값은 '참조 정보'일 뿐이므로, 그 참조정보에 접근해서 property를 변경해도 참조정보가 변경되는 것은 아니기 때문.)*

     ```swift
     struct Fixed_struct { // 상수구조체
         var firstValue: Int
         let length: Int
     }
      
     class Fixed_class { // 클래스
         var firstValue: Int
         let length: Int
     }
      
      
     let Items_struct = Fixed_struct(firstValue: 0, length: 4) 
     // this range represents integer values 0, 1, 2, and 3
     // Fixed_struct 의 값을 복사한 새로운 인스턴스를  상수 let Items_struct 에 저장한 것.
     rangeOfFourItems_struct.firstValue = 6
     // rangeOfFourItems_struct 는 상수이므로 해당 인스턴스 정보를 변경할 수 없다. 에러!
      
     let Items_class = Fixed_class(firstValue: 0, length: 4) 
     rangeOfFourItems_class.firstValue = 6
     // Items_ class 는 참조정보만 저장하고 있기 때문에 let 가능
     ```

   - 기능을 제공하기 위한 Method 선언

   - [서브스크립트](https://the-brain-of-sic2.tistory.com/37)로 접근할 수 있는 문법 지원

   - 초기 상태를 위한 초기화 메서드 제공

   ```swift
   struct Resolution {
   		var width = 0
   		var height = 0
   }
   
   let someResolution = Resolution()
   ```

   새로운 데이터 타입을 만든다고 생각하면 된다.

   

   ### 프로그램 흐름 제어하기

   1. if문 (조건문)

      ```swift
      var temperature = 15
      if temperature > 15 {
      		print("아우 추워. 겉옷을 챙기세요.")
      }
      
      temperature = 40
      if temperature > 30 {
      		print("더운 날씨에요. 티셔츠만 입어도 될꺼에요.")
      } else {
      		print("쌀쌀할 수 있어요.")
      }
      //더운 날씨에요. 티셔츠만 입어도 될꺼에요. 가 출력됨
      ```

      연습문제

      -일정 point를 넘기면 학점 "A", "B", "C", "D", "F"를 리턴하세요.

      ```swift
      func whatIsGrade(point : Int) -> Character {
          if point >= 90 { //90점 이상
              return "A"
          }else if point >= 80{ //90점 미만 80점 이상
              return "B"
          }else if point >= 70{ //80점 미만 70점 이상
              return "C"
          }else if point >= 60{ // 70점 미만 60점 이상
              return "D"
          }else {               // 60점 미만
              return "F"
          }
      }
      ```

   2. switch-case문 (조건비교문)

      ```swift
      let somePoint = (1, 1)
      switch somePoint {
      case (0, 0):
          print("(0, 0) is at the origin")
      case (_, 0):
          print("(\\(somePoint.0), 0) is on the x-axis")
      case (0, _):
          print("(0, \\(somePoint.1)) is on the y-axis")
      case (-2...2, -2...2):
          print("(\\(somePoint.0), \\(somePoint.1)) is inside the box")
      default:
          print("(\\(somePoint.0), \\(somePoint.1)) is outside of the box")
      }
      // Prints "(1, 1) is inside the box"
      ```

      위와 같이, 어떤 위치에 _를 넣어, 그 부분은 신경쓰지 않는 case를 만들 수도 있다.

   3. for문 (반복문)

      연습문제

      -구구단 함수를 반복문으로 활용해서 만들기

      ```swift
      func gugu(dan : Int) {
      //dan 값에 1 ~ 9까지 곱해서 출력하기
      		print("----\\(dan)단---")
      		for i in 1...9 {
      				print("\\(dan) * \\(i) = \\(dan * i) ")
      		}
      }
      
      func makeAll() {
      // gugu() 함수를 1 ~ 9단까지 호출
      		for i in 1...9{
      				gugu(dan: i)
      		}
      }
      
      func makeGugu(maxDan : Int) {
      // 1단부터 maxDan까지 값이 1 ~ 9까지 곱해서 출력하기
      		for Dan in 1...maxDan {
      				print("----\\(Dan)단---")
      				for i in 1...9 {
      						print("\\(Dan) * \\(i) = \\(Dan * i) ")
      				}
      		}
      }
      ```

   4. while문 (반복문)

      -복잡한 조건을 만족할 떄까지 반복하는 반복문

      ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9c71f819-7dcb-4d83-9cd5-54388f4024e9/Untitled.png)

      ```swift
      let finalSquare = 25
      var board = [Int](repeating: 0, count: finalSquare + 1)
      
      board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
      board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
      
      var square = 0
      var diceRoll = 0
      while square < finalSquare {
          // roll the dice
          diceRoll += 1
          if diceRoll == 7 { diceRoll = 1 }
          // move by the rolled amount
          square += diceRoll
          if square < board.count {
              // if we're still on the board, move up or down for a snake or a ladder
              square += board[square]
          }
      }
      print("Game over!")
      ```

## 연습문제

### **연습문제1**

#### **미션1. Rectangle**

- Playground로 Rectangle struct를 만들어보세요.
- Int 형 leftTopX, leftTopY 변수를 추가하세요.
- Int 형 rightBottomX, rightBottomY 변수를 추가하세요.
- 4개의 꼭지점을 출력하는 printRect() 메서드를 선언하세요.

#### **미션2. 호출하기**

- 아래에서 Rectangle struct를 rect 변수로 선언하고
- 기본 제공하는 leftTopX, leftTopY, rightBottomX, rightBottomY 모두 초기화하는 메서드로 값을 지정하세요.
- printRect() 메서드를 호출해서 꼭지점 좌표를 출력하세요.

#### **미션3. printArea()**

- 사각형의 면적을 계산해서 출력하는 printArea() 메서드를 추가하세요.
- 아래에서 printArea() 메서드를 호출하세요.

#### **미션4. Float형**

- 사각형 좌표를 Float 형으로 바꿔보세요.
- printRect() 메서드를 호출하세요.

#### **미션5. center**

- 사각형의 중점(center)를 계산해서 float 형으로 출력하는 printCenter() 메서드를 추가하세요.
- 아래에서 printCenter() 메서드를 호출하세요.

```swift
import Foundation

struct Rectangle{
    var leftTopX:Int , leftTopY:Int
    var rightBottomX:Int, rightBottomY:Int
    
    func printRect(){
        print("(\\(leftTopX),\\(leftTopY)) , (\\(leftTopX),\\(rightBottomY)) , (\\(rightBottomX),\\(leftTopY)) , (\\(rightBottomX),\\(rightBottomY))")
    }
    
    func printArea(){
        let length = rightBottomX - leftTopX
        let height = leftTopY - rightBottomY
        print("Area = \\(length * height)")
    }
}
var rect = Rectangle(leftTopX:5,leftTopY:11,rightBottomX:15,rightBottomY:4)
rect.printRect() //(5,11) , (5,4) , (15,11) , (15,4)
rect.printArea() //Area = 70

struct Rectangle_float{
    let leftTopX:Float, leftTopY:Float
    let rightBottomX:Float, rightBottomY:Float
    
    func printRect(){
        print("(\\(leftTopX),\\(leftTopY))","(\\(leftTopX),\\(rightBottomY))","(\\(rightBottomX),\\(leftTopY))","(\\(rightBottomX),\\(rightBottomY))")
    }
    func printCenter(){
        let centerX = (leftTopX+rightBottomX)/2
        let centerY = (rightBottomY+leftTopY)/2
        print("Center Point = (\\(centerX) , \\(centerY))")
    }
}
let rect2 = Rectangle_float(leftTopX: 4.5, leftTopY: 10.5, rightBottomX: 15, rightBottomY: 3.5)
rect2.printCenter() // Center Point = (9.75 , 7.0)
```

### 연습문제2

#### **미션1. MyPoint**

- MyPoint struct를 만들어보세요.
- Float 형 myX, myY 변수를 추가하세요.
- (x,y)형태로 좌표를 출력하는 printPoint() 메서드를 만드세요.
- MyPoint struct 인스턴스를 pointA로 선언하고
- 초기화 메서드로 (2.5f,15.8f)값을 넘기고
- printPoint()를 호출해서 좌표를 출력하세요.

#### **미션2. 메소드 추가하기**

- setX(x : Float) 메서드와 setY(y: Float) 메서드를 추가하세요.
- setX는 myX값을 x로 바꾸고, setY는 myY값을 y로 바꾸세요.
- setX(x:15.2)와 setY(y:7.4)를 호출하세요.
- 직접 print(“pointA=( )”) 형태로 x와 y 값을 가져와서 출력하세요.

### **미션3. 계산하기**

다른 점과의 거리를 계산하기 위해서 `getDistanceTo(toPoint : MyPoint)->Float` 메서드를 추가하세요.- Float sqrt(Float) 함수 사용

- 새로운 점(15f, 12.2f) pointB 인스턴스를 추가하고getDistanceTo() 메서드에 매개변수로 넘겨 결과값을 출력하세요.

```swift
struct MyPoint{
    var myX : Float, myY : Float
    func printPoint() {
        print("(\\(myX),\\(myY))")
    }
    mutating func setX(x : Float){
        myX = x
    }
    mutating func setY(y : Float) {
        myY = y
    }
}
func getDistanceTo(toPoint : MyPoint) -> Float {
    let distanceX : Float = pointA.myX - toPoint.myX
    let distanceY :Float = pointA.myY - toPoint.myY
    return sqrt(distanceX * distanceX + distanceY * distanceY)
}
var pointA : MyPoint = MyPoint(myX: 2.5, myY: 15.8)
pointA.printPoint() //(2.5, 15,8)

pointA.setX(x: 15.2)
pointA.setY(y: 7.4)
print("pointA = (\\(pointA.myX),\\(pointA.myY))") //(15.2 , 7.4)

var pointB : MyPoint = MyPoint(myX: 15, myY: 12.2)

print("distance = \\(getDistanceTo(toPoint: pointB))") // distance = 4.80...
```

MyPoint struct 내부에 mutating function을 사용했다. 구조체는 값 타입이기 때문에, 인스턴스가 생성되고 나서, 인스턴스 매서드에서 해당 인스턴스의 속성을 변경할 수 없다. 따라서 구조체의 method가 구조체 내부에서 데이터를 수정할 때는 Mutating 키워드를 선언해줘야한다. (값 타입이란, 데이터를 전달할 때, 값을 복사해서 전달하는 방식, 참조 타입은 데이터를 전달할 때 메모리 위치를 전달해 단순히 참조하는 방식)

### 연습문제3

#### **미션1. MyPoint로 바꾸기**

- 이전에 만든 Rectangle struct를 MyPoint 구조체를 사용하도록 개선해봅시다.
  - Float leftTop-X, -Y 대신 MyPoint leftTop으로
  - Float rightBottom-X, -Y 대신 MyPoint rightBottom 으로 대체하고
- 기본 생성자에서 각 좌표의 초기값을 (0,0) 으로 설정하세요.
- rect 테스트했던 메서드를 그대로 실행해보세요.
- 안되는 부분을 수정해보세요.

### **미션2. printPoints() 구현하기**

- 추가 생성자로 MyPoint형 원점(x,y) 좌표와길이 Float width 와 높이 Float height 를 넘겨사각형을 만드는 메서드를 만드세요.
- 원점에 해당하는 MyPoint 인스턴스 (5,5)를 추가하고추가 생성자에 길이는 5f, 10f 넘겨 새로운 사각형 rectB 객체를 생성하세요.
- rectB.printPoint()를 호출해서 좌표를 출력하세요.

### **미션3. moveTo() 구현하기**

- 이전에 만든 Rectangle struct에 원하는 delta 값만큼 위치 이동하는 `moveTo(delta: MyPoint)`메서드를 추가하세요.
- `rectB.moveTo(delta: (-3f, 1.5f))` 메서드를 호출하고 이동한 사각형 좌표를 printRect()로 확인하세요.

```swift
struct Rectangle2{
    var leftTop : MyPoint = MyPoint(myX: 0, myY: 0)
    var rightBottom : MyPoint = MyPoint(myX: 0, myY: 0)
    var origin : MyPoint
    var width : Float
    var height : Float
    func printRect(){
        print("(\\(leftTop.myX),\\(leftTop.myY))","(\\(leftTop.myX),\\(rightBottom.myY))","(\\(rightBottom.myX),\\(leftTop.myY))","(\\(rightBottom.myX),\\(rightBottom.myY))")
    }
    
    func printArea(){
        let length = rightBottom.myX - leftTop.myX
        let height = leftTop.myY - rightBottom.myY
        print("Area = \\(length * height)")
    }
    
    func printPoint() {
        print("(\\(origin.myX) , \\(origin.myY)) , (\\(origin.myX) , \\(origin.myY + height)) , (\\(origin.myX + width) , \\(origin.myY + height)) , (\\(origin.myX + height) , \\(origin.myY))")
    }
    
    mutating func moveTo(delta : MyPoint) {
        origin.myX += delta.myX
        origin.myY += delta.myY
    }
}

var rectB = Rectangle2(origin: MyPoint(myX: 5, myY:5), width: 5, height: 10)
rectB.printPoint()

rectB.moveTo(delta: MyPoint(myX:-3 ,myY:1.5))
rectB.printPoint() //미션에는 printRect()메서드로 확인하라고 돼있는데, 
//Rectangle2의 인스턴스인 rectB를 사용했기때문에 printPoint()메서드가 더 적합하다 생각해서 printPoint()메서드 사용했음.
```