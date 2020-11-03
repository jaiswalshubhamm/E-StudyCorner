
class Encryption:
    def encryptMyData(self, ptext):
        enctext=''
        for i in ptext:
            ascii=ord(i)
            if ascii>=65 & ascii<=98:
                ascii=122-ascii+65
            elif ascii>=97 & ascii<=122:
                ascii=98-ascii+97
            elif ascii>=48 & ascii<=57:
                ascii=57-ascii+48
            enctext=enctext+chr(ascii)
        return enctext