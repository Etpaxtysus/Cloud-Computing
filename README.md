# Cloud-Computing

## OpenTofu

```
tofu init
tofu apply
```

Untuk Cek Status:
```
sudo systemctl status libvirtd
```

Untuk Buat Storage pool pertama kali :
```
sudo virsh pool-define /etc/libvirt/storage/default_storage_pool.xml
sudo virsh pool-start default
sudo virsh pool-autostart default
```

Untuk Cek Storage pool :
```
virsh vol-list default
virsh pool-info default
```

Jika Fail (storage pool 'default' already exists), Debug dengan cara :
```
sudo virsh pool-list --all
sudo virsh pool-destroy default
sudo virsh pool-undefine default
```

Untuk Cek VM yang sedang running :
```
virsh list
```