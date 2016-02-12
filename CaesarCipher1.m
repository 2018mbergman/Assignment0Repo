%Caesar cipher
%CaesarEncode
word = 'caesarcipher'
shift= 4;
word = setstr(rem(word+shift-97,26)+97)
%CaesarDecode
word = setstr(rem(word-shift-97,26)+97)
