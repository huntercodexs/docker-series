# SONARQUBE

> IMPORTANT: This work was tested using the following versions
 
| Item | Version       | Build  | Description        | Operational System | URL                    |
|------|---------------|--------|--------------------|--------------------|------------------------|
| 1    | lts-community |        | Community Edition  | Linux / Windows    | http://localhost:39000 |
| 2    | 6.7           |        | Community Edition  | Linux / Windows    | http://localhost:39001 |
| 3    | 9.7           |        | Community Edition  | Linux / Windows    | http://localhost:39002 |
| 4    | 9.9.8         | 100196 | Community Edition  | Linux / Windows    | http://localhost:39003 |
| 5    | 24.12.0       | 100206 | Community Edition  | Linux / Windows    | http://localhost:39004 |

- How to run sonarqube from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/sonar
user@host:/home/user/docker-series/self-containers/sonar$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/sonar$ docker-compose start
</pre>

The expected result for this sonar docker configuration repository is something like below

```text
     Name                    Command               State                     Ports                   
-----------------------------------------------------------------------------------------------------
sonar_db24120_1   docker-entrypoint.sh postgres    Up      5432/tcp                                  
sonar_db67_1      docker-entrypoint.sh postgres    Up      5432/tcp                                  
sonar_db97_1      docker-entrypoint.sh postgres    Up      5432/tcp                                  
sonar_db998_1     docker-entrypoint.sh postgres    Up      5432/tcp                                  
sonar_db_1        docker-entrypoint.sh postgres    Up      5432/tcp                                  
sonarqube         /opt/sonarqube/docker/entr ...   Up      0.0.0.0:39000->9000/tcp,:::39000->9000/tcp
sonarqube24120    /opt/sonarqube/docker/entr ...   Up      0.0.0.0:39004->9000/tcp,:::39004->9000/tcp
sonarqube67       ./bin/run.sh                     Up      0.0.0.0:39001->9000/tcp,:::39001->9000/tcp
sonarqube97       /opt/sonarqube/bin/run.sh  ...   Up      0.0.0.0:39002->9000/tcp,:::39002->9000/tcp
sonarqube998      /opt/sonarqube/docker/entr ...   Up      0.0.0.0:39003->9000/tcp,:::39003->9000/tcp

```

## Plugins

- Vulnerabilities checking

> Releases: github.com/dependency-check/dependency-check-sonar-plugin/releases

[Example]
https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/5.0.0/sonar-dependency-check-plugin-5.0.0.jar

## Access

Use the table above to access each docker using the respective version
<pre>
Login: admin
Password: admin

** You might be requested to change the password after first login
</pre>

![update-password.png](update-password.png)

## Usage

After you make login in the Sonar UI Form, you can follow these steps below to achieve a good and satisfactory usage 
of this amazing and powerful tools for code quality, just read with attention and enjoy.

### ✅ Step 1: Create a Global Token

<pre>
Log in to SonarQube
Go to “My Account” > “Security”

Under “Generate Tokens”:
    Give it a name like ci-token-java-projects
    Click “Generate”
    Copy and save the token immediately (you won’t see it again)
    
Example: sqa_753b0f09b0b8ca51d78251912cdfa48e0ccf0377
</pre>

![token-generate.png](token-generate.png)

### ✅ Step 2: Define a Minimum Score Using Quality Gates

1. Log in as Admin or Project Admin

Only users with admin privileges can edit or apply Quality Gates.
2. Go to the Quality Gates Section

   In the top menu, go to “Quality Gates”.

   Click on the Quality Gate you want to edit (e.g., "Sonar Way").

3. Add Conditions to the Quality Gate

Click “Add Condition” and configure rules such as:

    Coverage < 80%
    New Code Maintainability Rating worse than A
    Security Rating worse than B
    Bugs > 0
    Duplications on new code > 3%

These serve as your minimum score thresholds.

If any condition fails, the Quality Gate will fail, and the dashboard will indicate this with a red “Failed” badge.
🎯 Example: Enforcing Minimum Maintainability and Coverage

Let’s say you want:

    Coverage must be at least 80%
    Maintainability Rating must be A (i.e., zero code smells on new code)

Your conditions would be:
Metric	Operator	Value
Coverage on New Code	<	80%
Maintainability Rating on New Code	worse than	A

