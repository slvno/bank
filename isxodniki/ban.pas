unit ban; //�������� ������

interface   //������ ������������ �����

uses     //�������� ����������� ������� �������
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, Menus, Buttons, ExtCtrls, Db, DBTables,
  bde, stdctrls, dbctrls, ImgList;

type TSrok=record   //���, ��������������� 1 ���� ��������
  chislo,           //����� ������� ��������
  kol: integer;     //���������� ���������� ����� ����� �������� � ��������
                    //������� ( 12 ���)
end;
                                  //������ ��� ���������
Type TSum_Srokov=array of TSrok;  //���� ���������� ������ ��������, ������ �
                                  //����� �������� ������ (12 ���)
                                  //�������������� ������������ ������, �.�.
                                  //��� ��������� ������ �� �������������
                     //������ ��� ���������
type TDoxod=record   //�����, ��� ����� ������������ ���������� ������ ��������
  doxod:real;        //�������� ������
  rez:boolean;       //������������ �� ����� ���������� ������ ��������
  komb:TSum_Srokov ; //���������� ������ ��������
end;

type TVariant_s=array of TDoxod; //������ ��� ��������� ������������ ������.
//�����, ��� ���� ���������� ��������� ���������� ������ ��������

type TMax=record  //������ ��� ��������� ������������ �����
  stavka:real;    //�������� ������
  no:integer;     //����� ������ � ������� TVariant_s
end;
                     //������ ��� ���������
type TIs_dan=record  //�������� ������ ��� ���������� ������
  srok:integer;      //���� ��������
  min_summa,         //����������� �����
  max_summa,         //������������ �����
  stavka:real;       //���������� ������

  nomer,             //����� � �� vkl_nam.db
  nomer1:integer;    //����� � �� bank.db
  name_vkl,          //�������� ������
  name_b:string;     //�������� �����
  rez:boolean;       //��������� �� ���� ����� ��� ��������� ������� �� ����
  //����������� ������ ��������
end;

type Tdan_mas= array of TIs_dan;  //������ ��� ��������� ������������ ������
//�������� ������ ��� ��������� �������

type Pdan_mas= ^Tdan_mas; //��������� (����� � ������) �� ������ ������ ��������

type TKombin=record  //������ ��� ��������� ������� �� ���������� ������ ������.
  nomer:integer;    //���������� ����� �������� � ������������ ������ � �������
  nnaydena:boolean; //��������� ������ �������� - dan_mas:Tdan_mas
end;

type  //���������� ������� ����� ���������
  TForm1 = class(TForm)         //���������� ������ TForm1 - ���������� �� TForm
    StatusBar1: TStatusBar;     //���������� ���������� StatusBar1 ����
    //TStatusBar. ������������ � ���� ������ ���������� �� ����� Form1.
    ToolBar1: TToolBar;          //���������� ���������� ToolBar1 ����
    //TToolBar. ������������ � ���� ������ �� ����� Form1, ��������� �������
    //���������� ������
    SpeedButton1: TSpeedButton;  //���������� ���������� SpeedButton1 ����
    //TSpeedButton. ������������ � ���� ������ �� ����� Form1
    SpeedButton2: TSpeedButton;  //���������� ���������� SpeedButton2 ����
    //TSpeedButton. ������������ � ���� ������ �� ����� Form1
    SpeedButton3: TSpeedButton;  //���������� ���������� SpeedButton3 ����
    //TSpeedButton. ������������ � ���� ������ �� ����� Form1

    MainMenu1: TMainMenu;        //���������� ���������� MainMenu1 ����
    //TMainMenu. ������� ����

    N1: TMenuItem;               //���������� ����������� MenuItem1-12 ����
    N2: TMenuItem;               //MenuItem. ������ �������� ����
    N3: TMenuItem;               //
    N4: TMenuItem;               //
    N5: TMenuItem;               // ������ �������� ����
    N6: TMenuItem;               //
    N7: TMenuItem;               //
    N8: TMenuItem;               //
    N9: TMenuItem;               //
    N10: TMenuItem;              //
    N11: TMenuItem;              //
    N12: TMenuItem;              //

    PopupMenu1: TPopupMenu;      //���������� ����������� PopupMenu1-3 ����
    PopupMenu2: TPopupMenu;      //TPopupMenu. ����������� ����.
    PopupMenu3: TPopupMenu;      //

    Panel1: TPanel;//���������� ����������� Panel1-3 ����
    Panel3: TPanel;//TPanel. ������, ������������ �� �����. ���������� ������
    Panel2: TPanel;//����������  ����������

    DBGrid1: TDBGrid;//���������� ����������� DBGrid1-3 ����
    DBGrid2: TDBGrid;//TDBGrid. �������, ������������ ��������� ������� ������
    DBGrid3: TDBGrid;//����� ���������� SQL �������� ������������ Query1,
    //Query2, Query3 ���� TQuery, �������������� � ������ ������  DM ����
    //TDataModule

    procedure N2Click(Sender: TObject);           //���������� ��������-
    procedure SpeedButton1Click(Sender: TObject); //������������ �������
    procedure SpeedButton2Click(Sender: TObject); // ������ � ������� ����
    procedure SpeedButton3Click(Sender: TObject); //Sender ��������� �����
    procedure N3Click(Sender: TObject);           //��������� �������� ���
    procedure N4Click(Sender: TObject);           //���������
    procedure N6Click(Sender: TObject);           //
    procedure N8Click(Sender: TObject);           //
    procedure N10Click(Sender: TObject);          //
    procedure N9Click(Sender: TObject);           //
    procedure N11Click(Sender: TObject);          //
    procedure N5Click(Sender: TObject);           //
    procedure N7Click(Sender: TObject);           //
    procedure N12Click(Sender: TObject);          //

    procedure FormCreate(Sender: TObject);        //���������� ���������
    //������������� ��� ����������� ����� Form1. Sender ��������� �����
    //��������� �������� ��� ���������
  public
    dan_mas:Tdan_mas;      //�������� � ��������� ������ ��� ������� ������

    id:integer;             //����� ������ ��� �������������� ������ � ��
    redaktirovanie:boolean; //�������������� ��� ������� ������ � ���� �� ��

    procedure podshet(s__:real);  //���������� ���������, ����������� �����
    //���������� ������ �������� � �������� � ��������� ����� �� ��� ������
    //��������. ��������� ��������� �������� - ��������� ����� ����� � $
    function poisk(chislo:integer; mas:Pdan_mas):TKombin;  //����������
    //�������, ����������� ����� ����� �������� ����� ���������� ������
    //��������. ��������� ��������� ���������: chislo - ����������� �������,
    // mas - ��������� �� ������������ ������ ���� Tdan_mas
  end;

var
  Form1: TForm1; //���������� ���������� ���� TForm1, �.�. ������� �����

implementation  //����� ������������ �����, ������ ������ ����������

uses dat, sortirovka, variant_s, Unit1;  //�������� ����������� ������� �������

{$R *.DFM} //�������� ������������� ������ � ����������� ������ ����� ��������

//����������� �������, ����������� ����� ����� �������� ����� ����������
//������ ��������. ��������� ��������� ���������: chislo - ����������� �������,
// mas - ��������� �� ������������ ������ ���� Tdan_mas, � ������� ��� ����
//���� �������� chislo. ��������� ������ - ����� �������� � ������� dan_mas
function TForm1.poisk(chislo:integer; mas:Pdan_mas):TKombin;
var i:integer;  //�������
begin
  result.nomer:=0;        //����� ��������, ��������������� ����� �������� ��
  //������
  result.nnaydena:=false; //���� �������� �� ������
  //����� ���� ��������� ����� ���� ������� ������� ���� ������� ��������.
  //��������� ����� �� ������� �������� ������� mas^ �� ����������, ��� �����
  for i:=0 to length(mas^)-1 do //������������ �������� length(mas^)-1.
    begin                       //��������� ��������� ������� �� 0
      //���� ������� ���� �������� chislo ��������� �� ������, ������������
      //��������� i �������� ������� mas^[i].srok, �� ����������� ���������
      //��������
      if (mas^[i].srok=chislo) and mas^[i].rez then  //������ mas^ -
      //�������������� ���������, �.�. � ������ ������ ���������� �������
      //������� ���� ������� ��������. i - ������ �������� �������
        begin
          result.nomer:=i;       //������� ��������� ���� ��������
          result.nnaydena:=true; //���� �������� ������
        end;
    end;
