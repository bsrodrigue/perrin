<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:util="xalan://org.greenstone.gsdl3.util.XSLTUtil"
	xmlns:gslib="http://www.greenstone.org/skinning"
	xmlns:gsf="http://www.greenstone.org/greenstone3/schema/ConfigFormat"
	xmlns:lxslt="http://xml.apache.org/xslt"
	xmlns:result="http://www.example.com/s"
	xmlns:exsl="http://exslt.org/common" extension-element-prefixes="java util  exsl" exclude-result-prefixes="util java util">


	<!-- The main layout is defined here -->
	<xsl:template name="mainTemplate">
		<html>
			<head>
				<!-- ***** in header.xsl ***** -->
				<xsl:call-template name="create-html-header"/>
			</head>
			<body id="top">

			<!-- Upper Header -->
				<header class="upper-header">
					<div class="container">
						<div class="header-bar">
						<!-- Logo -->
						<xsl:call-template name="burkinaFlag"/>

		
								<a class="header-brand  upper-header-brand" href="{$library_name}">
								<h1 style="" class="header-brand-h1 upper-header-brand-h1">Base de données opérationnelle du <span style="color:f60000;">HCRUN</span></h1>
								<p>Haut Conseil pour la Réconciliation et l'Unité Nationale</p>
								<!-- <xsl:call-template name="siteName"/> -->
							</a>
							<xsl:call-template name="hcrunLogo"/>
					
						</div>
					</div>
				</header>

				<!-- Header -->
				<header>
					<div class="container">
						<div class="header-bar">
							<xsl:choose>
								<xsl:when test="page/pageRequest/@subaction='home'">
									<xsl:call-template name="crossCollSearch"/>
								</xsl:when>
								<xsl:when test="page/pageRequest/paramList/param/@name='c' and /page/pageResponse/collection[@name=$collNameChecked]/serviceList/service[@name='TextQuery']">
									<xsl:call-template name="CollectionSearch"/>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<nav class="header-navbar">
								<a class="header-navbar-link" href="{$library_name}/collection/{$collNameChecked}/page/pref">Préférences</a>
								<a class="header-navbar-link" href="{$library_name}/collection/{$collNameChecked}/page/help">Aide</a>
								<xsl:call-template name="loginLinks"/>
							</nav>
						</div>
					</div>
				</header>


				<!-- Subheader -->
				<div class="subheader">
					<div class="container">
						<nav class="subheader-navbar">
							<a class="subheader-navbar-link" href="{$library_name}">
							Base de données opérationnelle du HCRUN
								<!-- <xsl:call-template name="siteName"/> -->
							</a>
						</nav>
					</div>
				</div>


				<!--IF Collection Title -->
				<xsl:if test="page/pageResponse/collection">
					<section id="skills" class="skills">
						<div class="section-header">
							<div style="margin:20px 0px;">
								<a class="section-header-title" href="{$library_name}/collection/{$collNameChecked}/page/about">
									<xsl:value-of select="page/pageResponse/collection/displayItemList/displayItem[@name='name']"/>
								</a>
							</div>
						</div>
					</section>
				</xsl:if>

				<div class="gs-content">

					<div class="gs-real-content" id="gs_content">
						
					<xsl:apply-templates select="/page"/>
					</div>

					<!-- Navigation Bar -->
					<div class="gs-navbar container">
						<ul>
							<xsl:call-template name="navBar"/>
						</ul>
			
					</div>

				</div>

				<xsl:call-template name="gs_footer"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="burkinaFlag">
		<xsl:variable name="burkinaFlag">
			interfaces/<xsl:value-of select="$interface_name"/>/images/bf-flag.jpg
	</xsl:variable>
	<img class="burkinaFlag" src="{$burkinaFlag}" alt="" srcset=""/>
	</xsl:template>


	<xsl:template name="horinfoLogo">
		<xsl:variable name="horinfoLogo">
			interfaces/<xsl:value-of select="$interface_name"/>/images/horinfo.png
	</xsl:variable>
	<img class="horinfoLogo" src="{$horinfoLogo}" alt="" srcset=""/>
	</xsl:template>


	<xsl:template name="hcrunLogo">
		<xsl:variable name="hcrunLogo">
			interfaces/<xsl:value-of select="$interface_name"/>/images/hcrun.jpg
	</xsl:variable>
	<img class="hcrunLogo" src="{$hcrunLogo}" alt="" srcset=""/>
	</xsl:template>


	<!-- Template controlling the footer. -->
	<xsl:template name="gs_footer">
		<!-- Footer -->
		<footer>
			<div class="container">
				<!-- <div class="footer-section">
					<p style="font-weight: bold;margin: 20px 0px;">HORINFO Solutions Informatiques</p>
				</div>
				<hr style="margin-top: 0px;"/>
				
				<div class="footer-section">
					<xsl:call-template name="horinfoLogo"/>
				</div> -->
				<!-- <div class="footer-section">
                
                <div class="footer-link-stacks">
                    
                    <div class="footer-link-stack">
                        <p class="footer-link-stack-title">Entreprise</p>
                        <ul class="footer-links">
                            <li class="footer-link"><a href="">Qui sommes-nous?</a></li>
                        </ul>
                    </div>

                    
                    <div class="footer-link-stack">
                        <p class="footer-link-stack-title">Ressources</p>
                        <ul class="footer-links">
                            <li class="footer-link"><a href="">Guide de débutant</a></li>
                            <li class="footer-link"><a href="">Comment réussir en tant que Freelance?</a></li>
                            <li class="footer-link"><a href="">Paiement par Orange Money</a></li>
                        </ul>
                    </div>

                    
                    <div class="footer-link-stack">
                        <p class="footer-link-stack-title">Afrique de l'Ouest</p>
                        <ul class="footer-links">
                            <li class="footer-link"><a href="">Burkina Faso</a></li>
                            <li class="footer-link"><a href="">Sénégal</a></li>
                            <li class="footer-link"><a href="">Côte d'Ivoire</a></li>
                            <li class="footer-link"><a href="">Mali</a></li>
                            <li class="footer-link"><a href="">Togo</a></li>
                        </ul>
                    </div>
                </div>
            </div> -->
				<!-- <hr/> -->
				<div class="footer-section">
					<small style="color:white; margin:15px 0px;">2021-HCRUN avec l’appui du PNUD – Développée à partir de la solution Open Source Greenstone</small>
				</div>
			</div>
		</footer>
	</xsl:template>


	<xsl:template name="navBar">

		<xsl:choose>
			<xsl:when test="page/pageResponse/collection">
				<xsl:variable name="count" select="count(/page/pageResponse/collection/serviceList/service[@name='ClassifierBrowse']/classifierList/classifier)"/>
				<xsl:variable name="currentPage" select="page/pageRequest/@fullURL"/>

				<!-- <li>
					<a href="{$library_name}">Home</a>
				</li>
				<li>
					<xsl:if test="page/pageRequest/@subaction='about'">
						<xsl:attribute name="class">active</xsl:attribute>
					</xsl:if>
					<a href="{$library_name}/collection/{$collNameChecked}/page/about">About</a>
				</li> -->

				<xsl:choose>
					<xsl:when test="$count > 3">
						<li>
							<a class="gs-navbar-title" href="{$currentPage}">Browse</a>
							<ul>
								<xsl:call-template name="Browsing"/>
							</ul>
						</li>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Browsing"/>
					</xsl:otherwise>
				</xsl:choose>

				<xsl:if test="/page/pageResponse/collection/serviceList/service/@type='query'">
					<li>
						<a class="gs-navbar-title" href="{$currentPage}">Search</a>
						<ul>
							<xsl:for-each select="/page/pageResponse/collection/serviceList/service[@type='query']">
								<xsl:variable name="search" select="@name"/>
								<xsl:variable name="search_name" select="displayItem[@name='name']"/>
								<li>
									<a href="{$library_name}/collection/{$collNameChecked}/search/{$search}">
										<xsl:value-of select="$search_name"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</li>
				</xsl:if>

			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>


	</xsl:template>

	<xsl:template name="Browsing">
	<div class="container">
	
	</div>
		<xsl:for-each select="/page/pageResponse/collection/serviceList/service[@name='ClassifierBrowse']/classifierList/classifier">
			<li>
				<xsl:choose>
					<!-- If this tab is selected then colour it differently -->
					<xsl:when test="util:contains(/page/pageRequest/paramList/param[@name = 'cl' and /page/pageRequest/@action = 'b']/@value, @name)">
						<xsl:attribute name='class'>active</xsl:attribute>
					</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>

				<a>
					<!-- Add a title element to the <a> tag if a description exists for this classifier -->
					<xsl:if test="displayItem[@name='description']">
						<xsl:attribute name='title'>
							<xsl:value-of select="displayItem[@name='description']"/>
						</xsl:attribute>
					</xsl:if>

					<!-- Add the href element to the <a> tag -->
					<xsl:choose>
						<xsl:when test="@name">
							<xsl:attribute name="href">
								<xsl:value-of select="$library_name"/>