4. Set the Quality Gate as Default (optional)

   On the Quality Gate page, click “Set as Default”.
   Or assign it to a specific project via Project Settings > Quality Gate.

5. Check the Result in the Dashboard

After your next analysis (e.g., via CI/CD), go to the project dashboard. You’ll see whether the project passed or failed the Quality Gate.

6. Also you can add more conditions to your Gate settings for measurements more strict or critical in the 
Quality Gates top menu, see the example below

![quality-gates.png](quality-gates.png)

So in this case you will get Failed when sonar was running because the coverage consider the 
Overall Code as well, so the results should be like something below

![overall-coverage-failed.png](overall-coverage-failed.png)

### ✅ Step 3: Create a Custom Quality Profile for Java

1. Log in as Admin

Only users with Admin privileges can create or edit quality profiles.

2. Go to the Quality Profiles Section

   From the top menu, go to “Quality Profiles”.
   On the left, you’ll see a list of languages (Java, Python, JavaScript, etc.).

3. Select Java

   Click on “Java” from the language list.
   You’ll see existing profiles like “Sonar way”.

4. Create a New Profile

   Click “Create”.
   Give your profile a name, e.g., Strict Java Rules.
   Choose an existing profile to inherit from (typically "Sonar way") or start from scratch.

5. Activate or Deactivate Rules

After creating the profile, you'll be taken to its rules page.

Use filters to:

    Show all available rules for Java.
    Search for rules by tags like security, bug, or code smell.
    Enable or disable specific rules.

⚠️ You can also set severity levels (Info, Minor, Major, Critical, Blocker) when activating rules.

6. Set as Default (Optional)

To make this your default Java profile:

    Go back to the Java profiles list.
    Click the “star” icon next to your profile.

7. Assign a Quality Profile to a Specific Project (Optional)

If you want a specific project to use this profile:

    Go to Project Settings > Quality Profiles.
    Click “Java”, then select your custom profile from the list.

### ✅ Step 4: Using Sonar in the Maven Command

You can pass the token directly via the command line:

<pre>
mvn clean verify sonar:sonar -Dsonar.projectKey=simple-api-demo -Dsonar.host.url=http://localhost:3900[0-4] -Dsonar.login=sqa_912c6e493d5c9527a6c855e714de03ac41c82509
</pre>

Replace YOUR_TOKEN_HERE with your generated token.

## Sonar commands

- Example 1

<pre>
mvn clean verify sonar:sonar -Dsonar.projectKey=simple-api-demo -Dsonar.host.url=http://localhost:3900[0-4] -Dsonar.login=sqa_912c6e493d5c9527a6c855e714de03ac41c82509
</pre>

- Example 2

<pre>
mvn -V org.jacoco:jacoco-maven-plugin:prepare-agent test org.jacoco:jacoco-maven-plugin:report compile install org.sonarsource.scanner.maven:sonar-maven-plugin:3.5.0.1254:sonar -Dsonar.profile={Java-Profile-Sample} -Dsonar.log.level=INFO -Dbranch={PROJECT-BRANCH-GIT} -Dsonar.projectKey={PROJECT-KEY-NAME-IN-SONAR-DASHBOARD} -Dsonar.projectName={PROJECT-NAME-IN-SONAR-DASHBOARD} -Dsonar.host.url=http://localhost:3900[0-4] -Dsonar.login={LOGIN-TOKEN}

# Example1
mvn -V org.jacoco:jacoco-maven-plugin:prepare-agent test org.jacoco:jacoco-maven-plugin:report compile install org.sonarsource.scanner.maven:sonar-maven-plugin:3.5.0.1254:sonar 
-Dsonar.profile=HuntercodexsJava 
-Dsonar.log.level=INFO 
-Dbranch=pipeline-release 
-Dsonar.projectKey=simple-api-demo 
-Dsonar.projectName=simple-api-demo 
-Dsonar.host.url=http://localhost:3900[0-4] 
-Dsonar.login=sqa_912c6e493d5c9527a6c855e714de03ac41c82509

# Example2
mvn -V org.jacoco:jacoco-maven-plugin:prepare-agent test org.jacoco:jacoco-maven-plugin:report compile install org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar  
-Dsonar.profile=HuntercodexsJava  
-Dsonar.log.level=INFO  
-Dbranch=pipeline-release  
-Dsonar.projectKey=simple-api-demo  
-Dsonar.projectName=simple-api-demo  
-Dsonar.host.url=http://localhost:3900[0-4]  
-Dsonar.login=sqa_5654448d73d6552f6f36568e8f9ecd9dfb8868a2
</pre>

