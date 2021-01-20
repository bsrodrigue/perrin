<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:util="xalan://org.greenstone.gsdl3.util.XSLTUtil"
	xmlns:gslib="http://www.greenstone.org/skinning" extension-element-prefixes="java util" exclude-result-prefixes="java util">

	<!-- use the 'main' layout -->
	<xsl:include href="layouts/main.xsl"/>
	<xsl:variable name="help_interface_name" select="concat($interface_name, '2')"/>
	<!-- set page title -->
	<xsl:template name="pageTitle">
		<xsl:value-of select="util:getInterfaceText($help_interface_name, /page/@lang, 'help_b')"/>
	</xsl:template>

	<!-- set page breadcrumbs -->
	<xsl:template name="breadcrumbs">
		<gslib:siteLink/>
		<gslib:rightArrow/>
		<xsl:if test="/page/pageResponse/collection">
			<gslib:collectionNameLinked/>
			<gslib:rightArrow/>
		</xsl:if>
	</xsl:template>

	<!-- the page content -->
	<xsl:template match="page">
		<!-- <xsl:call-template name="helpTopics"/> -->
		<xsl:choose>
			<xsl:when test="/page/pageResponse/collection">
			<xsl:call-template name="homePageHelp"/>
				<!-- <xsl:call-template name="findingInformationHelp"/> -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="homePageHelp"/>
			</xsl:otherwise>
		</xsl:choose>
		<!-- <xsl:call-template name="readingDocsHelp"/>
		<xsl:call-template name="searchingHelp"/>
		<xsl:call-template name="preferencesHelp"/> -->
	</xsl:template>

	<xsl:template name="helpTopics">

	</xsl:template>

	<xsl:template name="homePageHelp">
		<div class="container my-5">
			<section class="help-section">
				<h1>Comment lire les documents</h1>

				<p>

		Vous pouvez savoir quand vous êtes arrivé à un livre ou un document individuel car son titre, ou une image de la couverture avant, apparaît en haut à gauche de la page. Dans certaines collections, une table des matières apparaît, tandis que dans d'autres (par exemple, lorsque l'option d'image paginée est utilisée), seul le numéro de page est affiché, avec une boîte qui vous permet de sélectionner une nouvelle page et d'avancer et de reculer. Dans la table des matières, le titre de la section courante est en gras et le tableau est extensible - cliquez sur les dossiers pour les ouvrir ou les fermer; cliquez sur le livre ouvert en haut pour le fermer.

		En dessous se trouve le texte de la section actuelle. Lorsque vous l'avez lu, il y a des flèches en bas pour vous amener à la section suivante ou revenir à la précédente.

		Sous le titre ou l'image de couverture se trouvent quelques boutons. Cliquez sur DÉVELOPPER LE DOCUMENT pour développer tout le texte de la section ou du livre en cours. Si le document est volumineux, cela peut prendre beaucoup de temps et utiliser beaucoup de mémoire! Cliquez sur DÉVELOPPER LE CONTENU pour développer toute la table des matières afin que vous puissiez voir les titres de tous les chapitres et sous-sections. Cliquez sur DÉTACHER LA PAGE pour créer une nouvelle fenêtre de navigateur pour ce document. (Ceci est utile si vous souhaitez comparer des documents ou en lire deux à la fois.)
				</p>
			</section>

			<section class="help-section">
				<h1 class="help-section-header">Comment rechercher des mots particuliers</h1>

				<p>

		

À partir de la page de recherche, vous effectuez une requête en suivant ces étapes simples:
				</p>

				<ol>
					<li>Spécifiez les éléments que vous souhaitez rechercher</li>
					<li>Dites si vous souhaitez rechercher tous ou seulement certains des mots</li>
					<li>Tapez les mots que vous souhaitez rechercher</li>
					<li>Cliquez sur le bouton Lancer la recherche</li>
				</ol>






				<p>
Lorsque vous effectuez une requête, les titres de vingt documents correspondants seront affichés. Il y a un bouton à la fin pour vous diriger vers les vingt documents suivants. De là, vous trouverez des boutons pour vous emmener aux vingt troisièmes ou revenir aux vingt premiers, et ainsi de suite. Cliquez sur le titre d'un document ou sur le petit bouton à côté pour le voir.

Un maximum de 50 est imposé sur le nombre de documents retournés. Vous pouvez modifier ce numéro en cliquant sur le bouton PRÉFÉRENCES en haut de la page.
				</p>

				<h2 class="help-section-subheader">Termes de recherche</h2>

				<p>

Tout ce que vous tapez dans la zone de requête est interprété comme une liste de mots ou d'expressions appelés «termes de recherche». Un terme est un mot unique contenant uniquement des lettres et des chiffres, ou une phrase constituée d'une séquence de mots entre guillemets ("..."). Les termes sont séparés par des espaces blancs. Si d'autres caractères tels que la ponctuation apparaissent, ils servent à séparer les termes comme s'il s'agissait d'espaces. Et puis ils sont ignorés. Vous ne pouvez pas rechercher des mots comportant de la ponctuation.