end;

//����������� ���������, ����������� ����� ���������� ������ �������� � ��������
// � ��������� ����� �� ��� ������ ��������. ��������� ��������� �������� -
//��������� ����� ����� � $.
procedure TForm1.podshet(s__:real);
label 1,2;
var l, i, j:integer;  //����������� ����� �������, ��������
  nach_summa:real;    //��������� �����
  Variant_s:TVariant_s;  //������ �� ��� �� ������ ���������
  max:TMax; //��������� ������������ �����
  s:string; //�������������� ������ ���������
  kom:TKombin; //������ �� ���� ��������
begin
  nach_summa:=s__; //������� ��������� �����

  dan_mas:=nil;   //������� ������������ ������
  //�������� ������ ��� ��������� �������. ��� ������ - 0
  va:=nil; //������� ������������ ������ ���������� ������ ��������

  l:=length(varianti); //���������� ������ ������� ��������� ������ ��������
  //varianti. ����� �������� varianti � dan_mas - ����������.
  setlength(dan_mas, l); //����������� ������ ������� �������� ������ ���
  //��������� ������� �� ����� ������� varianti

  for i:=0 to length(varianti)-1 do //� ����� �� 1 �������� ������� dan_mas ��
  //���������� (����� ���������� - length(varianti)-1). ����� ��������
  //varianti � dan_mas - ����������.
    begin   //������� ������ dan_mas, ����������� ��� ��������� 0
      dan_mas[i].srok:=0;
      dan_mas[i].min_summa:=0;
      dan_mas[i].max_summa:=0;
      dan_mas[i].stavka:=0;
      dan_mas[i].nomer:=0;
      dan_mas[i].nomer1:=0;
      dan_mas[i].name_vkl:='';
      dan_mas[i].name_b:='';
      dan_mas[i].rez:=false;  //�� ������������ ������ ���� ��������
    end;

  //���� ����� ��������, ������ ����������� ����� �������� ������� �� �����
  //�������� ���������� s__, � ����� ��������� ������� ���� ������ �� �������
  //��������� ������ �������� varianti � ��
  for i:=0 to length(varianti)-1 do  //� ����� �� 1 �������� ������� dan_mas ��
  //���������� (����� ���������� - length(varianti)-1). ����� ��������
  //varianti � dan_mas - ����������. ��������� �������� ������ dan_mas:Tdan_mas
  //�������� � ��������� ������ ��� ������� ������
    begin
      //////////////////////////////////////////////////////////////////////////
      dan_mas[i].rez:=true;   //���������� ������ ���� ��������

      dm.Q_test.Close;      //��������� ������� �� Q_test. ���������� �� �����
      //Close
      dm.Q_test.SQL.Clear;  //������� ���������� SQL ������. ��������� �� �����
      //SQL.Clear
      //���������� ���� �������� � �������� i ������������� ������� dan_mas -
      //dan_mas[i].srok
      dan_mas[i].srok:=varianti[i]; //���������� �������
      //��������� ����� SQL ������ �� ������� vklad.db. ����������� ��� ������
      //����� ����� ������� �� ������� vklad.db, ��������������� �������: ����
      //�������� ����� �����, ������������� ���������� dan_mas[i].srok   �
      //����������� ����� ������ ������� �� ����� nach_summa. inttostr -
      //��������� ����������� �� ������ � ���������� �����, floattostr -
      //��������� ����������� �� ������������� � ���������� �����,
      dm.Q_test.SQL.Add('select * from "vklad.db" where ("vklad.db"."Srok"='+
                 inttostr(dan_mas[i].srok)+') and ("vklad.db"."Min_summa"<='+
                 floattostr(nach_summa)+')');
      dm.Q_test.Open; //��������� SQL ������

      //���� ���������� �������, ������������ ��������� dm.Q_test.RecordCount,
      //���� �� ������ ��������������� ���������, ���� �� ����
      if dm.Q_test.RecordCount<>0 then
        begin //�� ����������� ����� ����� ������� �� �� vklad.db ����������
        //������, ������� ������������
          //////////////////////////////////////////////////////////////////////
          max.stavka:=0; //������ - 0
          max.no:=0;     //����� ������ �� �� vklad.db - 0

          dm.Q_test.First; //��������� � ������ ������ � �� vklad.db
          for j:=1 to dm.Q_test.RecordCount do //� ����� �� ������ ������ ��
          //��������� ���� ������������ ������, ��������� ��������� ������
          //max.stavka � ����������� �� �� vklad.db
            begin
              if max.stavka < dm.Q_test.FieldByName('stavka').asfloat then
              //������ dm.Q_test.FieldByName('stavka').asfloat ��������
              //                      /                   \
              //                �������� ����          ��� ����
              //                ������                 ������
              //asfloat - ������������, asinteger - �����
                begin  //���� ����� ������ � ������� % �������, ��
                  //����������� �� % �������� % ������
                  max.stavka:=dm.Q_test.FieldByName('Stavka').asfloat; //
                  //����������� �� ����� ������ �������� % ������
                  max.no:=dm.Q_test.FieldByName('no').asinteger;
                end;
               dm.Q_test.Next; //��������� � ��������� ������ � �� vklad.db
            end;

          //���� ����� ������������ ���������� ������, ��
          if (max.no<>0) and (max.stavka<>0) then
            begin //��������� � ��������� ������������ ������
              if dm.Q_test.Locate('no', max.no, [loCaseInsensitive] ) then
              //��������� Locate ��������� �������� 'No' - �������� ����,
              //max.no - �������� ����, [loCaseInsensitive] - ������������
              //�������� ������. ��������� ��������� - ������� � ���������
              //������
                begin //���� ������ ������� ���������� � ������� dan_mas
                //�������� ������ ��� ��������� �������
                  dan_mas[i].min_summa:= //����������� �����
                                     dm.Q_test.FieldByName('min_summa').asfloat;

                  dan_mas[i].max_summa:= //������������ �����
                                     dm.Q_test.FieldByName('max_summa').asfloat;
                  dan_mas[i].stavka:=dm.Q_test.FieldByName('Stavka').asfloat;
                  //������
                  dan_mas[i].nomer:=dm.Q_test.FieldByName('nr').asinteger;;
                  //����� ������ � �� vklad.db
                  //������ dm.Q_test.FieldByName('stavka').asfloat ��������
                  //                               /           \
                  //                      �������� ����      ��� ����
                  //                     ������                 ������
                   //asfloat - ������������, asinteger - �����

                end
              else
                begin //���� ������� ���, �� ������ ��������������� ���������
                  showmessage('��������, �� �� ������� �� ������ �������� '+
                  inttostr(dan_mas[i].srok)+
                  ' ������ � ������������ ���������� ������� �� �������.');
                  dan_mas[i].rez:=false; //������ � ����� ������ �������� ��� �
                  //��. inttostr - �������������� �� ������ � ��������� ���
                end;

            end
          else
            begin     //���� ������� ���, �� ������ ��������������� ���������
              showmessage('��������, �� �� ������� �� ������ �������� '+
              inttostr(dan_mas[i].srok)+' ���������� ������ ����� 0.');
              dan_mas[i].rez:=false; //������ � ����� ������ �������� ��� � ��
              //inttostr - �������������� �� ������ � ��������� ���
            end;

          //���� ����� ������ � ������������ ���������� �������, ���������������
          //������������ ���� ��������, �� ���� �������� ������ �������������
          //���������� �������� � �������� ����� ����������� ���� �����
          if dan_mas[i].rez then
            begin
              dm.Q_test.Close; //��������� ������� �� Q_test. ���������� ��
              //����� Close
              dm.Q_test.SQL.Clear;//������� ���������� SQL ������. ���������� ��
              // ����� SQL.Clear
              //��������� ����� SQL ������ �� ������� vkl_nam.db. �����������
              //��� ������ ����� ����� ������� �� ������� vkl_nam.db,
              //��������������� �������: "vkl_nam.db"."no" - ����� ������ �����
              //���������� ���� ������ dan_mas[i].nomer. �.�. ���� �����
              //����� (�������� �����) � ������� vkl_nam.db- "��������" �������
              //�������� ������������ % ������ �� ������� vklad.db
              dm.Q_test.SQL.Add(
                          'select * from "vkl_nam.db" where ("vkl_nam.db"."no"='
              +inttostr(dan_mas[i].nomer)+')');
              //inttostr - �������������� �� ������ � ��������� ���
              dm.Q_test.Open; //��������� SQL ������

              //���� ���������� �������, ������������ ���������
              //dm.Q_test.RecordCount, ���� �� ������ ��������������� ���������,
              // ���� �� ����
              if dm.Q_test.RecordCount<>0 then
                begin  //��������� �������� ������ FieldByName('n').asstring �
                  //�������� ������� dan_mas[i].name_vkl. ����� �����
                  //FieldByName('nr').asinteger � dan_mas[i].nomer1. ��������
                  //����� �� ���� n, ����� ����� �� ���� nr ������� vkl_nam.db
                  dan_mas[i].name_vkl:=dm.Q_test.FieldByName('n').asstring;
                  dan_mas[i].nomer1:=dm.Q_test.FieldByName('nr').asinteger;

                  //������ dm.Q_test.FieldByName('nr').asfloat ��������
                  //                             /           \
                  //                      �������� ����      ��� ����
                  //                     ������                 ������
                  //asinteger - �����, asstring - ���������

                  //��������� ����� �������� �����
                  dm.Q_test.Close; //��������� ������� �� Q_test. ���������� ��
                  //����� Close
                  dm.Q_test.SQL.Clear;//������� ���������� SQL ������.
                  //���������� �� ����� SQL.Clear
                  //��������� ����� SQL ������ �� ������� bank.db. �����������
                  //��� ������ ����� ����� ������� �� ������� bank.db,
                  //��������������� �������: "bank.db"."no" - ����� ����� �����
                  //���������� ���� ������ dan_mas[i].nomer1. �.�. ���� �����
                  //����� (�������� �����) � ������� bank.db- "��������" ������
                  //�� ������� vkl_nam.db, �������� ������������ % ������ �
                  //��������� � ������� vklad.db
                  dm.Q_test.SQL.Add(
                                'select * from "bank.db" where ("bank.db"."no"='
                                +inttostr(dan_mas[i].nomer1)+')');
                  dm.Q_test.Open; //��������� SQL ������

                  //���� ���������� �������, ������������ ���������
                  //dm.Q_test.RecordCount, ���� �� ������ ���������������
                  //���������, ���� �� ����
                  if dm.Q_test.RecordCount<>0 then
                    begin  //��������� �������� ����� FieldByName('n').asstring
                      //� �������� ������� dan_mas �������� ������ ��� ���������
                      // ������� dan_mas[i].name_b
                      dan_mas[i].name_b:=dm.Q_test.FieldByName('n').asstring;

                      //������ dm.Q_test.FieldByName('nr').asfloat ��������
                      //                             /           \
                      //                      �������� ����      ��� ����
                      //                     ������                 ������
                      //asstring - ���������
                    end
                  else  //���� ���� �� ������, �� ������ ���������������
                    begin //���������
                      showmessage('��������, �� � �� bank.db �����.');
                      dan_mas[i].rez:=false; //���� �������� �� ����������
                    end;
                end
              else   //���� ����� �� ������, �� ������ ���������������
                begin //���������
                  showmessage('��������, �� � �� vkl_nam.db �����.');
                  dan_mas[i].rez:=false; //������ � ����� ������ �������� ��� �
                  //��, ���� �������� �� ����������
                end;

            end
          //////////////////////////////////////////////////////////////////////
        end
      else //���� ���� �������� �� ������, �� ������ ��������������� ���������
        begin
          showmessage('��������, �� ������� �� ������ �������� '+
          inttostr(dan_mas[i].srok)+' ������(��) ���.');
          dan_mas[i].rez:=false; //������ � ����� ������ �������� ��� � ��,
          //���� �������� �� ����������. inttostr - �������������� �� ������ �
          //��������� ���
        end;

      //���� ������ ���� ��������, ��
      if dan_mas[i].rez then   //��������� ��� � ������������ ������ ����������
      //������ �������� va
        begin
          l:=length(va); //���������� ������ ������� ��������� ������ ��������
          setlength(va, l+1); //����������� ������ ������� ������ �������� va
          //�� 1 �������
          va[l]:=dan_mas[i].srok; //��������� ���� ������� (���� ��������) �
          //������������ ������ va
        end;

      //////////////////////////////////////////////////////////////////////////
    end;

  varianti:=nil; //������� ������������ ������ ���������� ������ ��������
  varianti:=va;  //����������� ��������� ������ ���������� ������ �������� va
  //����������� ������� ���������� ������ �������� varianti

  //dan_mas= array [0..3] of TIs_dan; //0- 3, 1- 6, 2- 9, 3- 12 ���
  //Variant_s:TVariant_s;  //������ �� ��� �� ������ ��������� � �����������
  //������ ��������

  //���� ��� ������ ��������, ���������� ����������� ����� ������������� �������
  //va, �� ����������� ���������, ����������� � ����� 1
  if length(va)=0 then
    goto 1;

  //���� ������� ����, �� ����������
  Polucit_Variants(12); //��������� ���� ��������� ��������� �������� �����
  //����������� �����, ������������ � ���������,  - 12 �������
  //��������� - ����� ���������� ������ ��������, ����������� � ������������
  //������� Sroki, ��� ����� - ����� ���� ��������� ��������� ����,
  //�������������� �����, �  - 12 �������

  //���� ����� ��������� ���������� ������ �������� ���, �� �����������
  // ���������, ����������� � ����� 1. ���������� ��������� ������������
  //������ ������������� ������� Sroki
  if length(Sroki)=0 then
    goto 1;

  //���� ��������  ���������� ������ �������� ����, �� ������� ��� ������
  //���������� �����
  l:=length(Sroki); //���������� ������ ������� ���������� ������ ��������
  Variant_s:=nil;   //������� ������������ ������ ������� �� ������ ��������� �
  //����������� ������ ��������
  setlength(Variant_s, l); //������������� ������ ������� ������� �� ������
  //��������� � ����������� ������ �������� Variant_s ������ ������� �������
  //���������� ������ �������� Sroki

  //������� �����

  //���� ������������ ������ Variant_s  - ����������, �� ��������� �� �������
  //������ �� nil (nil - �����), �������� ����������� ���������� assigned,
  // ����������� ��������� ������� Variant_s
  if assigned(Variant_s) then
  //���� ������ ����������, �� � ����� �� ������ ���������� ������ �������� ��
  //���������, ������� ������������ ������ ������� Variant_s, �.�.
  //length(Variant_s)-1. ��������� �� 0.
    for i:=0 to length(Variant_s)-1 do
      begin
        Variant_s[i].rez:=true;     //����� ������� ���� ����� - �� ����

        Variant_s[i]. doxod :=nach_summa;     //����������� ����� ��
        //�������� ����� $

        l:=length(Sroki[i]);   //���������� ����� ���������� ������ ��������,
        //�.�. ���������� ���� ������ �������� ����� ����������

        Variant_s[i].komb:=nil;  //������� ������������ ������ ��������� ������
        //��������, ���������� ��� ������� ���������
        setlength(Variant_s[i].komb, l); //������������� ������ �������
        //��������� ������ ��������, ������ ����� ������� ���������� ������
        //�������� Sroki[i]

        //� ����� �� ������� ����� �������� �� ����������, ������������� ������
        //������� Variant_s[i].komb, �.�. length(Variant_s[i].komb)-1. ���������
        //�� ����
        for j:=0 to length(Variant_s[i].komb)-1 do
          begin
            //���������� ���������� ������� ����� �������� � ����� ����������
            //�������� � ���� � ������� ������������� ������� ���������� ������
            //�������� Variant_s[i].komb[j]
            Variant_s[i].komb[j].chislo:=Sroki[i][j].chislo; //����
            //��������
            Variant_s[i].komb[j].kol:=Sroki[i][j].kol; //����� ����������
            //����� ��������

            //������� ����� �� ������������ ���� ��������
            //Variant_s[i].komb[j].chislo , �� ��������� �������� �� ���� ����
            //��������� ���� �������� � ������� ������
            kom:=poisk(Variant_s[i].komb[j].chislo, @dan_mas);
            if kom.nnaydena then //���� ����� ������� �������
              begin
                //� ����� �� ������� �������� �� ���������� ������� �����
                for l:=1 to Variant_s[i].komb[j].kol do
                  Variant_s[i].doxod:=
                  (dan_mas[kom.nomer].srok * dan_mas[kom.nomer].stavka/1200 +1)*
                  Variant_s[i].doxod;
                  //��� kom.nomer - ����� �������� �� ������ ��������
                  //Variant_s[i].komb[j].chislo � ������� dan_mas,
                  //dan_mas[kom.nomer].srok - ���� ��������,
                  //dan_mas[kom.nomer].stavka - ���������� ������ �� �������
                  //����� �������, ������ �� �������� kom.nomer �������������
                  //������� dan_mas
              end
            else
              begin  //���� ���� �������� �� ������
                Variant_s[i].rez:=false;  //����� - ����
                Variant_s[i]. doxod :=nach_summa;     //����������� ����� ��
                //�������� ����� $
                goto 2; //������� �� ����� ������� ������
              end;

          end;
