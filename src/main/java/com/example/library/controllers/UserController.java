package com.example.library.controllers;

import com.example.library.models.User;
import com.example.library.repositories.UserRepository;
import com.example.library.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    @GetMapping("/login")
    public String login(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }
    @GetMapping("/registration")
    public String registration(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }
    @PostMapping("/registration")
    public String createUser(User user, Model model){
        if (!userService.createUser(user)){
            model.addAttribute("errorMessage","Пользователь с email: " + user.getEmail() + " уже существует!");
            return "registration";
        }
        return "redirect:/login";
    }

}
