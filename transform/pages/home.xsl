<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:util="xalan://org.greenstone.gsdl3.util.XSLTUtil"
	xmlns:gslib="http://www.greenstone.org/skinning" extension-element-prefixes="java util" exclude-result-prefixes="java util">

	<!-- the page content -->
	<xsl:template match="/page/pageResponse">

	<!-- Cover Image -->
	<xsl:call-template name="coverImageTemplate"/>

		<!-- Section: Skills -->
		<section id="skills" class="skills">
			<div class="section-header">
				<div>
					<p class="section-header-title">Explorer toutes les collections</p>
				</div>
			</div>
			<div class="container">
			<p>
				Bienvenue sur la base de données opérationelle du HCRUN. 
			</p>
				<div class="row skill-cards">
				<xsl:variable name="username" select="/page/pageRequest/userInformation/@username"/>
						<xsl:variable name="groups" select="/page/pageRequest/userInformation/@groups"/>

						<!-- <xsl:choose>
							<xsl:when test="$username"> -->
								<!-- <xsl:if test="contains($groups,'admin')"></xsl:if> -->
									<xsl:call-template name="collectionCards"/>
							<!-- </xsl:when>
							<xsl:otherwise>
								<div style="margin: 200px 0px; text-align:center;" class="container">
									<h1>Veuillez vous connecter pour voir les collections</h1>
								</div>
							</xsl:otherwise>
						</xsl:choose> -->
					
				</div>
			</div>
		</section>

		<!-- 

		<div id="hpage_cats">
			<xsl:call-template name="collectionsList"/>
		</div> -->
	</xsl:template>

	<xsl:template name="coverImageTemplate">
		<xsl:variable name="coverImage1">
			interfaces/<xsl:value-of select="$interface_name"/>/images/library.jpg
		</xsl:variable>
		<xsl:variable name="coverImage2">
			interfaces/<xsl:value-of select="$interface_name"/>/images/documents1.jpg
		</xsl:variable>
		<xsl:variable name="coverImage3">
			interfaces/<xsl:value-of select="$interface_name"/>/images/library2.jpg
		</xsl:variable>
	


	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item ">
     <img class="coverImage" src="{$coverImage1}" alt="" srcset=""/>
    </div>
    <div class="carousel-item active">
      <img class="coverImage" src="{$coverImage2}" alt="" srcset=""/>
    </div>
    <div class="carousel-item">
      <img class="coverImage" src="{$coverImage3}" alt="" srcset=""/>
    </div>
  </div>
  <a class="carousel-control-prev"  role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next"  role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>

	</xsl:template>

	<xsl:template name="collectionCards">
		<xsl:for-each select="./collectionList/collection">
			<xsl:variable name="collectionFolder" select="@name"/>
			<xsl:variable name="collectionName" select="displayItemList/displayItem[@name='name']"/>
			<!-- Pick an Image according to some condition -->
			<xsl:variable name="homeImage">
				<xsl:choose>
					<xsl:when test="displayItem[@name='smallicon']">
				sites/<xsl:value-of select="$site_name"/>
/collect/<xsl:value-of select="$collectionFolder"/>
/images/<xsl:value-of select="displayItem[@name='smallicon']"/>
			</xsl:when>
			<xsl:otherwise>
				interfaces/<xsl:value-of select="$interface_name"/>
/images/doc2.png
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>


	<!-- Skill card -->
	<div class="col-md-2">
		<div class="skill-card card">
			<img src="{$homeImage}" class="skill-card-img" alt="compétence"/>
			<div class="skill-card-content">
				<p class="skill-card-title">
					<xsl:value-of select="$collectionName"/>
				</p>
				<hr/>
				<a class="skill-card-button" href="{$library_name}/collection/{$collectionFolder}/page/about">
								Consulter
				</a>
			</div>
		</div>
	</div>
</xsl:for-each>
</xsl:template>

<xsl:template name="collectionsList">
<xsl:for-each select="./collectionList/collection">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div class="container gs-collection-description">
				<xsl:call-template name="collDescription"/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="container gs-collection-description">
				<xsl:call-template name="collDescription"/>
			</div>
			<br class="clear" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:for-each>
</xsl:template>

<xsl:template name="collDescription">
<xsl:variable name="collectionFolder" select="@name"/>
<xsl:variable name="collectionName" select="displayItemList/displayItem[@name='name']"/>
<xsl:variable name="homeImage" select="displayItemList/displayItem[@name='icon']"/>
<xsl:variable name="aboutImage" select="displayItemList/displayItem[@name='smallicon']"/>
<xsl:variable name="collDesc" select="displayItemList/displayItem[@name='description']"/>
<xsl:variable name="numDocs" select="metadataList/metadata[@name='numDocs']"/>

<h2>
	<a href="{$library_name}/collection/{$collectionFolder}/page/about">
		<xsl:value-of select="$collectionName"/>
	</a>
</h2>
<xsl:if test="$aboutImage">
	<img src="sites/{$site_name}/collect/{$collectionFolder}/images/{$aboutImage}" alt="{$collectionName}" />
</xsl:if>

<xsl:choose>
	<xsl:when test="$collDesc">
		<p class="justify">
			<xsl:apply-templates select="displayItemList/displayItem[@name='description']"/>
		</p>
	</xsl:when>
	<xsl:otherwise>
		<p class="justify">Welcome to the <xsl:value-of select="$collectionName"/>
 collection. This collection contains <xsl:value-of select="$numDocs"/>
 documents.</p>
</xsl:otherwise>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>


