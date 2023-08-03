function mailme(mailtitle,mailcontent)

mail = '1763692481@qq.com'; 
password = 'tvnqgwcnkmlqbcfh';

setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Server','smtp.qq.com');
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

receiver='1763692481@qq.com'; 
sendmail(receiver,mailtitle,mailcontent);
end


