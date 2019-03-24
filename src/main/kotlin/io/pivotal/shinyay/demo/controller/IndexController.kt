package io.pivotal.shinyay.demo.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import java.time.LocalDateTime

@Controller
@RequestMapping("/")
class IndexController {

    @GetMapping
    fun index(model: Model): String {
        model.addAttribute("hello", "Hello World with WebJar")
        model.addAttribute("dateTime", LocalDateTime.now())
        return "index"
    }
}