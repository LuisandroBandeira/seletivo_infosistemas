# seletivo_infosistemas

Processo Seletivo InfoSistemas - DELPHI - Luisandro Nachtigal Bandeira

Aplicação desenvolvida com IDE Delphi 10.3.3 Rio para Windows 32-bit

Orientações de uso

O sistema faz uso das DLLs <b>libeay32.dll</b> e <b>ssleay32.dll</b> para envio de e-mail e devem estar no mesmo diretório do executável.</br>
O sistema também faz uso do arquivo <b>email_config.ini</b> para envio de e-mail e deve estar no mesmo diretório do executável.</br>

Para garantir que esses arquvivos estejam no mesmo diretório do executável, foi criado um script que é executado no <b>Post-build events</b> do projeto.</br>
Esse script faz a cópia dos arquivos <b>libeay32.dll</b>, <b>ssleay32.dll</b> e <b>email_config.ini</b> do diretório do projeto para o diretório onde o executável é gerado.</br>
para visualizar o script do <b>Post-build events</b> vá em:</br> 
<b>Project -> Options -> Building -> Build Events -> Post-build events -> Commands -> Value from "All configurations - All platforms"</b>

O arquivo <b>email_config.ini</b> possuí as configurações da conta de e-mail que será utilizada para enviar os e-mails do sistema.</br>
Esse arquivo já esta configurado com uma conta para o envio dos e-mails, mas é possível altera-lo para utilizar outra conta de e-mail.</br>
Obs. caso queira utilizar outra conta de e-mail e essa conta for do GMail é necessário que a conta do e-mail permita o acesso a Apps menos seguros.</br>
Caso a conta de e-mail não permita o acesso Apps menos seguros o GMail irá bloquear o envio do e-mail.</br> 
Para mais informações acesse: https://support.google.com/accounts/answer/6010255?hl=pt-BR

Caso haja dúvida entre em contato através do e-mail luisandro@hotmail.com