2:
        Variant_s[i]. doxod :=Variant_s[i]. doxod - nach_summa;//���������
        //����� �� �������� �����
      end;


  //������� ������������ �����
  //max.stavka - ������������ ����� �� 1 ���
  max.stavka:=0;
  //max.no - ���������� ����� ���������� � ������� Variant_s

  //� ����� �� ������ ���������� ������ �������� �� ��������� ������������
  //������ ������� Variant_s, �.�. length(Variant_s)-1. ��������� �� 0.
  //������� ������������ ����� ��� ������ ���������� ������ �������� � ���������
  //�����
  for i:=0 to length(Variant_s)-1 do
  //���� ����� Variant_s[i].doxod �� ������� ���������� ������ �������� ������
  //��������� ������ max.stavka, � ����� ���������� ������ �������� ���������,
  //�� ��������� ������ max.stavka ����������� ���� �����, � ����� �����������
  //������ ���������� � ���������� ������� max.no - ����� ���������� � ������
  //Variant_s, �.�. i.
    if (Variant_s[i].doxod > max.stavka) and Variant_s[i].rez then
      begin
        max.stavka:=Variant_s[i].doxod;
        max.no:=i; //����� ����������
      end;

  //���� ��������� ����� �� ����, �� ������ �����
  if max.stavka <>0 then
    begin
      //max.no   s - �������� ���������� � ��������
      s:='����� �������� ��������� � ������� ���� �������� �����: '#13#10#13#10;
      //�� ������� ����� �������� �� ���������, ��� ������ ������������
      //������ ������������� ������� ���������� ������ ��������
      //Variant_s[max.no].komb, ����������� ��������� ��������. max.no - �����
      //���������� ������ �������� � ������� Variant_s � ������������ �������
      For i:=0 to length(Variant_s[max.no].komb) - 1 do
        begin
          //��������� ���� �������� � ������� ������
          kom:=poisk(Variant_s[max.no].komb[i].chislo, @dan_mas);

          //���� ���� �������� ������
          if kom.nnaydena then
            begin   //���������� ���������� ���������� ����� ��������
              s:=s+' '+inttostr(Variant_s[max.no].komb[i].kol)+

              ' ���(�) �� '+ //���������� ���������� ������� ����� ��������
              inttostr(Variant_s[max.no].komb[i].chislo)+
                               //���������� �������� �����
              ' ���. � ����� "'+dan_mas[kom.nomer].name_b+
                             //���������� �������� ������
              '" �� ����� "'+dan_mas[kom.nomer].name_vkl+'" �� '+
                             //���������� ����������� �����
              floattostr(dan_mas[kom.nomer].min_summa);
              //���������� ������������ �����
              if dan_mas[kom.nomer].max_summa<dan_mas[kom.nomer].min_summa then
              //���� ������������ ����� �� ������
                s:=s+' $ � �����.'#13#10#13#10
              else
              //���� ������������ ����� ������
              s:=s + ' �� '+floattostr(dan_mas[kom.nomer].max_summa)+
              ' $.'#13#10#13#10;
            end;
        end;
      //����������� ����� ������������� ����� 8 ����� � 3 ������� �����
      s:=s+'����� ��������: '+ Format('%8.3f', [max.stavka])+' $';
      //������ ��������� � ������������ ��������
      showmessage(s);
    end
  else //���� ��� ������� � ��, �� ������ ���������
    showmessage('������ ����������� � ��. ������ ���������� ����������.');
