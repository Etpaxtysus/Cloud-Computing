import time

log_file = 'logs/activity.log'
max_logs = 10  # Tentukan jumlah maksimal log yang ingin ditulis
counter = 0  # Inisialisasi penghitung log

# Menulis log aktivitas terbatas
while counter < max_logs:
    with open(log_file, 'a') as f:
        timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
        f.write(f"Activity logged at {timestamp}\n")  # Menulis log dengan newline
    time.sleep(5)  # Menunggu 5 detik sebelum menulis log lagi
    counter += 1  # Menambah penghitung setelah setiap log
