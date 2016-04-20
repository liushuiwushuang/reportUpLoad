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
@Table(name = "report")
public class Report implements Serializable {
	private static final long serialVersionUID = 4658086142506107798L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "re_id", nullable = false)
	private Integer reId;
	
	@Column(name = "re_title" )
	private String reTitle;
	
	@Column(name = "re_abstract" )
	private String reAbstract;
	
	@Column(name = "re_man" )
	private String reMan;
	
	@Column(name = "re_time" )
	private String reTime;
	
	@Column(name = "related_materials" )
	private String relatedMaterials;
	
	@Column(name = "re_type")
	private String reType;

	public Integer getReId() {
		return reId;
	}

	public void setReId(Integer reId) {
		this.reId = reId;
	}

	public String getReTitle() {
		return reTitle;
	}

	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}

	public String getReAbstract() {
		return reAbstract;
	}

	public void setReAbstract(String reAbstract) {
		this.reAbstract = reAbstract;
	}

	public String getReMan() {
		return reMan;
	}

	public void setReMan(String reMan) {
		this.reMan = reMan;
	}

	public String getReTime() {
		return reTime;
	}

	public void setReTime(String reTime) {
		this.reTime = reTime;
	}

	public String getRelatedMaterials() {
		return relatedMaterials;
	}

	public void setRelatedMaterials(String relatedMaterials) {
		this.relatedMaterials = relatedMaterials;
	}

	public String getReType() {
		return reType;
	}

	public void setReType(String reType) {
		this.reType = reType;
	}

	
}
