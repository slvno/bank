unit dat; //Название модуля

interface  //Начало интерфейсной части

uses    //Названия подлючаемых внешних модулей
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type  //Объявление модуля данных
  TDM = class(TDataModule) //Объявление класса TDM - наследника от TDataModule
    Session1: TSession; //Объявление компонента Session1 типа
    //TSession. Управляет соединениями с БД. Невизуальный компонент.
    Query1: TQuery; //Объявление компонента Query1 типа
    //TQuery. Радота с таблицей банков. Невизуальный компонент.
    Query2: TQuery; //Объявление компонента Query2 типа
    //TQuery. Радота с таблицей вкладов. Невизуальный компонент.
    Query3: TQuery; //Объявление компонента Query3 типа
    //TQuery. Радота с таблицей субвкладов. Невизуальный компонент.
    DataSource1: TDataSource; //Объявление компонента  типа
    //TDataSource. Источник данных для таблицы банков. Невизуальный компонент.
    DataSource2: TDataSource; //Объявление компонента  типа
    //TDataSource. Источник данных для таблицы вкладов. Невизуальный компонент.
    DataSource3: TDataSource; //Объявление компонента  типа
  //TDataSource. Источник данных для таблицы субвкладов. Невизуальный компонент.
    Q_test: TQuery; //Объявление компонента Q_test типа
    //TQuery. Радота с таблицами. Невизуальный компонент.
    DataSource4: TDataSource; //Объявление компонента  типа
    //TDataSource. Источник данных для таблиц. Невизуальный компонент.

    //Определяем прцедуры обработчики для события OnDataChange в источниках
    //данных dm.DataSource1 и dm.DataSource2. Для источников данных
    //dm.DataSource1 и dm.DataSource2. Требуется для организации двух
    //связей "1 ко многим" между 3 таблицами Базы данных:
    //"bank.db"."no"="vkl_nam.db"."nr",
    procedure Query1Change(Sender: TObject; Field: TField);
    //"vkl_nam.db"."no"="vklad.db"."nr"
    procedure Query2Change(Sender: TObject; Field: TField);
    //bank.db - информация о названиях банков, vkl_nam.db - информация о
    //названиях вкладов, vklad.db - информация о субвкладах
    //Field - набор полей в наборе данных для которых происходит изменение
    //состояния. Sender указывает какой компонент вызывает эту процедуру
  end;

var
  DM: TDM; //Объявление переменной типа TDM, т.е. модуля данных, который
  //содержит невизуальные компоненты для работы с БД

implementation //Конец интерфейсной части, начало секции реализации

uses ban, variant_s;  //Названия подлючаемых внешних модулей

{$R *.DFM} //Названия компилируемых вместе с исполняемым файлом файло ресурсов

//Определяем прцедуру-обработчики для события OnDataChange в источнике данных
//dm.DataSource1. Требуется для организации связи "1 ко многим" между 2
//таблицами Базы данных (bank.db - информация о названиях банков, vkl_nam.db -
//информация о названиях вкладов): "bank.db"."no"="vkl_nam.db"."nr",
//Field - набор полей в наборе данных для которых происходит изменение состояния
//Sender указывает какой компонент вызывает эту процедуру
procedure TDM.Query1Change(Sender: TObject; Field: TField);
begin
  //Проверяем что таблица банков bank.db открыта. Это определяется свойством
  //Active компонента DM.Query1. Если истина то таблица открыта
  if DM.Query1.Active then
    begin //Проверяем что набор данных не пустой. Проверяем что количество
    //записей набора данных DM.Query1.RecordCount не ноль и значение счетчика,
    // поля no - текущей записи DM.Query1.FieldByName('no').asstring не ноль.
      if (DM.Query1.RecordCount<>0) and
      (DM.Query1.FieldByName('no').asstring<>'') then
        begin
          dm.Query3.Close; //Закрываем таблицу субвкладов.

          dm.Query2.Close; //Закрываем таблицу вкладов.
          dm.Query2.SQL.Clear; //Удаляем предыдущий SQL запрос.
          //Используем ее метод SQL.Clear
          //Добавляем новый SQL запрос по таблице vkl_nam.db. Результатом его
          //работы будет набор всех записей из таблицы vkl_nam.db, которые
          //связаны с одной записью в таблице банков bank.db. Связь организуется
          //по полю nr в таблице vkl_nam.db и по полю no в таблице bank.db.
          dm.Query2.SQL.Add(
                         'select * from "vkl_nam.db" where ("vkl_nam.db"."nr"='+
                         DM.Query1.FieldByName('no').asstring+')');
          dm.Query2.Open; //Выполняем SQL запрос
        end;
    end;
end;

//Определяем прцедуру-обработчики для события OnDataChange в источнике данных
//dm.DataSource2. Требуется для организации связи "1 ко многим" между 2
//таблицами Базы данных (vkl_nam.db - информация о названиях вкладов, vklad.db -
//информация о субвкладах):  "vkl_nam.db"."no"="vklad.db"."nr"
//Field - набор полей в наборе данных для которых происходит изменение состояния
//Sender указывает какой компонент вызывает эту процедуру
procedure TDM.Query2Change(Sender: TObject; Field: TField);
begin
  //Проверяем что таблица вкладов vkl_nam.db открыта. Это определяется свойством
  //Active компонента DM.Query2. Если истина то таблица открыта
  if DM.Query2.Active then
    begin //Проверяем что набор данных не пустой. Проверяем что количество
    //записей набора данных DM.Query2.RecordCount не ноль и значение счетчика,
    // поля no - текущей записи DM.Query2.FieldByName('no').asstring не ноль.
      if (DM.Query2.RecordCount<>0) and
      (DM.Query2.FieldByName('no').asstring<>'') then
        begin
          dm.Query3.Close; //Закрываем таблицу вкладов.
          dm.Query3.SQL.Clear; //Удаляем предыдущий SQL запрос.
          //Используем ее метод SQL.Clear
          //Добавляем новый SQL запрос по таблице vklad.db. Результатом его
          //работы будет набор всех записей из таблицы vklad.db, которые
          //связаны с одной записью в таблице вкладов vkl_nam.db. Связь
          //организуется по полю nr в таблице vklad.db и по полю no в таблице
          //vkl_nam.db.
          dm.Query3.SQL.Add('select * from "vklad.db" where ("vklad.db"."nr"='+
          DM.Query2.FieldByName('no').asstring+')');
          dm.Query3.Open; //Выполняем SQL запрос
        end;
    end;
end;

end.