1:

end;

//����������� ���������-����������� ��� ������ ���� N2, �������������� ���
//������������� ������� onClick
procedure TForm1.N2Click(Sender: TObject);
begin
  close;  //��������� ���������
end;
//���������� ���������-����������� ������� ������ SpeedButton1.
//��������� �������� �� ���������� ���������� � ������, �������, ����������
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  //���������� �������� ����������� ��� ������� OnDataChange � ���������� ������
  //dm.DataSource1 � dm.DataSource2. ��� ���������� ������ dm.DataSource1
  //��������� DM.Query1Change, ��� dm.DataSource2 - DM.Query2Change.
  //��������� ��� ����������� ���� ������ "1 �� ������" ����� 3 ���������
  //��� ������: "bank.db"."no"="vkl_nam.db"."nr",
  //"vkl_nam.db"."no"="vklad.db"."nr". bank.db - ���������� � ��������� ������,
  //vkl_nam.db - ���������� � ��������� �������, vklad.db - ���������� �
  //����������
  dm.DataSource1.OnDataChange:=DM.Query1Change;
  dm.DataSource2.OnDataChange:=DM.Query2Change;

  dm.Query3.Close;  //��������� ������� � ������������
  dm.Query2.Close;  //��������� ������� � ���������� �������

  dm.Query1.Close; //��������� ������� � ���������� ������ Query1. ���������� ��
                  //����� Close
  dm.Query1.SQL.Clear; //������� ���������� SQL ������. ���������� �� �����
  //SQL.Clear
  //��������� ����� SQL ������ �� ������� bank.db. ����������� ��� ������ �����
  //����� ���� ������� �� ������� bank.db, �.�. ���� ������������ ������
  dm.Query1.SQL.Add('select * from bank.db');
  dm.Query1.Open;  //��������� SQL ������.

end;

//���������� ���������-����������� ������� ������ SpeedButton2.
//��������� �������� �� ���������� ���������� � ������, �������, ����������
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  //���������� �������� ����������� ��� ������� OnDataChange � ���������� ������
  //dm.DataSource1 � dm.DataSource2. ��� ���������� ������ dm.DataSource1
  //� dm.DataSource2 - nil.
  //��������� ��� �������� ���� ������ "1 �� ������" ����� 3 ���������
  //��� ������: "bank.db"."no"="vkl_nam.db"."nr",
  //"vkl_nam.db"."no"="vklad.db"."nr". bank.db - ���������� � ��������� ������,
  //vkl_nam.db - ���������� � ��������� �������, vklad.db - ���������� �
  //����������

  dm.DataSource1.OnDataChange:=nil;
  dm.DataSource2.OnDataChange:=nil;

  dm.Query3.Close; //��������� ������� � ������������
  dm.Query2.Close; //��������� ������� � ���������� �������
  dm.Query1.Close; //��������� ������� � ���������� ������ Query1. ���������� ��
                  //����� Close
end;

//���������� ���������-����������� ������� ������ SpeedButton3.
//��������� ������ ���������� ������ ��� �������� �� 12 ��������
procedure TForm1.SpeedButton3Click(Sender: TObject);
var s_:string;  //
    ss:real;    //��������� ����� ������
