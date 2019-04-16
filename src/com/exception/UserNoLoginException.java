package com.exception;

public class UserNoLoginException extends Exception{
	private static final long serialVersionUID = 1L;
	public UserNoLoginException(String message) {
		super(message);
	}
}
