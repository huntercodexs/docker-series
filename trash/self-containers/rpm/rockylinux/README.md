# ROCKLINUX RPM

- How to run rockylinux rpm from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/rpm/rockylinux
docker-compose up --build (in first time)
docker-compose start (in the next times)
docker exec -u rpmuser -it rockylinux-rpm /bin/bash
</pre>


- How to configure the RPMBUILD

> JAVA

<pre>
# Step 1
- Firstly, generate a builder (jar file) from your project.
- In the next step, get the application.properties and log4j2.xml (if exists)
- Now create the service file and also the SPEC file (these files can be obtained in the path shared/java in this project)
- Put all files in a single folder, example: APPLICATION-NAME/
- Edit the SOURCES files: application.properties, log.xml, APPLICATION-NAME.service e APPLICATION-NAME.spec

# Step 2
- Put the following files: application.properties, log4j2.xml, APPLICATION-NAME.service, APPLICATION-NAME-${VERSION}.jar 
in the folder SOURCES
- Put the SPEC file APPLICATION-NAME.spec in the folder SPECS

# Step 3
- Check if the current directory looks like:
/home/rpmuser/rpmbuild/
    ├── BUILD
    ├── BUILDROOT
    ├── RPMS
    ├── SOURCES
    │   └── application.properties
    │   └── log4j2.xml
    │   └── APPLICATION-NAME.service
    │   └── APPLICATION-NAME-${VERSION}.jar
    ├── SPECS
    │   └── APPLICATION-NAME.spec
    └── SRPMS

# Step 4
- Run the rpmbuild command int the folder /home/rpmuser/rpmbuild as showed bellow:
    rpmbuild -ba SPECS/APPLICATION-NAME.spec

# Step Final
- Check if the RPM file was generated in the folder /home/rpmuser/rpmbuild/RPMS/x86_64/
ls /home/rpmuser/rpmbuild/RPMS/x86_64/APPLICATION-NAME-ENVIRONMENT-${VERSION}-0.x86_64.rpm

! DONE
</pre>

> PYTHON

> PHP

> SHELL SCRIPT
