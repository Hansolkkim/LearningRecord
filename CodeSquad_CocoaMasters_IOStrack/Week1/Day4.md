## **연습문제 - 사다리게임**

### **1. 프로젝트 생성**

- Xcode에서 Command Line Tool 프로젝트 템플릿으로 LadderGame 프로젝트를 저장소 디렉토리 아래에 생성한다.
- 소스트리에서 프로젝트 생성에서 만들어진 파일들을 추가해서 커밋하고 푸시해서 리모트에 반영한다.

### **2. 사다리 인원 입력**

- readLine()으로 사다리 게임에 참여할 인원을 입력받는다.
- 만약 사다리 인원이 2명 미만이거나 8명을 초과할 경우 프로그램을 종료한다.

### **3. 사다리 출력하기**

- 사다리 높이는 4개라고 가정한다.
- 참여 인원과 높이를 매개변수로 받아서 사다리를 출력하는 printLadder() 함수를 구현한다.
- 가로 개수는 `참여 인원 - 1`, 세로 개수는 사다리 높이와 동일한 Int 타입 2차원 배열을 만들고
- Int.random()으로 랜덤하게 사다리 발판이 있으면 ``를 출력하고, 없으면 공백을 출력한다.
- 발판 사이에는 `|`로 표시한다.
- 실행해서 콘솔에 출력되는지 확인한다.

> 3명일 때 출력 예시

```
|-| |
| |-|
| |-|
|-|-|
```

- 코드

  ```swift
  import Foundation
  
  struct Ladder{
      var myHeadCount: (Int) = 0, myLadderHeight: (Int) = 0
      var errorCode: (Int) = 0
      
      mutating func setLadder() {
          print("인원을 입력해주세요.(2~8명) : ", terminator: "")
          let headCount = Int(readLine()!)
          if (headCount! < 2) || (headCount! > 8) {
              print("인원이 너무 적거나 너무 많습니다.")
              errorCode = -1
          }else {
              print("사다리 높이를 입력해주세요 : ", terminator:  "")
              let ladderHeight = Int(readLine()!)
              print("인원 : \\(headCount ?? 0), 사다리 높이 : \\(ladderHeight ?? 0)")
              myHeadCount = headCount ?? 0
              myLadderHeight = ladderHeight ?? 0
          }
         
          
      }
      
  //    미션 조건에 맞지 않지만 만든게 아까워서 남겨놓은 코드
  //    func makeLadder(cnt: Int, height: Int)->[[String]]{
  //
  //        var Ladder :[[String]] = [[String]](repeating: [String](repeating: "|", count: cnt*2-1), count: height) //발판이 올 수 있는 모든 자리까지 "|"로 채워놓은 2차원 배열
  //        var intLadder :[[Int]] = [[Int]](repeating: [Int](repeating: 2, count: cnt*2-1), count: height) //위의 배열과 같은 크기를 가지는 2차원 Int 배열(사다리의 위치에는 2가 남도록 설정)
  //        for yIndex in 0..<height{
  //            for xIndex in stride(from: 1, to: cnt*2-1, by: 2){
  //                intLadder[yIndex][xIndex] = Int.random(in: 0...1) //발판이 올 수 있는 자리에 0 또는 1을 random으로 대입
  //                if intLadder[yIndex][xIndex] == 1{
  //                    Ladder[yIndex][xIndex] = "-"
  //                }else if intLadder[yIndex][xIndex] == 0{
  //                    Ladder[yIndex][xIndex] = " "
  //                }else{
  //                    Ladder[yIndex][xIndex] = Ladder[yIndex][xIndex]
  //                }
  //            }
  //        }
  //        return Ladder
  //    }
      func makeLadder(cnt: Int, height: Int)-> [String]{
          
          if errorCode != -1 {
              
              var footholdArr: [[Int]] = [[Int]](repeating: [Int](repeating: 2, count: cnt-1), count: height)
              var ladderArr: [String] = [String](repeating: "", count: height)
              
              for yIndex in 0..<height {
                  
                  for xIndex in 0..<(cnt-1) {
                      
                      ladderArr[yIndex] += "|"
                      footholdArr[yIndex][xIndex] = Int.random(in: 0...1)
                      
                      if footholdArr[yIndex][xIndex] == 1 {
                          ladderArr[yIndex] += "-"
                      }else {
                          ladderArr[yIndex] += " "
                      }
                      
                  }
                  
                  ladderArr[yIndex] += "|"
              }
              
              return ladderArr
              
          }else {
              return ["---프 로 그 램 종 료---"]
          }
          
      }
  }
  func printLadder(Ladder: [String],height: Int) {
      for y in Ladder{
          print(y)
      }
  }
  
  var someLadder = Ladder()
  someLadder.setLadder()
  printLadder(Ladder: someLadder.makeLadder(cnt: someLadder.myHeadCount, height: someLadder.myLadderHeight), height: someLadder.myLadderHeight)
  ```

  강의 중에, 입력 받아서 계산하는 함수와 출력을 위한 함수는 구분을 하는 것이 좋다해서,  setLadder()  함수와  printLadder() 함수를 따로 만들었다. 그리고 setRadder() 함수를 이용해 정해진 값을 바탕으로 원하는 사다리 모양을 만들어주는 함수를 만들었다.( makeLadder() )

  입력 조건 중에, 인원이 2명 이상 8면 이하 라고 주어져있었기 때문에, 조건에 벗어나면 if문을 이용해 errorcode = 0 으로 만들고, errorcode = 0 이라면 printRadder() 함수에서 "프로그램 종료"를 출력하도록 했다. 또한 문제 조건에는 없지만, 사다리의 높이 또한 사용자가 입력할 수 있도록 설정했다.

  makeLadder() 함수를 만들 때, 처음에 조건을 잘못 이해하고, 사다리 발판 유무를 정하는 배열을 맘대로 만들어서 // 로 잘못만든 함수를 가려놨다.

  footholdArr는 사다리 각각의 위치의 발판 유무를 정해주는 배열인데, 이 배열은 Int.Random() 메소드를 이용해, 0이라면 발판이 생기지않고, 1이라면 발판이 생기도록 설정했다.

  printLadder() 함수는 String 배열을 입력으로 받아 입력 받은 String 원소를 하나당 한 줄씩 출력해주는 함수다.