unit ban; //Название модуля

interface   //Начало интерфейсной части

uses     //Названия подлючаемых внешних модулей
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, Menus, Buttons, ExtCtrls, Db, DBTables,
  bde, stdctrls, dbctrls, ImgList;

type TSrok=record   //Тип, характеризующий 1 срок хранения
  chislo,           //число месяцев хранения
  kol: integer;     //количество повторений этого срока хранения в отчетном
                    //периоде ( 12 мес)
end;
                                  //Данный тип описывает
Type TSum_Srokov=array of TSrok;  //Одну комбинацию сроков хранения, дающую в
                                  //сумме отчетный период (12 мес)
                                  //Типизированный динамический массив, т.е.
                                  //его окончание жестко не зафиксировано
                     //Данный тип описывает
type TDoxod=record   //доход, для одной определенной комбинации сроков хранения
  doxod:real;        //Значение дохода
  rez:boolean;       //Использовать ли такую комбинацию сроков хранения
  komb:TSum_Srokov ; //Комбинация сроков хранения
end;

type TVariant_s=array of TDoxod; //Данный тип описывает Динамический массив.
//Доход, для всех допустимых вариантов комбинаций сроков хранения

type TMax=record  //Данный тип описывает Максимальный доход
  stavka:real;    //Значение дохода
  no:integer;     //номер записи в массиве TVariant_s
end;
                     //Данный тип описывает
type TIs_dan=record  //Исходные данные для отдельного вклада
  srok:integer;      //Срок хранения
  min_summa,         //Минимальная сумма
  max_summa,         //Максимальная сумма
  stavka:real;       //Процентная ставка

  nomer,             //Номер в БД vkl_nam.db
  nomer1:integer;    //Номер в БД bank.db
  name_vkl,          //Название вклада
  name_b:string;     //Название банка
  rez:boolean;       //Учитывать ли этот вклад при сравнении доходов по всем
  //комбинациям сроков хранения
end;

type Tdan_mas= array of TIs_dan;  //Данный тип описывает динамический массив
//Исходных данных для отдельных вкладов

type Pdan_mas= ^Tdan_mas; //Указатель (адрес в памяти) на массив сроков хранения

type TKombin=record  //Данный тип описывает найдена ли комбинация срохов хранен.
  nomer:integer;    //порядковый номер элемента с определенным сроком в массиве
  nnaydena:boolean; //возможных сроков хранения - dan_mas:Tdan_mas
end;

type  //Объявление главной формы программы
  TForm1 = class(TForm)         //Объявление класса TForm1 - наследника от TForm
    StatusBar1: TStatusBar;     //Объявление компонента StatusBar1 типа
    //TStatusBar. Отображается в виде панели информации на форме Form1.
    ToolBar1: TToolBar;          //Объявление компонента ToolBar1 типа
    //TToolBar. Отображается в виде панели на форме Form1, выполняет функцию
    //групировки кнопок
    SpeedButton1: TSpeedButton;  //Объявление компонента SpeedButton1 типа
    //TSpeedButton. Отображается в виде кнопки на форме Form1
    SpeedButton2: TSpeedButton;  //Объявление компонента SpeedButton2 типа
    //TSpeedButton. Отображается в виде кнопки на форме Form1
    SpeedButton3: TSpeedButton;  //Объявление компонента SpeedButton3 типа
    //TSpeedButton. Отображается в виде кнопки на форме Form1

    MainMenu1: TMainMenu;        //Объявление компонента MainMenu1 типа
    //TMainMenu. Главное меню

    N1: TMenuItem;               //Объявление компонентов MenuItem1-12 типа
    N2: TMenuItem;               //MenuItem. Пункты главного меню
    N3: TMenuItem;               //
    N4: TMenuItem;               //
    N5: TMenuItem;               // Пункты главного меню
    N6: TMenuItem;               //
    N7: TMenuItem;               //
    N8: TMenuItem;               //
    N9: TMenuItem;               //
    N10: TMenuItem;              //
    N11: TMenuItem;              //
    N12: TMenuItem;              //

    PopupMenu1: TPopupMenu;      //Объявление компонентов PopupMenu1-3 типа
    PopupMenu2: TPopupMenu;      //TPopupMenu. Всплывающее меню.
    PopupMenu3: TPopupMenu;      //

    Panel1: TPanel;//Объявление компонентов Panel1-3 типа
    Panel3: TPanel;//TPanel. Панели, отображаются на форме. Группируют другие
    Panel2: TPanel;//визуальные  компоненты

    DBGrid1: TDBGrid;//Объявление компонентов DBGrid1-3 типа
    DBGrid2: TDBGrid;//TDBGrid. Таблицы, отображающие состояния наборов данных
    DBGrid3: TDBGrid;//после выполнения SQL запросов компонентами Query1,
    //Query2, Query3 типа TQuery, расположенными в модуле данных  DM типа
    //TDataModule

    procedure N2Click(Sender: TObject);           //Объявление процедур-
    procedure SpeedButton1Click(Sender: TObject); //обработчиков нажатия
    procedure SpeedButton2Click(Sender: TObject); // кнопок и пунктов меню
    procedure SpeedButton3Click(Sender: TObject); //Sender указывает какой
    procedure N3Click(Sender: TObject);           //компонент вызывает эту
    procedure N4Click(Sender: TObject);           //процедуру
    procedure N6Click(Sender: TObject);           //
    procedure N8Click(Sender: TObject);           //
    procedure N10Click(Sender: TObject);          //
    procedure N9Click(Sender: TObject);           //
    procedure N11Click(Sender: TObject);          //
    procedure N5Click(Sender: TObject);           //
    procedure N7Click(Sender: TObject);           //
    procedure N12Click(Sender: TObject);          //

    procedure FormCreate(Sender: TObject);        //Объявление процедуры
    //выполняющейся при активизации формы Form1. Sender указывает какой
    //компонент вызывает эту процедуру
  public
    dan_mas:Tdan_mas;      //Исходные и найденные данные для расчета дохода

    id:integer;             //Номер записи для редактирования записи в БД
    redaktirovanie:boolean; //Редактирование или вставка записи в одну из БД

    procedure podshet(s__:real);  //Объявление процедуры, выполняющей поиск
    //комбинации сроков хранения и вложений в различные банки на эти скроки
    //хранения. Принимает начальный параметр - начальную сумму денег в $
    function poisk(chislo:integer; mas:Pdan_mas):TKombin;  //Объявление
    //функции, выполняющей поиск срока хранения среди допустимых сроков
    //хранения. Принимает начальные параметры: chislo - колличество месяцев,
    // mas - указатель на динамический массив типа Tdan_mas
  end;

var
  Form1: TForm1; //Объявление переменной типа TForm1, т.е. главной формы

implementation  //Конец интерфейсной части, начало секции реализации

uses dat, sortirovka, variant_s, Unit1;  //Названия подлючаемых внешних модулей

{$R *.DFM} //Названия компилируемых вместе с исполняемым файлом файло ресурсов

//Определение функции, выполняющей поиск срока хранения среди допустимых
//сроков хранения. Принимает начальные параметры: chislo - колличество месяцев,
// mas - указатель на динамический массив типа Tdan_mas, в котором она ищет
//срок хранения chislo. Результат работы - номер элемента в массиве dan_mas
function TForm1.poisk(chislo:integer; mas:Pdan_mas):TKombin;
var i:integer;  //Счетчик
begin
  result.nomer:=0;        //Номер элемента, соответствующий сроку хранения не
  //найден
  result.nnaydena:=false; //Срок хранения не найден
  //Поиск всех элементов среди всех элемент массива всех скроков хранения.
  //Выполняем поиск От первого элемента массива mas^ до последнего, его номер
  for i:=0 to length(mas^)-1 do //определяется функцией length(mas^)-1.
    begin                       //Нумерация элементов массива от 0
      //Если искомый срок хранения chislo совпадает со сроком, определяемым
      //значением i элемента массива mas^[i].srok, то выполняется составной
      //оператор
      if (mas^[i].srok=chislo) and mas^[i].rez then  //Запись mas^ -
      //Разименованный указатель, т.е. в данном случае конкретный элемент
      //массива всех скроков хранения. i - индекс элемента массива
        begin
          result.nomer:=i;       //Заносим найденный срок хранения
          result.nnaydena:=true; //Срок хранения найден
        end;
    end;
