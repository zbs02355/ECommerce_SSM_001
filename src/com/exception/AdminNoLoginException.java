package com.exception;

public class AdminNoLoginException extends Exception{
	private static final long serialVersionUID = 1L;
	public AdminNoLoginException(String message) {
		super(message);
	}
}