begin
  s_:='1000'; //�������� �� �������� ��������� ����� ������ 1000 $
  ss:=1000;
  //����� ����������� ���� ��� ����� ��������� ����� ������ ����������� � s_
  if InputQuery('��������� ����� ������','�����, $' ,s_) then
    begin
      try  //��������� ��������� ������ ����� ��������� ����� ������
        ss:=strtofloat(s_); // strtofloat - �������������� ������ s_ �
        //������������ ����� ss
      except
        //���� ��������� ������ �� ������� ���������
        showmessage('����� ������� � ��������');
      end;
      //���������� �������� ����������� ��� ������� OnDataChange � ����������
      //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
      //dm.DataSource1 � dm.DataSource2 - nil. ��������� ��� �������� ����
      //������ "1 �� ������" ����� 3 ��������� ��� ������:
      //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr".
      //bank.db - ���������� � ��������� ������, vkl_nam.db - ���������� �
      //��������� �������, vklad.db - ���������� � ����������

      dm.DataSource1.OnDataChange:=nil;
      dm.DataSource2.OnDataChange:=nil;

      //���������� ����� Form2 � ��������� ������, �.�. ����� �������� ������
      //����� Form2, � ������ ����� ��������� �� ��������.
      Form2.ShowModal;
      try //��������� ��������� ������ � ��������� ������� ����������� ������
        podshet(ss); //������ ��������� ������� ����������� ������
      except
        //���� ��������� ������ ������� ���������
        showmessage('������ � ��������� ������� ����������� ������');
      end;

      //���������� �������� ����������� ��� ������� OnDataChange � ����������
      //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
      //dm.DataSource1 ��������� DM.Query1Change, ��� dm.DataSource2 -
      //DM.Query2Change. ��������� ��� ����������� ���� ������ "1 �� ������"
      //����� 3 ���������
      dm.DataSource1.OnDataChange:=DM.Query1Change;
      dm.DataSource2.OnDataChange:=DM.Query2Change;

    end;
end;

//����������� ���������-����������� ��� ������ ���� N2, �������������� ���
//������������� ������� onClick. Sender ��������� ����� ��������� �������� ���
//���������. �������� �����
procedure TForm1.N3Click(Sender: TObject);
var s:string; //�������� �����
begin
  s:='';
  //����� ����������� ���� ��� ����� �������� �����, �������� ����������� � s
      if InputQuery('�������� ������ �����','��������:' ,s) then
        begin
          s:=trim(s); //�������� �������� � ����������� �������� � ������ �
          //����� ������ s
          if s<>'' then   //���� ������ �� ������
            begin
              s:=trim(s); //�������� �������� � ����������� �������� � ������ �
             //����� ������ s
         //���������� �������� ����������� ��� ������� OnDataChange � ����������
            //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
            //dm.DataSource1 � dm.DataSource2 - nil. ��������� ��� �������� ����
              //������ "1 �� ������" ����� 3 ��������� ��� ������:
           //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr"
            //bank.db - ���������� � ��������� ������, vkl_nam.db - ���������� �
              //��������� �������, vklad.db - ���������� � ����������

              dm.DataSource1.OnDataChange:=nil;
              dm.DataSource2.OnDataChange:=nil;


              dm.Query3.Close; //��������� ������� � ������������
              dm.Query2.Close; //��������� ������� � ���������� �������
              //��������� ������� � ���������� ������ Query1. ���������� ��
              dm.Query1.Close; //����� Close
              dm.Query1.SQL.Clear; //������� ���������� SQL ������.
              //���������� �� ����� SQL.Clear
              //��������� ����� SQL ������ �� ������� bank.db. ����������� ���
              //������ ����� ����� ���� ������� �� ������� bank.db, � �������
              //�������� ����� ���� n ����� ������ ��������� ���������� S
              dm.Query1.SQL.Add(
              'select * from "bank.db" where ("bank.db"."n" = "'+s+'")');
              dm.Query1.Open; //��������� SQL ������

              //���� ��� ����� �������� ������, �.�. ���������� �������
              //������ ������ RecordCount ����� 0
              if dm.Query1.RecordCount=0 then
                begin
                  dm.Query1.Insert; //��������� ����� ������
                  DM.Query1.FieldByName('n').asstring:=s; //������� � ���������
                  //���� n �������� ����� �� ���������� S
                  dm.Query1.Post; //����������� ��������������
                end
              else //���� �������� ����� ������� � �� bank.db, �� ������
              //��������������� ���������
                showmessage(
                         '��������, �� ���� � ����� ��������� ��� ����������.');

        //���������� �������� ����������� ��� ������� OnDataChange � ����������
              //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
              //dm.DataSource1 ��������� DM.Query1Change, ��� dm.DataSource2 -
              //DM.Query2Change. ��������� ��� ����������� ���� ������ "1 ��
              // ������" ����� 3 ���������
              dm.DataSource1.OnDataChange:=DM.Query1Change;
              dm.DataSource2.OnDataChange:=DM.Query2Change;

              dm.Query1.Close; //��������� ������� � �������
              dm.Query1.SQL.Clear; //������� ���������� SQL ������.
              //���������� �� ����� SQL.Clear
              //��������� ����� SQL ������ �� ������� bank.db. ����������� ���
              //������ ����� ����� ���� ������� �� ������� bank.db
              dm.Query1.SQL.Add('select * from bank.db');
              dm.Query1.Open;//��������� SQL ������
              //��������� � ��������� ������
              dm.Query1.Locate('n', s, [loCaseInsensitive] );
              //��������� Locate ��������� �������� 'N' - �������� ����,
              //s - �������� ����, [loCaseInsensitive] - ������������
              //�������� ������. ��������� ��������� - ������� � ���������
              //������
            end;

        end;
end;
//����������� ���������-����������� ��� ������ ���� N4, �������������� ���
//������������� ������� onClick. Sender ��������� ����� ��������� �������� ���
//���������.  ��������� �������� �����
procedure TForm1.N4Click(Sender: TObject);
var s:string;  //�������� �����
begin
  s:='';
  //��������� ��� ������� ������ bank.db �������. ��� ������������ ���������
  //Active ���������� DM.Query1. ���� ������ �� ������� �������
  if DM.Query1.Active then
  //��������� ��� ����� ������ �� ������. ��������� ��� ����������
  //������� ������ ������ DM.Query1.RecordCount �� ����.
    if dm.Query1.RecordCount<>0 then
      begin //���� ������ ����
        s:=DM.Query1.FieldByName('n').asstring; //��������� � ���������� s
        //�������� ����� �� ���� DM.Query1.FieldByName('n').asstring
          //������� ���������� ���� ������� ������ �������� �����, �����
          //�������� ����������� � ���������� s
          if InputQuery('��������� �������� �����','��������:' ,s) then
            begin
              s:=trim(s); //�������� �������� � ����������� �������� � ������ �
             //����� ������ s
              if s<>'' then  //���� �������� ����� �� ������
                begin
         //���������� �������� ����������� ��� ������� OnDataChange � ����������
            //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
            //dm.DataSource1 � dm.DataSource2 - nil. ��������� ��� �������� ����
              //������ "1 �� ������" ����� 3 ��������� ��� ������:
           //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr"
            //bank.db - ���������� � ��������� ������, vkl_nam.db - ���������� �
              //��������� �������, vklad.db - ���������� � ����������

                  dm.DataSource1.OnDataChange:=nil;
                  dm.DataSource2.OnDataChange:=nil;

                  dm.Q_test.Close; //��������� ������� � �������
                  dm.Q_test.SQL.Clear; //������� ���������� SQL ������.
                  //���������� �� ����� SQL.Clear
                //��������� ����� SQL ������ �� ������� bank.db. ����������� ���
                  //������ ����� ����� ���� ������� �� ������� bank.db. ��������
                  //������ ������� ����� ��������� ���������� s
                  dm.Q_test.SQL.Add(
                       'select * from "bank.db" where ("bank.db"."n"="'+s+'")');
                  dm.Q_test.Open; //��������� SQL ������

                  //��������� ��� ����� ������ �� ������. ��������� ���
                  //���������� ������� ������ ������ DM.Q_test.RecordCount �����
                  //���������� SQl ������� �� ����.
                  if dm.Q_test.RecordCount=0 then
                    begin  //���� ����
                      dm.Query1.Edit; //����������� ������ � ������� bank.db
                      DM.Query1.FieldByName('n').asstring:=s; //��������
                      //�������� ���� n, �� ��������� ���������� s
                      dm.Query1.Post; //����������� �������������� ������ �
                      //������� bank.db
                    end
                  else  //���� �� ���� ������ ��������������� ���������
                    showmessage(
                         '��������, �� ���� � ����� ��������� ��� ����������.');

                  dm.Q_test.Close; //��������� ������� � ���������� ��������
                  //���������� �������� ����������� ��� ������� OnDataChange �
                  //���������� ������ dm.DataSource1 � dm.DataSource2. ���
                  //��������� ������ dm.DataSource1 ��������� DM.Query1Change,
                  //��� dm.DataSource2 - DM.Query2Change. ��������� ���
                  //����������� ���� ������ "1 �� ������" ����� 3 ���������
                  dm.DataSource1.OnDataChange:=DM.Query1Change;
                  dm.DataSource2.OnDataChange:=DM.Query2Change;
                end;
            end;
      end;
