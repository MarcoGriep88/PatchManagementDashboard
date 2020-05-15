# Backup Databases

docker exec db-patchmanagement-chocoinfo-mysql-001 sh -c 'exec mysqldump --all-databases -uroot -p"da8xun789a7xd897w7897x89d7s8a7"' > /home/ust01-qbitc12/backups/database/$(date +%d-%m-%Y_%H-%M-%S)-db-patchmanagement-chocoinfo-mysql-001.sql
docker exec db-patchmanagement-duminfo-mysql-001 sh -c 'exec mysqldump --all-databases -uroot -p"Ramda8xun7dx3m89087x89d7s8a7"' > /home/ust01-qbitc12/backups/database/$(date +%d-%m-%Y_%H-%M-%S)-db-patchmanagement-duminfo-mysql-001.sql