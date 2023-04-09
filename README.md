<ol>
    <li> 
        <a href="#1">
        The src/resources/application.yml file, and how to fix 'Could not resolve placeholder ${salt}' type errors
        </a>
    </li>
    <li>
        <a href="#2">
            Address already in use: JVM_Bind" error?
        </a>
    </li>
    <li>
        <a href="https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu">
            How to Install Maven on Linux (Ubuntu)
        </a>
    </li>
    <li>
        <a href="https://github.com/Vicente-jpro/java-problems-solved/blob/main/application.properties">
            Database connection
        </a>
    </li>
    <li>
        <a href="#5"> Hibernate Error executing DDL via JDBC Statement</a>
    </li>
    <li><a href="#6"> Create a jar or warm using maving</a></li>
        <li>
            <a href="#7"> Field authenticationManager in com.example.configurations.AuthorizationServerConfig required a bean of type '       org.springframework.security.authentication.AuthenticationManager' that could not be found..</a>
    </li>
    
    <li><a href="#8">
    Field passwordEncoder in com.example.services.UsuarioService required a bean of type 
    'org.springframework.security.crypto.password.PasswordEncoder' that could not be found.</a></li>
    
 
 
</ol>



<a href="https://jdk.java.net/archive/">Download JDK here.</a>

### The src/resources/application.yml file, and how to fix 'Could not resolve placeholder ${salt}' type errors

<div id="1">

```java
 @Value("${salt}")
  private String salt;
```

```xml
    <dependency>
        <groupId>org.yaml</groupId>
        <artifactId>snakeyaml</artifactId>
    </dependency>
```
</div>

###  Address already in use: JVM_Bind" error?
 https://stackoverflow.com/questions/12737293/how-do-i-resolve-the-java-net-bindexception-address-already-in-use-jvm-bind
<div id="2">
    <pre>
        If you know what port the process is running you can type: lsof -i:port.
        For instance, lsof -i:8080, to list the process (pid) running on port 8080.
        Then kill the process with kill pid
    </pre>
</div>
 
<div id="4">

    <a href="https://stackoverflow.com/questions/43191294/hibernate-error-executing-ddl-via-jdbc-statement"> Hibernate Error executing DDL via JDBC Statement </a>
Adding this configuration in application.properties file to fixed this issue easily.
<pre> spring.jpa.properties.hibernate.globally_quoted_identifiers=true </pre>
</div>


<div id="5">

</div>

<pre>
ERROR TYPE
Description:

The dependencies of some of the beans in the application context form a cycle:

┌─────┐
|  securityConfiguration (field private com.prity.springbootdemo1.service.UserService com.prity.springbootdemo1.config.SecurityConfiguration.userService)
↑     ↓
|  userServiceImpl (field private org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder com.prity.springbootdemo1.service.UserServiceImpl.passwordEncoder)
└─────┘


Action:

Relying upon circular references is discouraged and they are prohibited by default. Update your application to remove the dependency cycle between beans. As a last resort, it may be possible to break the cycle automatically by setting spring.main.allow-circular-references to true.


SOLUTION:

https://stackoverflow.com/questions/71867218/relying-upon-circular-reference-is-discouraged-and-they-are-prohibited-by-defaul
Add it to file application.properties

spring.main.allow-circular-references=true
</pre>

<div id="6">
First go into to your /project-folder
Them run de commands in your terminal

<pre>
Clean package and create a .jar file
</pre>
```bach

./mvnw clean package 
```
<pre>Execute file .jar created</pre>

```bach
java -jar ./target/project-name.jar 
```
</div>







### Field authenticationManager in com.example.configurations.AuthorizationServerConfig required a bean of type 'org.springframework.security.authentication.AuthenticationManager' that could not be found.

<div id="7">

 ```java

@SuppressWarnings("deprecation")
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    // ADD this method to your code
    @Bean
    @Override
    public AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

}
 
 ```
 
    
```bash

***************************
APPLICATION FAILED TO START
***************************

Description:

Field authenticationManager in com.example.configurations.AuthorizationServerConfig required a bean of type 'org.springframework.security.authentication.AuthenticationManager' that could not be found.

The injection point has the following annotations:
        - @org.springframework.beans.factory.annotation.Autowired(required=true)


Action:

Consider defining a bean of type 'org.springframework.security.authentication.AuthenticationManager' in your configuration.

```
</div>






### Field passwordEncoder in com.example.services.UsuarioService required a bean of type 'org.springframework.security.crypto.password.PasswordEncoder' that could not be found.

<div id="8">

 ```java

@SuppressWarnings("deprecation")
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    // ADD this method to your code
    @Bean
    @Override
    public AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

}
 
 ```
 
    
```bash

***************************
APPLICATION FAILED TO START
***************************

Description:

Field passwordEncoder in com.example.services.UsuarioService required a bean of type 'org.springframework.security.crypto.password.PasswordEncoder' that could not be found.

The injection point has the following annotations:
        - @org.springframework.beans.factory.annotation.Autowired(required=true)


Action:

Consider defining a bean of type 'org.springframework.security.crypto.password.PasswordEncoder' in your configuration.

```
</div>