Par exemple, la requête

    L'agroforesterie dans les îles du Pacifique: des systèmes pour la durabilité (1993)

sera traité de la même manière que

    Agroforesterie dans les systèmes des îles du Pacifique pour la durabilité 1993
				</p>

				<h2 class="help-section-subheader">Type de requête</h2>

				<p>

					Il existe deux types de requêtes.

						Requêtes pour tous les mots. Ceux-ci recherchent des documents (ou des chapitres, ou des titres) contenant tous les mots que vous avez spécifiés. Les documents qui satisfont la requête sont affichés, dans l'ordre de construction.
						Requêtes pour certains mots. Énumérez simplement quelques termes susceptibles d'apparaître dans les documents que vous recherchez. Les documents sont affichés dans l'ordre de leur correspondance avec la requête. Lors de la détermination du degré de correspondance,
							plus un document contient d'occurrences de termes de recherche, plus il se rapproche;
							les termes rares dans la collection dans son ensemble sont plus importants que les termes courants;
							les documents courts correspondent mieux que les longs.

				Utilisez autant de termes de recherche que vous le souhaitez - une phrase entière, voire un paragraphe entier. Si vous ne spécifiez qu'un seul terme, les documents seront classés en fonction de sa fréquence d'occurrence.
				</p>
				<h2 class="help-section-subheader">Portée des requêtes</h2>
				<p>
Dans la plupart des collections, vous avez le choix entre différents index à rechercher. Par exemple, il peut y avoir des index d'auteurs ou de titres. Ou il peut y avoir des index de chapitres ou de paragraphes. En règle générale, le document correspondant complet est renvoyé quel que soit l'index que vous recherchez.

Si les documents sont des livres, ils seront ouverts à l'endroit approprié.
				</p>
			</section>


<section class="help-section">
				<!-- Changer vos Préférences -->
				<h1 class="help-section-header">Changer vos préférences</h1>

				<p>
Lorsque vous cliquez sur le bouton PRÉFÉRENCES en haut de la page, vous pourrez modifier certaines fonctionnalités de l'interface en fonction de vos propres besoins.
<h2 class="help-section-subheader">Préférences de collection</h2>

Certaines collections comprennent plusieurs sous-collections, qui peuvent être recherchées indépendamment ou ensemble, comme une seule unité. Si tel est le cas, vous pouvez sélectionner les sous-collections à inclure dans vos recherches sur la page Préférences.
<h2 class="help-section-subheader">Préférences linguistiques</h2>

Chaque collection a une langue de présentation par défaut, mais vous pouvez passer à une autre langue si vous le souhaitez. Vous pouvez également modifier le schéma de codage utilisé par Greenstone pour la sortie vers le navigateur - le logiciel choisit des valeurs par défaut sensibles, mais avec certains navigateurs, il peut être nécessaire de passer à un autre schéma de codage pour assurer un affichage correct des caractères. Toutes les collections vous permettent de passer du format d'interface graphique standard à un format textuel. Ceci est particulièrement utile pour les utilisateurs malvoyants qui utilisent des polices grand écran ou des synthétiseurs vocaux pour la sortie.
<h2 class="help-section-subheader">Préférences de présentation</h2>

Selon la collection particulière, vous pouvez définir plusieurs options qui contrôlent la présentation.

Les collections de pages Web vous permettent de supprimer la barre de navigation Greenstone en haut de chaque page de document, de sorte qu'une fois que vous avez effectué une recherche, vous arrivez à la page Web exacte qui correspond sans aucun en-tête Greenstone. Pour faire une autre recherche, vous devrez utiliser le bouton "retour" de votre navigateur. Ces collections vous permettent également de supprimer le message d'avertissement de Greenstone lorsque vous cliquez sur un lien qui vous emmène hors de la collection de la bibliothèque numérique et sur le Web lui-même. Et dans certaines collections Web, vous pouvez contrôler si les liens de la page de résultats de recherche vous mènent directement à l'URL réelle en question, plutôt qu'à la copie de la page de la bibliothèque numérique.
				</p>
			</section>




			<section class="help-section">
				<!-- Changer vos Préférences -->
				<h1 class="help-section-header">Changer vos préférences</h1>

				<p>
Lorsque vous cliquez sur le bouton PRÉFÉRENCES en haut de la page, vous pourrez modifier certaines fonctionnalités de l'interface en fonction de vos propres besoins.
				</p>

<h2 class="help-section-subheader">Préférences de collection</h2>
<p>
Certaines collections comprennent plusieurs sous-collections, qui peuvent être recherchées indépendamment ou ensemble, comme une seule unité. Si tel est le cas, vous pouvez sélectionner les sous-collections à inclure dans vos recherches sur la page Préférences.
</p>
<h2 class="help-section-subheader">Préférences linguistiques</h2>
<p>
Chaque collection a une langue de présentation par défaut, mais vous pouvez passer à une autre langue si vous le souhaitez. Vous pouvez également modifier le schéma de codage utilisé par Greenstone pour la sortie vers le navigateur - le logiciel choisit des valeurs par défaut sensibles, mais avec certains navigateurs, il peut être nécessaire de passer à un autre schéma de codage pour assurer un affichage correct des caractères. Toutes les collections vous permettent de passer du format d'interface graphique standard à un format textuel. Ceci est particulièrement utile pour les utilisateurs malvoyants qui utilisent des polices grand écran ou des synthétiseurs vocaux pour la sortie.
</p>
<h2 class="help-section-subheader">Préférences de présentation</h2>
<p>
Selon la collection particulière, vous pouvez définir plusieurs options qui contrôlent la présentation.