end;

//Определение процедуры, выполняющей поиск комбинации сроков хранения и вложений
// в различные банки на эти скроки хранения. Принимает начальный параметр -
//начальную сумму денег в $.
procedure TForm1.podshet(s__:real);
label 1,2;
var l, i, j:integer;  //определение длины массива, счетчики
  nach_summa:real;    //Начальная сумма
  Variant_s:TVariant_s;  //Доходы за мес по разным вариантам
  max:TMax; //Найденный максимальный доход
  s:string; //Результирующая строка сообщения
  kom:TKombin; //Найден ли срок хранения
begin
  nach_summa:=s__; //Заносим начальную сумму

  dan_mas:=nil;   //Очищаем динамический массив
  //Исходных данных для отдельных вкладов. Его длинна - 0
  va:=nil; //Очищаем динамический массив допустимых сроков хранения

  l:=length(varianti); //Определяем размер массива вариантов сроков хранения
  //varianti. Длина массивов varianti и dan_mas - одинаковая.
  setlength(dan_mas, l); //увеличиваем размер массива Исходных данных для
  //отдельных вкладов на длину массива varianti

  for i:=0 to length(varianti)-1 do //В цыкле от 1 элемента массива dan_mas до
  //последнего (номер последнего - length(varianti)-1). Длина массивов
  //varianti и dan_mas - одинаковая.
    begin   //Очищаем массив dan_mas, присваиваем его элементам 0
      dan_mas[i].srok:=0;
      dan_mas[i].min_summa:=0;
      dan_mas[i].max_summa:=0;
      dan_mas[i].stavka:=0;
      dan_mas[i].nomer:=0;
      dan_mas[i].nomer1:=0;
      dan_mas[i].name_vkl:='';
      dan_mas[i].name_b:='';
      dan_mas[i].rez:=false;  //Не использовать данный срок хранения
    end;

  //Ищем сроки хранения, размер минимальной суммы вложения которых не более
  //заданого параметром s__, а также проверяем наличие этих сроков из массиве
  //вариантов сроков хранения varianti в БД
  for i:=0 to length(varianti)-1 do  //В цыкле от 1 элемента массива dan_mas до
  //последнего (номер последнего - length(varianti)-1). Длина массивов
  //varianti и dan_mas - одинаковая. Заполняем исходные данные dan_mas:Tdan_mas
  //Исходные и найденные данные для расчета дохода
    begin
      //////////////////////////////////////////////////////////////////////////
      dan_mas[i].rez:=true;   //Используем данный срок хранения

      dm.Q_test.Close;      //Закрываем таблицу БД Q_test. Используем ее метод
      //Close
      dm.Q_test.SQL.Clear;  //Удаляем предыдущий SQL запрос. спользуем ее метод
      //SQL.Clear
      //Запоминаем срок хранения в элементе i динамического массива dan_mas -
      //dan_mas[i].srok
      dan_mas[i].srok:=varianti[i]; //количество месяцев
      //Добавляем новый SQL запрос по таблице vklad.db. Результатом его работы
      //будет набор записей из таблицы vklad.db, удовлетворяющих условию: срок
      //хранения равен сроку, определяемому переменной dan_mas[i].srok   И
      //минимальная сумма вклада которых не более nach_summa. inttostr -
      //процедура преобразует из целого в символьную форму, floattostr -
      //процедура преобразует из вещественного в символьную форму,
      dm.Q_test.SQL.Add('select * from "vklad.db" where ("vklad.db"."Srok"='+
                 inttostr(dan_mas[i].srok)+') and ("vklad.db"."Min_summa"<='+
                 floattostr(nach_summa)+')');
      dm.Q_test.Open; //Исполняем SQL запрос

      //Если количество записей, определяется значением dm.Q_test.RecordCount,
      //ноль то выдаем соответствующее сообщение, если не ноль
      if dm.Q_test.RecordCount<>0 then
        begin //То выполняется далее поиск записей из БД vklad.db процентная
        //ставка, которых максимальная
          //////////////////////////////////////////////////////////////////////
          max.stavka:=0; //Ставка - 0
          max.no:=0;     //Номер записи из БД vklad.db - 0

          dm.Q_test.First; //переходим к первой записи в БД vklad.db
          for j:=1 to dm.Q_test.RecordCount do //В цыкле от первой записи до
          //последней ищем максимальную ставку, сравнивая начальную ставку
          //max.stavka с проверяемой из БД vklad.db
            begin
              if max.stavka < dm.Q_test.FieldByName('stavka').asfloat then
              //Запись dm.Q_test.FieldByName('stavka').asfloat означает
              //                      /                   \
              //                название поля          тип поля
              //                записи                 записи
              //asfloat - вещественный, asinteger - целый
                begin  //Если нашли запись с большей % ставкой, то
                  //Присваиваем ее % исходной % ставке
                  max.stavka:=dm.Q_test.FieldByName('Stavka').asfloat; //
                  //Присваиваем ее номер номеру исходной % ставки
                  max.no:=dm.Q_test.FieldByName('no').asinteger;
                end;
               dm.Q_test.Next; //Переходим к следующей записи в БД vklad.db
            end;

          //Если нашли максимальную процентную ставку, то
          if (max.no<>0) and (max.stavka<>0) then
            begin //Переходим к найденной максимальной записи
              if dm.Q_test.Locate('no', max.no, [loCaseInsensitive] ) then
              //Процедура Locate принимает значение 'No' - название поля,
              //max.no - значение поля, [loCaseInsensitive] - используемый
              //параметр поиска. Результат процедуры - переход к найденной
              //записи
                begin //Если запись найдена Запоминаем в массиве dan_mas
                //Исходных данных для отдельных вкладов
                  dan_mas[i].min_summa:= //Минимальную сумму
                                     dm.Q_test.FieldByName('min_summa').asfloat;

                  dan_mas[i].max_summa:= //Максимальную сумму
                                     dm.Q_test.FieldByName('max_summa').asfloat;
                  dan_mas[i].stavka:=dm.Q_test.FieldByName('Stavka').asfloat;
                  //ставку
                  dan_mas[i].nomer:=dm.Q_test.FieldByName('nr').asinteger;;
                  //номер записи в БД vklad.db
                  //Запись dm.Q_test.FieldByName('stavka').asfloat означает
                  //                               /           \
                  //                      название поля      тип поля
                  //                     записи                 записи
                   //asfloat - вещественный, asinteger - целый

                end
              else
                begin //Если записей нет, то выдаем предупреждающее сообщение
                  showmessage('Извините, но по вкладам со сроком хранения '+
                  inttostr(dan_mas[i].srok)+
                  ' запись с максимальной процентной ставкой не найдена.');
                  dan_mas[i].rez:=false; //вклада с таким сроком хранения нет в
                  //бд. inttostr - преобразование из целого в строковый тип
                end;

            end
          else
            begin     //Если записей нет, то выдаем предупреждающее сообщение
              showmessage('Извините, но по вкладам со сроком хранения '+
              inttostr(dan_mas[i].srok)+' процентная ставка равна 0.');
              dan_mas[i].rez:=false; //вклада с таким сроком хранения нет в бд
              //inttostr - преобразование из целого в строковый тип
            end;

          //Если нашли запись с максимальной процентной ставкой, удовлетворяющей
          //определенным выше условиям, то ищем название вклада соотствующего
          //найденному субсчету и название банка содержащего этот вклад
          if dan_mas[i].rez then
            begin
              dm.Q_test.Close; //Закрываем таблицу БД Q_test. Используем ее
              //метод Close
              dm.Q_test.SQL.Clear;//Удаляем предыдущий SQL запрос. Используем ее
              // метод SQL.Clear
              //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом
              //его работы будет набор записей из таблицы vkl_nam.db,
              //удовлетворяющих условию: "vkl_nam.db"."no" - номер вклада равен
              //найденному выше номеру dan_mas[i].nomer. Т.Е. идет поиск
              //счета (названия счета) в таблице vkl_nam.db- "родителя" субщета
              //имеющего максимальную % ставку из таблицы vklad.db
              dm.Q_test.SQL.Add(
                          'select * from "vkl_nam.db" where ("vkl_nam.db"."no"='
              +inttostr(dan_mas[i].nomer)+')');
              //inttostr - преобразование из целого в строковый тип
              dm.Q_test.Open; //Исполняем SQL запрос

              //Если количество записей, определяется значением
              //dm.Q_test.RecordCount, ноль то выдаем соответствующее сообщение,
              // если не ноль
              if dm.Q_test.RecordCount<>0 then
                begin  //Сохраняем название вклада FieldByName('n').asstring в
                  //элементе массива dan_mas[i].name_vkl. Номер банка
                  //FieldByName('nr').asinteger в dan_mas[i].nomer1. Название
                  //берем из поля n, номер банка из поля nr таблицы vkl_nam.db
                  dan_mas[i].name_vkl:=dm.Q_test.FieldByName('n').asstring;
                  dan_mas[i].nomer1:=dm.Q_test.FieldByName('nr').asinteger;

                  //Запись dm.Q_test.FieldByName('nr').asfloat означает
                  //                             /           \
                  //                      название поля      тип поля
                  //                     записи                 записи
                  //asinteger - целый, asstring - строковый

                  //Выполняем поиск названия банка
                  dm.Q_test.Close; //Закрываем таблицу БД Q_test. Используем ее
                  //метод Close
                  dm.Q_test.SQL.Clear;//Удаляем предыдущий SQL запрос.
                  //Используем ее метод SQL.Clear
                  //Добавляем новый SQL запрос по таблице bank.db. Результатом
                  //его работы будет набор записей из таблицы bank.db,
                  //удовлетворяющих условию: "bank.db"."no" - номер банка равен
                  //найденному выше номеру dan_mas[i].nomer1. Т.Е. идет поиск
                  //банка (названия банка) в таблице bank.db- "родителя" вклада
                  //из таблицы vkl_nam.db, имеющего максимальную % ставку в
                  //субвкладе в таблице vklad.db
                  dm.Q_test.SQL.Add(
                                'select * from "bank.db" where ("bank.db"."no"='
                                +inttostr(dan_mas[i].nomer1)+')');
                  dm.Q_test.Open; //Исполняем SQL запрос

                  //Если количество записей, определяется значением
                  //dm.Q_test.RecordCount, ноль то выдаем соответствующее
                  //сообщение, если не ноль
                  if dm.Q_test.RecordCount<>0 then
                    begin  //сохраняем название банка FieldByName('n').asstring
                      //в элементе массива dan_mas Исходных данных для отдельных
                      // вкладов dan_mas[i].name_b
                      dan_mas[i].name_b:=dm.Q_test.FieldByName('n').asstring;

                      //Запись dm.Q_test.FieldByName('nr').asfloat означает
                      //                             /           \
                      //                      название поля      тип поля
                      //                     записи                 записи
                      //asstring - строковый
                    end
                  else  //Если банк не найден, то выдаем предупреждающее
                    begin //сообщение
                      showmessage('Извините, но в БД bank.db ошики.');
                      dan_mas[i].rez:=false; //срок хранения не используем
                    end;
                end
              else   //Если вклад не найден, то выдаем предупреждающее
                begin //сообщение
                  showmessage('Извините, но в БД vkl_nam.db ошики.');
                  dan_mas[i].rez:=false; //вклада с таким сроком хранения нет в
                  //бд, срок хранения не используем
                end;

            end
          //////////////////////////////////////////////////////////////////////
        end
      else //Если срок хранения не найден, то выдаем предупреждающее сообщение
        begin
          showmessage('Извините, но вкладов со сроком хранения '+
          inttostr(dan_mas[i].srok)+' месяца(ев) нет.');
          dan_mas[i].rez:=false; //вклада с таким сроком хранения нет в бд,
          //срок хранения не используем. inttostr - преобразование из целого в
          //строковый тип
        end;

      //Если найден срок хранения, то
      if dan_mas[i].rez then   //Добавляем его в динамический массив допустимых
      //сроков хранения va
        begin
          l:=length(va); //Определяем размер массива вариантов сроков хранения
          setlength(va, l+1); //увеличиваем размер массива сроков хранения va
          //на 1 элемент
          va[l]:=dan_mas[i].srok; //Добавляем один элемент (срок хранения) в
          //динамический массив va
        end;

      //////////////////////////////////////////////////////////////////////////
    end;

  varianti:=nil; //Очищаем динамический массив допустимых сроков хранения
  varianti:=va;  //Присваиваем временный массив допустимых сроков хранения va
  //постоянному массиву допустимых сроков хранения varianti

  //dan_mas= array [0..3] of TIs_dan; //0- 3, 1- 6, 2- 9, 3- 12 мес
  //Variant_s:TVariant_s;  //Доходы за мес по разным вариантам и комбинациям
  //сроков хранения

  //Если нет сроков хранения, определяем вычислением длины динамического массива
  //va, то заканчиваем процедуру, перемещаясь к метке 1
  if length(va)=0 then
    goto 1;

  //Если варианы есть, то происходит
  Polucit_Variants(12); //Получение всех возможных вариантов которыми можно
  //представить число, передаваемое в процедуру,  - 12 месяцев
  //Результат - набор комбинаций сроков хранения, сохраняется в динамическом
  //массиве Sroki, его длина - число всех возможных вариантов сумм,
  //представляющих число, в  - 12 месяцев

  //Если таких вариантов комбинаций сроков хранения нет, то заканчиваем
  // процедуру, перемещаясь к метке 1. Количество вариантов определяется
  //длиной динамического массива Sroki
  if length(Sroki)=0 then
    goto 1;

  //Если варианты  комбинаций сроков хранения есть, то считаем для каждой
  //комбинации доход
  l:=length(Sroki); //Определяем размер массива комбинаций сроков хранения
  Variant_s:=nil;   //Очищаем динамический массив Доходов по разным вариантам и
  //комбинациям сроков хранения
  setlength(Variant_s, l); //Устанавливаем размер массива Доходов по разным
  //вариантам и комбинациям сроков хранения Variant_s равным размеру массива
  //комбинаций сроков хранения Sroki

  //Считаем доход

  //Если динамический массив Variant_s  - существует, то указатель на область
  //памяти не nil (nil - пусто), проверка выполняется процедурой assigned,
  // принимающей указатель массива Variant_s
  if assigned(Variant_s) then
  //если массив существует, то в цыкле от первой комбинации сроков хранения до
  //последней, которая определяется длиной массива Variant_s, т.е.
  //length(Variant_s)-1. Нумерация от 0.
    for i:=0 to length(Variant_s)-1 do
      begin
        Variant_s[i].rez:=true;     //Будим считать если Доход - не ноль

        Variant_s[i]. doxod :=nach_summa;     //Увеличиваем даход на
        //исходную сумму $

        l:=length(Sroki[i]);   //определяем длину комбинации сроков хранения,
        //т.е. количество всех сроков хранения одной комбинации

        Variant_s[i].komb:=nil;  //Очищаем динамический массив вариантов сроков
        //хранения, присваивая ему нулевой указатель
        setlength(Variant_s[i].komb, l); //Устанавливаем размер массива
        //вариантов сроков хранения, равным длине массива комбинации сроков
        //хранения Sroki[i]

        //В цыкле от первого срока хранения до последнего, определяемого длиной
        //массива Variant_s[i].komb, т.е. length(Variant_s[i].komb)-1. Нумерация
        //от нуля
        for j:=0 to length(Variant_s[i].komb)-1 do
          begin
            //Записываем количество месяцев срока хранения и число повторений
            //вложения в банк в элемент динамического массива комбинации сроков
            //хранения Variant_s[i].komb[j]
            Variant_s[i].komb[j].chislo:=Sroki[i][j].chislo; //срок
            //хранения
            Variant_s[i].komb[j].kol:=Sroki[i][j].kol; //число повторений
            //срока хранения

            //Считаем доход за определенный срок хранения
            //Variant_s[i].komb[j].chislo , за несколько вложений на этот срок
            //Проверяем срок хранения в массиве сроков
            kom:=poisk(Variant_s[i].komb[j].chislo, @dan_mas);
            if kom.nnaydena then //Если число месяцев найдено
              begin
                //В цыкле от первого вложения до последного считаем доход
                for l:=1 to Variant_s[i].komb[j].kol do
                  Variant_s[i].doxod:=
                  (dan_mas[kom.nomer].srok * dan_mas[kom.nomer].stavka/1200 +1)*
                  Variant_s[i].doxod;
                  //Где kom.nomer - номер элемента со сроком хранения
                  //Variant_s[i].komb[j].chislo в массиве dan_mas,
                  //dan_mas[kom.nomer].srok - срок хранения,
                  //dan_mas[kom.nomer].stavka - процентная ставка по данному
                  //сроку хранеия, взятые из элемента kom.nomer динамического
                  //массива dan_mas
              end
            else
              begin  //Если срок хранения не найден
                Variant_s[i].rez:=false;  //Доход - ноль
                Variant_s[i]. doxod :=nach_summa;     //Увеличиваем даход на
                //исходную сумму $
                goto 2; //Выходим из цыкла расчета дохода
              end;

          end;
