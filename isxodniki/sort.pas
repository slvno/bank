unit sort;  //�������� ������

interface //������ ������������ �����

uses   //�������� ����������� ������� �������
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type TSrok=record   //���, ��������������� 1 ���� ��������
  chislo,           //����� ������� ��������
  kol: integer;     //���������� ���������� ����� ����� �������� � ��������
                    //������� (� ��������� ������ - 12 ���)
end;
                                  //������ ��� ���������
Type TSum_Srokov=array of TSrok;  //���� ���������� ������ ��������, ������
                                  //� ����� �������� ������ (12 ���)
                                  //�������������� ������������ ������, �.�.
                                  //��� ��������� ������ �� �������������

                                  //������ ��� ���������
Type TSroki=array of TSum_Srokov; //����� ������������ ���������� ������
                                  //��������. �������������� ������������
                                  //������, ��������� �������� ��������
                                  //������������ ������ �������� �����
                                  //TSum_Srokov.
var
  Sroki: TSroki; //���������� ������������ ������ ����� ������������ ����������
                 //������ ��������.

  dlina,             // ������� ������������ ��������
  dlina1:integer;    //

  varianti: array of integer;  //���������� ������������ ������ ���������
                               //�������� ������ ��������. � ��������� ������
                               //3,6,9,12

  //procedure sort( max:integer; osn_:TSum_Srokov); //���������� ���������
  //����� ���� ��������� ������ ��������, �������� ����� ����������� �������� ����
  //�������� (kol_mes).

  function sort1( osn_:TSum_Srokov):TSum_Srokov;  //���������� �������
  //�������������� �������� ���������� ������ ��������. �� 1 - 2  3 - 1  1 - 6 ����-
  //���� 1 - 8  3 - 1
  // 8 �������� �� 1 ������ + 1 �������� �� 3 �.

  function sort2( osn_:TSroki):TSroki;  //���������� ������� ��������������,
                                  //�������� �������������
                                  //���������� ���������� ������ ��������, �.�
                                  //��������, �� ���� ���������� ����������
                                  //������ ��������(1 - 2  5 - 2) ��������
                                 //���� ���������� ����� �������� (1 - 2  5 - 2)

  function est_znachenie(zn:integer):boolean; //���������� ������� �������.
  //�-� ���������� ������� �� ��� ����� ������� �������� � ������� ���������
  //��������� ������ ��������

  procedure poluchit_mes;//��������� ���������� ��������� �������� ������
  //��������.

implementation  //����� ������������ �����, ������ ������ ����������

//����� ���� ��������� ������ �������� �������� ����� ����������� �������� ����
//�������� (kol_mes).
procedure Polucit_Variants;
var nulli: TSum_Srokov;
 i,j, kol_mes:integer;
 s:string;
begin
  dlina:=0;   //��������������� ���������� ��� ����������� ����� ������������
  dlina1:=0;  //��������
  nulli:= nil;//������ ���������
  Sroki:=nil; //������ ��������� ������ ��������

  kol_mes:=12;
//       |
//    ���������� �������
//       |    ������� ������ ��������� ������ ��������
//       |          |
  sort( kol_mes,  nulli);   //����� ���� ��������� ���������

  for i:=0 to length(Sroki)-1 do  //�������������� �� 1 - 2  3 - 1  1 - 6 ����-
    Sroki[i]:=sort1(Sroki[i]);    //���� 1 - 8  3 - 1
                                  // 8 �������� �� 1 ������ + 1 �������� �� 3 �.

  Sroki:=sort2(Sroki);            //��������������, �������� �������������
                                  //���������� ���������� ������ ��������, �.�
                                  //��������, �� ���� (1 - 2  5 - 2) ��������
                                  //���� ���������� (1 - 2  5 - 2)

