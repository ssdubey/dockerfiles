## Steps to create a private ipfs network with docker container:

### Creating Raft leader:
1. Build the attached dockerfile to create the docker image.
2. Run the interactive session of docker container:
```
    docker run -it <image name>
```
3. Start IPFS:
```
    ipfs init
```
4. Start IPFS daemon:
```
    ipfs daemon
```
5. Start a new shell for the running container:
```
    docker exec -it <container_id>
```
6. Start the IPFS cluster service:
```
    ipfs-cluster-service init
```
7. Open the `service.json` file created in the previous step and copy the secret key (4th parameter in the 'cluster' tag)
8. Run the ipfs-cluster-service daemon:
```
    ipfs-cluster-service daemon
```

At this step the IPFS raft leader is ready. Now we will prepare a peer node in almost similar fashion.

### Creating peer node:
Repeat steps 2 to 5
6. Set the secret key variable with the value copied from the raft leader:
```
    export CLUSTER_SECRET=<secret key>
```
7. Start the IPFS cluster service:
```
    ipfs-cluster-service init
```
This step will create a service.json file. It can be verified that the secret key for in this file is same as raft leader.
8. Run the ipfs-cluster-service daemon with the bootstrap address of the raft leader (following is an eg.):
```
    ipfs-cluster-service daemon --bootstrap /ip4/172.17.0.10/tcp/9096/ipfs/QmYPE4CugC5tKf7okTpF94YYK9t3SFwP9juaPZ1JFPCQMG
```

At this point shell of both the peers will display the Current Raft Leader and the peer added to the raft through their Hashes.

### Using the cluster
A new executable shell for both the container can be opened as shown in step 5 for experimentation.

Check the peers in the cluster:
```
    ipfs-cluster-ctl peers ls
```
Create a new file and add it to the cluster:
```
    ipfs-cluster-ctl add file.txt
```
Check all the added (pinned) items in the cluster:
```
    ipfs-cluster-ctl pin ls
```
