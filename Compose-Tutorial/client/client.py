#!/usr/bin/env python3

# Импортируем системную библиотеку Python.
# Она используется для загрузки файла 'index.html' с сервера.
import urllib.request
from http.client import HTTPResponse


# Эта переменная содержит запрос к 'http://localhost:1234/'.
# Возможно, сейчас вы задаётесь вопросом о том, что такое 'http://localhost:1234'.
# localhost указывает на то, что программа работает с локальным сервером.
# 1234 - это номер порта, который вам предлагалось запомнить при настройке серверного кода.
fp: HTTPResponse = urllib.request.urlopen("http://localhost:1234")

# 'encodedContent' соответствует закодированному ответу сервера ('index.html').
# 'decodedContent' соответствует раскодированному ответу сервера (тут будет то, что мы хотим вывести на экран).
encodedContent: bytes = fp.read()
decodedContent: str = encodedContent.decode("utf-8")

# Выводим содержимое файла, полученного с сервера ('index.html').
print(decodedContent)

# Закрываем соединение
fp.close()