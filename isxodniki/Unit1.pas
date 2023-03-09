unit Unit1; //�������� ������

interface  //������ ������������ �����

uses      //�������� ����������� ������� �������
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type   //���������� ����� ���������� �� �������������� ����������
//��������
  Tf_sv = class(TForm) //���������� ������ Tf_sv - ���������� �� TForm
    Lab1: TLabel; //���������� ���������� Lab1 ����
    //TLabel, - ��������� �������. ������������ �� ����� f_sv.
    Lab2: TLabel; //���������� ���������� Lab2 ����
    //TLabel, - ��������� �������. ������������ �� ����� f_sv.
    Lab3: TLabel; //���������� ���������� Lab3 ����
    //TLabel, - ��������� �������. ������������ �� ����� f_sv.
    Label1: TLabel; //���������� ���������� Label1 ����
    //TLabel, - ��������� �������. ������������ �� ����� f_sv.
    DBEdit1: TDBEdit; //���������� ���������� DBEdit1 ���� TDBEdit, - ������
    //�������������� ��� ���� Srok ����� ������ �� ������� ��������� vklad.db
    //������������ �� ����� f_sv.
    DBEdit2: TDBEdit; //���������� ���������� DBEdit2 ���� TDBEdit, - ������
    //�������������� ��� ���� Min_summa ����� ������ �� ������� ���������
    //vklad.db. ������������ �� ����� f_sv.
    DBEdit3: TDBEdit; //���������� ���������� DBEdit3 ���� TDBEdit, - ������
    //�������������� ��� ���� Stavka ����� ������ �� ������� ���������
    // vklad.db. ������������ �� ����� f_sv.
    DBEdit4: TDBEdit; //���������� ���������� DBEdit4 ���� TDBEdit, - ������
    //�������������� ��� ���� Max_summa ����� ������ �� ������� ���������
    //vklad.db. ������������ �� ����� f_sv.
    SpeedButton_1: TSpeedButton; //���������� ���������� SpeedButton_1 ����
    //TSpeedButton, - ������ ��������� ����������������� ������.
    //������������ �� ����� f_sv.
    SpeedButton_2: TSpeedButton; //���������� ���������� SpeedButton_2 ����
    //TSpeedButton, - ������ �������� - �� ��������� ����������������� ������.
    //������������ �� ����� f_sv.
    //���������� ��������-������������ ������� ������. Sender ��������� �����
    //��������� �������� ��� ���������.
    procedure SpeedButton_1Click(Sender: TObject); //��� ������ SpeedButton_1
    procedure SpeedButton_2Click(Sender: TObject); //��� ������ SpeedButton_2
    //���������� ���������-����������� ������� onClose - �������� ����� .
    //Sender ��������� ����� ��������� �������� ��� ���������. Action ����������
    //������ �������� �����
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  end;

var
  f_sv: Tf_sv; //���������� ���������� ���� Tf_sv, �.�. ����� ���������� ��
  //�������� � �������������� ��������� ��������� ����������
implementation  //����� ������������ �����, ������ ������ ����������

uses dat, ban, variant_s; //�������� ����������� ������� �������


{$R *.DFM} //�������� ������������� ������ � ����������� ������ ����� ��������

