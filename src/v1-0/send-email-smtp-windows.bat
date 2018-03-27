@ECHO OFF
SET LOCAL EnableDelayedExpansion

REM :: Batch file to send email via SMTP
REM :: By Kingsley Chimezie - Kingsley Media Productions™ - 27/03/2018
REM :: http://youtube.com/kingsley15
REM :: License: MIT

REM ********** APPEND THE FOLLOWING VARIABLE TO SUIT YOUR NEEDS **********
(
    REM :: Enter your email server SMTP details (gmail example)
    (
        REM :: To send secure emails (encrypted):       SET port=465 and SET SSL=True
        REM :: To send non-secure emails (unencrypted): SET port=587 and SET SSL=False

        SET Port=465
        SET SSL=True
        SET SMTPServer="smtp.gmail.com"
        SET Username="youremail@gmail.com"
        SET Password="YourEmailPassword"
    )
    REM :: Enter your email sending details
    (
        SET EmailFrom="youremail@gmail.com"
        SET EmailTo="youremail@gmail.com"
        SET EmailSubject="KMP SMTP BATCH SCRIPT"
        SET EmailBody="Batch file to send email via SMTP"
        
        REM :: Attachment must be file - no bat, exe, rar (use .zip) - Leave blank for no attachment.
        SET EmailAttachment="C:\example.jpg"
    )
)

REM :::::::: DO NOT EDIT ANYTHING BELOW HERE UNLESS YOU KNOW WHAT YOU'RE DOING ::::::::

SET "vbsfile=%temp%\smtp-email-bat.vbs"
DEL "%vbsfile%" 2>nul
SET cdoSchema=http://schemas.microsoft.com/cdo/configuration
ECHO >>"%vbsfile%" SET objArgs       = WScript.Arguments
ECHO >>"%vbsfile%" SET objEmail      = CreateObject("CDO.Message")
ECHO >>"%vbsfile%" objEmail.From     = %EmailFrom%
ECHO >>"%vbsfile%" objEmail.To       = %EmailTo%
ECHO >>"%vbsfile%" objEmail.Subject  = %EmailSubject%
ECHO >>"%vbsfile%" objEmail.Textbody = %Emailbody%
IF exist %EmailAttachment% ECHO >>"%vbsfile%" objEmail.AddAttachment %EmailAttachment%
ECHO >>"%vbsfile%" with objEmail.Configuration.Fields
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/sendusing")        = 2 ' not local, smtp
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/smtpserver")       = %SMTPServer%
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/smtpserverport")   = %Port%
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/smtpauthenticate") = 1 ' cdobasic
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/sendusername")     = %Username%
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/sendpassword")     = %Password%
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/smtpusessl")       = %SSL%
ECHO >>"%vbsfile%"  .Item ("%cdoSchema%/smtpconnectiontimeout") = 15
ECHO >>"%vbsfile%"  .Update
ECHO >>"%vbsfile%" end with
ECHO >>"%vbsfile%" objEmail.Send
cscript.exe /nologo "%vbsfile%"
DEL "%vbsfile%" 2>NUL

ECHO --------------------------------------------------------------------
ECHO Batch file to send email via SMTP
ECHO By Kingsley Chimezie - Kingsley Media Productions - 27/03/2018
ECHO http://www.kingsley.tech
ECHO License: MIT
ECHO --------------------------------------------------------------------& ECHO.
ECHO email sent - check your variables if email is not received.
ECHO %time% > NUL & timeout 10 > NUL & echo %time% > NUL 
GOTO :EOF