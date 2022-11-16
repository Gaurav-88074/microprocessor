set projectName=start
\masm611\bin\ml /c /Zd /coff %projectName%.asm
\masm611\bin\Link /SUBSYSTEM:CONSOLE %projectName%.obj
%projectName%.exe