//��������� ��������� ������� ��������
  if est_znachenie(kol_mes) then      //��������� ������� �� ��� ����� �������
                                      //�������� � ������� ��������� ������
                                      //��������
    begin
      dlina1:=length(Sroki);          //���������� ������ �������
      setlength(Sroki,dlina1+1);      //����������� ������ ������� �� 1 �������
                                      //�� "���������"

      setlength(Sroki[dlina1],1);     //����������� ������ ������� �� 1 �������
                                      //�� "�����������"

      Sroki[dlina1][0].chislo:=kol_mes;//��������� ���������� �������
      Sroki[dlina1][0].kol:=1;         //��������� ���������� ���������� ������
    end;


//������ ������ ���� ��������� ����� ����� ���� ��������� ������ ��������
//�������� ����� ����������� �������� ���� �������� (kol_mes).

//������������ ���� ��������� ��������� �� 2 ��������� ����������� ���
//����������� 2 ��������� ������������ ������:
//a) ���������: AMD Athlon 900/����� ����������� ������ (��): 128 Mb/����� �����
//��������: 300 Mb/������������ ������� Windows 2000
//b)  ���������: Intel Pentium 150/����� ����������� ������: 16 Mb/����� �����
//��������: 100 Mb/������������ ������� Windows 95

//������������ ���� ��������� ��������:
//1. �������� ���������� ���� ��������� ��������� �������� ��� ��������� �����
//�������� ������� 12 ������� �� ������ "�" ������ 5 �, �� ������ "b" - 25 �����
//2. ��� �������������� ������ ������������� ���������� ������ (64 mb) ��
//���������� "b" ��������� ����������� � �������.
//3. ����������� ������� �� ��� ������ ��������� ��� ��������� � ����� ��������
//��� ����� ��������� ����� �������� �������� �������� 64 Mb ��������� ��.
//4. �������� ���������� ���� ��������� ��� ������ �������� {3, 6, 9, 12),
//������������ � ��������� ������, - ����� 1 � �� ���������� "b".
  {
  RichEdit1.Lines.Clear;
  for i:=0 to length(Sroki)-1 do
    begin
      s:='* ';

      for j:=0 to length(Sroki[i])-1 do
        begin
          s:=s+'     '+inttostr(Sroki[i][j].chislo)+' - '+inttostr(Sroki[i][j].kol)+'    '
        end;
      s:=s+' * ';
      RichEdit1.Lines.Add(s);
    end;
   }
end;


procedure poluchit_mes;
begin
  varianti:=nil;
  setlength(varianti,4);
  varianti[0]:=3;
  varianti[1]:=6;
  varianti[2]:=9;
  varianti[3]:=12;
end;

//����������� ������� �������. �-� ���������� ������� �� ��� ���-�� �������
//�������� � ������� ��������� ��������� ������ ��������
function est_znachenie(zn:integer):boolean;     //��������� true - ������, ����
//���� ��������  �������� zn ������� � ������� ��������� ��������� ������
//�������� - variant.
var i:integer;    //������� �����
begin
  result:=false;  //���� ��������  �������� zn �� ������� � ������� ���������
  //��������� ������ ��������. �� ��������� - �� ������.

  if assigned(varianti) then //���� ��������� �� ������� ������ �� nil (nil -
  //�����), �.�. �������� ��������� �� ������ ��������� ��������� ������
  //�������� varianti, ���� ��������� �� ����������� ��������� ��������
    begin
      for i:=0 to length(varianti)-1 do   //� ����� �� ������� �������� �������
      //��������� ��������� ������ �������� varianti �� ����������, ��� �����
      //������������ length(varianti)-1
        if zn=varianti[i] then  //��������� �������, ������ �� ���� ��������
        //�������� zn � ������ ��������� ��������� ������ �������� varianti, �.�
        //����� �� �� ��� ����������� �������� varianti[i], i - ����������
          result:=true; //���� ������, �� ��������� ������� �������������
    end;

end;

