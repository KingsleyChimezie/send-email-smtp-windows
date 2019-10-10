# send-email-smtp-windows #

> ### Version 1.0 ###

### Send custom emails via SMTP ##



## __Prerequisites__ ##
* OS - Window
* Internet access
* Email account (Gmail is recommended)



## __Instructions__ ##
### YouTube Videos ###
| Description                                                                                                 | Link                         |
|-------------------------------------------------------------------------------------------------------------|------------------------------|
| How To Send An Email Using A Batch Script - SMTP                                                            | COMING SOON                  |

### Written Guide ###
### 1. Download "send-email-smtp-windows.bat" tool. ###   

* The latest tool can be downloaded from the ___"master"___ branch ___"src"___ folder - within this repository.   
OR   
Independently from __GitHubGist__ if available. 
(See links below) 
    
        - BitBucket repository (master branch):    https://goo.gl/MC7zDD  
        - GitHub repository (master branch):       na  
        - GitHubGist:                              na


### 2. Right click on the tool, click edit (notepad should open), append the variables according to your details: ###

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



## __License__ ##
* MIT - Copyright (c) 2017 Kingsley Chimezie



## __Versions__ ##
| Version No.   	| Release Date 	|
|---------------	|--------------	|
| 1.0 (current) 	| 2018-03-27   	|



## __Project People__ ##
| Title              	| Name                	| Website                  	|
|-------------------	|-------------------	|--------------------------	|
| Author +        	| Kingsley Chimezie 	| http://www.kingsley.tech 	|

* __For more info on title definition: "/misc/title.md"__



## __Acknowledgments__ ##
* NULL



## __References__ ##
* Null