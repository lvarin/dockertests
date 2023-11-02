FROM python:3.8

#RUN adduser node root && \
RUN mkdir -p /src

WORKDIR /src

# Install dependencies
RUN pip install flask
RUN git clone -b experiment_switch_method --single-branch https://github.com/giomara-larraga/desdeo-webapi.git

WORKDIR /src/desdeo-webapi

EXPOSE 5000

#RUN python -mvenv .venv && \
#    source .venv/bin/activate && \
RUN pip install -r requirements.txt
# python add_exp_users.py --N 1 && \
# cat ./users_and_pass.csv

#RUN chmod -R 775 /src/desdeo-webapi
#RUN chown -R node:root /src/desdeo-webapi


ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]
