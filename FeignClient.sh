Esse problema ocorre geralmente porque o Spring não conseguiu encontrar ou instanciar o bean `OauthControllerClient` necessário para ser injetado no `UserService`. Aqui estão algumas etapas para resolver esse problema:

### 1. Verificar a Anotação do Cliente

Certifique-se de que a classe `OauthControllerClient` está anotada corretamente para que o Spring possa reconhecê-la. Se você estiver usando Feign para clientes REST, a classe deve ser anotada com `@FeignClient`.

Exemplo:
```java
@FeignClient(name = "oauth-service", url = "http://localhost:8080")
public interface OauthControllerClient {
    // métodos da API
}
```

### 2. Verificar o Pacote de Scans de Componentes

Certifique-se de que o pacote onde `OauthControllerClient` está localizado está incluído no componente scan do Spring Boot. Isso pode ser feito nas suas classes de configuração ou na classe principal da aplicação.

Exemplo:
```java
@SpringBootApplication(scanBasePackages = "com.example.hrusers")
public class HrUsersApplication {
    public static void main(String[] args) {
        SpringApplication.run(HrUsersApplication.class, args);
    }
}
```

Se `OauthControllerClient` estiver em um pacote diferente, você precisa incluí-lo no scan de componentes.

### 3. Verificar Configurações de Feign (se aplicável)

Se você estiver usando Feign, verifique se ele está habilitado no seu projeto Spring Boot.

Exemplo:
```java
@EnableFeignClients(basePackages = "com.example.hrusers.clients")
@SpringBootApplication
public class HrUsersApplication {
    public static void main(String[] args) {
        SpringApplication.run(HrUsersApplication.class, args);
    }
}
```

### 4. Verificar Dependências do Maven/Gradle

Certifique-se de que as dependências necessárias estão incluídas no seu `pom.xml` (para Maven) ou `build.gradle` (para Gradle).

Para Maven:
```xml
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-openfeign</artifactId>
</dependency>
```

Para Gradle:
```groovy
implementation 'org.springframework.cloud:spring-cloud-starter-openfeign'
```

### 5. Verificar o Uso Correto de Anotações no Serviço

Certifique-se de que a injeção de dependência está correta no `UserService`.

Exemplo:
```java
@Service
public class UserService {

    private final OauthControllerClient oauthControllerClient;

    @Autowired
    public UserService(OauthControllerClient oauthControllerClient) {
        this.oauthControllerClient = oauthControllerClient;
    }

    // outros métodos
}
```

### 6. Verificar Mensagens de Erro Detalhadas

Às vezes, as mensagens de erro detalhadas podem fornecer mais informações sobre por que o bean não está sendo encontrado. Verifique os logs para qualquer detalhe adicional.

### Exemplo Completo

Aqui está um exemplo completo considerando todas as verificações acima:

**Classe do Cliente Feign:**
```java
package com.example.hrusers.clients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "oauth-service", url = "http://localhost:8080")
public interface OauthControllerClient {
    @GetMapping("/oauth/check_token")
    String checkToken();
}
```

**Classe Principal da Aplicação:**
```java
package com.example.hrusers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients(basePackages = "com.example.hrusers.clients")
public class HrUsersApplication {
    public static void main(String[] args) {
        SpringApplication.run(HrUsersApplication.class, args);
    }
}
```

**Classe de Serviço:**
```java
package com.example.hrusers.services;

import com.example.hrusers.clients.OauthControllerClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final OauthControllerClient oauthControllerClient;

    @Autowired
    public UserService(OauthControllerClient oauthControllerClient) {
        this.oauthControllerClient = oauthControllerClient;
    }

    // outros métodos
}
```

Seguindo esses passos, você deve ser capaz de resolver o problema de injeção de dependência do `OauthControllerClient` no seu serviço.
