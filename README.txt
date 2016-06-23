Steps:
1. download latest FS2 linux installer from ftp site: ftp://plefilesvr.dctmlabs.com/Builds/FS2/7.3/
2. put files under installer folder, folder structure woule be like:
  Dockerfile
  entrypoint.sh
  silient.txt
  .dockerignore
  README.txt
  installer/
	FS2_Adapter_Development_Kit.iam.zip
	FS2_Server_SDK_unix.zip
	fs2Setup.bin
    tanukisoftware.zip
3. modify FROM in Dockerfile, by default 16.04. Optional would be 14.04
4. run docker builder command to build docker image under this root folder:
	docker build -t fs2:latest ./
5. play with image and container as docker guide.
6. play with FS2 admin UI as usual.
	During container starting, host IP address will be displayed as output, most likely, 172.17.0.2. Then FS2 admin UI would be: https://172.17.0.2:3003/AdminCenter. 