//����������� ������� ��������������,  �������� ������������� ����������
//���������� ������ ��������, �.� ��������, �� ���� ���������� ����������
//������ ��������(1 - 2  5 - 2) �������� ���� ���������� ����� ��������
//(1 - 2  5 - 2). ��������� ������ ������� - ����� ��������� �������������
//���������� ��������� ��������� ������ �������� ������ � ����� ���� �������� �
//�������� ������� (� ��������� ������ - 12 ���)
function sort2( osn_:TSroki):TSroki;
label 1, 2;         //���������� ����� ��� ���������
var J,              //��������
    I,              //
    l               //
    :integer;
                    //��������� ������. ����������
    osn:TSroki;     //����� ��������� ������������� ���������� ���������
    //��������� ������ �������� ������ � ����� ���� �������� � �������� �������
    //(� ��������� ������ - 12 ���)
    rez:boolean;    //���������, ������������ �������� �� ���������� ����������
    //��������� ��������� ������ �������� ������������� � �������� �������
    //��������� ��������� ������ �������� - osn_:TSroki
begin
  result:=nil;   //���������, ����� ��������� ������������� ����������
  //��������� ��������� ������ ��������, ����������� ������ �����. nil - �������
  //���������
  osn:=osn_;  //���������� �������� ������ osn_ �� ��������� ������� osn
  //��������� ��� ��������� � �������� ��������

  for i:=0 to length(osn_)-1 do  //� ����� �� ������� �������� ���������� ���-��
      //��������� ���������� ��������� ��������� ������ �������� �� ����������,
      //��� ����� ������������ length(osn_)-1
    begin
      for j:= 0 to length(osn_)-1 do //� ����� �� ������� �������� ��������
      //������� ��������� ���������� ��������� ��������� ������ �������� ��
      //����������, ��� ����� ������������ length(osn_)-1
        begin
          if (i<>j) then  //��������� �������� �� ����������� �������
          //����������� �.�. ��� osn_[1] �� ����� osn_[1], ���� �� �����, ��
          //����������� ��������� ��������
            begin
                if assigned(osn[j]) then  //��������� ������������� ��������
                //������� ��������� ���������� ��������� ��������� ������
                //��������. �������� �������� ����� ��������� � �������
                //���������� nil, ��������� true ���� ��������� �� �������
                  if length(osn_[i])=length(osn[j]) then  //���� ������
                  //������������ ������� osn_[i] ��������� � �����������
                  //��������� - osn[j], �� ����������� ��������� ��������.
                  //������ �������� ���������� ��������� ���������� ������
                  //�������� � ���������� �� ����������. �.�. osn[i] - ������
                  //����������� ���� ����������, ������ � ����� ���� �������� �
                  //�������� ������� (� ��������� ������ - 12 ���). ��������
                  //osn[j][l].chislo - ����� �������, osn[j][l].kol - ����������
                 //���������� ������� ������, - ���� l-�� ������� ������� osn[j]
                    begin
                      //������ �������

                      rez:=true; // => �������, ��� ������� ����������

                      for l:= 0 to length(osn[i])-1 do //� ����� �� �������
                      //�������� ���������� ��������� ��������� ������ �������� ��
                      //����������, ��� ����� ������������ length(osn_[i])-1.
                      //��������� ��� �������� ���������� ��������� ���������
                      //������ ��������.
                        begin

                          //���� �������� osn_[i][l] � ����������� �������
                          //osn[j][l], ����������� ���� ����������, ������ �
                          //����� ���� �������� � �������� �������, ���������,
                          //�� ����� ������������� �������. ��������� ���� ��
                          //���������� ������� osn[j][l].chislo � osn[j][l].kol
                          //- ���������� ���������� ������� ������.
                          if (osn[j][l].chislo=osn_[i][l].chislo) and
                          (osn[j][l].kol=osn_[i][l].kol) then
                          else
                            begin
                              rez:=false; //���� �� ���������, �� ���������� ���
                              //��� ���� ���������� ���������� rez
                              goto 1;   //������� �� ����� ��������
                            end
                        end;