end;
//����������� ���������-����������� ��� ������ ���� N6, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. �������� ������
procedure TForm1.N6Click(Sender: TObject);
var s:string; //�������� ������
begin
    s:='';
    //��������� ��� ������� ������ bank.db �������. ��� ������������ ���������
    //Active ���������� DM.Query1. ���� ������ �� ������� �������
    if DM.Query1.Active then   //���� �������
    //������� ���������� ���� ������� ������ �������� ������, �����
    //�������� ����������� � ���������� s
      if InputQuery('�������� ������ ������','�������� ������:' ,s) then
        begin
          s:=trim(s); //�������� �������� � ����������� �������� � ������ �
          //����� ������ s

          //��������� ����� ������� � ��������� ������ s

          //���� �������� ������ �� ������ � ���������� ����� � ������� bank.db
          //������������� ������ ������������ ��������� ���������� ������� �
          //������� bank.db - DM.Query1.RecordCount
          if (s<>'') and (DM.Query1.RecordCount<>0) then
            begin
              dm.DataSource2.OnDataChange:=nil; //�� ������� ���������� �����
              // "1 �� ������" ����� 2 ��������� ���� ������ (vkl_nam.db -
              //���������� � ��������� �������, vklad.db - ���������� �
              //����������): "vkl_nam.db"."no"="vklad.db"."nr"
              dm.Query3.Close; //��������� ������� ����������

              dm.Query2.Close; //��������� ������� �������
              dm.Query2.SQL.Clear; //������� ���������� SQL ������.
             //��������� ����� SQL ������ �� ������� vkl_nam.db. ����������� ���
              //������ ����� ����� ���� ������� �� ������� vkl_nam.db, ��������
              //������� ������� ����� ��������� ���������� s, � �����
              //������������ � ����� ����� (������������ ��������� ���� nr �
              //������� vkl_nam.db � ��������� ���� no � ������� bank.db).
              dm.Query2.SQL.Add(
                       'select * from "vkl_nam.db" where ("vkl_nam.db"."n"="'+s+
                       '") and ("vkl_nam.db"."nr"="'+
                       Dm.Query1.FieldByName('no').asstring+'")');
              dm.Query2.Open; //��������� SQL ������

              //��������� ��� ����� ������ �� ������. ��������� ���
              //���������� ������� ������ ������ DM.Query2.RecordCount �����
              //���������� SQl ������� �� ����.
              if dm.Query2.RecordCount=0  then
                begin  //���� ��� �������
                  dm.Query2.Insert;  //��������� 1 ������ � ������� vkl_nam.db
                  Dm.Query2.FieldByName('n').asstring:=s; //���� n, �����������
                  //������ ����������� �������� ������ �� ���������� s
                  //���� ����� nr � �������� bank.db, ����������� ������
                  //����������� �������� �� ���� no ������� bank.db
                  DM.Query2.FieldByName('nr').asinteger:=
                                          DM.Query1.FieldByName('no').asinteger;
                  dm.Query2.Post; //����������� �������������� ������
                end
              else  //���� ������ ����, ������ ���������
                showmessage(
                        '��������, �� ����� � ����� ��������� ��� ����������.');

              //��������������� ����� "1 �� ������" ����� 2 ��������� ����
              //������ (vkl_nam.db - ���������� � ��������� �������, vklad.db -
              //���������� � ����������): "vkl_nam.db"."no"="vklad.db"."nr"
              dm.DataSource2.OnDataChange:=DM.Query2Change;

              dm.Query2.Close; //��������� ������� � ��������
              dm.Query2.SQL.Clear; //������� ���������� SQL ������.
             //��������� ����� SQL ������ �� ������� vkl_nam.db. ����������� ���
              //������ ����� ����� ���� ������� �� ������� vkl_nam.db,
              //������������ � ����� ����� (������������ ��������� ���� nr �
              //������� vkl_nam.db � ��������� ���� no � ������� bank.db).
              dm.Query2.SQL.Add(
                        'select * from "vkl_nam.db" where ("vkl_nam.db"."nr"='+
                        DM.Query1.FieldByName('no').asstring+')');
              dm.Query2.Open; //��������� SQL ������
              //��������� � ���������� ������
              dm.Query2.Locate('n', s, [loCaseInsensitive] )
              //��������� Locate ��������� �������� 'N' - �������� ����,
              //s - �������� ����, [loCaseInsensitive] - ������������
              //�������� ������. ��������� ��������� - ������� � ���������
              //������
            end;
        end;
end;
//����������� ���������-����������� ��� ������ ���� N8, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. ��������� �������� ������.
procedure TForm1.N8Click(Sender: TObject);
var s:string;
begin
  //��������� ��� ���������� ���� � ������������� ����� � ���� �����, ��� ������
  //������ �� ������, �.�.  ������� bank.db � vkl_nam.db �������. ���
  //����������� ��������� ������ DM.Query1.Active - ��� ������� bank.db �
  //DM.Query2.Active - ��� vkl_nam.db.
  if DM.Query1.Active and DM.Query2.Active then //���� ������� �������
  //��������� ��� ���������� ������� ������� ������ RecordCount ��� ����� ������
  //�� ����
    if (dm.Query2.RecordCount<>0) and (DM.Query1.RecordCount<>0) then
        begin //���� ���������� ������� �� �������, �.�. ���������� ����� �
        //�����
          s:=DM.Query2.FieldByName('n').asstring; //��������� ����������
          //�������� ������ � ��������� ���������� s
          //������� ���������� ���� ������� ������ �������� �������, �����
          //�������� ����������� � ���������� s
          if InputQuery('��������� �������� ������','�������� ������:' ,s) then
            begin
              s:=trim(s); //�������� �������� � ����������� �������� � ������ �
              //����� ������ s
              //���� �������� ������ �� ������ � ������� ������� ������ bank.db,
              //�.�. �������� DM.Query1.Active ����������� � true
              if (s<>'') and (DM.Query1.Active) then
                begin
                  //���������� ��������-���������� ��� ������� OnDataChange �
                  //��������� ������ dm.DataSource2. ��� ��������� ������
                  //dm.DataSource2 - nil. ��������� ��� �������� ����� "1 ��
                  //������" ����� 2 ��������� ��� ������:
                  //"vkl_nam.db"."no"="vklad.db"."nr"
                  //vkl_nam.db - ���������� � ��������� �������, vklad.db -
                  //���������� � ����������
                  dm.DataSource2.OnDataChange:=nil;

                  dm.Q_test.Close; //��������� �������
                  dm.Q_test.SQL.Clear;  //������� ���������� SQL ������.
             //��������� ����� SQL ������ �� ������� vkl_nam.db. ����������� ���
                 //������ ����� ����� ���� ������� �� ������� vkl_nam.db,
                 //������������ � ����� ����� (������������ ��������� ���� nr �
                 //������� vkl_nam.db � ��������� ���� no � ������� bank.db) �
                 //������� ���������� �������� ������ s.
                  dm.Q_test.SQL.Add(
                       'select * from "vkl_nam.db" where ("vkl_nam.db"."n"="'+s+
                       '") and ("vkl_nam.db"."nr"="'+
                       Dm.Query1.FieldByName('no').asstring+'")');
                  dm.Q_test.Open; //��������� SQL ������
                  //���������, ��� ����� ������ �� ������. ��������� ���
                  //���������� ������� ������ ������ DM.Q_test.RecordCount �����
                  //���������� SQl ������� �� ����.
                  if dm.Q_test.RecordCount=0 then
                    begin //���� ������� ���
                      dm.Query2.Edit; //����������� ������ � �� vkl_nam.db
                      DM.Query2.FieldByName('n').asstring:=s;//���� n,
                      //������������� ������ ����������� �������� ������ ��
                      //���������� s.
                      dm.Query2.Post; //����������� �������������� ������
                    end
                  else //���� ������ ����, ������ ���������
                    showmessage(
                        '��������, �� ����� � ����� ��������� ��� ����������.');

                  dm.Q_test.Close; //��������� �������
                  //��������������� ����� "1 �� ������" ����� 2 ��������� ����
               //������ (vkl_nam.db - ���������� � ��������� �������, vklad.db -
                  //���������� � ����������): "vkl_nam.db"."no"="vklad.db"."nr"
                  dm.DataSource2.OnDataChange:=DM.Query2Change;
                end;

            end;
        end;
