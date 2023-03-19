### Управление камерой с земли

Проект svpcom wfb-ng предусматривает создание tcp-тоннеля сквозь линк между воздушной и наземной частями, однако часть реализации это выполнена на python, которого конечно в камере с ее 8mb flash и 32-64 RAM быть не может.
Поэтому приходится изыскивать какие-то другие решения. В качестве эксперимента `[mavfwd](https://github.com/OpenIPC/sandbox-fpv/tree/master/mavfwd)` был дополнен парсером mavlink-пакета RC_CHANNELS_OVERRIDE (значения RC каналов, отправленные с наземной станции, с джойстика).
Он мониторит изменения в 5,6,7,8 каналах и при их наличии вызывает скрипт `[/root/channels.sh](https://github.com/OpenIPC/sandbox-fpv/tree/master/gk7205v200/root)`, передавая в него два параметра (номер канала и значение), и который производит неоюходимые операции. В текущем примере это изменение режима работы камеры (1080p@30fsp / 720p@5-fps) на 5-м канале и смена luminance на 7м (трехпозиционный переключатель).
При использовании потенциометра передача параметров идет слишком быстро, и медленные действия лучше не выполнять!

Для установки его на камеру замените в `/usr/sbin/` штатный mavfwd на [измененный](https://github.com/OpenIPC/sandbox-fpv/tree/master/gk7205v200/usr/sbin). Заодно получите возможность установить скорость телеметрии для связи с полетником выше чем 115200, конечно на свой страх и риск!
Приветствуются идеи и пожелания по этому поводу, которые можно высказать [здесь](https://t.me/+BMyMoolVOpkzNWUy).
