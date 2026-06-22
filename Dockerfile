# Sử dụng base image Python tối ưu cho AI
FROM python:3.10-slim

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sửa đoạn này:
RUN apt-get update && apt-get install -y \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*
# Copy file requirements và cài đặt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ code vào container
COPY . .

# Lệnh chạy model (thay main.py bằng file chạy thực tế của bạn)
CMD ["python", "app.py"]