#!/bin/bash

# 설정 변수
LOG_DIR="/var/log/test_results"
BACKUP_DIR="/home/kwoni/backup"
DATE=$(date +%Y%m%d)

echo "[1/3] 백업 디렉토리 확인 중..."
mkdir -p $BACKUP_DIR

echo "[2/3] 로그 파일 압축 및 백업 중..."
if [ -f "$LOG_DIR/app.log" ]; then
    cp $LOG_DIR/app.log "$BACKUP_DIR/app_$DATE.log"
    echo "백업 완료: app_$DATE.log"
else
    echo "경고: 백업할 app.log 파일이 없습니다."
fi

echo "[3/3] 오래된 백업 파일 정리 중..."
find $BACKUP_DIR -name "app_*.log" -mtime +3 -delete

echo "=== 모든 작업이 완료되었습니다! ==="
