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
@Table(name = "new_technology")
public class NewTech implements Serializable {
	private static final long serialVersionUID = 4658086147762104379L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ne_id", nullable = false)
	private Integer neId;
	
	@Column(name = "ne_reference")
	private String neReference;
	
	@Column(name = "re_id")
	private Integer reId;
	
	@Column(name = "material_name")
	private String materialName;
	
	@Column(name = "material_address")
	private String materialAddress;
	
	@Column(name = "material_uptime")
	private String materialUptime;

	public Integer getNeId() {
		return neId;
	}

	public void setNeId(Integer neId) {
		this.neId = neId;
	}

	public String getNeReference() {
		return neReference;
	}

	public void setNeReference(String neReference) {
		this.neReference = neReference;
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