end;

//����������� ���������-����������� ��� ������ ���� N10, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. �������������� ���������.
procedure TForm1.N10Click(Sender: TObject);
begin
  //��������� ��� ���������� ����� � ������������� �������� � ���� ������, ���
  //������ ������ �� ������, �.�.  ������� vkl_nam.db � vklad.db �������. ���
  //����������� ��������� ������ DM.Query2.Active - ��� ������� vkl_nam.db �
  //DM.Query3.Active - ��� vklad.db.
  if DM.Query2.Active and DM.Query3.Active then
  //���������, ��� ���������� ������� ������� ������ RecordCount ��� �����
  //������ �� ����
    if (DM.Query2.RecordCount<>0) and (DM.Query3.RecordCount<>0) and
    DM.Query3.Active then
      begin  //���� ���������� ������� �� �������, �.�. ���������� �������� �
        //������
        //���������� ����� ������������� ������ ��������� �� ������� vklad.db �
        //���������� id
        id:=DM.Query3.FieldByName('no').asinteger;
        dm.Query3.Edit; //�������� �������������� ������ ��������� �� �������
        //vklad.db
        redaktirovanie:=true; //�������� ���������� redaktirovanie �����������
        //true - �������������� ���������
        f_sv.ShowModal;  //��������� ����� �������������� ��������� � ���������
        //������, �.�. ����� �������� ������ ���� ��� ����� �������������� f_sv
      end;

end;
//����������� ���������-����������� ��� ������ ���� N9, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. �������� ���������
procedure TForm1.N9Click(Sender: TObject);
begin
  id:=0;
  //��������� ��� ���������� �����, ��� ����� ������ �� ������, �.�.  �������
  //vkl_nam.db �������. ��� ����������� ��������� �������� DM.Query2.Active -
  //��� ������� vkl_nam.db.
  if DM.Query2.Active  then //���� ������� �������, ��
  //���������, ��� ���������� ������� ������� ������ RecordCount ��� �������
  //vkl_nam.db �� ���� � ��� ��������� ����� ������������� ������
    if (DM.Query2.RecordCount<>0) and
    (DM.Query2.FieldByName('no').asstring<>'') then
      begin  //���� ���������� �����
        dm.Query3.Insert;//��������� 1 ������ � ������� ���������� vklad.db
        redaktirovanie:=false; //�������� ���������� redaktirovanie �����������
        //false - �������� ���������
        f_sv.ShowModal; //��������� ����� �������������� ��������� � ���������
        //������, �.�. ����� �������� ������ ���� ��� ����� �������������� f_sv
      end;

end;
//����������� ���������-����������� ��� ������ ���� N11, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. �������� ���������
procedure TForm1.N11Click(Sender: TObject);
begin
  //��������� ��� ���������� ��������, ��� ����� ������ �� ������, �.�.  �������
  //vklad.db �������. ��� ����������� ��������� �������� DM.Query3.Active -
  //��� ������� vklad.db.
  if DM.Query3.Active then //���� ������� �������, ��
  //���������, ��� ���������� ������� ������� ������ RecordCount ��� �������
  //vklad.db �� ���� � ��� ��������� ����� ������������� ������
    if (DM.Query3.RecordCount<>0) and (DM.Query3.FieldByName('no').asstring<>'')
    then
      //����� ����������� ���� ������������� �������� ���������
      case MessageDlg('��������! �������� ���������.'+
           #13#10#13#10+'������� �������� - Yes,   �� ������� - No.'
           , mtConfirmation, [mbYes, mbNo], 0) of
        mrYes://���� ������ ������� Yes, �� ��������� �������� ���������
              dm.Query3.Delete;
      end;
end;
//����������� ���������-����������� ��� ������ ���� N2, �������������� ���
//������������� ������� onClick. Sender ��������� ����� ��������� �������� ���
//���������. �������� �����, � ����� ���� ��� ������� � ����������.
procedure TForm1.N5Click(Sender: TObject);
label 1;
var n1, no:string;
  i:integer;
