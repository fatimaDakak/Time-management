package models;


public class User {
    private String nom, prenom, email, mdp;
    private int id_user;
    private String role;

    

    public User() {}

    public User(String nom, String prenom, String email, String mdp) {
        this.nom = nom;
        this.prenom = prenom;  
        this.email = email;
        this.mdp = mdp;
       
    }

    public int getId() {
        return id_user;
    }

    public void setId(int i) {
        this.id_user = i;
    }
    
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
    public String getMdp() {
    	 return mdp;
    }

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}}