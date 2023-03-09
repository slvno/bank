unit variant_s; //Название модуля

interface //Начало интерфейсной части

uses //Названия подлючаемых внешних модулей
{  Windows, Messages, StdCtrls, Controls, CheckLst, Classes, Buttons,  Controls, CheckLst, Classes, Buttons, StdCtrls,
   SysUtils,  Graphics,  Dialogs, Forms, StdCtrls, Controls, CheckLst,
  Classes, Buttons;}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons;

type //Объявление формы отвечающей за определение различных вариантов сроков
//хранения
  TForm2 = class(TForm) //Объявление класса TForm2 - наследника от TForm
    CheckListBox1: TCheckListBox;  //Объявление компонента CheckListBox1 типа
    //TCheckListBox, - все варианты сроков хранения. Отображается в виде списка
    //всех вариантов сроков хранения на форме Form2.
    SpeedButton1: TSpeedButton; //Объявление компонента SpeedButton1 типа
    //TSpeedButton, - кнопка подтверждения выбора всех вариантов сроков хранения
    //Отображается на форме Form2.
    Memo1: TMemo; //Объявление компонента Memo1 типа TMemo, - текстовый редактор
    //Отображается на форме Form2.
 
    procedure SpeedButton1Click(Sender: TObject); //Объявление процедуры
    //выполняющейся при одиночном щелчке на кнопке SpeedButton1. Sender
    //указывает какой компонент вызывает эту процедуру.
    procedure FormClose(Sender: TObject; var Action: TCloseAction);//Объявление
    //процедуры выполняющейся при закрытии формы. Sender указывает какой
    //компонент вызывает эту процедуру. Action определяет способ закрытия формы
    procedure FormCreate(Sender: TObject);//Объявление процедуры
    //выполняющейся при активизации формы Form2. Sender указывает какой
    //компонент вызывает эту процедуру
  end;

var
  Form2: TForm2;  //Объявление переменной типа TForm2, т.е. формы отвечающей за
  //определение различных вариантов сроков хранения

implementation  //Конец интерфейсной части, начало секции реализации

uses ban, sortirovka;  //Названия подлючаемых внешних модулей

{$R *.DFM}  //Названия компилируемых вместе с исполняемым файлом файло ресурсов

//Объявление процедуры выполняющейся при одиночном щелчке на кнопке
//SpeedButton1. Sender указывает какой компонент вызывает эту процедуру.
procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  close; //Выполняем закрытие формы Form2
end;

//Объявление процедуры выполняющейся при закрытии формы. Sender указывает какой
//компонент вызывает эту процедуру. Action определяет способ закрытия формы
//При закрытии формы проверяются значения установленных флажков в компоненте
//CheckListBox1, Каждый флажек соответствует одному конкретному выбранному
//сроку хранения. Если флажек установлен, то значение массива
//CheckListBox1.Checked[i] - true
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i,l:integer; //счетчики
begin
  varianti:=nil; //Очищаем динамический массив вариантов сроков хранения
  for i:=0 to 11 do  //В цикле проверяем значения выбранных сроков хранения
    if CheckListBox1.Checked[i] then //Если срок хранения выбран, то
    //Заносим его в динамический массив вариантов сроков хранения varianti
      begin
        l:=length(varianti); //Определяем размер массива вариантов сроков
        //хранения varianti
        setlength(varianti, l+1); //увеличиваем размер массива вариантов сроков
        //хранения varianti на 1 элемент

        //Считаем что i+1 - соответствует, количеству месяцев срока хранения
        varianti[l]:=i+1; //Заносим выбранный срок хранения в массива вариантов
        //сроков хранения varianti в l позицию массива.
      end;
  {
  //Показываем окно сообщения, для чего в строковую переменной s заносим необхо-
  //димое сообщение, символы #13#10#13#10 означают перевод строки.
  s:='Выбраны следующие сроки хранения вкладов:'#13#10#13#10;
  //Добавляем все сроки хранения в строку сообщения, для чего из массива
  //varianti в цикле последовательно берем элементы и преобразуем их в целые
  //числа используя функцию inttostr
  for i:=0 to length(varianti)-1 do
    s:=s+inttostr(varianti[i])+#13#10; //Добавляем к строке новое значение
    //срока хранения

  showmessage(s);//Показываем окно сообщения s
  }
end;

//Определение процедуры выполняющейся при активизации формы Form2. Sender
//указывает какой компонент вызывает эту процедуру
procedure TForm2.FormCreate(Sender: TObject);
begin
  CheckListBox1.Checked[2]:=true;  //Выбор сроков хранения заданных
  CheckListBox1.Checked[5]:=true;  //работе на 3, 6, 9, 12 месяцев.
  CheckListBox1.Checked[8]:=true;  //Выбор идет путем установки флажков в
  CheckListBox1.Checked[11]:=true; //компоненте CheckListBox1 типа
  //TCheckListBox, - все варианты сроков хранения, массив собственностей
  //Checked[i]. Данный массив заполнялся во время создания фрмы
end;

end.
