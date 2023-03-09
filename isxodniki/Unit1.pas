unit Unit1; //Название модуля

interface  //Начало интерфейсной части

uses      //Названия подлючаемых внешних модулей
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type   //Объявление формы отвечающей за редактирование субвкладов
//хранения
  Tf_sv = class(TForm) //Объявление класса Tf_sv - наследника от TForm
    Lab1: TLabel; //Объявление компонента Lab1 типа
    //TLabel, - текстовая надпись. Отображается на форме f_sv.
    Lab2: TLabel; //Объявление компонента Lab2 типа
    //TLabel, - текстовая надпись. Отображается на форме f_sv.
    Lab3: TLabel; //Объявление компонента Lab3 типа
    //TLabel, - текстовая надпись. Отображается на форме f_sv.
    Label1: TLabel; //Объявление компонента Label1 типа
    //TLabel, - текстовая надпись. Отображается на форме f_sv.
    DBEdit1: TDBEdit; //Объявление компонента DBEdit1 типа TDBEdit, - Строка
    //редактирования для поля Srok одной записи из таблицы субсчетов vklad.db
    //Отображается на форме f_sv.
    DBEdit2: TDBEdit; //Объявление компонента DBEdit2 типа TDBEdit, - Строка
    //редактирования для поля Min_summa одной записи из таблицы субсчетов
    //vklad.db. Отображается на форме f_sv.
    DBEdit3: TDBEdit; //Объявление компонента DBEdit3 типа TDBEdit, - Строка
    //редактирования для поля Stavka одной записи из таблицы субсчетов
    // vklad.db. Отображается на форме f_sv.
    DBEdit4: TDBEdit; //Объявление компонента DBEdit4 типа TDBEdit, - Строка
    //редактирования для поля Max_summa одной записи из таблицы субсчетов
    //vklad.db. Отображается на форме f_sv.
    SpeedButton_1: TSpeedButton; //Объявление компонента SpeedButton_1 типа
    //TSpeedButton, - кнопка Сохранить отредактированную запись.
    //Отображается на форме f_sv.
    SpeedButton_2: TSpeedButton; //Объявление компонента SpeedButton_2 типа
    //TSpeedButton, - кнопка Отменить - не сохранять отредактированную запись.
    //Отображается на форме f_sv.
    //Объявление процедур-обработчиков нажатия кнопок. Sender указывает какой
    //компонент вызывает эту процедуру.
    procedure SpeedButton_1Click(Sender: TObject); //для кнопки SpeedButton_1
    procedure SpeedButton_2Click(Sender: TObject); //для кнопки SpeedButton_2
    //Объявление процедуры-обработчика события onClose - закрытия формы .
    //Sender указывает какой компонент вызывает эту процедуру. Action определяет
    //способ закрытия формы
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  end;

var
  f_sv: Tf_sv; //Объявление переменной типа Tf_sv, т.е. формы отвечающей за
  //создание и редактирование различных вариантов субвкладов
implementation  //Конец интерфейсной части, начало секции реализации

uses dat, ban, variant_s; //Названия подлючаемых внешних модулей


{$R *.DFM} //Названия компилируемых вместе с исполняемым файлом файло ресурсов

