unit dat; //�������� ������

interface  //������ ������������ �����

uses    //�������� ����������� ������� �������
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type  //���������� ������ ������
  TDM = class(TDataModule) //���������� ������ TDM - ���������� �� TDataModule
    Session1: TSession; //���������� ���������� Session1 ����
    //TSession. ��������� ������������ � ��. ������������ ���������.
    Query1: TQuery; //���������� ���������� Query1 ����
    //TQuery. ������ � �������� ������. ������������ ���������.
    Query2: TQuery; //���������� ���������� Query2 ����
    //TQuery. ������ � �������� �������. ������������ ���������.
    Query3: TQuery; //���������� ���������� Query3 ����
    //TQuery. ������ � �������� ����������. ������������ ���������.
    DataSource1: TDataSource; //���������� ����������  ����
    //TDataSource. �������� ������ ��� ������� ������. ������������ ���������.
    DataSource2: TDataSource; //���������� ����������  ����
    //TDataSource. �������� ������ ��� ������� �������. ������������ ���������.
    DataSource3: TDataSource; //���������� ����������  ����
  //TDataSource. �������� ������ ��� ������� ����������. ������������ ���������.
    Q_test: TQuery; //���������� ���������� Q_test ����
    //TQuery. ������ � ���������. ������������ ���������.
    DataSource4: TDataSource; //���������� ����������  ����
    //TDataSource. �������� ������ ��� ������. ������������ ���������.

    //���������� �������� ����������� ��� ������� OnDataChange � ����������
    //������ dm.DataSource1 � dm.DataSource2. ��� ���������� ������
    //dm.DataSource1 � dm.DataSource2. ��������� ��� ����������� ����
    //������ "1 �� ������" ����� 3 ��������� ���� ������:
    //"bank.db"."no"="vkl_nam.db"."nr",
    procedure Query1Change(Sender: TObject; Field: TField);
    //"vkl_nam.db"."no"="vklad.db"."nr"
    procedure Query2Change(Sender: TObject; Field: TField);
    //bank.db - ���������� � ��������� ������, vkl_nam.db - ���������� �
    //��������� �������, vklad.db - ���������� � ����������
    //Field - ����� ����� � ������ ������ ��� ������� ���������� ���������
    //���������. Sender ��������� ����� ��������� �������� ��� ���������
  end;

var
  DM: TDM; //���������� ���������� ���� TDM, �.�. ������ ������, �������
  //�������� ������������ ���������� ��� ������ � ��

implementation //����� ������������ �����, ������ ������ ����������

uses ban, variant_s;  //�������� ����������� ������� �������

{$R *.DFM} //�������� ������������� ������ � ����������� ������ ����� ��������

//���������� ��������-����������� ��� ������� OnDataChange � ��������� ������
//dm.DataSource1. ��������� ��� ����������� ����� "1 �� ������" ����� 2
//��������� ���� ������ (bank.db - ���������� � ��������� ������, vkl_nam.db -
//���������� � ��������� �������): "bank.db"."no"="vkl_nam.db"."nr",
//Field - ����� ����� � ������ ������ ��� ������� ���������� ��������� ���������
//Sender ��������� ����� ��������� �������� ��� ���������
procedure TDM.Query1Change(Sender: TObject; Field: TField);
begin
  //��������� ��� ������� ������ bank.db �������. ��� ������������ ���������
  //Active ���������� DM.Query1. ���� ������ �� ������� �������
  if DM.Query1.Active then
    begin //��������� ��� ����� ������ �� ������. ��������� ��� ����������
    //������� ������ ������ DM.Query1.RecordCount �� ���� � �������� ��������,
    // ���� no - ������� ������ DM.Query1.FieldByName('no').asstring �� ����.
      if (DM.Query1.RecordCount<>0) and
      (DM.Query1.FieldByName('no').asstring<>'') then
        begin
          dm.Query3.Close; //��������� ������� ����������.

          dm.Query2.Close; //��������� ������� �������.
          dm.Query2.SQL.Clear; //������� ���������� SQL ������.
          //���������� �� ����� SQL.Clear
          //��������� ����� SQL ������ �� ������� vkl_nam.db. ����������� ���
          //������ ����� ����� ���� ������� �� ������� vkl_nam.db, �������
          //������� � ����� ������� � ������� ������ bank.db. ����� ������������
          //�� ���� nr � ������� vkl_nam.db � �� ���� no � ������� bank.db.
          dm.Query2.SQL.Add(
                         'select * from "vkl_nam.db" where ("vkl_nam.db"."nr"='+
                         DM.Query1.FieldByName('no').asstring+')');
          dm.Query2.Open; //��������� SQL ������
        end;
    end;
end;

//���������� ��������-����������� ��� ������� OnDataChange � ��������� ������
//dm.DataSource2. ��������� ��� ����������� ����� "1 �� ������" ����� 2
//��������� ���� ������ (vkl_nam.db - ���������� � ��������� �������, vklad.db -
//���������� � ����������):  "vkl_nam.db"."no"="vklad.db"."nr"
//Field - ����� ����� � ������ ������ ��� ������� ���������� ��������� ���������
//Sender ��������� ����� ��������� �������� ��� ���������
procedure TDM.Query2Change(Sender: TObject; Field: TField);
begin
  //��������� ��� ������� ������� vkl_nam.db �������. ��� ������������ ���������
  //Active ���������� DM.Query2. ���� ������ �� ������� �������
  if DM.Query2.Active then
    begin //��������� ��� ����� ������ �� ������. ��������� ��� ����������
    //������� ������ ������ DM.Query2.RecordCount �� ���� � �������� ��������,
    // ���� no - ������� ������ DM.Query2.FieldByName('no').asstring �� ����.
      if (DM.Query2.RecordCount<>0) and
      (DM.Query2.FieldByName('no').asstring<>'') then
        begin
          dm.Query3.Close; //��������� ������� �������.
          dm.Query3.SQL.Clear; //������� ���������� SQL ������.
          //���������� �� ����� SQL.Clear
          //��������� ����� SQL ������ �� ������� vklad.db. ����������� ���
          //������ ����� ����� ���� ������� �� ������� vklad.db, �������
          //������� � ����� ������� � ������� ������� vkl_nam.db. �����
          //������������ �� ���� nr � ������� vklad.db � �� ���� no � �������
          //vkl_nam.db.
          dm.Query3.SQL.Add('select * from "vklad.db" where ("vklad.db"."nr"='+
          DM.Query2.FieldByName('no').asstring+')');
          dm.Query3.Open; //��������� SQL ������
        end;
    end;
end;

end.
