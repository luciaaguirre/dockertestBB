FROM python:3.12-slim

# work directory
WORKDIR /app

# copying .txt
COPY requirements.txt .

# installing dependencies
RUN pip install --no-cache-dir -r requirements.txt

# copying app content
COPY app/ .

# envs configuration
ENV FLASK_APP=app.py
ENV MYSQL_HOST=mysql
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=password
ENV MYSQL_DB=my_db

# exposing port
EXPOSE 5000

# ejecution
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]