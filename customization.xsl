<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ditaarch opentopic e" version="2.0"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
    xmlns:e="org.dita.pdf2.topic.numbering" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- 
        When this option is enabled the topic's number will be presented before the topics's title.
    -->
    <xsl:param name="numbers-before-title" select="'no'"/>
    
    <!--
        Specifies the depth of the topics that will be numbered when the 'numbers-before-title' option is enabled.
    -->
    <xsl:param name="numbers-before-title-depth" select="3"/>

    <xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')][$numbers-before-title = 'yes']"
        mode="getTitle">        
        <xsl:variable name="topic"
            select="ancestor-or-self::*[contains(@class, ' topic/topic ')][1]"/>

        <xsl:variable name="id" select="$topic/@id"/>        
        <xsl:variable name="mapTopics" select="key('map-id', $id)"/>
        
        <!--
            Do not generate numbers for first level chapters, appendix topics and parts.
        -->        
        <xsl:if test="not(contains($mapTopics[1]/@class, ' bookmap/chapter ')) 
            and not(contains($mapTopics[1]/@class, ' bookmap/appendix '))
            and not(contains($mapTopics[1]/@class, ' bookmap/part '))">
            <fo:inline>
                <xsl:for-each select="$mapTopics[1]">
                    <xsl:variable name="depth"
                        select="count(ancestor-or-self::*[contains(@class, ' map/topicref')])"/>
                    <xsl:choose>
                        <xsl:when test="parent::opentopic:map and contains(@class, ' bookmap/bookmap ')"/>
                        <!-- Do not add numbers for fontmatter or backmatter topics -->
                        <xsl:when
                            test="
                            ancestor-or-self::*[contains(@class, ' bookmap/frontmatter ') or
                            contains(@class, ' bookmap/backmatter ')]"/>
                        <!-- Appendix topics -->
                        <xsl:when
                            test="
                            ancestor-or-self::*[contains(@class, ' bookmap/appendix ')] and
                            $depth lt ($numbers-before-title-depth + 1)">
                            <!--<xsl:number
                                count="
                                *[contains(@class, ' map/topicref ')]
                                [ancestor-or-self::*[contains(@class, ' bookmap/appendix ')]]"
                                format="A.1.1" level="multiple"/>-->
                        </xsl:when>
                        <!-- Normal topics -->
                        <xsl:when test="$depth lt ($numbers-before-title-depth + 1)">
                            <xsl:number
                                count="
                                *[contains(@class, ' map/topicref ')]
                                [not(ancestor-or-self::*[contains(@class, ' bookmap/frontmatter ')])]"
                                format="1.1" level="multiple"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </fo:inline>
            <xsl:value-of select="' '"/>
        </xsl:if>
                
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>