1:
                      if rez then  //���� ������� ���������� ���������,
                      //����������� �������,����������� ���� ����������, ������
                      //� ����� ���� �������� � �������� �������, ���������. ���
                      //����� ��� ������������� ������� ���������, �.�. ������
                      //osn[j] �������� ������������.
                        osn[j]:=nil;
                    end; //����� ����� �������� ������� ��������� ����������
                    //��������� ��������� ������ ��������
            end;

        end;
    end;
  //������ ������ ���� ��������� ����� ������, � ������� �����������
  //������������� ��������

  //��������� ���� ������ � �������������� ������� ��������� ����������
  //��������� ��������� ������ �������� - result
  for i:=0 to length(osn_)-1 do //� ����� �� ������� �������� ���������� ���-��
  //��������� ���������� ��������� ��������� ������ �������� �� ����������,
  //��� ����� ������������ length(osn_)-1
    if assigned(osn[i]) then //��������� ������������� ��������
    //������� ��������� ���������� ��������� ��������� ������ ��������. ��������
    // �������� ����� ��������� � ������� ���������� nil, ��������� true ����
    //��������� �� ������� ���� ���� �������� ��������� ���������� ���������
    //��������� ������ ��������, ��
      begin
        l:=length(result);            //���������� ������ �������
        setlength(result,l+1);        //����������� ������ ������� �� 1 �������
                                      //�� "���������"

        result[l]:= osn[i];         //��������� 1 �������, ���������� ���������
                                    //��������� ������ ��������
      end;

  osn:=nil;
end;


function sort1( osn_:TSum_Srokov):TSum_Srokov;
label 1, 2;       //���������� ����� ��� ���������
var J,            //��������
    I,            //
    l             //
    :integer;

    osn:TSum_Srokov; //��������� ������. ����������
    //���������� ���������
    //��������� ������ ��������, ������ � ����� ���� �������� � �������� �������
    //(� ��������� ������ - 12 ���)

    test: TSrok; //��������� ������. ����������
    //���� ������� ����� ��������
begin
  result:=nil; //���������, ���� ����������
  //��������� ��������� ������ ��������, ����������� ������ �����. nil - �������
  //���������
  osn:=osn_; //���������� �������� ������ osn_ �� ��������� ������� osn
  //��������� ��� ��������� � �������� ��������


  for i:=0 to length(osn_)-1 do  //� ����� �� ������� �������� ���������� ���-��
      //���������� ��������� ��������� ������ �������� �� ����������,
      //��� ����� ������������ length(osn_)-1. �������� �� �������
    begin
      for j:= 0 to length(osn_)-1 do //� ����� �� ������� �������� ��������
      //������� ���������� ��������� ��������� ������ �������� ��
      //����������, ��� ����� ������������ length(osn_)-1. �������� �� �������
        begin
          //��������� �������� �� ����������� �������
          //����������� �.�. ��� osn_[1] �� ����� osn_[1], ���� �� �����;
          //���� �������� osn[i]  � ����������� ������� osn_[J], �����������
          //���� �������, ���������, �� ����� ������������� �������. ���������
          //���� �� ���������� ������� osn[i].chislo � osn[i].kol - ����������
          //���������� ������� ������.
          //���� ������� �����������, �� ��������� ��������� ��������
          if (i<>j) and (osn[i].chislo=osn_[j].chislo) and (osn_[j].chislo<>0)
          then
            begin    //�������� �������� ������������ ��������
              osn[i].kol:=osn[i].kol+osn_[j].kol; //��������� � �����������
              //���������� ��������� �������� ����� ���������� ������������
              //��������
              osn_[j].chislo:=0; //�������� �������� ������������ �������� -
              //����� �������
              osn_[j].kol:=0; //����������� ����������
            end;
        end;
    end;
  //����������� ������ ������ ��������� ����� ����������� ������ ����������
  //��������� ��������� ������ ��������, � ������� ����������� �������������
  //��������.

  //�������������� ��� �������: �������� � �����������.
  for i:=0 to length(osn_)-1 do //� ����� �� ������� �������� ���������� ���-��
      //���������� ��������� ��������� ������ �������� �� ����������,
      //��� ����� ������������ length(osn_)-1. �������� �� �������
    if osn[i].chislo<>osn_[i].chislo then  //���� �� �������� �� ���������, ��
    //������� ������������� ������� � �������� �� ������������ �������. ����
    //������ ������������� ��� ���������.
      begin
        osn[i].chislo:=0;    //�������� �������� ������������ �������� -
                             //����� �������
        osn[i].kol:=0;//����������� ����������
      end;

  //��������� ���� ������ � �������������� ������� ����������
  //��������� ��������� ������ �������� - result
  for i:=0 to length(osn_)-1 do //� ����� �� ������� �������� ���������� ���-��
  //���������� ��������� ��������� ������ �������� �� ����������,
  //��� ����� ������������ length(osn_)-1
    if osn[i].chislo<>0 then  //��������� ������������� ��������
    //������� ��������� ���������� ��������� ��������� ������ ��������. ��������
    // �������� ����� ��������� � �����, ��������� true ���� ����� �������
    //�� ����. ���� ���� �������� ���������
    //��������� ������ ��������, ��
      begin
        l:=length(result);             //���������� ������ �������
        setlength(result,l+1);         //����������� ������ ������� �� 1 �������
                                       //�� "���������"
        result[l].chislo:= osn[i].chislo; //��������� 1 ������� 1 ����������
        result[l].kol:= osn[i].kol;       //��������� ������ ��������
      end;

   //������������� �������������� ������ �������� ������ �������� �� �����������
   //�������� ����� �������� result[i].chislo
   for j:=0 to length(result)-1 do //� ����� �� ������� �������� ���-��
  //���������� ��������� ��������� ������ �������� �� ����������,
  //��� ����� ������������ length(result)-1
     for i:=0 to length(result)-2 do //� ����� �� ������� �������� ���-��
  //���������� ��������� ��������� ������ �������� �� ���������� ����� ����
  //�������, ��� ����� ������������ length(result)-2
  //���� ����� ������� ������ ����������� �������� ������ ������ �������
  //����������, �� ������ �� �������.
       if result[i].chislo>result[i+1].chislo then
       begin
         test:=result[i+1];
         result[i+1]:=result[i];
         result[i]:=test;
       end;
  osn:=nil;
end;

//����� ���� ��������� ������ ��������, �������� ����� ����������� �������� ����
//�������� (kol_mes). ��������� �������� ���� ���� ����������.
//��������� ��������� �������� ������������� ������ �������������� �����
//���������� ������������ ���� ������������� ����� �����, ������ � �����
//�������� ���� �������� (kol_mes). ����� ������� ����� - ����������.
//��������� ��������� ���� - max ����� ������ osn_:TSum_Srokov
procedure sort( max:integer; osn_:TSum_Srokov);
label 1, 2;
var L,
    B,
    K,                //��������
    I,                //�������
    P:integer;        //�������

                           //������������ �������
    osn, test:TSum_Srokov; //���������� ���������
    //��������� ������ �������� ������ � ����� ���� �������� � �������� �������
    //(� ��������� ������ - 12 ���).
