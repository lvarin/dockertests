FROM python:3.9

WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && apt-get install -y && \
    #pip install poetry && \
    git clone https://github.com/industrial-optimization-group/desdeo-webapi.git

WORKDIR /usr/src/app/desdeo-webapi

RUN pip install -r requirements.txt
    #poetry install && \
RUN python add_exp_users.py --username user --N 1 && \
    cat ./users_and_pass.csv


ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]