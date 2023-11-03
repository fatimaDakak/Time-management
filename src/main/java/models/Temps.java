package models;

import java.sql.Time;


import java.util.Date;

public class Temps {
	
	private int id;
	private int id_employé ;
	private Date date_j;
	private Time heure_debut;
	private Time heure_fin;
	private Time pause_debut;
	private Time pause_fin;
	private int week;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_employé() {
		return id_employé;
	}
	public void setId_employé(int id_employé) {
		this.id_employé = id_employé;
	}
	public Date getDate_j() {
		return date_j;
	}
	public void setDate_j(Date date_j) {
		this.date_j = date_j;
	}
	public Time getHeure_debut() {
		return heure_debut;
	}
	public void setHeure_debut(Time heure_debut) {
		this.heure_debut = heure_debut;
	}
	public Time getHeure_fin() {
		return heure_fin;
	}
	public void setHeure_fin(Time heure_fin) {
		this.heure_fin = heure_fin;
	}
	public Time getPause_debut() {
		return pause_debut;
	}
	public void setPause_debut(Time pause_debut) {
		this.pause_debut = pause_debut;
	}
	public Time getPause_fin() {
		return pause_fin;
	}
	public void setPause_fin(Time fin_debut) {
		this.pause_fin = fin_debut;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	

	
	
	

}
