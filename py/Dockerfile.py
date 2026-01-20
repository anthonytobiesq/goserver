
FROM debian:stable-slim
RUN apt update && apt install -y python3
#WORKDIR /app
COPY main.py ./main.py
COPY books/ ./books/
CMD ["python3", "main.py"]