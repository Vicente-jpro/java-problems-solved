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
    
    <li><a href="#6"> Create a jar or warm using maving</a></li>
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

./mvnw clean package -DskipTests
```
<pre>Execute file .jar created</pre>

```bach
java -jar ./target/project-name.jar 
```
</div>

<pre>
bash: ./mvnw: Permissão negada
</pre>
```bach
chmod +x mvnw
```





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

### Change java compile version in VS CODE
First you have to access the file `settings.json` then add this `JSON` code in the file `settings.json`. 
Change and put the vertion you want.
```json
{
    "java.debug.settings.onBuildFailureProceed": true,
    "java.compile.nullAnalysis.mode": "automatic",
    "java.configuration.runtimes": [
        {
          "name": "JavaSE-1.8",
          "path": "/usr/lib/jvm/java-8-openjdk-amd64",
          "sources" : "/usr/lib/jvm/java-8-openjdk-amd64/src.zip",
          "javadoc" : "https://docs.oracle.com/javase/8/docs/api",
          "default":  true
         },
         
      ]
}

```

### Run Spring Boot application in terminal using maven.
Go into the `your-project-folder/` then run the command:
```bash
./mvnw spring-boot:run
```

### Create a .jar file in Spring Boot application in terminal using maven.
Go into the `your-project-folder/` then run the command:
```bash
./mvnw clean package
```

### Run a .jar file Spring Boot application in terminal using maven.
After created a .jar file in Spring Boot application in terminal using maven. <br/>
Go into the `your-project-folder/target/` then run the command:
```bash
java -jar project-name.jar 
```


When naming tests in Java using Mockito (or any testing framework), it is essential to follow clear, consistent, and descriptive conventions. This helps in understanding the purpose of the test, what is being mocked, and the expected outcome. Here are some best practices for naming tests that use Mockito:

### 1. **Test Method Naming Convention**
The most commonly used convention is:

`<MethodBeingTested>_<ConditionUnderTest>_<ExpectedBehavior>`

- **MethodBeingTested**: The name of the method you're testing.
- **ConditionUnderTest**: The scenario or condition you're testing for (e.g., specific input, state).
- **ExpectedBehavior**: The behavior or outcome you expect from the method.

### 2. **Example Test Names**

Here are some examples to clarify this naming convention:

#### Example 1: Testing a Service Method with a Mocked Dependency
Assume you have a `UserService` class that depends on a `UserRepository`. You want to test the `getUserById()` method of `UserService`, which returns a user by their ID.

```java
@Test
void getUserById_userExists_returnsUser() {
    // Test code here
}
```
- **MethodBeingTested**: `getUserById`
- **ConditionUnderTest**: `userExists`
- **ExpectedBehavior**: `returnsUser`

#### Example 2: Testing a Service Method with a Mocked Dependency for an Exception
Assume the `UserService`'s `getUserById()` method throws an exception if the user is not found.

```java
@Test
void getUserById_userNotFound_throwsUserNotFoundException() {
    // Test code here
}
```
- **MethodBeingTested**: `getUserById`
- **ConditionUnderTest**: `userNotFound`
- **ExpectedBehavior**: `throwsUserNotFoundException`

#### Example 3: Testing with a Mocked Return Value
Imagine a `ProductService` that interacts with a `ProductRepository`, and you want to test if the `getProduct()` method returns a mocked product.

```java
@Test
void getProduct_productIdExists_returnsMockedProduct() {
    // Test code here
}
```
- **MethodBeingTested**: `getProduct`
- **ConditionUnderTest**: `productIdExists`
- **ExpectedBehavior**: `returnsMockedProduct`

### 3. **Mockito-Specific Test Naming**

When using Mockito to mock dependencies, you can specify the expected behavior in the mock and then name the test accordingly:

#### Example 4: Mocking a Method Call and Verifying Behavior
Let's say you are testing a `PaymentService` that uses a `PaymentGateway` mock to simulate a successful payment:

```java
@Test
void processPayment_paymentSuccessful_returnsConfirmation() {
    // Arrange: Set up mock behavior
    when(paymentGateway.process(any(Payment.class))).thenReturn(true);

    // Act: Call the method under test
    boolean result = paymentService.processPayment(new Payment());

    // Assert: Verify result
    assertTrue(result);
}
```
- **MethodBeingTested**: `processPayment`
- **ConditionUnderTest**: `paymentSuccessful`
- **ExpectedBehavior**: `returnsConfirmation`

#### Example 5: Verifying Interactions with a Mock
Suppose you have a method that updates a user's profile, and you're verifying that the `saveUserProfile` method is called.

```java
@Test
void updateUserProfile_userProfileUpdated_callsSaveUserProfile() {
    // Arrange: Set up mock behavior
    User user = new User();
    when(userRepository.save(any(User.class))).thenReturn(user);

    // Act: Call the method under test
    userService.updateUserProfile(user);

    // Assert: Verify interactions
    verify(userRepository, times(1)).save(user);
}
```
- **MethodBeingTested**: `updateUserProfile`
- **ConditionUnderTest**: `userProfileUpdated`
- **ExpectedBehavior**: `callsSaveUserProfile`

### 4. **Edge Cases & Negative Tests**

It's also useful to name tests for edge cases or negative scenarios clearly.

#### Example 6: Testing Invalid Input
If your method should throw an exception when given invalid input, name it accordingly:

```java
@Test
void registerUser_invalidEmail_throwsInvalidEmailException() {
    // Test code here
}
```
- **MethodBeingTested**: `registerUser`
- **ConditionUnderTest**: `invalidEmail`
- **ExpectedBehavior**: `throwsInvalidEmailException`

### 5. **Other Useful Naming Patterns**
Here are additional naming patterns based on different test conditions:

- **When <something> happens, <expect something>**
  - `whenUserExists_returnsUserDetails()`
  - `whenPaymentFails_throwsPaymentFailedException()`
- **<MethodBeingTested>_<ExpectedOutcome>**
  - `getUserById_returnsUserNotFoundException()`
  - `addProductToCart_productIsAddedSuccessfully()`

### Conclusion
Naming your tests with clear, descriptive, and consistent names makes it easier to understand the test's purpose, especially when using mocking frameworks like Mockito. Follow these naming conventions to improve readability, maintainability, and clarity of your unit tests.

    
    <li>
        <a href="https://github.com/cxxr/better-java">
            Better java code
        </a>
    </li>