begin
  //��������� ��� ���������� ����, ��� ����� ������ �� ������, �.�. �������
  //bank.db �������. ��� ����������� ��������� ������ DM.Query1.Active - ���
  //������� bank.db
  if DM.Query1.Active then
    //���������, ��� ���������� ������� ������ ������ RecordCount ��� �������
    //bank.db �� ���� � ��� ��������� ����� ������������� ������
    if DM.Query1.RecordCount<>0 then
      begin
        //����� ����������� ���� ������������� �������� �����
        case MessageDlg('��������! �������� �����.'+
             #13#10#13#10+'������� ���� - Yes,   �� ������� - No.'
             , mtConfirmation, [mbYes, mbNo], 0) of
          mrno: goto 1;  //���� ������ ������� No - ������������ � ����� 1
          //� ��������� ���������
        end;
        //���������� �������� ����������� ��� ������� OnDataChange � ����������
        //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
        //dm.DataSource1 � dm.DataSource2 - nil. ��������� ��� �������� ����
        //������ "1 �� ������" ����� 3 ��������� ��� ������:
        //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr"
        //bank.db - ���������� � ��������� ������, vkl_nam.db - ���������� �
        //��������� �������, vklad.db - ���������� � ����������

        dm.DataSource1.OnDataChange:=nil;
        dm.DataSource2.OnDataChange:=nil;

        dm.Query3.Close;  //��������� ������� ����������
        dm.Query2.Close;  //��������� ������� �������

        //���������� � ���������� n1 ����� ���������� ����� �� ������� bank.db
        n1:=DM.Query1.FieldByName('no').asstring;

        dm.Q_test.close;     //��������� �������
        dm.Q_test.SQL.Clear; //������� ���������� SQL ������.
        //��������� ����� SQL ������ �� ������� vkl_nam.db. ����������� ���
        //������ ����� ����� ���� ������� �� ������� vkl_nam.db, ������������ �
        //����� ����� (������������ ��������� ���� nr � ������� vkl_nam.db �
        //��������� ���� no � ������� bank.db).
        dm.Q_test.SQL.Add(
               'select * from "vkl_nam.db" WHERE ("vkl_nam.db"."Nr" = '+n1+')');
        dm.Q_test.Open; //��������� SQL ������
        //���������, ��� ����� ������ �� ������. ��������� ��� ����������
        //������� ������ ������ DM.Q_test.RecordCount �����  ���������� SQl
        //������� �� ����.

        if dm.Q_test.RecordCount<>0 then
          begin  //���������� ������� �� ����,
            dm.Q_test.First; //�� ��������� � ������ ������ ������� vkl_nam.db
            //� ����� �� ������ ������ �� ��������� ������ ������ ������
            //��� ������ ������ - �������� ������ �� ������� vkl_nam.db
            for i:=1 to dm.Q_test.RecordCount do
              begin  //���������� ����� �������� ������ �� ������� vkl_nam.db �
              //���������� no
                no:=DM.Q_test.FieldByName('no').asstring;

                dm.Query3.close; //��������� ������� ���������� vklad.db
                dm.Query3.SQL.Clear; //������� ���������� SQL ������.
                //��������� ����� SQL ������ �� ������� vklad.db. �����������
                //��� ������ ����� �������� ������ ������� �� ������� vklad.db,
                //������������ � ����� ����� � ������� vkl_nam.db (������������
                //��������� ���� nr � ������� vklad.db � ��������� ���� no �
                //������� vkl_nam.db).
                dm.Query3.SQL.Add(
                     'DELETE FROM "vklad.db" WHERE ("vklad.db"."Nr" = '+no+')');
                dm.Query3.ExecSQL; //��������� SQL ������

                dm.Query2.close;     //��������� ������� ������� vkl_nam.db
                dm.Query2.SQL.Clear; //������� ���������� SQL ������.
                //��������� ����� SQL ������ �� ������� vkl_nam.db. �����������
                //��� ������ ����� �������� ������ �� ������� vkl_nam.db,
                //(����� ��������� ������ ������������ ��������� ���������� no)
                dm.Query2.SQL.Add(
                 'DELETE FROM "vkl_nam.db" WHERE ("vkl_nam.db"."No" = '+no+')');
                dm.Query2.ExecSQL; //��������� SQL ������

                dm.Q_test.Next; //��������� � ��������� ������, �.�. ����������
                //������
              end;
          end;

        dm.Query3.close;  //��������� �������
        dm.Query3.SQL.Clear; //������� ���������� SQL ������.
        //��������� ����� SQL ������ �� ������� bank.db. �����������
        //��� ������ ����� �������� ������ �� ������� bank.db, (����� ���������
        //������ ������������ ��������� ���������� n1)
        dm.Query3.SQL.Add('DELETE FROM "bank.db" WHERE ("bank.db"."No" = '+n1+')');
        dm.Query3.ExecSQL; //��������� SQL ������

        dm.Q_test.Close;  //��������� �������

        //���������� �������� ����������� ��� ������� OnDataChange � ����������
        //������ dm.DataSource1 � dm.DataSource2. ��� ��������� ������
        //dm.DataSource1 ��������� DM.Query1Change, ��� dm.DataSource2 -
        //DM.Query2Change. ��������� ��� ����������� ���� ������ "1 �� ������"
        //����� 3 ���������
        dm.DataSource1.OnDataChange:=DM.Query1Change;
        dm.DataSource2.OnDataChange:=DM.Query2Change;

        dm.Query1.Close;  //��������� ������� ������
        dm.Query1.SQL.Clear; //������� ���������� SQL ������.
        //��������� ����� SQL ������ �� ������� bank.db. ����������� ��� ������
        //����� ����� ���� ������� �� ������� bank.db.
        dm.Query1.SQL.Add('select * from bank.db');
        dm.Query1.Open;  //��������� SQL ������
      end;


1:
end;
//����������� ���������-����������� ��� ������ ���� N7, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. �������� ������, � ����� ���� ��� ����������
procedure TForm1.N7Click(Sender: TObject);
label 1;
var no:string;
begin
  //��������� ��� ���������� ����, � �����, ��� ������ ������ �� ������, �.�.
  //������� bank.db � vkl_nam.db �������. ��� ����������� ��������� ������
  //DM.Query1.Active - ��� ������� ������ bank.db � DM.Query2.Active - ���
  //������� ������� vkl_nam.db
  if DM.Query1.Active and DM.Query2.Active then
  //���������, ��� ���������� ������� ������ ������ RecordCount ��� ������
  //bank.db � vkl_nam.db �� ���� � ��� ��������� ����� ��������� ������
    if (dm.Query2.RecordCount<>0) and (DM.Query1.RecordCount<>0) then
      begin
        //����� ����������� ���� ������������� �������� ������
        case MessageDlg('��������! �������� ������.'+
             #13#10#13#10+'������� ����� - Yes,   �� ������� - No.'
             , mtConfirmation, [mbYes, mbNo], 0) of
          mrno: goto 1; //���� ������ ������� No - ������������ � ����� 1
          //� ��������� ���������
        end;

        dm.Query3.Close; //��������� �������
        //���������� ��������-���������� ��� ������� OnDataChange � ���������
        //������ dm.DataSource2. ��� ��������� ������ dm.DataSource2 - nil.
        //��������� ��� �������� ����� "1 �� ������" ����� 2 ��������� ����
        // ������:  "vkl_nam.db"."no"="vklad.db"."nr". vkl_nam.db - ���������� �
        // ��������� �������, vklad.db - ���������� � ����������
        dm.DataSource2.OnDataChange:=nil;
        //���������� ����� �������� ������ �� ������� vkl_nam.db � ���������� no
        no:=DM.Query2.FieldByName('no').asstring;

        dm.Query3.close; //��������� ������� ����������
        dm.Query3.SQL.Clear;  //������� ���������� SQL ������.
        //��������� ����� SQL ������ �� ������� vklad.db. �����������
        //��� ������ ����� �������� ������ ������� �� ������� vklad.db,
        //(����� ��������� ������� Nr ������������ ��������� ���������� no)
        dm.Query3.SQL.Add(
                     'DELETE FROM "vklad.db" WHERE ("vklad.db"."Nr" = '+no+')');
        dm.Query3.ExecSQL; //��������� SQL ������

        dm.Query2.close;  //��������� ������� �������
        dm.Query2.SQL.Clear; //������� ���������� SQL ������.
        //��������� ����� SQL ������ �� ������� vkl_nam.db. �����������
        //��� ������ ����� �������� ������ �� ������� vkl_nam.db,
        //(����� ��������� ������� No ������������ ��������� ���������� no)
        dm.Query2.SQL.Add(
                 'DELETE FROM "vkl_nam.db" WHERE ("vkl_nam.db"."No" = '+no+')');
        dm.Query2.ExecSQL; //��������� SQL ������

        dm.Query3.Close; //��������� ������� ����������

        dm.Query2.Close; //��������� ������� �������
        dm.Query2.SQL.Clear; //������� ���������� SQL ������.
        //��������� ����� SQL ������ �� ������� vkl_nam.db. ����������� ���
        //������ ����� ����� ���� ������� �� ������� vkl_nam.db, ����� �������
        //Nr ������� ������������ ��������� DM.Query1.FieldByName('no').asstring
        //�.�. ����� ������� ������������ � ��������� �����
        dm.Query2.SQL.Add('select * from "vkl_nam.db" where ("vkl_nam.db"."nr"='
        +DM.Query1.FieldByName('no').asstring+')');
        dm.Query2.Open; //��������� SQL ������

        //��������������� ����� "1 �� ������" ����� 2 ��������� ����
        //������ (vkl_nam.db - ���������� � ��������� �������, vklad.db -
        //���������� � ����������): "vkl_nam.db"."no"="vklad.db"."nr"
        dm.DataSource2.OnDataChange:=DM.Query2Change;
      end;                        
1:
end;
//����������� ���������-����������� ��� ������ ���� N12, �������������� ���
//������������� ������� onClick.  Sender ��������� ����� ��������� �������� ���
//���������. ���������� � ������ � ������ :)
procedure TForm1.N12Click(Sender: TObject);
begin //���������� ���������  #13#10 - ���� �������� ��������� ������
  showmessage('������'#13#10#13#10'������ ���������� ���������� '+
  '������� � ������'#13#10#13#10'�����:'#13#10'SLV'#13#10+
  'slavik@vmail.ru'+#13#10+
    'slvno@rambler.ru'+
  #13#10#13#10'����������� (�������� �� ��������):'#13#10'http://web.vrn.ru/soft-1/');
end;

//����������� ���������-����������� ������� �������������� ��� �������� �����
//Form1/ Sender ��������� ����� ��������� �������� ��� ���������.
procedure TForm1.FormCreate(Sender: TObject);
begin
  decimalSeparator:='.'; //������������� ����������� ����� � ������� �����
  //������������� ����� ��� "."
end;

end.
