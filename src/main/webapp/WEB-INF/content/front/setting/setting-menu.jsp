<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<div class="panel panel-default">
	  <div class="panel-heading">
	    <h3 class="panel-title">Personal settings</h3>
	  </div>
	  <div class="list-group" >
		<a href="${root}/setting/profile" class="list-group-item <c:if test="${type eq 'profile'}">selected</c:if>">Profile</a>
		<a href="${root}/setting/account" class="list-group-item <c:if test="${type eq 'account'}">selected</c:if>">Account</a>
		<a href="${root}/setting/about" class="list-group-item <c:if test="${type eq 'about'}">selected</c:if>">About</a>
		<a href="${root}/setting/menu" class="list-group-item <c:if test="${type eq 'menu'}">selected</c:if>">Menu</a>
	</div>
</div>