//Объявление процедуры-обработчика нажатия кнопоки SpeedButton_1. Sender
//указывает какой компонент вызывает эту процедуру. Сохранение отредактированной
//информации в БД vklad.db
procedure Tf_sv.SpeedButton_1Click(Sender: TObject);
var proc, max_sum:string;
begin
  //Проверяем отсутствие дублирования записей в таблице vklad.db
  dm.Q_test.Close; //закрываем таблицу Q_test Используем ее метод Close
  dm.Q_test.SQL.Clear; //Удаляем предыдущий SQL запрос.
  //Добавляем новый SQL запрос по таблице bank.db. Результатом его работы будет
  //набор всех записей из таблицы vklad.db, у которых название срок вклада поле
  //Srok будет равным строковой переменной DBEdit1.Text, введенной в форме
  //редактирования f_sv, а также минимальная сумма вклада поле Min_summa будет
  //равным строковой переменной DBEdit2.Text, введенной в форме
  //редактирования f_sv, а также поле связи nr c таблицей vkl_nam.db будет
  //равным полю no в таблице vkl_nam.db. Значение поля определяется значением
  //DM.Query2.FieldByName('no').asstring
  dm.Q_test.SQL.Add('select * from "vklad.db" where ("vklad.db"."Srok"='+
  DBEdit1.Text+') and ("vklad.db"."Min_summa"='+DBEdit2.Text+
  ') and ("vklad.db"."nr"='+DM.Query2.FieldByName('no').asstring+')');
  dm.Q_test.Open; //Открываем SQL запрос

  //Если есть записи с одинаковыми значениями полей srok, Min_summa, Nr, т.е
  //имеется дублирование записей в таблице vklad.db. Определяется количеством
  //записей dm.Q_test.RecordCount, найденных в результате SQL запроса по этой
  //таблице,
  if dm.Q_test.RecordCount=0 then //Если количество записей ноль
    begin  //Обновляем поле связи nr с таблицей vkl_nam.db в таблице vklad.db,
    //значением поля no из таблицы vkl_nam.db. vklad.db - субвклады, vkl_nam.db
    //- вклады.
      dm.Query3.FieldByName('nr').asinteger:=dm.Query2.FieldByName('no').asinteger;
      dm.Query3.Post; //Сохраняем информацию в БД и заканчиваем редактирование
      //записи в таблице vklad.db
    end
  else
    begin  ////Если количество записей не ноль
      proc:=DBEdit3.Text; //В переменной proc сохраняем значение поля Stavka,
      //DBEdit3.Text, - процентная ставка
      max_sum:=DBEdit4.Text; //В переменной max_sum сохраняем значение поля
      //Max_summa, DBEdit4.Text, - максимальная сумма первоначального вклада
      dm.Query3.Cancel; //Отменяем редактирование/создание записи в таблице
      //vklad.db

      //Если найдена 1 запись, Определяется количеством
      //записей dm.Q_test.RecordCount, найденных в результате SQL запроса, то
      //редактируем ее
      if dm.Q_test.RecordCount=1 then
        begin   //Если имело место редактирование записи, т.е. переменная
        //Form1.redaktirovanie установлена в true
          if Form1.redaktirovanie then
            begin
              dm.Q_test.Edit; //Редактируем найденную запись по предыдущему
              //SQL запросу
              //Обновляем значение поля Stavka из временной переменной proc
              dm.Q_test.FieldByName('Stavka').asfloat:=strtofloat(proc);
             //Обновляем значение поля Max_summa из временной переменной max_sum
              dm.Q_test.FieldByName('Max_summa').asfloat:=strtofloat(max_sum);
              dm.Q_test.Post; //Заканчиваем редактирование записи
              dm.Query3.Refresh; //Обновляем набор данных в таблице vklad.db
            end
          else  //Если нет редактирования, т.е. переменная
            //Form1.redaktirovanie установлена в false, то выдаем сообщение
            showmessage('Извините, но вклад с такими сроком хранения и '+
            'минимальной суммой первоначального взноса уже существует.');
        end
      else  //Если найдено более 1 записи, Определяется количеством записей -
      //dm.Q_test.RecordCount, найденных в результате SQL запроса, то выдаем
      //сообщение
        begin
          showmessage('Извините, но вклад с такими сроком хранения и '+
          'минимальной суммой первоначального взноса уже существует.');
        end;
    end;

  f_sv.Close;  //Зкрываем форму редактирования f_sv
end;

//Определяем процедуры-обработчика нажатия кнопок SpeedButton_2. Sender
//указывает какой компонент вызывает эту процедуру. Закрываем форму f_sv.
//Отмена редактирования.
procedure Tf_sv.SpeedButton_2Click(Sender: TObject);
begin
  close; //Зкрываем форму редактирования f_sv
end;
//Определяем процедуру-обработчик события onClose - закрытия формы .
//Sender указывает какой компонент вызывает эту процедуру. Action определяет
//способ закрытия формы
procedure Tf_sv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.Query3.Cancel; //Отменяем редактирование/создание записи в таблице
  //vklad.db
end;

end.