## Java Project Example

> Reference Project: https://github.com/huntercodexs/simple-api-demo

To use sonarqube ain java projects you can follow the steps bellow:

1. Configure sonar files exclusion, for example:

```xml
	<properties>
		<java.version>17</java.version>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
		<sonar-exclusions>
			src/main/java/com/huntercodexs/simpleapidemo/dto/QuickJsonDto.java,
			src/main/java/com/huntercodexs/simpleapidemo/SimpleApiDemoApplication.java
		</sonar-exclusions>

		<sonar.exclusions>${sonar-exclusions}</sonar.exclusions>
		<sonar.coverage.exclusions>${sonar-exclusions}</sonar.coverage.exclusions>
	</properties>
```

> Note: It is not required to use both of them (sonar.exclusions and sonar.coverage.exclusions) use just one if you prefer

2. Add sonar maven plugins, for example

```xml

			<!--sonar-maven-plugin-->
			<plugin>
				<groupId>org.sonarsource.scanner.maven</groupId>
				<artifactId>sonar-maven-plugin</artifactId>
				<version>3.7.0.1746</version>
			</plugin>
			<!--jacoco-maven-plugin - Sonarqube-->
			<plugin>
				<groupId>org.jacoco</groupId>
				<artifactId>jacoco-maven-plugin</artifactId>
				<version>0.8.10</version>
				<configuration>
					<!--Use this configuration to set witch files should be ignored in the sonar measures/metrics-->
					<!--<excludes>
						<exclude>${sonar-exclusions}</exclude>
					</excludes>-->
				</configuration>
			</plugin>
```

3. Run the MVN command, for example

> TIP: In this case you do not need to include the plugins mentioned above (sonar-maven-plugin and jacoco-maven-plugin)

```shell
mvn -V org.jacoco:jacoco-maven-plugin:prepare-agent test org.jacoco:jacoco-maven-plugin:report compile install org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar  
-Dsonar.profile=HuntercodexsJava  
-Dsonar.log.level=INFO  
-Dbranch=pipeline-release  
-Dsonar.projectKey=simple-api-demo  
-Dsonar.projectName=simple-api-demo  
-Dsonar.host.url=http://localhost:3900[0-4]  
-Dsonar.login=sqa_912c6e493d5c9527a6c855e714de03ac41c82509
```

or 

```shell
mvn clean verify sonar:sonar -Dsonar.projectKey=simple-api-demo -Dsonar.host.url=http://localhost:3900[0-4] -Dsonar.login=sqa_912c6e493d5c9527a6c855e714de03ac41c82509
```

## Troubleshooting

> For Linux

If any problem occurs, for example the error below

<pre>
sonarqube_1  | 
sonarqube_1  | ERROR: [1] bootstrap checks failed. You must address the points described in the following [1] lines before starting Elasticsearch.
sonarqube_1  | bootstrap check failure [1] of [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
sonarqube_1  | ERROR: Elasticsearch did not exit normally - check the logs at /opt/sonarqube/logs/sonarqube.log
sonarqube_1  | 2025.05.11 14:24:20 INFO  es[][o.e.n.Node] stopping ...
sonarqube_1  | 2025.05.11 14:24:20 INFO  es[][o.e.n.Node] stopped
sonarqube_1  | 2025.05.11 14:24:20 INFO  es[][o.e.n.Node] closing ...
sonarqube_1  | 2025.05.11 14:24:20 INFO  es[][o.e.n.Node] closed
sonarqube_1  | 2025.05.11 14:24:20 WARN  app[][o.s.a.p.AbstractManagedProcess] Process exited with exit value [ElasticSearch]: 78
sonarqube_1  | 2025.05.11 14:24:20 INFO  app[][o.s.a.SchedulerImpl] Process[ElasticSearch] is stopped
sonarqube_1  | 2025.05.11 14:24:20 INFO  app[][o.s.a.SchedulerImpl] SonarQube is stopped
sonar_sonarqube_1 exited with code 0
</pre>

you can try to run the commands below in order to fix it

<pre>
sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
</pre>

That's it !
