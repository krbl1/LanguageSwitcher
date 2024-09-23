^+l:: ; Ctrl + Shift + L
; Копируем выделенный текст

Clipboard := ""
Send, ^c
;ClipWait, 1

; Проверяем, что текст был скопирован
if (Clipboard = "")
{
    MsgBox, Не удалось скопировать текст. Убедитесь, что что-то выделено.
    return
}

IsLowerCase(char)
{
    StringLower, lowerChar, char ; Преобразуем символ в нижний регистр
    return (char == lowerChar) ; Сравниваем с исходным символом
}

; Получаем скопированный текст
OriginalText := Clipboard

; Функция для переключения раскладки
TransformText(Text)
{
    ; Таблицы соответствий для английской и русской раскладок
    EnglishToRussian := { "q":"й", "w":"ц", "e":"у", "r":"к", "t":"е", "y":"н", "u":"г", "i":"ш", "o":"щ", "p":"з", "[":"х", "]":"ъ", "a":"ф", "s":"ы", "d":"в", "f":"а", "g":"п", "h":"р", "j":"о", "k":"л", "l":"д", ";":"ж", "'":"э", "z":"я", "x":"ч", "c":"с", "v":"м", "b":"и", "n":"т", "m":"ь", ",":"б", ".":"ю", "/":"/", "Q":"Й", "W":"Ц", "E":"У", "R":"К", "T":"Е", "Y":"Н", "U":"Г", "I":"Ш", "O":"Щ", "P":"З", "{":"Х", "}":"Ъ", "A":"Ф", "S":"Ы", "D":"В", "F":"А", "G":"П", "H":"Р", "J":"О", "K":"Л", "L":"Д", ":":"Ж", """":"Э", "Z":"Я", "X":"Ч", "C":"С", "V":"М", "B":"И", "N":"Т", "M":"Ь", "<":"Б", ">":"Ю", "?":"," }

    RussianToEnglish := { "й":"q", "ц":"w", "у":"e", "к":"r", "е":"t", "н":"y", "г":"u", "ш":"i", "щ":"o", "з":"p", "х":"[", "ъ":"]", "ф":"a", "ы":"s", "в":"d", "а":"f", "п":"g", "р":"h", "о":"j", "л":"k", "д":"l", "ж":";", "э":"'","я":"z", "ч":"x", "с":"c", "м":"v", "и":"b", "т":"n", "ь":"m", "б":",", "ю":".", "/":"/", "Й":"Q", "Ц":"W", "У":"E", "К":"R", "Е":"T", "Н":"Y", "Г":"U", "Ш":"I", "Щ":"O", "З":"P", "Х":"{", "Ъ":"}", "Ф":"A", "Ы":"S", "В":"D", "А":"F", "П":"G", "Р":"H", "О":"J", "Л":"K", "Д":"L", "Ж":":", "Э":"""", "Я":"Z", "Ч":"X", "С":"C", "М":"V", "И":"B", "Т":"N", "Ь":"M", "Б":"<", "Ю":">", "/":"/" }
	
	RussianLetters := "йцукенгшщзхъфывапролдэжэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЭЖЭЯЧСМИТЬБЮ"
    EnglishLetters := "qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP[]ASDFGHJKL;'ZXCVBNM,./?"
	EnglishMiniLetters := "qwertyuiopasdfghjklzxcvbnm"

    TransformedText := ""
    Loop, parse, Text
    {
        char := A_LoopField
        if (InStr(RussianLetters, char))
        {
            ; Преобразование с русской на английскую раскладку
            if (char in RussianToEnglish)
                TransformedText .= RussianToEnglish[char]
            else
                TransformedText .= char
        }
        else if (InStr(EnglishLetters, char))
        {
            ; Преобразование с английской на русскую раскладку
            if (char in EnglishToRussian && IsLowerCase(char))
				{
				oldchar := EnglishToRussian[char]
				StringLower, newchar, oldchar
                TransformedText .= newchar
				}
			else if (char in EnglishToRussian && !IsLowerCase(char))
				TransformedText .= EnglishToRussian[char]
            else
                TransformedText .= char
        }
        else
        {
            ; Неизвестные символы остаются без изменений
            TransformedText .= char
        }
    }
    return TransformedText
}

; Преобразуем текст
TransformedText := TransformText(OriginalText)

; Вставляем преобразованный текст
Clipboard := TransformedText
Send, ^v