2:
        Variant_s[i]. doxod :=Variant_s[i]. doxod - nach_summa;//Уменьшаем
        //доход на исходную сумму
      end;


  //Находим максимальный доход
  //max.stavka - максимальный доход за 1 год
  max.stavka:=0;
  //max.no - порядковый номер комбинации в массиве Variant_s

  //В цыкле от первой комбинации сроков вложения до последней определяемой
  //длиной массива Variant_s, т.е. length(Variant_s)-1. Нумерация от 0.
  //Находим максимальный доход для данной комбинации сроков вложения в различные
  //банки
  for i:=0 to length(Variant_s)-1 do
  //Если доход Variant_s[i].doxod по какойто комбинации сроков вложения больше
  //исходного дохода max.stavka, и такая комбинация сроков вложения допустима,
  //то исходному доходу max.stavka присваиваем этот доход, а также присваиваем
  //номеру комбинации с наибольшим доходом max.no - номер комбинации в массие
  //Variant_s, т.е. i.
    if (Variant_s[i].doxod > max.stavka) and Variant_s[i].rez then
      begin
        max.stavka:=Variant_s[i].doxod;
        max.no:=i; //Номер комбинации
      end;

  //Если найденный доход не ноль, то выдаем отчет
  if max.stavka <>0 then
    begin
      //max.no   s - содержит информацию о вложении
      s:='Самым выгодным вложением в течение года является вклад: '#13#10#13#10;
      //От первого срока вложения до последнго, его размер определяется
      //длиной динамического массива комбинации сроков вложения
      //Variant_s[max.no].komb, выполняется составной оператор. max.no - номер
      //комбинации сроков вложения в массиве Variant_s с максимальным доходом
      For i:=0 to length(Variant_s[max.no].komb) - 1 do
        begin
          //Проверяем срок хранения в массиве сроков
          kom:=poisk(Variant_s[max.no].komb[i].chislo, @dan_mas);

          //Если срок вложения найден
          if kom.nnaydena then
            begin   //Показываем количество повторений срока вложения
              s:=s+' '+inttostr(Variant_s[max.no].komb[i].kol)+

              ' раз(а) на '+ //Показываем количество месяцев срока вложения
              inttostr(Variant_s[max.no].komb[i].chislo)+
                               //Показываем название банка
              ' мес. в банке "'+dan_mas[kom.nomer].name_b+
                             //Показываем название вклада
              '" во вклад "'+dan_mas[kom.nomer].name_vkl+'" от '+
                             //Показываем минимальную сумму
              floattostr(dan_mas[kom.nomer].min_summa);
              //Показываем максимальную сумму
              if dan_mas[kom.nomer].max_summa<dan_mas[kom.nomer].min_summa then
              //Если максимальная сумма не задана
                s:=s+' $ и более.'#13#10#13#10
              else
              //Если максимальная сумма задана
              s:=s + ' до '+floattostr(dan_mas[kom.nomer].max_summa)+
              ' $.'#13#10#13#10;
            end;
        end;
      //Форматируем вывод вещественного числа 8 целых и 3 дробных числа
      s:=s+'Доход составил: '+ Format('%8.3f', [max.stavka])+' $';
      //Выдаем сообщение о максимальном вложении
      showmessage(s);
    end
  else //Если нет вкладов в БД, то выдаем сообщение
    showmessage('Вклады отсутствуют в БД. Расчет доходности невозможен.');
