package com.lec.sts15_jdbc.board.command;

import org.springframework.ui.Model;

public interface BCommand {
	void execute(Model model);
}
