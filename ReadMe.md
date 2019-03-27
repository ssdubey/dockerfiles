## Steps to set-up the private IPFS network:

1. Run `docker-compose up` from the root directory (`docker-compose build` if further modifying the dockerfile)
2. Find the docker image hash of the master and workers.
3. Start and Run the containers with those images. (Master should be run only once and worker can be run as many times as required. All the workers will attach with the same master to create the cluster) 
  ```
  docker run -it <image hash> bash
  ```
 
4. For worker nodes, give executable permission to the script already available in the container and run it:
```
chmod +x script_worker
./script_worker
```
5. Run `ps` on master and worker nodes to check if ipfs and the service daemons are running.
6. Logs are generated in the current folder of the container in the files: `ipfs_daemon.out` and `ipfs_service_daemon.out`

There could be some errors shown in the log, but they do not hinder the private network setup. These errors are related to localhost, and the exact reason are yet to debug. 
If instead of running the script, the daemons are started using those commands one by one, this error does not show up. 
