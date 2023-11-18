<xsl:stylesheet version="3.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output indent="yes" method="xml"/>
<xsl:template match="/">
<xsl:processing-instruction name="xml-model">href="https://raw.githubusercontent.com/TEI-Correspondence-SIG/CMIF/master/schema/cmi-customization.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
	<teiHeader>
		<fileDesc>
			<titleStmt>
				<title>A digital index to the letters published in “The Letters of J.R.R. Tolkien. Edited by Humphrey Carpenter.”</title>
				<editor ref="https://orcid.org/0000-0001-8483-8123">Julian Jarosch <email>julian.jarosch@adwmainz.de</email></editor>
			</titleStmt>
			<publicationStmt>
				<publisher><ref target="https://orcid.org/0000-0001-8483-8123">Julian Jarosch</ref></publisher>
				<idno type="url">https://raw.githubusercontent.com/jjarosch/Tolkien-Letters-CMIF/master/letters.xml</idno>
				<date>
					<xsl:attribute name="when">
						<xsl:value-of select="adjust-date-to-timezone(current-date(), ())"/>
					</xsl:attribute>
				</date>
				<availability>
					<licence target="https://creativecommons.org/licenses/by/4.0/">This file is licensed under the terms of the Creative-Commons-License CC BY 4.0</licence>
				</availability>
			</publicationStmt>
			<sourceDesc>
				<!--<bibl type="print" xml:id="e2232c6ac-098a-45eb-94c6-c2987e92b3ad">The Letters of J.R.R. Tolkien. A selection edited by Humphrey Carpenter with the assistance of Christopher Tolkien. This edition first published: George Allen &amp; Unwin, 1981.</bibl>-->
				<bibl type="print" xml:id="e8f085d69-81a8-466f-a58d-3e7dac7431df">The Letters of J.R.R. Tolkien. Revised and Expanded Edition. A selection edited by Humphrey Carpenter with the assistance of Christopher Tolkien. This edition first published: HarperCollinsPublishers, 2023.</bibl>
			</sourceDesc>
		</fileDesc>
		<profileDesc>
			<xsl:for-each select="csv/row">
				<xsl:if test="publicationReady/text() = 'true'">
					<xsl:choose>
						<xsl:when test="exclude/normalize-space() = ''">
							<xsl:element name="correspDesc" xmlns="http://www.tei-c.org/ns/1.0">
								<xsl:attribute name="key">
									<xsl:value-of select="key"/>
								</xsl:attribute>
								<xsl:attribute name="source">
									<xsl:text>#e8f085d69-81a8-466f-a58d-3e7dac7431df</xsl:text>
								</xsl:attribute>
								<xsl:element name="correspAction">
									<xsl:attribute name="type">
										<xsl:text>sent</xsl:text>
									</xsl:attribute>
									<xsl:element name="persName">
										<xsl:attribute name="ref">
											<xsl:text>http://viaf.org/viaf/95218067</xsl:text>
										</xsl:attribute>
										<xsl:text>J. R. R. Tolkien</xsl:text>
									</xsl:element>
									<xsl:if test="senderPlace/text()">
									<xsl:element name="placeName">
										<xsl:if test="senderPlaceID/text()">
											<xsl:attribute name="ref">
												<xsl:value-of select="senderPlaceID"/>
											</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="senderPlace"/>
									</xsl:element>
									</xsl:if>
									<xsl:element name="date">
										<xsl:choose>
											<xsl:when test="senderDate/text()">
												<xsl:attribute name="when">
													<xsl:value-of select="senderDate"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="senderDateFrom/text() and senderDateTo/text()">
												<xsl:attribute name="from">
													<xsl:value-of select="senderDateFrom"/>
												</xsl:attribute>
												<xsl:attribute name="to">
													<xsl:value-of select="senderDateTo"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="senderDateEarliest/text() and senderDateLatest/text()">
												<xsl:attribute name="notBefore">
													<xsl:value-of select="senderDateEarliest"/>
												</xsl:attribute>
												<xsl:attribute name="notAfter">
													<xsl:value-of select="senderDateLatest"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</xsl:element>
								</xsl:element>
								<xsl:element name="correspAction">
									<xsl:attribute name="type">
										<xsl:text>received</xsl:text>
									</xsl:attribute>
									<xsl:element name="persName">
										<xsl:if test="addresseeID/text()">
											<xsl:attribute name="ref">
												<xsl:value-of select="addresseeID"/>
											</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="addressee"/>
									</xsl:element>
								</xsl:element>
								<xsl:element name="note">
									<xsl:element name="ref">
										<xsl:attribute name="type">
											<xsl:text>https://lod.academy/cmif/vocab/terms#hasLanguage</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="target">
											<xsl:text>en</xsl:text>
										</xsl:attribute>
									</xsl:element>
									<xsl:if test="textType/text()">
										<xsl:element name="ref">
											<xsl:attribute name="type">
												<xsl:text>https://lod.academy/cmif/vocab/terms#hasTextBase</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="target">
												<xsl:text>https://lod.academy/cmif/vocab/terms#</xsl:text>
												<xsl:value-of select="textType"/>
											</xsl:attribute>
										</xsl:element>
									</xsl:if>
									<xsl:element name="ref">
										<xsl:attribute name="type">
											<xsl:text>https://lod.academy/cmif/vocab/terms#isPublishedWith</xsl:text>
										</xsl:attribute>
										<xsl:attribute name="target">
											<xsl:text>https://lod.academy/cmif/vocab/terms#Transcription</xsl:text>
										</xsl:attribute>
									</xsl:element>
									<xsl:if test="headNote/text() = 'true' or endNote/text() = 'true'">
										<xsl:element name="ref">
											<xsl:attribute name="type">
												<xsl:text>https://lod.academy/cmif/vocab/terms#isPublishedWith</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="target">
												<xsl:text>https://lod.academy/cmif/vocab/terms#Commentary</xsl:text>
											</xsl:attribute>
										</xsl:element>
									</xsl:if>
								</xsl:element>
							</xsl:element>
						</xsl:when>
						<xsl:when test="exclude/normalize-space() != ''">
							<xsl:comment>
								<xsl:value-of select="key"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="exclude"/>
							</xsl:comment>
							<xsl:text>&#xa;</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
		</profileDesc>
	</teiHeader>
	<text>
		<body>
			<p/>
		</body>
	</text>
</TEI>
</xsl:template>
</xsl:stylesheet>
