Requires Docker. Run the `.run.sh` script to bring up the db, attempt to run the migration, then bring down the db.

## Expected output

```
$ ./run.sh
Starting db...
[+] Running 2/2
 ✔ Network atlas-multi-tenant-repro_default  Created  0.0s
 ✔ Container atlas-multi-tenant-repro-db-1   Started  0.2s

Running migrations...
Error: sql/schema: postgres: schema "" was not found

Killing db...
[+] Running 2/1
 ✔ Container atlas-multi-tenant-repro-db-1   Removed  0.1s
 ✔ Network atlas-multi-tenant-repro_default  Removed  0.0s
```