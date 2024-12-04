## Недавно столкнулся с проблемой, что Gmail попал в черный список DNSBL.ORG, который я использую для проверки на спам в Zimbra.  Чтобы исправить эту ситуацию необходимо:

1. su zimbra
2. nano /opt/zimbra/conf/amavisd.conf.in
3. Ищем строку, которая начинается с:
{ # a hash-type lookup table (associative array)
и добавляем доверенный домен перед всеми остальными записями:

'gmail.com'     =>                  -10.0,

4. Сохраняем файл и перезапускаем антиспам командой:

zmamavisdctl stop && zmamavisdctl start



Блокировка почтовых доменов в Zimbra

Бывает так, что антиспам пропускает письма с ненужным содержанием и никакого желания кроме как заблокировать домен отправителя не возникает. Делается все довольно просто.

Открываем для редактирования файл /opt/zimbra/conf/salocal.cf.in
Находим секцию # accept email from zimbra support and forumns
Добавляем блокируемый домен (например блокируем всю почту из домена com.ua)
blacklist_from *.com.ua
Сохраняем файл и перезапускаем Zimbra командой
zmcontrol stop && zmcontrol start
Таким же образом можно добавить домен, почту от которого нужно всегда пропускать (например почту от пользователей своего домена). В той же секции необходимо добавить
whitelist_from *@zimbradomain.dom
