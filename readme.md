# LanguageSwitcher Скрипт для Переключения Раскладки Текста

## Описание
Этот скрипт на AutoHotkey позволяет быстро переключать раскладку выделенного текста между английской и русской клавиатурами, сохраняя при этом регистр символов. Например, при выделении текста на английском и нажатии комбинации клавиш `Ctrl + Shift + L`, скрипт преобразует текст в соответствующую русскую раскладку, и наоборот.

## Возможности
- Переключение раскладки выделенного текста между английской и русской клавиатурами.
- Сохранение регистра символов при преобразовании.
- Поддержка строчных и заглавных букв.
- Легкое использование с помощью горячих клавиш `Ctrl + Shift + L`.

## Установка
1. Скачайте и установите [AutoHotkey 1.1](https://www.autohotkey.com/download/ahk-install.exe).
2. Скачайте скрипт [script_ls.ahk](script_ls.ahk) из репозитория GitHub.
3. Сохраните файл `script_ls.ahk` на вашем компьютере.

## Автозапуск
Чтобы скрипт запускался автоматически при старте Windows, выполните следующие шаги:
1. Нажмите `Win + R`, введите `shell:startup` и нажмите Enter. Это откроет папку автозапуска.
2. Создайте ярлык для вашего `script_ls.ahk` файла и поместите его в эту папку. 

Теперь скрипт будет запускаться автоматически при каждом запуске Windows.

## Использование
1. Запустите загруженный `script_ls.ahk` файл двойным кликом.
2. Выделите текст, который хотите преобразовать.
3. Нажмите `Ctrl + Shift + L` для переключения раскладки выделенного текста.

## Примечания
- Скрипт преобразует раскладку каждого символа в тексте. Если символ не распознан, он остается неизменным.
- Если текст не был выделен, появится сообщение об ошибке. Убедитесь, что что-то выделено перед использованием скрипта.

## Использование
Если вы используете этот скрипт в своих проектах, пожалуйста, упоминайте о нем, отмечая [@KPbl_love](https://habr.com/ru/users/KPbl_love/) на Хабре.

Версия для MacOS в процессе.
Вопросы и пожелания можно на Хабре [@KPbl_love](https://habr.com/ru/users/KPbl_love/).
