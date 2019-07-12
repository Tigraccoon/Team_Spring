package com.sky.springteam.controller.board;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sky.springteam.service.board.CommentService;

@RestController
@RequestMapping("comment/*")
public class CommentController {

	@Inject
	CommentService commentService;
	
}
