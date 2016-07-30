FROM firewut/python-base-image:0.1

RUN addgroup user
RUN adduser user -D -G user
RUN chown -R user:user /home/user/
RUN mkdir -p /home/user/

WORKDIR /home/user/
ADD ./ /home/user/

RUN pip install -r /home/user/requirements.txt && \
    rm -rf /root/.cache/

EXPOSE 8888
ENTRYPOINT gunicorn project.main:app -c project.gunicorn
