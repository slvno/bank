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

uses ban, sortirovka;  //Ќазвани€ подлючаемых внешних модулей

{$R *.dfm}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i,l:integer; //счетчики
begin
  varianti:=nil; //ќчищаем динамический массив вариантов сроков хранени€
  for i:=0 to 11 do  //¬ цикле провер€ем значени€ выбранных сроков хранени€
    if CheckListBox1.Checked[i] then //≈сли срок хранени€ выбран, то
    //«аносим его в динамический массив вариантов сроков хранени€ varianti
      begin
        l:=length(varianti); //ќпредел€ем размер массива вариантов сроков
        //хранени€ varianti
        setlength(varianti, l+1); //увеличиваем размер массива вариантов сроков
        //хранени€ varianti на 1 элемент

        //—читаем что i+1 - соответствует, количеству мес€цев срока хранени€
        varianti[l]:=i+1; //«аносим выбранный срок хранени€ в массива вариантов
        //сроков хранени€ varianti в l позицию массива.
      end;
  {
  //ѕоказываем окно сообщени€, дл€ чего в строковую переменной s заносим необхо-
  //димое сообщение, символы #13#10#13#10 означают перевод строки.
  s:='¬ыбраны следующие сроки хранени€ вкладов:'#13#10#13#10;
  //ƒобавл€ем все сроки хранени€ в строку сообщени€, дл€ чего из массива
  //varianti в цикле последовательно берем элементы и преобразуем их в целые
  //числа использу€ функцию inttostr
  for i:=0 to length(varianti)-1 do
    s:=s+inttostr(varianti[i])+#13#10; //ƒобавл€ем к строке новое значение
    //срока хранени€

  showmessage(s);//ѕоказываем окно сообщени€ s
  }
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 CheckListBox1.Checked[2]:=true;  //¬ыбор сроков хранени€ заданных в дипломной
  CheckListBox1.Checked[5]:=true;  //работе на 3, 6, 9, 12 мес€цев.
  CheckListBox1.Checked[8]:=true;  //¬ыбор идет путем установки флажков в
  CheckListBox1.Checked[11]:=true; //компоненте CheckListBox1 типа
  //TCheckListBox, - все варианты сроков хранени€, массив собственностей
  //Checked[i]. ƒанный массив заполн€лс€ во врем€ создани€ фрмы
end;

end.