1:

end;

//Определение процедуры-обработчика для пункта меню N2, выполняющегося при
//возникновении события onClick
procedure TForm1.N2Click(Sender: TObject);
begin
  close;  //Закрываем программу
end;
//Объявление процедуры-обработчика нажатия кнопки SpeedButton1.
//Выполняет открытие БД содержащую информацию о банках, вкладах, субвкладах
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  //Определяем прцедуры обработчики для события OnDataChange в источниках данных
  //dm.DataSource1 и dm.DataSource2. Для источниках данных dm.DataSource1
  //процедура DM.Query1Change, для dm.DataSource2 - DM.Query2Change.
  //Требуется для организации двух связей "1 ко многим" между 3 таблицами
  //Баз данных: "bank.db"."no"="vkl_nam.db"."nr",
  //"vkl_nam.db"."no"="vklad.db"."nr". bank.db - информация о названиях банков,
  //vkl_nam.db - информация о названиях вкладов, vklad.db - информация о
  //субвкладах
  dm.DataSource1.OnDataChange:=DM.Query1Change;
  dm.DataSource2.OnDataChange:=DM.Query2Change;

  dm.Query3.Close;  //закрываем таблицу с субвкладамии
  dm.Query2.Close;  //закрываем таблицу с названиями вкладов

  dm.Query1.Close; //закрываем таблицу с названиями банков Query1. Используем ее
                  //метод Close
  dm.Query1.SQL.Clear; //Удаляем предыдущий SQL запрос. Используем ее метод
  //SQL.Clear
  //Добавляем новый SQL запрос по таблице bank.db. Результатом его работы будет
  //набор всех записей из таблицы bank.db, т.е. всех существующих банков
  dm.Query1.SQL.Add('select * from bank.db');
  dm.Query1.Open;  //Выполняем SQL запрос.

end;

//Объявление процедуры-обработчика нажатия кнопки SpeedButton2.
//Выполняет закрытие БД содержащую информацию о банках, вкладах, субвкладах
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  //Определяем прцедуры обработчики для события OnDataChange в источниках данных
  //dm.DataSource1 и dm.DataSource2. Для источников данных dm.DataSource1
  //и dm.DataSource2 - nil.
  //Требуется для удаления двух связей "1 ко многим" между 3 таблицами
  //Баз данных: "bank.db"."no"="vkl_nam.db"."nr",
  //"vkl_nam.db"."no"="vklad.db"."nr". bank.db - информация о названиях банков,
  //vkl_nam.db - информация о названиях вкладов, vklad.db - информация о
  //субвкладах

  dm.DataSource1.OnDataChange:=nil;
  dm.DataSource2.OnDataChange:=nil;

  dm.Query3.Close; //закрываем таблицу с субвкладамии
  dm.Query2.Close; //закрываем таблицу с названиями вкладов
  dm.Query1.Close; //закрываем таблицу с названиями банков Query1. Используем ее
                  //метод Close
end;

//Объявление процедуры-обработчика нажатия кнопки SpeedButton3.
//Выполняет расчет наилучшего дохода для вложения на 12 мечсяцев
procedure TForm1.SpeedButton3Click(Sender: TObject);
var s_:string;  //
    ss:real;    //Начальная сумма вклада