Les collections de pages Web vous permettent de supprimer la barre de navigation Greenstone en haut de chaque page de document, de sorte qu'une fois que vous avez effectué une recherche, vous arrivez à la page Web exacte qui correspond sans aucun en-tête Greenstone. Pour faire une autre recherche, vous devrez utiliser le bouton "retour" de votre navigateur. Ces collections vous permettent également de supprimer le message d'avertissement de Greenstone lorsque vous cliquez sur un lien qui vous emmène hors de la collection de la bibliothèque numérique et sur le Web lui-même. Et dans certaines collections Web, vous pouvez contrôler si les liens de la page de résultats de recherche vous mènent directement à l'URL réelle en question, plutôt qu'à la copie de la page de la bibliothèque numérique.
				</p>
			</section>



<section class="help-section">
	<!-- Recherche de Préférences -->
	<h1 class="help-section-header">Préférences de recherche</h1>
	<p>
	
Vous pouvez passer à un mode de requête "avancé" qui vous permet de combiner des termes en utilisant &amp; (pour "et"), | (pour "ou"), et! (pour "pas"), en utilisant des parenthèses pour le regroupement si désiré. Cela vous permet de spécifier des requêtes plus précises.

Il est possible d'obtenir une grande boîte de requête, de sorte que vous pouvez facilement effectuer une recherche au format paragraphe. Il est étonnamment rapide de rechercher de grandes quantités de texte.

Vous pouvez activer la fonction d'historique de recherche, qui vous montre vos dernières requêtes. Cela facilite la répétition des versions légèrement modifiées des requêtes précédentes.

Enfin, vous pouvez contrôler le nombre de hits renvoyés et le nombre présenté sur chaque écran.
	</p>
</section>

		</div>














	</xsl:template>
	<xsl:template name="findingInformationHelp">
		<xsl:variable name="searchEnabled">
			<xsl:choose>
				<xsl:when test="/page/pageResponse/collection[@name=$collName]/serviceList/service[@type='query']">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="numClassifiers">
			<xsl:value-of select="count(/page/pageResponse/collection[@name=$collName]/serviceList/service[@name = 'ClassifierBrowse']/classifierList/classifier)"/>
		</xsl:variable>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.findinginformationtitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.findinginformation', $searchEnabled + $numClassifiers)"/>

		<!-- using actual <ul> and <li> tags here would cause the XML parser to break -->
		<xsl:text disable-output-escaping="yes">&lt;ul&gt;</xsl:text>
		<xsl:if test="$searchEnabled = 1">
			<xsl:text disable-output-escaping="yes">&lt;li&gt;</xsl:text>
			<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.searchdesc')"/>
			<xsl:text disable-output-escaping="yes">&lt;/li&gt;</xsl:text>
		</xsl:if>

		<xsl:for-each select="/page/pageResponse/collection[@name=$collName]/serviceList/service[@name = 'ClassifierBrowse']/classifierList/classifier">
			<xsl:text disable-output-escaping="yes">&lt;li&gt;</xsl:text>
			<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.browsedesc', ./displayItem[@name = 'name'])"/>
			<xsl:text disable-output-escaping="yes">&lt;/li&gt;</xsl:text>
		</xsl:for-each>
		<xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
	</xsl:template>

	<xsl:template name="readingDocsHelp">
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.readingdocstitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.readingdocs')"/>

		<table>
			<tr>
				<td colspan="2">
					<img src="interfaces/default/images/bookshelf.png"/>
				</td>
				<td>
					<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.openbookshelf')"/>
				</td>
			</tr>
			<tr>
				<td>
					<img src="interfaces/default/images/previous.png"/>
				</td>
				<td>
					<img src="interfaces/default/images/next.png"/>
				</td>
				<td>
					<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.sectionarrows')"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="searchingHelp">
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.searchingtitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.searching')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.querytermstitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.queryterms')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.querytypetitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.querytype')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.queryscopetitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.queryscope')"/>
	</xsl:template>

	<xsl:template name="preferencesHelp">
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.changingpreferencestitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.changingpreferences')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.collectionpreferencestitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.collectionpreferences')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.languagepreferencestitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.languagepreferences')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.presentationpreferencestitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.presentationpreferences')"/>

		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.searchpreferencestitle')"/>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.searchpreferences1')"/>
		<xsl:if test="/page/pageResponse/collection[@name=$collName and (@type='mgpp' or @type='mg')]">
			<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.mgsearchpreferences')"/>
		</xsl:if>
		<xsl:value-of disable-output-escaping="yes" select="util:getInterfaceText($help_interface_name, /page/@lang, 'help.searchpreferences2')"/>
	</xsl:template>
</xsl:stylesheet>
