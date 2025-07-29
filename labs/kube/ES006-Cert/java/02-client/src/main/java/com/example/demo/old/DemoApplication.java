// package com.example.demo;

// import java.io.FileInputStream;
// import java.security.KeyStore;
// import java.security.SecureRandom;
// import java.security.cert.CertificateFactory;

// import javax.net.ssl.HttpsURLConnection;
// import javax.net.ssl.SSLContext;
// import javax.net.ssl.TrustManagerFactory;

// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.boot.CommandLineRunner;
// import org.springframework.boot.SpringApplication;
// import org.springframework.boot.autoconfigure.SpringBootApplication;
// import org.springframework.context.annotation.Bean;
// import org.springframework.http.client.SimpleClientHttpRequestFactory;
// import org.springframework.web.client.RestTemplate;

// @SpringBootApplication
// public class DemoApplication implements CommandLineRunner {

// 	public static void main(String[] args) {
// 		SpringApplication.run(DemoApplication.class, args);
// 	}

//     @Value("${api.url}")
//     private String apiUrl;

//     @Value("${custom.ssl.cert.path}")
//     private String certPath;


// 	@Override
//     public void run(String... args) throws Exception {
//         RestTemplate restTemplate = new RestTemplate();
// 		while (true) {
//             try {
//                 // String response = restTemplate.getForObject("https://api-service.default.svc.cluster.local:8443/hello", String.class);
//                 System.out.println("API Call      : " + apiUrl);
//                 System.out.println("API certPath  : " + certPath);
                
//                 String response = restTemplate.getForObject(apiUrl, String.class);
//                 System.out.println("API responded : " + response);
//                 Thread.sleep(3000);
//             } catch (Exception ex) {
//                 System.out.println("Errore: ");
//                 System.err.println("Error during HTTPS request: " + ex.getMessage());
//                 //ex.printStackTrace();
//             }
// 		}
//     }

// 	@Bean
//     public RestTemplate restTemplate() throws Exception {
//         // Percorso del certificato CA montato via Secret
//         String caCertPath = certPath; //"/certs/ca.crt";

//         // Carica il keystore di trust con il certificato CA
//         KeyStore trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
//         trustStore.load(null, null);

//         try (FileInputStream fis = new FileInputStream(caCertPath)) {
//             CertificateFactory cf = CertificateFactory.getInstance("X.509");
//             java.security.cert.Certificate caCert = cf.generateCertificate(fis);
//             trustStore.setCertificateEntry("ca", caCert);
//         }

//         // Inizializza TrustManager con il trustStore
//         TrustManagerFactory tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
//         tmf.init(trustStore);

//         SSLContext sslContext = SSLContext.getInstance("TLS");
//         sslContext.init(null, tmf.getTrustManagers(), new SecureRandom());

//         HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());

//         var requestFactory = new SimpleClientHttpRequestFactory();
//         return new RestTemplate(requestFactory);
//     }

// }
