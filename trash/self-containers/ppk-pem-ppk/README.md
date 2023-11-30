# PPK TO PEM - PEM TO PPK

- How to run ppk-pem-ppk from this project use

<pre>
user@host: git clone https://github.com/huntercodexs/docker-series.git .
user@host: cd self-containers/ppk-pem-ppk
user@host: docker network create open_network
user@host: docker-compose up --build (in first time)
user@host: docker-compose start (in the next times)
</pre>

- Convert a PPK KEY to PEM KEY

Put the PPK KEY in the folder share/ppk and after run the follow command

<pre>
user@host: docker exec -it ppk-pem-ppk ./getppk.sh ${PPK_FILENAME}
</pre>

- Convert a PEM KEY to PPK KEY

Put the PEM KEY in the folder share/pem and after run the follow command

<pre>
user@host: docker exec -it ppk-pem-ppk ./getpem.sh ${PEM_FILENAME}
</pre>

> In both case above, the resulted file will be put in the path share/result/ in this current path