begin
  s_:='1000'; //Заданная по умочанию начальная сумма вклада 1000 $
  ss:=1000;
  //Вывод диалогового окна для ввода начальной суммы вклада сохраняется в s_
  if InputQuery('Начальная сумма вклада','Сумма, $' ,s_) then
    begin
      try  //обработка возможной ошибки ввода начальной суммы вклада
        ss:=strtofloat(s_); // strtofloat - преобразование строки s_ в
        //вещественное число ss
      except
        //Если произошла ошибка то выводим сообщение
        showmessage('Сумма введена с ошибками');
      end;
      //Определяем прцедуры обработчики для события OnDataChange в источниках
      //данных dm.DataSource1 и dm.DataSource2. Для источников данных
      //dm.DataSource1 и dm.DataSource2 - nil. Требуется для удаления двух
      //связей "1 ко многим" между 3 таблицами Баз данных:
      //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr".
      //bank.db - информация о названиях банков, vkl_nam.db - информация о
      //названиях вкладов, vklad.db - информация о субвкладах

      dm.DataSource1.OnDataChange:=nil;
      dm.DataSource2.OnDataChange:=nil;

      //Показываем форму Form2 в модальном режиме, т.е. когда доступна только
      //форма Form2, а другие формы программы не доступны.
      Form2.ShowModal;
      try //обработка возможной ошибки в процедуре расчета наибольшего дохода
        podshet(ss); //Запуск процедуры расчета наибольшего дохода
      except
        //Если произошла ошибка выводим сообщение
        showmessage('Ошибка в процедуре расчета наибольшего дохода');
      end;

      //Определяем прцедуры обработчики для события OnDataChange в источниках
      //данных dm.DataSource1 и dm.DataSource2. Для источниках данных
      //dm.DataSource1 процедура DM.Query1Change, для dm.DataSource2 -
      //DM.Query2Change. Требуется для организации двух связей "1 ко многим"
      //между 3 таблицами
      dm.DataSource1.OnDataChange:=DM.Query1Change;
      dm.DataSource2.OnDataChange:=DM.Query2Change;

    end;
end;

//Определение процедуры-обработчика для пункта меню N2, выполняющегося при
//возникновении события onClick. Sender указывает какой компонент вызывает эту
//процедуру. Создание банка
procedure TForm1.N3Click(Sender: TObject);
var s:string; //название банка
begin
  s:='';
  //Вывод диалогового окна для ввода названия банка, название сохраняется в s
      if InputQuery('Создание нового банка','Название:' ,s) then
        begin
          s:=trim(s); //Удаление пробелов и управляющих символов с начала и
          //конца строки s
          if s<>'' then   //Если строка не пустая
            begin
              s:=trim(s); //Удаление пробелов и управляющих символов с начала и
             //конца строки s
         //Определяем прцедуры обработчики для события OnDataChange в источниках
            //данных dm.DataSource1 и dm.DataSource2. Для источников данных
            //dm.DataSource1 и dm.DataSource2 - nil. Требуется для удаления двух
              //связей "1 ко многим" между 3 таблицами Баз данных:
           //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr"
            //bank.db - информация о названиях банков, vkl_nam.db - информация о
              //названиях вкладов, vklad.db - информация о субвкладах

              dm.DataSource1.OnDataChange:=nil;
              dm.DataSource2.OnDataChange:=nil;


              dm.Query3.Close; //закрываем таблицу с субвкладамии
              dm.Query2.Close; //закрываем таблицу с названиями вкладов
              //закрываем таблицу с названиями банков Query1. Используем ее
              dm.Query1.Close; //метод Close
              dm.Query1.SQL.Clear; //Удаляем предыдущий SQL запрос.
              //Используем ее метод SQL.Clear
              //Добавляем новый SQL запрос по таблице bank.db. Результатом его
              //работы будет набор всех записей из таблицы bank.db, у которых
              //название банка поле n будет равным строковой переменной S
              dm.Query1.SQL.Add(
              'select * from "bank.db" where ("bank.db"."n" = "'+s+'")');
              dm.Query1.Open; //Выполняем SQL запрос

              //Если нет таких названий банков, т.е. количество записей
              //набора данных RecordCount равно 0
              if dm.Query1.RecordCount=0 then
                begin
                  dm.Query1.Insert; //Вставляем новую запись
                  DM.Query1.FieldByName('n').asstring:=s; //Заносим в строковое
                  //поле n название банка из переменной S
                  dm.Query1.Post; //Заканчиваем редактирование
                end
              else //Если название банка найдено в БД bank.db, то выдаем
              //предупреждающее сообщение
                showmessage(
                         'Извините, но банк с таким названием уже существует.');

        //Определяем прцедуры обработчики для события OnDataChange в источниках
              //данных dm.DataSource1 и dm.DataSource2. Для источниках данных
              //dm.DataSource1 процедура DM.Query1Change, для dm.DataSource2 -
              //DM.Query2Change. Требуется для организации двух связей "1 ко
              // многим" между 3 таблицами
              dm.DataSource1.OnDataChange:=DM.Query1Change;
              dm.DataSource2.OnDataChange:=DM.Query2Change;

              dm.Query1.Close; //закрываем таблицу с банками
              dm.Query1.SQL.Clear; //Удаляем предыдущий SQL запрос.
              //Используем ее метод SQL.Clear
              //Добавляем новый SQL запрос по таблице bank.db. Результатом его
              //работы будет набор всех записей из таблицы bank.db
              dm.Query1.SQL.Add('select * from bank.db');
              dm.Query1.Open;//Выполняем SQL запрос
              //Переходим к созданной записи
              dm.Query1.Locate('n', s, [loCaseInsensitive] );
              //Процедура Locate принимает значение 'N' - название поля,
              //s - значение поля, [loCaseInsensitive] - используемый
              //параметр поиска. Результат процедуры - переход к найденной
              //записи
            end;

        end;
end;
//Определение процедуры-обработчика для пункта меню N4, выполняющегося при
//возникновении события onClick. Sender указывает какой компонент вызывает эту
//процедуру.  Изменение названия банка
procedure TForm1.N4Click(Sender: TObject);
var s:string;  //название банка
begin
  s:='';
  //Проверяем что таблица банков bank.db открыта. Это определяется свойством
  //Active компонента DM.Query1. Если истина то таблица открыта
  if DM.Query1.Active then
  //Проверяем что набор данных не пустой. Проверяем что количество
  //записей набора данных DM.Query1.RecordCount не ноль.
    if dm.Query1.RecordCount<>0 then
      begin //Если записи есть
        s:=DM.Query1.FieldByName('n').asstring; //Сохраняем в переменной s
        //название банка из поля DM.Query1.FieldByName('n').asstring
          //Выводим диалоговое окно запроса нового названия банка, новое
          //название сохраняется в переменной s
          if InputQuery('Изменение названия банка','Название:' ,s) then
            begin
              s:=trim(s); //Удаление пробелов и управляющих символов с начала и
             //конца строки s
              if s<>'' then  //Если название банка не пустое
                begin
         //Определяем прцедуры обработчики для события OnDataChange в источниках
            //данных dm.DataSource1 и dm.DataSource2. Для источников данных
            //dm.DataSource1 и dm.DataSource2 - nil. Требуется для удаления двух
              //связей "1 ко многим" между 3 таблицами Баз данных:
           //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr"
            //bank.db - информация о названиях банков, vkl_nam.db - информация о
              //названиях вкладов, vklad.db - информация о субвкладах

                  dm.DataSource1.OnDataChange:=nil;
                  dm.DataSource2.OnDataChange:=nil;

                  dm.Q_test.Close; //закрываем таблицу с банками
                  dm.Q_test.SQL.Clear; //Удаляем предыдущий SQL запрос.
                  //Используем ее метод SQL.Clear
                //Добавляем новый SQL запрос по таблице bank.db. Результатом его
                  //работы будет набор всех записей из таблицы bank.db. Название
                  //банков которых равно строковой переменной s
                  dm.Q_test.SQL.Add(
                       'select * from "bank.db" where ("bank.db"."n"="'+s+'")');
                  dm.Q_test.Open; //Выполняем SQL запрос

                  //Проверяем что набор данных не пустой. Проверяем что
                  //количество записей набора данных DM.Q_test.RecordCount после
                  //выполнения SQl запроса не ноль.
                  if dm.Q_test.RecordCount=0 then
                    begin  //Если ноль
                      dm.Query1.Edit; //Редактируем запись в таблице bank.db
                      DM.Query1.FieldByName('n').asstring:=s; //Изменяем
                      //значение поля n, из строковой переменной s
                      dm.Query1.Post; //Заканчиваем редактирование записи в
                      //таблице bank.db
                    end
                  else  //Если не ноль выдаем предупреждающее сообщение
                    showmessage(
                         'Извините, но банк с таким названием уже существует.');

                  dm.Q_test.Close; //закрываем таблицу с найденными записями
                  //Определяем прцедуры обработчики для события OnDataChange в
                  //источниках данных dm.DataSource1 и dm.DataSource2. Для
                  //источника данных dm.DataSource1 процедура DM.Query1Change,
                  //для dm.DataSource2 - DM.Query2Change. Требуется для
                  //организации двух связей "1 ко многим" между 3 таблицами
                  dm.DataSource1.OnDataChange:=DM.Query1Change;
                  dm.DataSource2.OnDataChange:=DM.Query2Change;
                end;
            end;
      end;
