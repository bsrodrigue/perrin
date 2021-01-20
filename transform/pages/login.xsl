<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- this page is used when the user clicks the Login button. If they have been directed to Login by trying to access a restricted page when they are not already logged in, then they will go to the Login section of authen.xsl -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:util="xalan://org.greenstone.gsdl3.util.XSLTUtil"
	xmlns:gslib="http://www.greenstone.org/skinning" extension-element-prefixes="java util" exclude-result-prefixes="java util">

	<!-- use the 'main' layout -->
	<xsl:include href="layouts/main.xsl"/>

	<!-- set page title -->
	<xsl:template name="pageTitle">
		<xsl:value-of select="util:getInterfaceText($interface_name, /page/@lang, 'login_b')"/>
	</xsl:template>

	<!-- set page breadcrumbs -->
	<xsl:template name="breadcrumbs">
		<gslib:siteLink/>
	</xsl:template>

	<!-- the page content -->
	<xsl:template match="/page">
		<xsl:if test="/page/pageRequest/paramList/param[@name = 'loginMessage']/@value">
			<div id="gs_error" class="ui-state-error ui-corner-all">
				<span class="ui-icon ui-icon-alert" style="float: left;">
					<xsl:text></xsl:text>
				</span>
				<xsl:value-of select="/page/pageRequest/paramList/param[@name = 'loginMessage']/@value"/>
			</div>
			<br/>
		</xsl:if>

		<div style="display:grid; place-items:center;" class="container">
			<form class="login-form card" method="POST" action="{/page/pageRequest/paramList/param[@name = 'redirectURL']/@value}">
				<h1>Connexion</h1>
				<label class="form-label" for="username">
					<xsl:value-of select="util:getInterfaceText($interface_name, /page/@lang, 'authen.username')"/>
				</label>
				<input class="form-control" type="text" name="username"/>
				<label class="form-label" for="password">
					<xsl:value-of select="util:getInterfaceText($interface_name, /page/@lang, 'authen.password')"/>
				</label>
				<input class="form-control" type="password" name="password"/>
				<input  class="form-submit" type="submit">
					<xsl:attribute name="value">
						<xsl:value-of select="util:getInterfaceText($interface_name, /page/@lang, 'login_b')"/>
					</xsl:attribute>
				</input>
			</form>
		</div>

		<script type="text/javascript">
			<xsl:text disable-output-escaping="yes">
			{
				$("#loginTable input[name=\"username\"]").focus();
			}
			</xsl:text>
		</script>
	</xsl:template>
</xsl:stylesheet>