/collection/<xsl:value-of select="/page/pageResponse/collection[@name=$collNameChecked]/@name"/>
/browse/<xsl:value-of select="@name"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="href">
							<xsl:value-of select="$library_name"/>
/collection/<xsl:value-of select="/page/pageResponse/collection[@name=$collNameChecked]/@name"/>
/browse/1</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>

				<!-- Add the actual text of the <a> tag -->
				<xsl:value-of select="displayItem[@name='name']"/>
			</a>
		</li>
	</xsl:for-each>
</xsl:template>


<!-- <form id="search-form" class="search-form" action="" method="post">
                    <input class="search-form-input" type="text" name="search" id="search" placeholder="Chercher une compétence">
                    <input class="search-form-submit" type="submit" value="Chercher">
                </form> -->

<xsl:template name="crossCollSearch">
	<xsl:for-each select="/page/pageResponse/serviceList/service[@name='TextQuery']">
		<form id="search-form" class="search-form" name="QuickSearch" method="get" action="{$library_name}">
			<input type="hidden" name="a" value="q"/>
			<input type="hidden" name="rt" value="rd"/>
			<input type="hidden" name="s" value="{@name}"/>
			<input type="hidden" name="s1.collection" value="all"/>
			<input class="search-form-input" type="text" name="s1.query" id="search-text" value="Chercher une collection" onfocus="this.value=(this.value=='Search all collections…')? '' : this.value ;" />
			<input class="search-form-submit" type="submit" name="go" id="go" value="Chercher" />
		</form>
	</xsl:for-each>