end;
//Определение процедуры-обработчика для пункта меню N6, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Создание вклада
procedure TForm1.N6Click(Sender: TObject);
var s:string; //названия вклада
begin
    s:='';
    //Проверяем что таблица банков bank.db открыта. Это определяется свойством
    //Active компонента DM.Query1. Если истина то таблица открыта
    if DM.Query1.Active then   //Если открыта
    //Выводим диалоговое окно запроса нового названия вклада, новое
    //название сохраняется в переменной s
      if InputQuery('Создание нового вклада','Название вклада:' ,s) then
        begin
          s:=trim(s); //Удаление пробелов и управляющих символов с начала и
          //конца строки s

          //Выполняем поиск вкладов с названием равным s

          //Если название вклада не пустое и существуют банки в таблице bank.db
          //Существование банков определяется проверкой количества записей в
          //таблице bank.db - DM.Query1.RecordCount
          if (s<>'') and (DM.Query1.RecordCount<>0) then
            begin
              dm.DataSource2.OnDataChange:=nil; //То удаляем обработчик связи
              // "1 ко многим" между 2 таблицами Базы данных (vkl_nam.db -
              //информация о названиях вкладов, vklad.db - информация о
              //субвкладах): "vkl_nam.db"."no"="vklad.db"."nr"
              dm.Query3.Close; //Закраваем таблицу субвкладов

              dm.Query2.Close; //Закраваем таблицу вкладов
              dm.Query2.SQL.Clear; //Удаляем предыдущий SQL запрос.
             //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом его
              //работы будет набор всех записей из таблицы vkl_nam.db, название
              //вкладов которых равно строковой переменной s, а также
              //содержащихся в одном банке (определяется значением поля nr в
              //таблице vkl_nam.db и значением поля no в таблице bank.db).
              dm.Query2.SQL.Add(
                       'select * from "vkl_nam.db" where ("vkl_nam.db"."n"="'+s+
                       '") and ("vkl_nam.db"."nr"="'+
                       Dm.Query1.FieldByName('no').asstring+'")');
              dm.Query2.Open; //Выполняем SQL запрос

              //Проверяем что набор данных не пустой. Проверяем что
              //количество записей набора данных DM.Query2.RecordCount после
              //выполнения SQl запроса не ноль.
              if dm.Query2.RecordCount=0  then
                begin  //Если нет записей
                  dm.Query2.Insert;  //Вставляем 1 запись в таблицу vkl_nam.db
                  Dm.Query2.FieldByName('n').asstring:=s; //Полю n, вставляемой
                  //записи присваиваем название вклада из переменной s
                  //Полю связи nr с таблицей bank.db, вставляемой записи
                  //присваиваем значение из поля no таблицы bank.db
                  DM.Query2.FieldByName('nr').asinteger:=
                                          DM.Query1.FieldByName('no').asinteger;
                  dm.Query2.Post; //Заканчиваем редактирование записи
                end
              else  //Если записи есть, выдаем сообщение
                showmessage(
                        'Извините, но вклад с таким названием уже существует.');

              //Восстанавливаем связь "1 ко многим" между 2 таблицами Базы
              //данных (vkl_nam.db - информация о названиях вкладов, vklad.db -
              //информация о субвкладах): "vkl_nam.db"."no"="vklad.db"."nr"
              dm.DataSource2.OnDataChange:=DM.Query2Change;

              dm.Query2.Close; //закрываем таблицу с вкладами
              dm.Query2.SQL.Clear; //Удаляем предыдущий SQL запрос.
             //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом его
              //работы будет набор всех записей из таблицы vkl_nam.db,
              //содержащихся в одном банке (определяется значением поля nr в
              //таблице vkl_nam.db и значением поля no в таблице bank.db).
              dm.Query2.SQL.Add(
                        'select * from "vkl_nam.db" where ("vkl_nam.db"."nr"='+
                        DM.Query1.FieldByName('no').asstring+')');
              dm.Query2.Open; //Выполняем SQL запрос
              //Переходим к созданному вкладу
              dm.Query2.Locate('n', s, [loCaseInsensitive] )
              //Процедура Locate принимает значение 'N' - название поля,
              //s - значение поля, [loCaseInsensitive] - используемый
              //параметр поиска. Результат процедуры - переход к найденной
              //записи
            end;
        end;
end;
//Определение процедуры-обработчика для пункта меню N8, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Изменение названия вклада.
procedure TForm1.N8Click(Sender: TObject);
var s:string;
begin
  //Проверяем что существуют банк и редактируемый вклад в этом банке, что наборы
  //данных не пустые, т.е.  таблицы bank.db и vkl_nam.db открыты. Это
  //достигается проверкой свойст DM.Query1.Active - для таблицы bank.db и
  //DM.Query2.Active - для vkl_nam.db.
  if DM.Query1.Active and DM.Query2.Active then //Если таблицы открыты
  //Проверяем что количество записей наборов данных RecordCount для обоих таблиц
  //не ноль
    if (dm.Query2.RecordCount<>0) and (DM.Query1.RecordCount<>0) then
        begin //Если количество записей не нулевое, т.е. существует вклад в
        //банке
          s:=DM.Query2.FieldByName('n').asstring; //Сохраняем предыдущее
          //название вклада в строковой переменной s
          //Выводим диалоговое окно запроса нового названия всклада, новое
          //название сохраняется в переменной s
          if InputQuery('Изменение названия вклада','Название вклада:' ,s) then
            begin
              s:=trim(s); //Удаление пробелов и управляющих символов с начала и
              //конца строки s
              //Если название вклада не пустое и открыта таблица банков bank.db,
              //т.е. свойство DM.Query1.Active установлено в true
              if (s<>'') and (DM.Query1.Active) then
                begin
                  //Определяем прцедуру-обработчик для события OnDataChange в
                  //источнике данных dm.DataSource2. Для источника данных
                  //dm.DataSource2 - nil. Требуется для удаления связи "1 ко
                  //многим" между 2 таблицами Баз данных:
                  //"vkl_nam.db"."no"="vklad.db"."nr"
                  //vkl_nam.db - информация о названиях вкладов, vklad.db -
                  //информация о субвкладах
                  dm.DataSource2.OnDataChange:=nil;

                  dm.Q_test.Close; //закрываем таблицу
                  dm.Q_test.SQL.Clear;  //Удаляем предыдущий SQL запрос.
             //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом его
                 //работы будет набор всех записей из таблицы vkl_nam.db,
                 //содержащихся в одном банке (определяется значением поля nr в
                 //таблице vkl_nam.db и значением поля no в таблице bank.db) и
                 //имеющих одинаковое название вклада s.
                  dm.Q_test.SQL.Add(
                       'select * from "vkl_nam.db" where ("vkl_nam.db"."n"="'+s+
                       '") and ("vkl_nam.db"."nr"="'+
                       Dm.Query1.FieldByName('no').asstring+'")');
                  dm.Q_test.Open; //Выполняем SQL запрос
                  //Проверяем, что набор данных не пустой. Проверяем что
                  //количество записей набора данных DM.Q_test.RecordCount после
                  //выполнения SQl запроса не ноль.
                  if dm.Q_test.RecordCount=0 then
                    begin //Если вкладов нет
                      dm.Query2.Edit; //Редактируем запись в БД vkl_nam.db
                      DM.Query2.FieldByName('n').asstring:=s;//Полю n,
                      //редактируемой записи присваиваем название вклада из
                      //переменной s.
                      dm.Query2.Post; //Заканчиваем редактирование записи
                    end
                  else //Если записи есть, выдаем сообщение
                    showmessage(
                        'Извините, но вклад с таким названием уже существует.');

                  dm.Q_test.Close; //закрываем таблицу
                  //Восстанавливаем связь "1 ко многим" между 2 таблицами Базы
               //данных (vkl_nam.db - информация о названиях вкладов, vklad.db -
                  //информация о субвкладах): "vkl_nam.db"."no"="vklad.db"."nr"
                  dm.DataSource2.OnDataChange:=DM.Query2Change;
                end;

            end;
        end;