//���������� ���������-����������� ������� ������� SpeedButton_1. Sender
//��������� ����� ��������� �������� ��� ���������. ���������� �����������������
//���������� � �� vklad.db
procedure Tf_sv.SpeedButton_1Click(Sender: TObject);
var proc, max_sum:string;
begin
  //��������� ���������� ������������ ������� � ������� vklad.db
  dm.Q_test.Close; //��������� ������� Q_test ���������� �� ����� Close
  dm.Q_test.SQL.Clear; //������� ���������� SQL ������.
  //��������� ����� SQL ������ �� ������� bank.db. ����������� ��� ������ �����
  //����� ���� ������� �� ������� vklad.db, � ������� �������� ���� ������ ����
  //Srok ����� ������ ��������� ���������� DBEdit1.Text, ��������� � �����
  //�������������� f_sv, � ����� ����������� ����� ������ ���� Min_summa �����
  //������ ��������� ���������� DBEdit2.Text, ��������� � �����
  //�������������� f_sv, � ����� ���� ����� nr c �������� vkl_nam.db �����
  //������ ���� no � ������� vkl_nam.db. �������� ���� ������������ ���������
  //DM.Query2.FieldByName('no').asstring
  dm.Q_test.SQL.Add('select * from "vklad.db" where ("vklad.db"."Srok"='+
  DBEdit1.Text+') and ("vklad.db"."Min_summa"='+DBEdit2.Text+
  ') and ("vklad.db"."nr"='+DM.Query2.FieldByName('no').asstring+')');
  dm.Q_test.Open; //��������� SQL ������

  //���� ���� ������ � ����������� ���������� ����� srok, Min_summa, Nr, �.�
  //������� ������������ ������� � ������� vklad.db. ������������ �����������
  //������� dm.Q_test.RecordCount, ��������� � ���������� SQL ������� �� ����
  //�������,
  if dm.Q_test.RecordCount=0 then //���� ���������� ������� ����
    begin  //��������� ���� ����� nr � �������� vkl_nam.db � ������� vklad.db,
    //��������� ���� no �� ������� vkl_nam.db. vklad.db - ���������, vkl_nam.db
    //- ������.
      dm.Query3.FieldByName('nr').asinteger:=dm.Query2.FieldByName('no').asinteger;
      dm.Query3.Post; //��������� ���������� � �� � ����������� ��������������
      //������ � ������� vklad.db
    end
  else
    begin  ////���� ���������� ������� �� ����
      proc:=DBEdit3.Text; //� ���������� proc ��������� �������� ���� Stavka,
      //DBEdit3.Text, - ���������� ������
      max_sum:=DBEdit4.Text; //� ���������� max_sum ��������� �������� ����
      //Max_summa, DBEdit4.Text, - ������������ ����� ��������������� ������
      dm.Query3.Cancel; //�������� ��������������/�������� ������ � �������
      //vklad.db

      //���� ������� 1 ������, ������������ �����������
      //������� dm.Q_test.RecordCount, ��������� � ���������� SQL �������, ��
      //����������� ��
      if dm.Q_test.RecordCount=1 then
        begin   //���� ����� ����� �������������� ������, �.�. ����������
        //Form1.redaktirovanie ����������� � true
          if Form1.redaktirovanie then
            begin
              dm.Q_test.Edit; //����������� ��������� ������ �� �����������
              //SQL �������
              //��������� �������� ���� Stavka �� ��������� ���������� proc
              dm.Q_test.FieldByName('Stavka').asfloat:=strtofloat(proc);
             //��������� �������� ���� Max_summa �� ��������� ���������� max_sum
              dm.Q_test.FieldByName('Max_summa').asfloat:=strtofloat(max_sum);
              dm.Q_test.Post; //����������� �������������� ������
              dm.Query3.Refresh; //��������� ����� ������ � ������� vklad.db
            end
          else  //���� ��� ��������������, �.�. ����������
            //Form1.redaktirovanie ����������� � false, �� ������ ���������
            showmessage('��������, �� ����� � ������ ������ �������� � '+
            '����������� ������ ��������������� ������ ��� ����������.');
        end
      else  //���� ������� ����� 1 ������, ������������ ����������� ������� -
      //dm.Q_test.RecordCount, ��������� � ���������� SQL �������, �� ������
      //���������
        begin
          showmessage('��������, �� ����� � ������ ������ �������� � '+
          '����������� ������ ��������������� ������ ��� ����������.');
        end;
    end;

  f_sv.Close;  //�������� ����� �������������� f_sv
end;

//���������� ���������-����������� ������� ������ SpeedButton_2. Sender
//��������� ����� ��������� �������� ��� ���������. ��������� ����� f_sv.
//������ ��������������.
procedure Tf_sv.SpeedButton_2Click(Sender: TObject);
begin
  close; //�������� ����� �������������� f_sv
end;
//���������� ���������-���������� ������� onClose - �������� ����� .
//Sender ��������� ����� ��������� �������� ��� ���������. Action ����������
//������ �������� �����
procedure Tf_sv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.Query3.Cancel; //�������� ��������������/�������� ������ � �������
  //vklad.db
end;

end.
