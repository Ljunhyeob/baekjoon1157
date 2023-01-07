//
//  main.swift
//  baekjoon1157
//
//  Created by 이준협 on 2023/01/07.
//

import Foundation

let text = readLine()!
var arr = [Int](repeating: 0, count: 26) //26칸 배열 0으로 채워서 만듬

for value in text.utf8 { //text 문자열 utf8값  하나하나씩 value에 넣으면서 반복
    //a->97 , A->65
    //대문자 일 경우에 -97, 소문자일 경우에 -65 를 하면 A와a 값이 똑같이 나옴
    //예를들어 A는 100이고, a는 68 이라고 치면 -> 3 과 3 이 나옴.
    //그렇기 때문에 같은 배열위치에 값을 저장할 수 있음.
    
    if value > 90 { //value 값이 90 이상이면 대문자
        arr[Int(value) - 97] = arr[Int(value) - 97] + 1
        //arr[value] 에다가 기존 arr[value] 값을 가져와서 + 1 을 한 값을 저장
        //만약 arr[value] = 0 일때, arr[value] = 0 + 1 이 됨.
    } else {
        arr[Int(value) - 65] += 1
    }
}

let max = arr.max()! // 위 for문으로 값을 저장한것중에 가장 큰 값을 가져옴
if arr.firstIndex(of: max) == arr.lastIndex(of: max) {
    //firstIndex -> 배열 맨앞부터 max 값  위치를 반환
    //lastIndex -> 배열 맨 뒤부터 max 값 위치를 반환
    //두개가 같다면 가장 많이 사용한 단어를 찾은거
    print(UnicodeScalar(arr.firstIndex(of: max)! + 65)!)
    //문제 출력값에서 무조건 대문자로 나와야하기때문에 65를 더해서 값을 출력
} else { // 못찾았다면 단어 갯수가 동일하게 있는거임.
    print("?")
}
