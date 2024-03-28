<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    
<!--================= first want to match everything and select just the actual text of the preamble/chapter ==================-->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="styling.css"/>
                <title>XSLT for Constitutions</title>
            </head>
            <body>
<!--               only want to select the body, not the meta data too-->
                <xsl:apply-templates select="//body"/>
            </body>
        </html>
    </xsl:template>    
    
<!--======================= turn the preamble into a paragraph ===================================-->
    <xsl:template match="preamble">
    <p class="preamble">
        <xsl:apply-templates/>
    </p>
    </xsl:template>
    
<!--================== make the chapter title big =================================-->
    <xsl:template match="chap_title">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
<!--===================== make the section header big (if there is one) =========================-->
    <xsl:template match="s_header">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
   
    <!--====================test to see if there are section headers to figure out how big to make the article headers ======================-->
    <xsl:template match="a_header">
        <xsl:variable name="count-sections" as="xs:integer" select="count(//section)"/>
        <xsl:choose>
            <xsl:when test="$count-sections eq 1">
                <h3>
                    <xsl:apply-templates/>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <h4>
                    <xsl:apply-templates/>
                </h4>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
<!--=================== make each article its own paragraph ====================================-->
    <xsl:template match="article">
        <p>
            <xsl:apply-templates/>
        </p>
        <br/>
    </xsl:template>
    
</xsl:stylesheet>