end;

//Определение процедуры-обработчика для пункта меню N10, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Редактирование субвклада.
procedure TForm1.N10Click(Sender: TObject);
begin
  //Проверяем что существуют вклад и редактируемый субвклад в этом вкладе, что
  //наборы данных не пустые, т.е.  таблицы vkl_nam.db и vklad.db открыты. Это
  //достигается проверкой свойст DM.Query2.Active - для таблицы vkl_nam.db и
  //DM.Query3.Active - для vklad.db.
  if DM.Query2.Active and DM.Query3.Active then
  //Проверяем, что количество записей наборов данных RecordCount для обоих
  //таблиц не ноль
    if (DM.Query2.RecordCount<>0) and (DM.Query3.RecordCount<>0) and
    DM.Query3.Active then
      begin  //Если количество записей не нулевое, т.е. существует субвклад в
        //вкладе
        //Запоминаем номер редактируемой записи субвклада из таблицы vklad.db в
        //переменной id
        id:=DM.Query3.FieldByName('no').asinteger;
        dm.Query3.Edit; //Начинаем редактирование записи субвклада из таблицы
        //vklad.db
        redaktirovanie:=true; //Значению переменной redaktirovanie присваиваем
        //true - редактирование субвклада
        f_sv.ShowModal;  //Открываем форму редактирования субвклада в модальном
        //режиме, т.е. когда доступна только одна эта форма редактирования f_sv
      end;

end;
//Определение процедуры-обработчика для пункта меню N9, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Создание субвклада
procedure TForm1.N9Click(Sender: TObject);
begin
  id:=0;
  //Проверяем что существуют вклад, что набор данных не пустой, т.е.  таблица
  //vkl_nam.db открыта. Это достигается проверкой свойства DM.Query2.Active -
  //для таблицы vkl_nam.db.
  if DM.Query2.Active  then //Если таблица открыта, то
  //Проверяем, что количество записей наборов данных RecordCount для таблицы
  //vkl_nam.db не ноль и что определен номер редактируемой записи
    if (DM.Query2.RecordCount<>0) and
    (DM.Query2.FieldByName('no').asstring<>'') then
      begin  //если существует вклад
        dm.Query3.Insert;//Вставляем 1 запись в таблицу субвкладов vklad.db
        redaktirovanie:=false; //Значению переменной redaktirovanie присваиваем
        //false - создание субвклада
        f_sv.ShowModal; //Открываем форму редактирования субвклада в модальном
        //режиме, т.е. когда доступна только одна эта форма редактирования f_sv
      end;

end;
//Определение процедуры-обработчика для пункта меню N11, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Удаление субвклада
procedure TForm1.N11Click(Sender: TObject);
begin
  //Проверяем что существуют субвклад, что набор данных не пустой, т.е.  таблица
  //vklad.db открыта. Это достигается проверкой свойства DM.Query3.Active -
  //для таблицы vklad.db.
  if DM.Query3.Active then //Если таблица открыта, то
  //Проверяем, что количество записей наборов данных RecordCount для таблицы
  //vklad.db не ноль и что определен номер редактируемой записи
    if (DM.Query3.RecordCount<>0) and (DM.Query3.FieldByName('no').asstring<>'')
    then
      //Вывод диалогового окна подтверждения удаления субвклада
      case MessageDlg('Внимание! Удаление субвклада.'+
           #13#10#13#10+'Удалить субвклад - Yes,   не удалять - No.'
           , mtConfirmation, [mbYes, mbNo], 0) of
        mrYes://Если выбран вариант Yes, то выполняем удаление субвклада
              dm.Query3.Delete;
      end;
end;
//Определение процедуры-обработчика для пункта меню N2, выполняющегося при
//возникновении события onClick. Sender указывает какой компонент вызывает эту
//процедуру. Удаление банка, а также всех его вкладов и субвкладов.
procedure TForm1.N5Click(Sender: TObject);
label 1;
var n1, no:string;
  i:integer;
