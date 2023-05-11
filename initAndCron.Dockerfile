FROM python:3.9

#RUN adduser node root && \
RUN mkdir -p /src

WORKDIR /src

# Install dependencies
RUN git clone -b experiment_switch_method --single-branch https://github.com/light-weaver/desdeo-webapi.git

WORKDIR /src/desdeo-webapi

EXPOSE 5000

#RUN python -mvenv .venv && \
#    source .venv/bin/activate && \
RUN pip install -r requirements.txt && \
    python add_exp_users.py --N 100 && \
    cat ./users_and_pass.csv

#RUN chmod -R 775 /src/desdeo-webapi
#RUN chown -R node:root /src/desdeo-webapi


ENTRYPOINT [ "python" ]

#Add cron job
