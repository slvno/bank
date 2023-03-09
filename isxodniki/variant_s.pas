unit variant_s; //�������� ������

interface //������ ������������ �����

uses //�������� ����������� ������� �������
{  Windows, Messages, StdCtrls, Controls, CheckLst, Classes, Buttons,  Controls, CheckLst, Classes, Buttons, StdCtrls,
   SysUtils,  Graphics,  Dialogs, Forms, StdCtrls, Controls, CheckLst,
  Classes, Buttons;}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons;

type //���������� ����� ���������� �� ����������� ��������� ��������� ������
//��������
  TForm2 = class(TForm) //���������� ������ TForm2 - ���������� �� TForm
    CheckListBox1: TCheckListBox;  //���������� ���������� CheckListBox1 ����
    //TCheckListBox, - ��� �������� ������ ��������. ������������ � ���� ������
    //���� ��������� ������ �������� �� ����� Form2.
    SpeedButton1: TSpeedButton; //���������� ���������� SpeedButton1 ����
    //TSpeedButton, - ������ ������������� ������ ���� ��������� ������ ��������
    //������������ �� ����� Form2.
    Memo1: TMemo; //���������� ���������� Memo1 ���� TMemo, - ��������� ��������
    //������������ �� ����� Form2.
 
    procedure SpeedButton1Click(Sender: TObject); //���������� ���������
    //������������� ��� ��������� ������ �� ������ SpeedButton1. Sender
    //��������� ����� ��������� �������� ��� ���������.
    procedure FormClose(Sender: TObject; var Action: TCloseAction);//����������
    //��������� ������������� ��� �������� �����. Sender ��������� �����
    //��������� �������� ��� ���������. Action ���������� ������ �������� �����
    procedure FormCreate(Sender: TObject);//���������� ���������
    //������������� ��� ����������� ����� Form2. Sender ��������� �����
    //��������� �������� ��� ���������
  end;

var
  Form2: TForm2;  //���������� ���������� ���� TForm2, �.�. ����� ���������� ��
  //����������� ��������� ��������� ������ ��������

implementation  //����� ������������ �����, ������ ������ ����������

uses ban, sortirovka;  //�������� ����������� ������� �������

{$R *.DFM}  //�������� ������������� ������ � ����������� ������ ����� ��������

//���������� ��������� ������������� ��� ��������� ������ �� ������
//SpeedButton1. Sender ��������� ����� ��������� �������� ��� ���������.
procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  close; //��������� �������� ����� Form2
end;

//���������� ��������� ������������� ��� �������� �����. Sender ��������� �����
//��������� �������� ��� ���������. Action ���������� ������ �������� �����
//��� �������� ����� ����������� �������� ������������� ������� � ����������
//CheckListBox1, ������ ������ ������������� ������ ����������� ����������
//����� ��������. ���� ������ ����������, �� �������� �������
//CheckListBox1.Checked[i] - true
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i,l:integer; //��������
begin
  varianti:=nil; //������� ������������ ������ ��������� ������ ��������
  for i:=0 to 11 do  //� ����� ��������� �������� ��������� ������ ��������
    if CheckListBox1.Checked[i] then //���� ���� �������� ������, ��
    //������� ��� � ������������ ������ ��������� ������ �������� varianti
      begin
        l:=length(varianti); //���������� ������ ������� ��������� ������
        //�������� varianti
        setlength(varianti, l+1); //����������� ������ ������� ��������� ������
        //�������� varianti �� 1 �������

        //������� ��� i+1 - �������������, ���������� ������� ����� ��������
        varianti[l]:=i+1; //������� ��������� ���� �������� � ������� ���������
        //������ �������� varianti � l ������� �������.
      end;
  {
  //���������� ���� ���������, ��� ���� � ��������� ���������� s ������� ������-
  //����� ���������, ������� #13#10#13#10 �������� ������� ������.
  s:='������� ��������� ����� �������� �������:'#13#10#13#10;
  //��������� ��� ����� �������� � ������ ���������, ��� ���� �� �������
  //varianti � ����� ��������������� ����� �������� � ����������� �� � �����
  //����� ��������� ������� inttostr
  for i:=0 to length(varianti)-1 do
    s:=s+inttostr(varianti[i])+#13#10; //��������� � ������ ����� ��������
    //����� ��������

  showmessage(s);//���������� ���� ��������� s
  }
end;

//����������� ��������� ������������� ��� ����������� ����� Form2. Sender
//��������� ����� ��������� �������� ��� ���������
procedure TForm2.FormCreate(Sender: TObject);
begin
  CheckListBox1.Checked[2]:=true;  //����� ������ �������� ��������
  CheckListBox1.Checked[5]:=true;  //������ �� 3, 6, 9, 12 �������.
  CheckListBox1.Checked[8]:=true;  //����� ���� ����� ��������� ������� �
  CheckListBox1.Checked[11]:=true; //���������� CheckListBox1 ����
  //TCheckListBox, - ��� �������� ������ ��������, ������ ��������������
  //Checked[i]. ������ ������ ���������� �� ����� �������� ����
end;

end.