begin
  //Проверяем что существуют банк, что набор данных не пустой, т.е. таблица
  //bank.db открыта. Это достигается проверкой свойст DM.Query1.Active - для
  //таблицы bank.db
  if DM.Query1.Active then
    //Проверяем, что количество записей набора данных RecordCount для таблицы
    //bank.db не ноль и что определен номер редактируемой записи
    if DM.Query1.RecordCount<>0 then
      begin
        //Вывод диалогового окна подтверждения удаления банка
        case MessageDlg('Внимание! Удаление банка.'+
             #13#10#13#10+'Удалить банк - Yes,   не удалять - No.'
             , mtConfirmation, [mbYes, mbNo], 0) of
          mrno: goto 1;  //Если выбран вариант No - перемещаемся к метке 1
          //и завершаем процедуру
        end;
        //Определяем прцедуры обработчики для события OnDataChange в источниках
        //данных dm.DataSource1 и dm.DataSource2. Для источников данных
        //dm.DataSource1 и dm.DataSource2 - nil. Требуется для удаления двух
        //связей "1 ко многим" между 3 таблицами Баз данных:
        //"bank.db"."no"="vkl_nam.db"."nr", "vkl_nam.db"."no"="vklad.db"."nr"
        //bank.db - информация о названиях банков, vkl_nam.db - информация о
        //названиях вкладов, vklad.db - информация о субвкладах

        dm.DataSource1.OnDataChange:=nil;
        dm.DataSource2.OnDataChange:=nil;

        dm.Query3.Close;  //Закраваем таблицу субвкладов
        dm.Query2.Close;  //Закраваем таблицу вкладов

        //Запоменаем в переменной n1 номер удаляемого банка из таблицы bank.db
        n1:=DM.Query1.FieldByName('no').asstring;

        dm.Q_test.close;     //Закраваем таблицу
        dm.Q_test.SQL.Clear; //Удаляем предыдущий SQL запрос.
        //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом его
        //работы будет набор всех записей из таблицы vkl_nam.db, содержащихся в
        //одном банке (определяется значением поля nr в таблице vkl_nam.db и
        //значением поля no в таблице bank.db).
        dm.Q_test.SQL.Add(
               'select * from "vkl_nam.db" WHERE ("vkl_nam.db"."Nr" = '+n1+')');
        dm.Q_test.Open; //Выполняем SQL запрос
        //Проверяем, что набор данных не пустой. Проверяем что количество
        //записей набора данных DM.Q_test.RecordCount после  выполнения SQl
        //запроса не ноль.

        if dm.Q_test.RecordCount<>0 then
          begin  //количество записей не ноль,
            dm.Q_test.First; //то переходим к первой записи таблицы vkl_nam.db
            //В цыкле от первой записи до последней записи набора данных
            //Для каждой записи - название вклада из таблицы vkl_nam.db
            for i:=1 to dm.Q_test.RecordCount do
              begin  //Запоминаем номер названия вклада из таблицы vkl_nam.db в
              //переменной no
                no:=DM.Q_test.FieldByName('no').asstring;

                dm.Query3.close; //Закрываем таблицу субвкладов vklad.db
                dm.Query3.SQL.Clear; //Удаляем предыдущий SQL запрос.
                //Добавляем новый SQL запрос по таблице vklad.db. Результатом
                //его работы будет удаление набора записей из таблицы vklad.db,
                //содержащихся в одном счете в таблице vkl_nam.db (определяется
                //значением поля nr в таблице vklad.db и значением поля no в
                //таблице vkl_nam.db).
                dm.Query3.SQL.Add(
                     'DELETE FROM "vklad.db" WHERE ("vklad.db"."Nr" = '+no+')');
                dm.Query3.ExecSQL; //Выполняем SQL запрос

                dm.Query2.close;     //Закрываем таблицу вкладов vkl_nam.db
                dm.Query2.SQL.Clear; //Удаляем предыдущий SQL запрос.
                //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом
                //его работы будет удаление записи из таблицы vkl_nam.db,
                //(номер удаляемой записи определяется значением переменной no)
                dm.Query2.SQL.Add(
                 'DELETE FROM "vkl_nam.db" WHERE ("vkl_nam.db"."No" = '+no+')');
                dm.Query2.ExecSQL; //Выполняем SQL запрос

                dm.Q_test.Next; //Переходим к следующей записи, т.е. следующему
                //вкладу
              end;
          end;

        dm.Query3.close;  //Закрываем таблицу
        dm.Query3.SQL.Clear; //Удаляем предыдущий SQL запрос.
        //Добавляем новый SQL запрос по таблице bank.db. Результатом
        //его работы будет удаление записи из таблицы bank.db, (номер удаляемой
        //записи определяется значением переменной n1)
        dm.Query3.SQL.Add('DELETE FROM "bank.db" WHERE ("bank.db"."No" = '+n1+')');
        dm.Query3.ExecSQL; //Выполняем SQL запрос

        dm.Q_test.Close;  //Закрываем таблицу

        //Определяем прцедуры обработчики для события OnDataChange в источниках
        //данных dm.DataSource1 и dm.DataSource2. Для источника данных
        //dm.DataSource1 процедура DM.Query1Change, для dm.DataSource2 -
        //DM.Query2Change. Требуется для организации двух связей "1 ко многим"
        //между 3 таблицами
        dm.DataSource1.OnDataChange:=DM.Query1Change;
        dm.DataSource2.OnDataChange:=DM.Query2Change;

        dm.Query1.Close;  //Закрываем таблицу банков
        dm.Query1.SQL.Clear; //Удаляем предыдущий SQL запрос.
        //Добавляем новый SQL запрос по таблице bank.db. Результатом его работы
        //будет набор всех записей из таблицы bank.db.
        dm.Query1.SQL.Add('select * from bank.db');
        dm.Query1.Open;  //Выполняем SQL запрос
      end;


1:
end;
//Определение процедуры-обработчика для пункта меню N7, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Удаление вклада, а также всех его субвкладов
procedure TForm1.N7Click(Sender: TObject);
label 1;
var no:string;
begin
  //Проверяем что существуют банк, и вклад, что наборы данных не пустые, т.е.
  //таблицы bank.db и vkl_nam.db открыты. Это достигается проверкой свойст
  //DM.Query1.Active - для таблицы банков bank.db и DM.Query2.Active - для
  //таблицы вкладов vkl_nam.db
  if DM.Query1.Active and DM.Query2.Active then
  //Проверяем, что количество записей набора данных RecordCount для таблиц
  //bank.db и vkl_nam.db не ноль и что определен номер удаляемой записи
    if (dm.Query2.RecordCount<>0) and (DM.Query1.RecordCount<>0) then
      begin
        //Вывод диалогового окна подтверждения удаления вклада
        case MessageDlg('Внимание! Удаление вклада.'+
             #13#10#13#10+'Удалить вклад - Yes,   не удалять - No.'
             , mtConfirmation, [mbYes, mbNo], 0) of
          mrno: goto 1; //Если выбран вариант No - перемещаемся к метке 1
          //и завершаем процедуру
        end;

        dm.Query3.Close; //Закрываем таблицу
        //Определяем прцедуру-обработчик для события OnDataChange в источнике
        //данных dm.DataSource2. Для источника данных dm.DataSource2 - nil.
        //Требуется для удаления связи "1 ко многим" между 2 таблицами Базы
        // данных:  "vkl_nam.db"."no"="vklad.db"."nr". vkl_nam.db - информация о
        // названиях вкладов, vklad.db - информация о субвкладах
        dm.DataSource2.OnDataChange:=nil;
        //Запоминаем номер названия вклада из таблицы vkl_nam.db в переменной no
        no:=DM.Query2.FieldByName('no').asstring;

        dm.Query3.close; //Закрываем таблицу субвкладов
        dm.Query3.SQL.Clear;  //Удаляем предыдущий SQL запрос.
        //Добавляем новый SQL запрос по таблице vklad.db. Результатом
        //его работы будет удаление набора записей из таблицы vklad.db,
        //(номер удаляемых записей Nr определяется значением переменной no)
        dm.Query3.SQL.Add(
                     'DELETE FROM "vklad.db" WHERE ("vklad.db"."Nr" = '+no+')');
        dm.Query3.ExecSQL; //Выполняем SQL запрос

        dm.Query2.close;  //Закрываем таблицу вкладов
        dm.Query2.SQL.Clear; //Удаляем предыдущий SQL запрос.
        //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом
        //его работы будет удаление записи из таблицы vkl_nam.db,
        //(номер удаляемых записей No определяется значением переменной no)
        dm.Query2.SQL.Add(
                 'DELETE FROM "vkl_nam.db" WHERE ("vkl_nam.db"."No" = '+no+')');
        dm.Query2.ExecSQL; //Выполняем SQL запрос

        dm.Query3.Close; //Закрываем таблицу субвкладов

        dm.Query2.Close; //Закрываем таблицу вкладов
        dm.Query2.SQL.Clear; //Удаляем предыдущий SQL запрос.
        //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом его
        //работы будет набор всех записей из таблицы vkl_nam.db, номер записей
        //Nr которых определяется значением DM.Query1.FieldByName('no').asstring
        //Т.Е. набор вкладов содержащихся в отдельном банке
        dm.Query2.SQL.Add('select * from "vkl_nam.db" where ("vkl_nam.db"."nr"='
        +DM.Query1.FieldByName('no').asstring+')');
        dm.Query2.Open; //Выполняем SQL запрос

        //Восстанавливаем связь "1 ко многим" между 2 таблицами Базы
        //данных (vkl_nam.db - информация о названиях вкладов, vklad.db -
        //информация о субвкладах): "vkl_nam.db"."no"="vklad.db"."nr"
        dm.DataSource2.OnDataChange:=DM.Query2Change;
      end;                        
1:
end;
//Определение процедуры-обработчика для пункта меню N12, выполняющегося при
//возникновении события onClick.  Sender указывает какой компонент вызывает эту
//процедуру. Информация о работе и авторе :)
procedure TForm1.N12Click(Sender: TObject);
begin //Показываем сообщение  #13#10 - коды символов окончания строки
  showmessage('БАНКИР'#13#10#13#10'Анализ доходности депозитных '+
  'вкладов в валюте'#13#10#13#10'Автор:'#13#10'SLV'#13#10+
  'slavik@vmail.ru'+#13#10+
    'slvno@rambler.ru'+
  #13#10#13#10'Регистрация (Подписка на рассылку):'#13#10'http://web.vrn.ru/soft-1/');
end;

//Определение процедуры-обработчика события выполняющегося при создании формы
//Form1/ Sender указывает какой компонент вызывает эту процедуру.
procedure TForm1.FormCreate(Sender: TObject);
begin
  decimalSeparator:='.'; //Устанавливаем разделитель целой и дробной части
  //вещественного числа как "."
end;

end.
