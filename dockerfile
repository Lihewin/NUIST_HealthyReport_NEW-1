#基于的基础镜像
FROM ubuntu:latest
#代码添加到code文件夹
ADD . /code
# 设置code文件夹是工作目录
WORKDIR /code
# 安装支持

RUN apt-get update && apt-get install -y python3 python3-pip cron && pip3 install -r requirements.txt -i https://pypi.doubanio.com/simple && echo '0 7 * * * /usr/bin/python /code/report.py'>>/etc/crontab && service cron restart
CMD ["python", "/code/report.py"]