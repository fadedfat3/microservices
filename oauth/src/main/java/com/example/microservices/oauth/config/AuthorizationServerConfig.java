package com.example.microservices.oauth.config;

import com.example.microservices.oauth.service.impl.CustomUserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

import javax.sql.DataSource;

@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {

    @Autowired
    AuthenticationManager authenticationManager;

    // 该对象用来将令牌信息存储到内存中
//    @Autowired
//    CustomInMemoryTokenStore inMemoryTokenStore;

    // 该对象将为刷新token提供支持
    @Autowired
    CustomUserDetailsServiceImpl userDetailsService;

    @Autowired
    PasswordEncoder passwordEncoder;


    //@Qualifier("dataSource")
    @Autowired
    DataSource dataSource;

    //@Qualifier("redis")
    @Autowired
    TokenStore redisTokenStore;

    // 指定密码的加密方式
//    @Bean
//    PasswordEncoder passwordEncoder() {
//        // 使用BCrypt强哈希函数加密方案（密钥迭代次数默认为10）
//        return new BCryptPasswordEncoder();
//    }

    // 配置 password 授权模式
    @Override
    public void configure(ClientDetailsServiceConfigurer clients)
            throws Exception {
//        ClientDetailsServiceBuilder builder = new ClientDetailsServiceBuilder();
//        builder.inMemory().withClient(clientConfig.getId()).secret(clientConfig.getSecret())
//                .scopes(clientConfig.getScope()).accessTokenValiditySeconds(clientConfig.getValidateSecond())
//                .authorizedGrantTypes(clientConfig.getGrantTypes()).resourceIds(clientConfig.getResourceId());
//        //builder.clients(clients);
//        clients.inMemory()
//                .withClient("password")
//                .authorizedGrantTypes("password", "refresh_token") //授权模式为password和refresh_token两种
//                .accessTokenValiditySeconds(1800) // 配置access_token的过期时间
//                .resourceIds("rid") //配置资源id
//                .scopes("all")
//                .secret(passwordEncoder.encode("wangu123!@#")); //加密后的密码
        clients.jdbc(dataSource);
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints.tokenStore(redisTokenStore) //配置令牌的存储（这里存放在内存中）
                .authenticationManager(authenticationManager)
                .userDetailsService(userDetailsService);
    }

    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) {
        // 表示支持 client_id 和 client_secret 做登录认证
        security.allowFormAuthenticationForClients();
        security.checkTokenAccess("isAuthenticated()");
        security.tokenKeyAccess("isAuthenticated()");
    }
}