</xsl:template>

<xsl:template name="CollectionSearch">
	<xsl:variable name="subaction" select="/page/pageRequest/@subaction"/>
	<form id="search-form" class="search-form" action="{$library_name}/collection/{$collNameChecked}/search/TextQuery">
		<!-- This parameter says that we have come from the quick search area -->
		<input type="hidden" name="qs" value="1"/>
		<input type="hidden" name="rt" value="rd"/>
		<input type="hidden" name="s1.level">
			<xsl:attribute name="value">
				<xsl:choose>
					<xsl:when test="/page/pageRequest/paramList/param[@name = 's1.level']">
						<xsl:value-of select="/page/pageRequest/paramList/param[@name = 's1.level']/@value"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/page/pageResponse/collection/serviceList/service[@name='TextQuery']/paramList/param[@name = 'level']/@default"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</input>
		<xsl:choose>
			<xsl:when test="/page/pageResponse/service[@name = 'TextQuery']/paramList/param[@name = 'startPage']">
				<input type="hidden" name="s1.startPage" value="1"/>
			</xsl:when>
			<xsl:otherwise>
				<input type="hidden" name="startPage" value="1"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="not(/page/pageRequest/paramList/param[@name = 's1.hitsPerPage'])">
			<input type="hidden" name="s1.hitsPerPage" value="20"/>
		</xsl:if>
		<xsl:if test="not(/page/pageRequest/paramList/param[@name = 's1.maxDocs'])">
			<input type="hidden" name="s1.maxDocs" value="100"/>
		</xsl:if>
		<!-- The query text box -->
		<span class="querybox">
			<xsl:variable name="qs">
				<xsl:apply-templates select="/page/pageResponse/collection[@name=$collNameChecked]/serviceList/service[@name='TextQuery']/paramList/param[@name='query']" mode="calculate-default"/>
			</xsl:variable>
			<nobr>
				<xsl:apply-templates select="/page/pageResponse/collection[@name=$collNameChecked]/serviceList/service[@name='TextQuery']/paramList/param[@name='query']">
					<xsl:with-param name="default" select="java:org.greenstone.gsdl3.util.XSLTUtil.tidyWhitespace($qs, /page/@lang)"/>
				</xsl:apply-templates>
			</nobr>
		</span>
		<!-- The submit button (for TextQuery) -->
		<xsl:if test="/page/pageResponse/collection[@name=$collNameChecked]/serviceList/service[@name='TextQuery']">
			<input class="search-form-submit" type="submit" name="go" id="go" value="Chercher"></input>
			<br/>
		</xsl:if>
	</form>
	<div id="advanced">
		<a href="{$library_name}/collection/{$collNameChecked}/search/TextQuery">Recherche Avancée</a>
	</div>
</xsl:template>



<xsl:template name="loginLinks">
	<xsl:variable name="username" select="/page/pageRequest/userInformation/@username"/>
	<xsl:variable name="groups" select="/page/pageRequest/userInformation/@groups"/>

	<xsl:choose>
		<xsl:when test="$username">
			<xsl:if test="contains($groups,'admin')">
				<a class="header-navbar-link" href="{$library_name}/admin/AddUser">Créer utilisateur</a>
				<a class="header-navbar-link" href="{$library_name}/admin/ListUsers">Administration</a>
			</xsl:if>
			<a class="header-navbar-link" href="{$library_name}/admin/AccountSettings?s1.username={$username}">Connecté: <xsl:value-of select="$username"/>
			</a>
			<a class="header-navbar-link" href="{$library_name}?logout=">
				<span class="secondary">Déconnexion</span>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<a class="header-navbar-link" href="{$library_name}?a=p&amp;sa=login&amp;redirectURL={$library_name}%3Fa=p%26sa=home">
				<span class="secondary">Connexion</span>
				<xsl:attribute name="title">
					<xsl:value-of select="util:getInterfaceText($interface_name, /page/@lang, 'login_tip')"/>
				</xsl:attribute>
			</a>

		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>
