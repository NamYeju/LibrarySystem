package com.example.librarysystem;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
@Controller
public class MainController {

    @GetMapping(value="/")
    public String list(Model model) {

        return "main";
    }
}