begin
  osn:=osn_; //���������� �������� ������ osn_ �� ��������� ������� osn

  //��������� �������� �� ��������� ���������� ������ �����. ��� ����� ��������
  // 1 �� ���������� ����� �����.
      l:=1;
      b:=max-l;
      if b>0 then     //���� ��������� �� ����, �� ��������� ���������� max
      //������
        begin
          //���� 1, �� ������������ ������ ������ ��������� ��������� ����������
          if b=1 then
            begin
              dlina:=length(osn);     //���������� ������ �������
              setlength(osn,dlina+2); //����������� ������ ������� �� 2 ��������
              osn[dlina].chislo:=l;   // ���������� �� ���� ������ �����
              osn[dlina].kol:=1;      // ����� ���������� ��������   - 1

              osn[dlina+1].chislo:=b; // ���������� �� ���� ������ �����
              osn[dlina+1].kol:=1;    // ����� ���������� ��������   - 1

             dlina1:=length(Sroki);  //���������� ������ ��������������� �������
              //���������� ��������� ������ ��������

              setlength(Sroki,dlina1+1);//����������� �������������� ������
              //���������� ��������� ������ �������� �� 1 ����������

              if est_znachenie(b) then  //���������, ��� 1 ����� ������ � �����
              //���������� ��������� ������ ��������. ���� ������, �� ����������
              //����� ���������� ��������� ������ �������� � ��������������
              //������� Sroki.
                Sroki[dlina1]:=osn;

              osn:=nil; //������� ���������� ��������� ������ ��������
            end
            //���� ������� �� 1, �� ��������������� ��������, ��������������
            //�����. � ���������� ��� ������������ ������
          else
            begin
              b:=b+1;

              //��������� ��������� ����������. � ����� �� 1 �� �������� ��
              //������� �� 2 ��������� �����. ���������� ��������� ��������
              //���������� b �� ����� ������� �����
              for k:=1 to b div 2 do
                begin
                  //����  k ������� ������ � �����
                  //���������� ��������� ������ ��������.
                  if est_znachenie(k) then
                  //���� ������, ��
                  for i:= 1 to b do //� ����� ���������� ��������� ����������
                  //�� 2 �����, �������� ����� ���� ������������ ����� B
                    begin
                      p:=b-k*i; // ���������� �������, �.�.  5-1*2=3
                      //3 - �������, 1 - ���������� ����������, 2 - ��������.
                      //i - ���������� ���������� �������� k
                      //����  p ������� ������ � �����
                      //���������� ��������� ������ ��������.
                      if est_znachenie(p) then
                      //�� ������������ ��� �����, ���� ������� > 0
                      //���� ������ ���� ������������
                      if p>0 then
                        begin
                            begin
                              //����������� �������������� ������
                              //���������� ��������� ������ �������� �� 1
                              //���������� k-�������, i - ���������� ������.
                              //���������� ��������� ������������ ������ test
                              test:=osn;  //����������� ��������� ����������
                              //� ��������� ��� �� ����������� ������.

                              dlina:=length(test);
                           setlength(test,dlina+2); //����������� ��������������
                              //������ ���������� ��������� ������ �������� ��
                              //2 ���������� ������ ��������: (K-�������,
                              //i- ����������) � (p-�������,
                              //1- ����������), ��� max=k*i+p - ���������� �
                              //��������� �����. K - ���������� � ����
                              //����� �������� � ����� �� ���������� K
                              //;I,P - ������������ � ����
                              //����� �������� � ����� �� ���������� I

                              test[dlina].chislo:=k;  //��������� � ��������
                              test[dlina].kol:=i;     //������� �����������
                              //������� k � ����� �� ���������� i

                              test[dlina+1].chislo:=p; //��������� � ��������
                              test[dlina+1].kol:=1;    //������� �����������
                              //������� p � ����� �� ���������� 1

                              dlina1:=length(Sroki);      //���������� ������
                              //�������
                              setlength(Sroki,dlina1+1);  //����������� ������
                              //������� �� 1 �������

                              Sroki[dlina1]:=test; //��������� 1 �������,
                              //���������� ��������� ��������� ������ ��������

                              //���������� ������ �������� ���������� ������� p
                              //������� ������� �� ����� ������.

                              dlina:=length(test);    //���������� ������
                              setlength(test,dlina-1);//��������� ������

                              //�������� ��� ������� ���������� ��� ����������
                              //���� ��������� ���������� ����� p. � �������
                              //���������� � ���� ������������� ������� test
                              //���������� ����������� ���������� �����
                              //max-p, ��� max - �����, ������� ������������ �
                              //���� ���������
                              sort( p, test);

                              test:=nil;  //������� ��������� ������,
                              //����������� ������� ���������.
                            end;
                        end
                      else
                        goto 1;
                    end;
1:            //��������� 1 �������� ����� �� k

                end;

            end;

        end
      else
        goto 2;
2:

end;

end.
