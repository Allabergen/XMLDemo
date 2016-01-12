<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <xsl:apply-templates select="tvshows/show"/>
    </xsl:template>

    <xsl:template match="show">
        <xsl:apply-templates select="name"/>

        Node Position:
        <xsl:value-of select="position()"/> out of
        <xsl:value-of select="last()"/> nodes
        <br/>

        Ratings: Averaged
        <xsl:value-of select="viewers"/>
        viewers versus the average of the rest

        <xsl:value-of select="format-number(sum(/tvshows/show/viewers) div count(tvshows/show), '#,##0.000')"/> millon
        <br/>
        3.14 Rounded
        <xsl:value-of select="round(3.14)"/>
        <br/>
        3.14 Ceiling
        <xsl:value-of select="ceiling(3.14)"/>
        <br/>
        3.14 Floor
        <xsl:value-of select="floor(3.14)"/>
        <br/>

        <xsl:for-each select="actors/actor">
            <xsl:value-of select="substring-before(real_name, ' ')"/> and
        </xsl:for-each>
        are good actors.
        <br/>

        Is I in Team:
        <xsl:value-of select="string(contains('Team', 'I'))"/>
        <br/>

    </xsl:template>

    <xsl:template match="name">
        <div style="float:left">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="../poster/@href"/>
                </xsl:attribute>
            </img>
        </div>
        <br/>

        <span style="color:#000; font-size:14pt">
            <xsl:value-of select="translate(.,
            'abcdefghijklmnopqrstuvwxyz',
            'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
            was released in <xsl:value-of select="../release"/>.
            The star
            <xsl:value-of select="../actors/actor/character"/>
            was played by
            <xsl:value-of select="../actors/actor/character/@profession"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="../actors/actor/real_name"/>

        </span>
        <br/>
        <br/>

        <span>
            Release:
            <xsl:value-of select="../release"/>
            <br/>
            Canceled:
            <xsl:value-of select="../end_data"/>
            <br/>
            Description:
            <xsl:value-of select="../release"/>
            <br/>
            Average Viewers:
            <xsl:value-of select="../viewers"/>
            <br/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="../viewers/@units"/>
            <br/>

            Stars
            <br/>
            <ul>
                <xsl:for-each select="../actors/actor">
                    <li>
                        <xsl:for-each select="character"/>
                        played by
                        <xsl:value-of select="real_name"/>
                    </li>
                </xsl:for-each>
            </ul>
        </span>

        <br/>
        <br/>

    </xsl:template>

</xsl:stylesheet>