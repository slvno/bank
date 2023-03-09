unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons;

type
  TForm3 = class(TForm)
    SpeedButton1: TSpeedButton;
    CheckListBox1: TCheckListBox;
    Memo1: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses ban, sortirovka;  //�������� ����������� ������� �������

{$R *.dfm}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TForm3.FormCreate(Sender: TObject);
begin
 CheckListBox1.Checked[2]:=true;  //����� ������ �������� �������� � ���������
  CheckListBox1.Checked[5]:=true;  //������ �� 3, 6, 9, 12 �������.
  CheckListBox1.Checked[8]:=true;  //����� ���� ����� ��������� ������� �
  CheckListBox1.Checked[11]:=true; //���������� CheckListBox1 ����
  //TCheckListBox, - ��� �������� ������ ��������, ������ ��������������
  //Checked[i]. ������ ������ ���������� �� ����� �������� ����
end;

end.
