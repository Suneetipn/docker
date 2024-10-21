package kgisl.com.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/messages")
@RestController
public class DockerMessageController {
    @GetMapping
    public String getMessage() {
        return "Hello from Docker!";
    }
}