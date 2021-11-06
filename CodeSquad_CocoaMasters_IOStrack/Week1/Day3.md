## Array

- 정식 문법

  ```swift
  let arr1: Array<Int>
  var arr2: Array<String>
  ```

- 단축 문법

  ```swift
  let arr1: [Int]
  var arr2: [String]
  ```

  정식 문법보다는 단축 문법을 주로 사용함.

  빈 배열을 만들 경우에는 타입을 반드시 명시해야함.

- 빈 배열 만들기

  ```swift
  let emptyArray1: Array<Int>()
  let emptyArray2: [Int]()
  ```

- 임의의 값 넣기

  ```swift
  //정식 문법
  let strArray1: Array<String> = ["정식", "문법"]
  
  //단축 문법
  let strArray2: [String] = ["단축", "문법"]
  
  //형식 추론
  let strArray3 = ["형식", "추론"]
  
  //시퀀스
  let nums = Array(1...3) //[1, 2, 3]
  
  //여러 데이터 타입
  let anyArr: [Any] = [1, 2, "three", "four"]
  ```

- 크기가 정해진 배열

  ```swift
  let zeroArray1 = [Int](repeating: 0, count: 5) // [0, 0, 0, 0, 0]
  let zeroArray2 = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
  ```

- 기본 메서드

  1. 배열 검사 - 배열에 들어있는 값의 개수를 알고 싶을 때

     ```swift
     let nums = [1, 2, 3]
     let emptyArray: [Int] = []
     
     //.count : 배열에 들어있는 값의 개수 검사
     nums.count //3
     emptyArray.count //0
     
     //.isEmpty : 배열에 값이 없는지를 판단
     nums.isEmpty // False
     emptyArray.isEmpty //True
     ```

  2. 배열 요소 접근

     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let emptyArray: [Int] = []
     
     /*서브스크립트(내가 원하는 값을 쉽게 찾기 위해서 정의하는 문법)로 접근*/
     numbers[0] //1
     numbers[1] //2
     
     numbers[0...2] //[1, 2, 3]
     //빈 배열에 서브스크립트를 사용하면 error을 반환
     //emptyArray[0] //error
     
     //첫 번째 요소 접근
     numbers[numbers.startIndex] //1
     //마지막 요소 접근(endIndex는 배열의 마지막 인덱스가 아님)
     numbers[numbers.index(before: numbers.endIndex] //5
     
     /*속성으로 접근*/
     numbers.first //1
     numbers.last //5
     
     //배열이 비어있다면 nil을 반환
     emptyArray.first //nil
     emptyArray.last //nil
     ```

  3. 배열에 요소 추가

     ```swift
     var numbers1 = [1, 2, 3, 4, 5]
     var numbers2 = [1, 2, 3, 4, 5]
     /* append: 맨 끝에 추가 */
     numbers1.append(6) //[1, 2, 3, 4, 5, 6]
     numbers1.append(contentsOf: [7, 8, 9]) //[1, 2, 3, 4, 5, 6, 7, 8, 9]
     
     /* insert : 중간에 추가 */
     numbers2.insert(0, at: 0) //[0, 1, 2, 3, 4, 5]
     numbers2.insert(contentsOf: [10, 100], at: 2) //[0, 1, 10, 100, 2, 3, 4, 5]
     numbers2.insert(-1, at: numbers.startIndex)
     
     //
     ```

  4. 배열에 요소 변경

     ```swift
     /* 서브스크립트로 변경하기 */
     var array1 = [1, 2, 3]
     array[0] = 10 //[10, 2, 3]
     array[0...2] = [10, 20, 30] //[10, 20, 30]
     array[0...2] = [0] //[0]
     
     /* replaceSubrange로 바꾸기 (범위 변경시) */
     var array2 = [1, 2, 3]
     array2.replaceSubrange(0...2, with: [10, 20, 30]) //[10, 20, 30]
     array2.replaceSubrange(0...2, with: [0]) //[0]
     array2.replaceSubrange(0..<1, with: []) //[]
     ```

  5. 배열 요소 삭제

     ```swift
     /* 일반적인 삭제 */
     var array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
     
     array1.remove(at: 2) //[1, 2, 4, 5, 6, 7, 8, 9]
     array1.removeFirst() //[2, 4, 5, 6, 7, 8, 9]
     array1.removeFirst(2) //[5, 6, 7, 8, 9]
     array1.removeLast() //[5, 6, 7, 8]
     array.popLast() //[5, 6, 7]
     array1.removeLast(2) //[5]
     array1.removeAll() //[]
     
     /* 특정 범위 삭제 */
     var array2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
     
     array2.removeSubrange(1...3) //[1, 5, 6, 7, 8, 9]
     array2[0..<2] = [] //[6, 7, 8, 9]
     ```

  6. 배열 비교

     ```swift
     var array1 = [1, 2, 3]
     var array2 = [1, 2, 3]
     var array3 = [1, 2, 3, 4, 5,]
      
     array1 == array2                    //true
     array1.elementsEqual(array3)        //false
     //모든 요소가 같아야 true
     ```

  7. 배열 정렬

     ```swift
     var array1 = [1, 5, 3, 8, 6, 10, 14]
     
     /* sort */
     array.sort() //[1, 3, 5, 6, 8, 10, 14]
     array.sort(by: >) //[14, 10, 8, 6, 5, 3, 1]
     
     /* sorted */
     let sortedArray = array1.sorted()
     let sortedArray2 = array1.sorted(by: >)
     ```

  8. 배열 요소 바꾸기

     ```swift
     let array1 = [1, 2, 3, 4, 5]
     array1.swapAt(0, 4) //[5, 2, 3, 4, 1]
     
     array1.shuffle() //무작위로 섞기
     ```

## String

- String 접근하기

  1. 개별 Character 접근하기

     ```swift
     /* startIndex, endIndex */
     let str = "Hello"
     
     print(str[str.startIndex]) //H
     print(str[index(before: str.endIndex)]) //o
     
     /* offsetBy */
     let str2 = "Hello World"
     
     print(str2[str2.index(str2.startIndex, offsetBy: 0)]) //H
     print(str2[str2.index(str2.startIndex, offsetBy: 6)]) //W
     
     print(str2[str2.index(str2.endIndex, offsetBy: -1)]) //d
     print(str2[str2.index(str2.endIndex, offsetBy: -3)]) //r
     ```

  2. 루프를 통해 전체 String에 접근하기

     ```swift
     let str = "Hello"
     
     for char in str {
     		print(char)
     }
     //H
     //e
     //l
     //l
     //o
     ```

  3. String 인덱스와 개별 문자에 접근하기

     ```swift
     for (index, value) in str.enumerated() {
     		print("index: \\(index), value: \\(value)") //index: 0, value: H
     ```