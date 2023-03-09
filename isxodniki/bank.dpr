program bank; //Название программы

uses
  Forms,
  ban in 'ban.pas' {Form1},
  dat in 'dat.pas' {DM: TDataModule},
  sortirovka in 'sortirovka.pas',
  variant_s in 'variant_s.pas' {Form2},
  Unit1 in 'Unit1.pas' {f_sv};

{$R *.RES} //Сообщение компилятору. Названия компилируемых вместе с исполняемым
//файлом файлов ресурсов

begin
  Application.Initialize;  //Инициализация приложения
  Application.Title := 'Анализ доходности депозитных вкладов в валюте';
  Application.CreateForm(TForm1, Form1);
  //создание формы Form1
  Application.CreateForm(TDM, DM);       //создание формы DM
  Application.CreateForm(TForm2, Form2); //создание формы Form2
  Application.CreateForm(Tf_sv, f_sv);   //создание формы f_sv
  Application.Run;                       //исполнение приложения 
end.
