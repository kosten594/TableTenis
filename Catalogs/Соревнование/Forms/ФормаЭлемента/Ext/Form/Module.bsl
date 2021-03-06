﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Игры.Параметры.УстановитьЗначениеПараметра("Соревнования", Объект.Ссылка); 
КонецПроцедуры

&НаСервереБезКонтекста
Функция ИграНаСервере(ДокОснов)
	// Вставить содержимое обработчика.
	игра = Документы.Игра.СоздатьДокумент();
	игра.Дата = ТекущаяДата();
	игра.Заполнить(ДокОснов);
	игра.Записать();
	Возврат игра.Ссылка;
КонецФункции

&НаКлиенте
Процедура Игра(Команда)
	игр = ИграНаСервере(Объект.Ссылка);
	ПоказатьЗначение(,игр);
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	Если НЕ ЗначениеЗаполнено(Объект.УИД) Тогда 
		мз = РегистрыСведений.Выгрузка.СоздатьМенеджерЗаписи();
		мз.ОбъектВыгрузки = Объект.Ссылка;
		мз.Записать();
	КонецЕсли;  	
КонецПроцедуры
