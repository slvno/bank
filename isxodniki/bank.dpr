program bank; //�������� ���������

uses
  Forms,
  ban in 'ban.pas' {Form1},
  dat in 'dat.pas' {DM: TDataModule},
  sortirovka in 'sortirovka.pas',
  variant_s in 'variant_s.pas' {Form2},
  Unit1 in 'Unit1.pas' {f_sv};

{$R *.RES} //��������� �����������. �������� ������������� ������ � �����������
//������ ������ ��������

begin
  Application.Initialize;  //������������� ����������
  Application.Title := '������ ���������� ���������� ������� � ������';
  Application.CreateForm(TForm1, Form1);
  //�������� ����� Form1
  Application.CreateForm(TDM, DM);       //�������� ����� DM
  Application.CreateForm(TForm2, Form2); //�������� ����� Form2
  Application.CreateForm(Tf_sv, f_sv);   //�������� ����� f_sv
  Application.Run;                       //���������� ���������� 
end.
