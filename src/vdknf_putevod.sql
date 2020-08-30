-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 30 2020 г., 21:53
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vdknf_putevod`
--

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--
-- Создание: Авг 26 2020 г., 15:01
-- Последнее обновление: Авг 29 2020 г., 23:49
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `isFAQ` bit(1) NOT NULL,
  `isFAQuestion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`, `img`, `isFAQ`, `isFAQuestion`) VALUES
(1, 'Об университете', '<p>Финансовый университет при Правительстве Российской Федерации — один из лучших экономико-финансовых университетов России.</p><p>Рейтинги Финансового университета при Правительстве РФ:</p><p>1. Девятый ежегодный рейтинг лучших вузов России RAEX-100:</p><ul><li>14-е место в списке лучших вузов России 2020;</li><li>3-е место в списке самых востребованных выпускников 2020.</li></ul><p>2. Список Forbes:</p><ul><li>15-е место в рейтинге лучших российских вузов.</li></ul><p>3. Рейтинг «Национальное признание»: лучшие вузы 2019:</p><ul><li>10-е место в рейтинге лучших российских вузов.</li></ul><p>4. Международный рейтинг «Round University Ranking» 2020:</p><ul><li>586-е место среди лучших вузов мира.</li></ul>', '', b'1', 'Что по универу?'),
(2, 'Выдающиеся выпускники Финуниверситета', '<p>Эскиндаров Михаил Абдурахманович — ректор Финансового университета при Правительстве Российской Федерации, доктор экономических наук.</p><p>Силуанов Антон Германович — Министр финансов Российской Федерации.</p><p>Прохоров Михаил Дмитриевич — российский предприниматель (11-й в рейтинге «200 богатейших бизнесменов России 2020» Forbes).</p><p>Грязнова Алла Георгиевна — российский экономист, профессор (президент Финансового университета).</p><p>Писарев Кирилл Валерьевич — российский предприниматель (основатель Группы Компаний ПИК).</p><p>Михайлов Вадим Валерьевич — с 2017 года первый заместитель Генерального директора ОАО «РЖД».</p>', '', b'0', NULL),
(3, 'История факультетов', '<p><strong>1919 г.</strong></p><ol><li>Московский финансово-экономический институт (Кредитно-экономический факультет и Финансово-экономический факультет)</li></ol><p><strong>1946 г.</strong></p><p>4 факультета:</p><ol><li>Финансово-экономический</li><li>Учёт и аудит</li><li>Кредитно-экономический</li><li>Международные экономические отношения</li></ol><p><strong>1993 г.</strong></p><ol><li>Факультет Налогов и налогообложения</li></ol><p><strong>1999 г.</strong></p><ol><li>Юридический факультет</li></ol><p><strong>2000 г.</strong></p><ol><li>Факультет математических методов (Факультет анализа рисков и экономический безопасности имени проф. В.К. Сенчагова и Факультет прикладной математики и информационных технологий)</li></ol><p><strong>2007 г.</strong></p><ol><li>Международный финансовый факультет</li></ol><p><strong>2011 г.</strong></p><ol><li>Факультет социологии и политологии</li></ol><p><strong>2012 г.</strong></p><ol><li>Факультет Прикладной математики и информационных технологий</li></ol><p><strong>2013 г.</strong></p><ol><li>Факультет анализа рисков и экономический безопасности имени проф. В.К. Сенчагова</li><li>Кредитно-экономический факультет (Факультет финансовых рынков имени проф. В.С. Геращенко)</li><li>Финансово-экономический факультет</li></ol><p><strong>2015 г.</strong></p><ol><li>Факультет государственного управления и финансового контроля</li></ol><p><strong>2016 г.</strong></p><ol><li>Факультет международного, туризма, спорта и гостиничного бизнеса</li></ol><p><strong>2018 г.</strong></p><ol><li>Факультет экономики и финансов топливно-энергетического комплекса</li></ol><p><strong>2019 г.</strong></p><ol><li>Логистика</li></ol><p><strong>2020 г.</strong></p><p>Реструктуризация: 8 факультетов</p><ol><li>Факультет социальных наук и массовых коммуникаций</li><li>Факультет налогов, аудита и бизнес-анализа</li><li>Факультет информационных технологий и анализа больших данных</li><li>Факультет международных экономических отношений</li><li>Факультет «Высшая школа управления»</li><li>Факультет экономики и бизнеса</li><li>Финансовый факультет</li><li>Юридический факультет</li></ol>', '', b'0', NULL),
(4, 'Информация о территориях факультетов', 'Ленинградский проспект, 49, 51, 55 — Факультет международных экономических отношений, Факультет социальных наук и массовых коммуникаций. \r\nМетро: Аэропорт.\r\nУлица Верхняя Масловка, 15 — Факультет «Высшая школа управления», Факультет налогов, аудита и бизнес-анализа. \r\nМетро: Динамо.\r\nУлица Кибальчича, 1 — Факультет экономики и бизнеса. \r\nМетро: ВДНХ.\r\nУлица Малый Златоустинский переулок, 7, строение 1 — Финансовый факультет. \r\nМетро: Китай-город.\r\nУлица Щербаковская, 38 — Факультет информационных технологий и анализа больших данных. \r\nМетро: Семёновская.\r\n4-ый Вешняковский проезд, 4 — Юридический факультет. \r\nМетро: Рязанский проспект. \r\nУлица Олеко Дундича, 23 — Институт заочного и открытого образования.\r\nМетро: Филёвский парк.\r\n', '', b'0', NULL),
(5, 'Контакты деканатов', 'Факультет международных экономических отношений\r\nДекан: Алексеев Михаил Юрьевич\r\nАдрес: Ленинградский проспект, д. 49, ауд. 315, 319\r\nТелефон: 8 (499) 943-95-56, 8 (499) 943-94-37\r\n \r\nФинансовый факультет\r\nДекан: Силуанов Антон Германович\r\nАдрес: Малый Златоустинский переулок, д. 7, стр. 1, ауд. 401\r\nТелефон: 8 (499) 503-47-85\r\n \r\nФакультет экономики и бизнеса\r\nДекан: Безсмертная Екатерина Рэмовна\r\nАдрес: ул. Кибальчича, д. 1, ауд. 303\r\nТелефон: 8 (495) 682-12-05, 8 (495) 682-13-01, 8 (495) 249-52-94\r\n \r\nФакультет «Высшая школа управления»\r\nДекан: Трачук Аркадий Владимирович\r\nАдрес: ул. Верхняя Масловка, д. 15, к. 421А\r\nТелефон: 8 (495) 249-52-70, 8 (495) 249-52-70\r\n \r\nФакультет информационных технологий и анализа больших данных\r\nДекан: Посашков Сергей Александрович\r\nАдрес: ул. Щербаковская, д. 38, к. 210, 201\r\nТелефон: 8 (499) 503-47-21, доб. 47-42, 47-43, 47-45, 47-81\r\n \r\nФакультет налогов, аудита и бизнес-анализа\r\nДекан: Засько Вадим Николаевич\r\nАдрес: Верхняя Масловка, д.15, каб. 208, 209\r\nТелефон: 8 (499) 277-39-05, 8 (499) 277-39-06, 8 (499) 277-39-07\r\n \r\nФакультет социальных наук и массовых коммуникаций\r\nДеканат: Шатилов Александр Борисович\r\nАдрес: Ленинградский проспект, д.49, ауд. 307, 308\r\nТелефон: 8 (499) 943-98-56, 8 (499) 922-34-17\r\n \r\nЮридический факультет\r\nДекан: Ручкина Гульнара Флюровна\r\nАдрес: 4-й Вешняковский проезд, д. 4, 205, 208, 209, 210, 212, 213, 305а, 309\r\nТелефон: 8 (499) 553-11-36\r\n', '', b'0', NULL),
(6, 'Часто задаваемые вопросы', '<p>– Какие тетради необходимы? – Опыт подсказывает, что тетради-блоки очень удобны. Но всё зависит от тебя и от твоих предпочтений.</p><p>– Нужен ли ноутбук и можно ли с ним сидеть на парах? – Если ты готов носить его каждый день и добросовестно печатать лекции — да. Всё зависит от преподавателя и его правил.</p><p>– Обязательно ли носить социалку и студенческий? Или можно носить что-то одно?</p><p>– Социальную карту носить обязательно, потому что без неё ты не сможешь пройти в университет, так как это ещё и кампусная карта. Студенческий билет можно не носить.</p><p>– Нужно ли носить все учебники? – Нет, в основном учебники пригодятся дома. Если будет необходимо приносить учебники на занятия — преподаватели обязательно скажут об этом твоей группе.</p><p>– Нужно носить белый верх и чёрный низ? – Нет, официального дресс-кода в университете нет, но есть некоторые ограничения, а стиль одежды — деловой. – Какое расписание звонков в Финуниверситете? – 1 пара: 8:30 – 10:00 2 пара: 10:10 – 11:40 3 пара: 11:50 – 13:20 Перерыв 40 минут 4 пара: 14:00 – 15:30 5 пара: 15:40 – 17:10 6 пара: 17:20 – 18:50</p>', NULL, b'1', 'А с ноутбуком можно?'),
(7, 'F&U', '<p>F&amp;U — это основная внеаудиторная медиа-платформа студентов Финансового университета, то есть официальная группа Студенческого совета. Здесь выходят все новости, которые касаются нашей жизни в университете, лайфхаки и ещё много других интересных рубрик. Также сюда можно обратиться с проблемой, возникшей, например, в общежитии или деканате. vk.com/finsst</p>', '', b'0', NULL),
(8, 'ИОП', 'ИОП — это информационно-образовательный портал, где хранится вся информация об обучении.\r\nВ отличие от сайта Финансового университета, данные здесь касаются лично тебя и твоего процесса обучения.\r\nКакие есть функции и как ими пользоваться?\r\nОсобое внимание обрати на боковую панель — много вкладок, много возможностей.\r\n \r\nРАБОТА С ГРУППАМИ \r\n1. Общая информация. Список всех одногруппников (с датой рождения каждого) и список преподавателей, которые ведут или вели предметы. \r\n2. Обучение. Какие дисциплины предстоит изучать на протяжении учебного года. По какому предмету у тебя будет зачёт, а по какому — экзамен. А во вкладках «Учебный план», «УММ по РУП» — материалы и видеолекции по дисциплинам согласно учебному плану на семестр. \r\n3. Контроль. Иногда будут доступны тесты, которые открывает преподаватель, они обязательны для выполнения. \r\n4. Долги. Отражена академическая задолженность (надеюсь, что такого не будет!). \r\n5. Электронная зачётная книжка, в которой выставлены все твои оценки и баллы за предметы. \r\n6. Мои работы. Сюда загружаются курсовые и ВКР и выставляются оценки по ним. \r\nПОРТФОЛИО. Здесь найдёшь…\r\nЗаявления на ПГАС: состояние и статус заявления на ПГАС. \r\nЛичная информация: все личные данные, включая фотографию, которая красуется в студенческом. \r\nАнкета первокурсника: анкета про интересы и деятельность в университете, которую можешь заполнить в любое время. \r\nИндивидуальный план развития: информация о своём обучении, взысканиях и стипендии. \r\nА ТАКЖЕ…\r\nДокументарная база. Библиотека всех рабочих планов, методичек, примеров тестовых и контрольных заданий, некоторых вопросов к экзамену. Не забудь заглянуть, когда придёт пора готовиться к сессии. \r\nБиблиотека. Все важные ресурсы в одном месте. Мастхэв при написании эссе и рефератов. \r\nСистема «Антиплагиат». Отчёт которого просят преподаватели для всех твоих письменных работ. Но будь разумен — попытки ограничены — всего 25 на учебный год.\r\nНастройки профиля. Можешь сменить невообразимый набор букв и цифр в пароле на что-то более приятное и запоминающееся. \r\nСообщения. Иногда сюда будут приходить важные сообщения, которые лучше не игнорировать.', '', b'1', 'Что такое ИОП?'),
(9, 'Сайты для учёбы', '<p>Сайты, которые пригодятся на протяжении всей студенческой жизни:</p><p>fa.ru — официальный сайт Финансового университета;</p><p>ruz.fa.ru — официальный ресурс, где содержится расписание занятий не только учебных групп, но и преподавателей.</p><p>Незаменимые источники информации:</p><p>urait.ru, book.ru, znanium.com — это сайты, содержащие огромные базы учебников, монографий и пособий;</p><p>elibrary.ru — научная электронная библиотека с публикациями тысяч статей и исследований.</p><p>Необычные сервисы для подготовки презентаций: prezi.com; canva.com; piktochart.com.</p><p>Сайты для тех, кому постоянно хочется получать ещё больше знаний:</p><p>coursera.org; edx.org. ISIC (International Student Identity Card) — isic.org.</p>', '', b'0', NULL),
(11, 'Балльно-рейтинговая система', '<p>БРС (балльно-рейтинговая система) — это способ оценивания знаний и усвоения студентом учебной программы. По каждому из предметов за семестр ты можешь набрать максимум 100 баллов: 40 отводится на работу в семестре (по 20 баллов за каждую из двух аттестаций) и 60 баллов за экзамен или зачёт.</p><p>Экзамены проводятся только в письменной форме (исключения: устная часть по иностранным языкам и всеобщее дистанционное обучение), а зачёты — на усмотрение преподавателей.</p>', NULL, b'0', NULL),
(12, 'Перевод на бюджет', '<p>Набранные по предметам баллы влияют на твой рейтинг, который сказывается на переводе с платного обучения на бесплатное. Это возможно в том случае, если две крайние сессии закрыты на 4, 4 и 5, только 5, а также если не имеются пересдачи, дисциплинарные взыскания и выговоры. Перевод осуществляется только в случае наличия свободных бюджетных мест.&nbsp;</p><p>Решение выносит специальная комиссия. Рассматриваются также различные ситуации индивидуального характера, о которых сказано в специальном положении о переводе на бюджет.</p><p>О переходе с платного обучения на бюджет: <a href=\"vk.cc/8WU6RZ\">vk.cc/8WU6RZ</a></p>', NULL, b'1', 'Как мне перевестись на бюджет?'),
(13, 'Включённое обучение', '<p>Данные программы подразумевают учёбу в иностранном вузе-партнёре в течение одного семестра. Для участия в конкурсном отборе на «включёнку» необходим высокий рейтинг, а также сертификат, подтверждающий знание иностранного языка (для некоторых стран и вузов — двух иностранных языков).</p>', NULL, b'0', NULL),
(14, 'Социальная карта', '<p>Социальная карта студента совмещает в себе функции:</p><ul><li>кампусной карты для прохода на территорию университета и пользования библиотечно-информационным комплексом;&nbsp;</li><li>банковской карты для начисления стипендий и иных выплат и возможности расплачиваться за товары и услуги где угодно;&nbsp;</li><li>льготного проездного в общественном транспорте.</li></ul><p>Каждый студент в начале года получает карту в порядке очереди, её оформлением занимается университет. Перевыпуск карты в случае поломки, утери или изменения личных данных (ФИО и т. д.) нужно осуществлять самому через mos.ru. Срок изготовления новой карты не более 30 дней. Для прохода в университет в это время нужно получить временную кампусную карту в «Группе кампусных карт».</p>', NULL, b'0', NULL),
(15, 'Правила поведения', '<p>В университете запрещено:</p><ul><li>Нахождение в корпусе в верхней одежде;</li><li>Курение на территории университета и на расстоянии ближе 15 м. от него;</li><li>Участие в азартных играх;</li><li>Распитие спиртных напитков;</li><li>Проведение политических агитаций;</li><li>Ношение открытой обуви и неподобающей одежды (шорты, топы), в том числе и домашней (актуально для проживающих в общежитии);</li><li>Порча имущества университета;</li><li>Передача социальной / кампусной карты другому лицу, а также проход по чужой карте.</li></ul><p>Нарушение этих правил может повлечь не только замечание или выговор, но и даже отчисление.</p><p>Устав Финансового университета: vk.cc/axBfmO</p>', NULL, b'0', NULL),
(16, 'Общежития', '<p>– Галушка (ул. Б. Галушкина, д. 11), от метро ВДНХ пару остановок на трамвае. Одно из самых больших в университете.</p><p>– Керченка (ул. Керченская, д. 1а к.2, м. Каховская), на живописном юге Москвы в 15 минутах ходьбы от метро «Севастопольская» или «Каховская».</p><p>– Новопесчанка (ул. Новопесчаная, д. 15, станция метро «Сокол»). Возле него очень милый Чапаевский парк, пройдя который по диагонали сразу попадёшь в корпус на Ленинградском проспекте.</p><p>– Коломенка (Коломенский пр-д, д. 17, м. Коломенская). Станция метро «Коломенская» и «Каширская».Рядом парки — Коломенское и Садовники, где можно отдохнуть и прогуляться после пар.&nbsp;</p><p>– Ул. Бутырская, д. 79 (м. Дмитровская). Станция метро «Дмитровская». Общежитие расположено в 17-этажном здании. Недалеко находится дизайн-завод Флакон, ещё рядом есть «Перекрёсток», «Cofix», «ВкусВилл» и «Макдональдс».</p><p>– Ул. Мурановская, д. 7Б (м. Бибирево). Станция метро «Бибирево». Это 9-этажное здание, а вход в общежитие — 8-й подъезд.</p><p>– Ленка (два общежития — Ленинградский пр-т, д. 55 и д. 51к3), находятся на территории учебных корпусов.</p><p>Если тебе положено общежитие, но ты его ещё не получил, обратись в Службу размещения проживающих по телефону 8(499)943-98-22 и уточни по поводу своей очереди на получение места. Общежитие предоставляется, если было написано заявление на его получение, а также если место регистрации удалено на расстояние больше, чем 30 км от МКАД.</p>', NULL, b'1', 'Когда мне выделят место в общежитии?'),
(17, 'Поликлиника и медкабинеты', '<p>Поликлиника Финансового университета расположена по адресу: Ленинградский пр-т, 49, 1 этаж.&nbsp;</p><p>Прикрепиться к ней может любой студент Финансового университета по тем же правилам, как и в любое другое медицинское учреждение. После этого в поликлинике можно будет наблюдаться в течение всего периода обучения.</p><p>Важно, что поликлиника будет принимать только пациентов, прикрепившихся к ней на срок не менее 1 года. Поэтому в случае недомогания обратись в медицинские кабинеты, которые находятся во всех корпусах и работают с понедельника по пятницу с 9:00 до 16:00.</p>', NULL, b'0', NULL),
(18, 'УОК «Лесное озеро»', '<p>В учебно-оздоровительном комплексе «Лесное озеро»проходят различные культурные и образовательные мероприятия: Школа Актива, научные конференции (как для начинающих, так и для без пяти минут учёных), выездные лагеря для школьников и т.п.</p><p>В твоём распоряжении будут спортивные залы, бассейн, всевозможные оздоровительные процедуры, трёхразовое питание, большая территория со свежим воздухом, берегом реки и уютной беседкой. Тем более для сотрудников и студентов Финансового университета есть скидки на проживание.&nbsp;</p><p>vk.cc/axKWgp</p>', NULL, b'0', NULL),
(19, 'Спорт в Финуниверситете', '<p>Адреса спортзалов Финансового университета:</p><ul><li>ул. Касаткина, 15 — крупнейший спорткомплекс Финуниверситета, здесь у многих студентов проходит физкультура, а также тренировки сборных и занятия военной кафедры.</li></ul><p>Спортзалы в учебных корпусах:</p><ul><li>Ленинградский проспект, 55</li><li>ул. Верхняя Масловка, 15&nbsp;&nbsp;&nbsp;&nbsp;</li></ul><p>Спортзалы в общежитиях:</p><ul><li>ул. Б. Галушкина</li><li>ул. Керченская , д. 1а к2</li></ul><p>Время работы: с понедельника по пятницу с 9 до 21 (для учебных корпусов) или ежеджевно с 8 до 22 (для обжещитий).</p>', NULL, b'0', NULL),
(20, 'Военно-учебный центр', '<p>Важные моменты о военно-учебном центре:</p><ul><li>Поступить на военную кафедру можно по окончании 1-го и 2-го курсов бакалавриата после сдачи нормативов и успешного окончания сессии. Наличие выговоров не допускается.</li><li>Подать заявление на отбор можно с 16 по 30 марта.</li><li>Срок обучения 2 года (сержант) или 3 года (лейтенант). Специальность — ракетные войска и артиллерия.</li><li>Занятия проходят 1 раз в неделю с утра. В этот день пар на твоём факультете не будет.</li></ul><p>Подробнее смотри тут: vk.cc/axBhyb.</p>', NULL, b'0', NULL),
(21, 'Студенческий совет', '<p>Структура:</p><ul><li>Тренинг-Центр</li><li>5 комитетов</li><li>8 факультетских подразделений</li></ul><p><strong>Тренинг-Центр</strong></p><p>Занимается развитием надпрофессиональных компетенций, неформального образования в университете и проводит обучающие тренинги для Студсовета.</p><p>vk.com/success_tc</p><p><strong>Проектный комитет</strong></p><p>Направления:</p><ul><li>PR-отдел</li><li>Отдел внешних связей</li><li>ГРКК</li></ul><p>Группы проектов:</p><ul><li><a href=\"https://vk.com/finkvest\">vk.com/finkvest</a></li><li><a href=\"https://vk.com/fin_naturedance\">vk.com/fin_naturedance</a></li><li><a href=\"https://vk.com/finsportfest\">vk.com/finsportfest</a></li><li><a href=\"https://vk.com/urbanfest\">vk.com/urbanfest</a></li></ul><p><strong>Информационный комитет</strong></p><p>Направления:</p><ul><li>Фото</li><li>FinDay TV</li><li>Дизайн</li><li>СМИ</li><li>ГЦТ (Группа цифровых технологий)</li></ul><p>vk.com/icsst</p><p><strong>Учебный комитет</strong></p><p>Направления:</p><ul><li>Учебная политика и аналитика</li><li>Учебная подготовка</li><li>Информационное</li><li>Проектное</li><li>HR</li></ul><p>vk.com/uch_kom</p><p><strong>Социальный комитет</strong></p><p>Направления:</p><ul><li>Работа со студентами</li><li>Благотворительное</li><li>Экологическое</li><li>Информационное</li></ul><p>vk.com/social_comittee_fu</p><p><strong>Комитет внешних связей</strong></p><p>Направления:</p><ul><li>Спонсорский</li><li>Проектный</li><li>Отдел грантов</li><li>Искусство и досуг</li><li>Отдел стажировок</li><li>SMM</li><li>Отдел развития</li></ul><p>vk.com/finrelations</p><p><strong>Подразделения факультетов</strong></p><ul><li>ИТиАБД: vk.com/itbda2000</li><li>ФСНиМК: vk.com/fsp_fu</li><li>Юрфак: vk.com/lawsstnews</li><li>НАиБА: vk.com/taxaudit</li><li>Финфак: vk.com/finuniver_finfac</li><li>МЭО: vk.com/ier_finuniver</li><li>ФЭиБ: vk.com/stud_ac</li><li>ВШУ: vk.com/soroka.media</li></ul>', NULL, b'1', 'Что такое ФЭФ, ПМиИТ и ФФР?'),
(22, 'Творческие коллективы', '<ul><li>Студия ведущих</li></ul><p>Руководитель: Семенова Татьяна Николаевна&nbsp;</p><ul><li>Хор Финансового университета</li></ul><p>&nbsp;vk.com/finuchoir</p><ul><li>Театр эстрадной песни</li></ul><p>Руководитель: Ермишкина Екатерина Васильевна</p><ul><li>Вокально-инструментальный ансамбль «Атмосфера»</li></ul><p>vk.com/finatmosfera</p><ul><li>Ансамбль народной песни</li></ul><p>Руководитель: Белова Виктория</p><ul><li>Студенческий театр «Фунт»</li></ul><p>vk.com/studteatrfunt</p><ul><li>Хореографическая студия танца «Frappe» ​&nbsp;</li></ul><p>vk.com/frappe_finu</p><ul><li>Студия эстрадного и современного танца «Liberte»</li></ul><p>vk.com/liberte_16</p><ul><li>Ансамбль барабанщиков</li></ul><p>vk.com/findrummers</p><p>В Финансовом университете у каждого студента есть возможность заниматься внеучебной деятельностью. Создание и развитие всех творческих коллективов и клубов вуза курирует Управление внеаудиторной работы под руководством начальника управления Н. Т. Шестаева и его заместителя Т. Н. Семёновой.</p><p>Для того, чтобы стать частью коллектива или клуба, нужно лишь желание, а дальше ты можешь обратиться в официальные группы или в&nbsp; вышеупомянутое Управление, которое располагается по адресу:</p><p>Ленинградский проспект, 55, каб. 342.</p>', NULL, b'0', NULL),
(23, 'Клубы по интересам', '<p>Шахматный клуб «Зебра»</p><p><a href=\"http://vk.com/zebra_fu\">vk.com/zebra_fu</a></p><p>Экспедиционный клуб</p><p><a href=\"http://vk.com/expclub\">vk.com/expclub</a></p><p>Практико-ориентированный студенческий клуб «Самоуправление вне границ»</p><p><a href=\"http://vk.com/fa_students_club\">vk.com/fa_students_club</a></p><p>Клуб интеллектуальных игр<strong> </strong>«Fintellect»</p><p><a href=\"http://vk.com/fintellect\">vk.com/fintellect</a></p><p>Кейс-клуб</p><p><a href=\"http://vk.com/consultingclub\">vk.com/consultingclub</a></p><p>Клуб Дебатов</p><p><a href=\"http://vk.com/findebateclub\">vk.com/findebateclub</a></p>', NULL, b'0', NULL),
(24, 'Волонтёрский центр', '<p>Развитие волонтёрского труда в Финансовом университете.</p><p>vk.com/volunteer_fin</p>', NULL, b'0', NULL),
(25, 'НСО и ОСО', '<p><strong>НСО</strong></p><p>Научное студенческое общество, в котором ты сможешь заниматься исследовательской деятельностью.</p><p>vk.com/nso_finuniversity</p><p>НСО также есть на каждом факультете.&nbsp;</p><p><strong>ОСО</strong></p><p>ОСО (Объединённый совет обучающихся) — коллегиальный орган студенческого самоуправления нашего университета. Эта организация отличается от студенческого совета своими рабочими направлениями. Студенты, вступившие в совет, преследуют единую цель — создание дружного сообщества, в котором у каждого будет возможность развиваться в любом направлении.&nbsp;</p><p>vk.com/finuniver_ucs</p>', NULL, b'0', NULL),
(26, 'Масштабные проекты', '<p>Первый семестр:</p><ul><li>Квест Первокурсникам</li></ul><p><a href=\"https://vk.com/finkvest\">vk.com/finkvest</a></p><ul><li>Час ректора&nbsp;</li><li>ОpenSource</li></ul><p>vk.com/icsst</p><ul><li>Школа Актива</li></ul><p>vk.com/schoolofactivity</p><ul><li>Дебют первокурсника&nbsp;</li></ul><p>Второй семестр:</p><ul><li>Большой Студенческий Бал</li></ul><p><a href=\"https://vk.com/fin_naturedance\">vk.com/fin_naturedance</a></p><ul><li>Media Livе</li></ul><p>vk.com/medialivefu</p><ul><li>FinPoint</li></ul><p>vk.com/finpoint</p><ul><li>Евровидение Финансового университета</li></ul><p>vk.com/fin_euro</p><ul><li>Спортфест</li></ul><p><a href=\"https://vk.com/finsportfest\">vk.com/finsportfest</a></p><ul><li>Urban Fest</li></ul><p><a href=\"https://vk.com/urbanfest\">vk.com/urbanfest</a></p>', NULL, b'0', NULL),
(27, 'Советы по сдаче сессии', '<ol><li>Начни готовиться заранее, чтобы в последнюю ночь судорожно не учить билеты и не плакать от нервов в вагоне метро в день экзамена.</li><li>&nbsp;Составь план целей и задач. Например, цель — «сдать историю на «отлично» ».. Задачи: собрать все лекции в один файл, подготовить 50 вопросов по теории, учить по 5 вопросов в день и так далее.</li><li>Не ходи на консультации, если ты и так ничего не знаешь. Лучше инвестируй это время в повторение билетов и решение задач.</li><li>Спроси совет у старшекурсников. Те, кто уже сдавал предмет у данного преподавателя, подскажут и предупредят о нюансах сдачи экзамена.</li><li>Пользуйся только одним учебником. Не стоит распыляться на несколько, чтобы не запутаться в информации.</li><li>Не забудь про методичку и РПД. Это твой надёжный план по подготовке не только к сессии, но и к семинарам.</li></ol>', NULL, b'0', NULL),
(28, 'Лайфхаки', '<ul><li>Льготный проезд</li></ul><p>Стоимость проезда по социальной карте на «подземку» равна 405 руб./мес.</p><p>и 265 руб./мес. на ТАТ.</p><ul><li>Поезда и электрички</li></ul><p>В рамках студенческой программы лояльности «РЖД Бонус» компания предоставляет скидку 25% при покупке билетов в купейные вагоны фирменных поездов.</p><p>Проезд на поездах пригородного сообщения. Скидка на абонементные билеты в период с 1 сентября по 15 июня составляет 50% от полной стоимости (актуально в большинстве регионов).</p><ul><li>Налоговый вычет</li></ul><p>Студенты, обучающиеся на платной основе, могут вернуть 13% от потраченных на учёбу денег.</p><ul><li>Apple Music, Boom</li></ul><p>У тебя есть возможность получить студенческую подписку на Apple Music за 75 рублей в месяц. Для этого при покупке подписки через iTunes нужно выбрать вариант «Для учащихся», далее остается всего лишь подтвердить свой статус, следуя инструкциям.</p><p>Ещё один вариант — оформить подписку в сервисе Boom. Для этого перейди по ссылке: <a href=\"https://vk.com/vk_pay_music#student\">vk.com/vk_pay_music#student</a>, оставь заявку и заполни анкету.</p><ul><li>Лицензионный пакет Microsoft Office</li></ul><p>Не качай пиратские версии — получи бесплатное пользование лицензионным пакетом Microsoft Office на весь период обучения. Для этого зайди на официальный сайт Microsoft ,укажи почту ***@edu.fa.ru, в которой вместо «*» — номер студенческого билета и следуй инструкции.&nbsp;</p><ul><li>Культурный отдых</li></ul><p>Студенты имеют льготы на посещение многих музеев, кинотеатров и библиотек, что позволяет делать это бесплатно или со скидкой. Посетить Третьяковскую галерею можно за 150 рублей, предъявив студенческий билет. Чтобы попасть на спектакль в Большой театр за 100 рублей, необходимо прийти в кассу за полтора часа до начала и также предъявить студенческий. В Исторический музей ты можешь попасть за 200 рублей, а в последнее воскресенье месяца входной билет обойдется тебе бесплатно, правда только на основную экспозицию.</p>', NULL, b'0', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--
-- Создание: Авг 25 2020 г., 15:25
-- Последнее обновление: Авг 26 2020 г., 19:35
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `isAdmin`) VALUES
(4, 'putevodAdmin', '$2y$10$VBK10goPIZOcrwOMzjXhj.MpPPKJinyTK44Cf1iZPH8xluog4vjXy', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
