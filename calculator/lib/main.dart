import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator Flutter',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Calculator(title: 'Calculator',));
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key key,this.title}) :super(key: key );
  final String title;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String Solution='', Output='0'; ///풀이식, 출력할 값
  double num1=0, num2=0;
  String operand='';
  bool hasEqual=false;

  PressedButton(String val){
    print(val);
    if(val =='C'){
      num1=0;
      num2=0;
      operand='';
      Output='0';
      Solution='';
    }
    else if(val=='<-')
    {
      if(Output==''||hasEqual==true)
        return;
      if(Output.length==1)
        Output='0';
      else
        Output=Output.substring(0,Output.length-1);
      num2=double.parse(Output);
    }
    else if(val=='+'||val=='-'||val=='*'||val=='/'){
      if(operand=='+'||operand=='-'||operand=='*'||operand=='/') {
        Solution+=Output+val;
        if (operand == '+')
          Output = (num1 + num2).toString();
        else if (operand == '-')
          Output = (num1 - num2).toString();
        else if (operand == '*')
          Output = (num1 * num2).toString();
        else if (operand == '/')
          Output = (num1 / num2).toString();
        num1 = double.parse(Output);
        num2 = 0;
        operand=val;
      }
      else{
        num1=double.parse(Output);
        num2=0;
        operand=val;
        Solution=Output+val;
      }
    }
    else if(val =='.'){
      if(Output.contains('.'))
        return;
      else
        Output+=val;
    }
    else if(val == '=') {
      if (operand == '+')
        Output = (num1 + num2).toString();
      else if (operand == '-')
        Output = (num1 - num2).toString();
      else if (operand == '*')
        Output = (num1 * num2).toString();
      else if (operand == '/')
        Output = (num1 / num2).toString();
      num1 = 0;
      num2 = 0;
      operand='';
      Solution='';
      hasEqual=true;
    }
    else{
      if(num2==0)
        Output=val;
      else
        Output+=val;
      num2=double.parse(Output);
      hasEqual=false;
    }

    setState(() {});
    ///setState가 동작하는 시점은 언제인가?
    ///Output=="';///을 이 위치에서 했더니 setState시점에서도 ''이 되는듯하다.
  }

  ///button widget 세팅
  Widget CalcBtn(String Btnval){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0), ///박스 외부 패딩
        decoration: BoxDecoration(
            color: Colors.grey[300], ///버튼 색
            boxShadow: [ ///버튼 박스의 쉐도우 관리
              BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(2.0,2.0), ///우하
                  blurRadius: 8.0, ///블러 강도
                  spreadRadius: 1.0 ///퍼지는 범위
              ),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0,-2.0), ///좌상
                  blurRadius: 8.0,
                  spreadRadius: 1.0
              ),
            ]
        ),
        child: MaterialButton( ///박스 내부 관리
          padding: EdgeInsets.all(30.0),
          child: Text(Btnval,style: TextStyle(
              fontSize: 25.0
          ),),
          onPressed: ()=>PressedButton(Btnval),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold( ///배경 생성
            backgroundColor: Colors.grey[300], ///배경 색 조절
            appBar: AppBar(title:Text(widget.title)),
            body: Container(
                child:Column(
                  children: <Widget>[
                    Container( ///계산 내용 출력창
                        alignment: Alignment.bottomRight, ///오른쪽 정렬, ////top,bottom 차이는 어떻게 주는가?
                        padding: EdgeInsets.only(right:12.0, top:50.0, ), ///지정된 방향으로 패딩
                        child:
                        Text(Solution, style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.grey[500]
                        ))
                    ),
                    Container( ///계산 내용 출력창
                        alignment: Alignment.bottomRight, ///오른쪽 정렬, ////top,bottom 차이는 어떻게 주는가?
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical:20.0), ///양쪽 모두에 지정된 만큼 패딩
                        child:
                          Text(Output, style: TextStyle(
                            fontSize: 60.0
                        ))
                    ),
                    Expanded( ///영역을 띄우기 위해 사용
                      child: Divider(), ///나누어지는 영역 표시
                    ),
                    Column(
                        children: <Widget>[
                          ///버튼들 생성
                          Row(
                            children: <Widget>[
                              CalcBtn('.'),
                              CalcBtn('C'),
                              CalcBtn('<-'),
                              CalcBtn('*'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              CalcBtn('7'),
                              CalcBtn('8'),
                              CalcBtn('9'),
                              CalcBtn('/'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              CalcBtn('4'),
                              CalcBtn('5'),
                              CalcBtn('6'),
                              CalcBtn('+'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              CalcBtn('1'),
                              CalcBtn('2'),
                              CalcBtn('3'),
                              CalcBtn('-'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              CalcBtn('0'),
                              CalcBtn('='),
                            ],
                          )
                        ]
                    )
                  ],
                )
            )

        )
    );
  }
}


