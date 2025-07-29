// package com.example.demo;

// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.scheduling.annotation.Scheduled;
// import org.springframework.stereotype.Component;
// import org.springframework.web.client.RestTemplate;
// import org.springframework.http.client.ClientHttpRequestFactory;
// import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
// import org.apache.http.impl.client.HttpClientBuilder;
// import org.apache.http.conn.ssl.NoopHostnameVerifier;
// import org.apache.http.ssl.SSLContextBuilder;
// import org.apache.http.conn.ssl.TrustSelfSignedStrategy;

// import javax.net.ssl.SSLContext;
// import java.io.FileInputStream;
// import java.security.KeyStore;

// @Component
// public class RestClient {

//     private final RestTemplate restTemplate;

//     @Value("${api.url}")
//     private String apiUrl;

//     public RestClient() throws Exception {
//         // Configurazione per accettare certificati self-signed o emessi da un'autorità sconosciuta al keystore di default
//         // In un ambiente di produzione, si dovrebbe importare il certificato del CA root nel truststore del client.
//         SSLContext sslContext = SSLContextBuilder
//                 .create()
//                 .loadTrustMaterial(null, new TrustSelfSignedStrategy()) // O una strategia più specifica per il tuo CA
//                 .build();

//         // Bypass del hostname verification per test interni (non raccomandato per produzione)
//         HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
//         requestFactory.setHttpClient(HttpClientBuilder.create()
//                 .setSSLContext(sslContext)
//                 .setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE) // Disabilita la verifica del hostname
//                 .build());

//         this.restTemplate = new RestTemplate(requestFactory);
//     }

//     @Scheduled(fixedRate = 3000) // Chiama ogni 3 secondi
//     public void callApi() {
//         try {
//             String response = restTemplate.getForObject(apiUrl, String.class);
//             System.out.println("Client received: " + response);
//         } catch (Exception e) {
//             System.err.println("Error calling API: " + e.getMessage());
//         }
//     }
// }