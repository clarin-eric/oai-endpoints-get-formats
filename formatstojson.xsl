<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:pmh="http://www.openarchives.org/OAI/2.0/" exclude-result-prefixes="xs" version="1.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="/pmh:OAI-PMH/pmh:ListMetadataFormats" />
    </xsl:template>
    
    <xsl:template match="pmh:ListMetadataFormats">
        <xsl:text>[&#xa;</xsl:text>
        
        <xsl:for-each select="pmh:metadataFormat">
            <xsl:if test="position() > 1"><xsl:text>,&#xa;</xsl:text></xsl:if>
            <xsl:apply-templates select="." />
        </xsl:for-each>
        
        <xsl:text>&#xa;]&#xa;</xsl:text>
    </xsl:template> 
    
    <xsl:template match="pmh:metadataFormat">
        <xsl:value-of select="concat(
            '  {&#xa;', 
            '    &quot;metadataPrefix&quot;: &quot;', pmh:metadataPrefix, '&quot;,&#xa;',
            '    &quot;schema&quot;: &quot;', pmh:schema, '&quot;,&#xa;',
            '    &quot;metadataNamespace&quot;: &quot;', pmh:metadataNamespace, '&quot;&#xa;',
            '  }')"/>
    </xsl:template>

</xsl:stylesheet>