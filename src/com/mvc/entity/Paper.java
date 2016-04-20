package com.mvc.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "paper")
public class Paper implements Serializable {
	private static final long serialVersionUID = 4658086147762105507L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pa_id", nullable = false)
	private Integer paId;
	
	@Column(name = "pa_year")
	private String paYear;
	
	@Column(name = "pa_auther")
	private String paAuther;
	
	@Column(name = "pa_origin")
	private String paOrigin;
	
	@Column(name = "re_id")
	private Integer reId;
	
	@Column(name = "material_name")
	private String materialName;
	
	@Column(name = "material_address")
	private String materialAddress;
	
	@Column(name = "material_uptime")
	private String materialUptime;

	public Integer getPaId() {
		return paId;
	}

	public void setPaId(Integer paId) {
		this.paId = paId;
	}

	public String getPaYear() {
		return paYear;
	}

	public void setPaYear(String paYear) {
		this.paYear = paYear;
	}

	public String getPaAuther() {
		return paAuther;
	}

	public void setPaAuther(String paAuther) {
		this.paAuther = paAuther;
	}

	public String getPaOrigin() {
		return paOrigin;
	}

	public void setPaOrigin(String paOrigin) {
		this.paOrigin = paOrigin;
	}

	public Integer getReId() {
		return reId;
	}

	public void setReId(Integer reId) {
		this.reId = reId;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getMaterialAddress() {
		return materialAddress;
	}

	public void setMaterialAddress(String materialAddress) {
		this.materialAddress = materialAddress;
	}

	public String getMaterialUptime() {
		return materialUptime;
	}

	public void setMaterialUptime(String materialUptime) {
		this.materialUptime = materialUptime;
	}

	
}

