package com.tj.profinder.model;

public class AdminMenu {
	private String menu_name;
	private String menu_url;
	private int submenu;
	public AdminMenu() {
		super();
	}
	public AdminMenu(String menu_name, String menu_url, int submenu) {
		super();
		this.menu_name = menu_name;
		this.menu_url = menu_url;
		this.submenu = submenu;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public int getSubmenu() {
		return submenu;
	}
	public void setSubmenu(int submenu) {
		this.submenu = submenu;
	}
	
}
