<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	

	<xsl:template name="blockly.element.grafico" >	
		<xsl:variable name="mutation" select="mutation/@count"/>
		<xsl:variable name="grafico" select="substring-after(@type,'grafico_')"/>		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		<xsl:variable name="collecto_type" select="substring-before(value[@name='statistics']/block/field,'::')"/>		
		<xsl:variable name="graficoup">		
			<xsl:call-template name="InitCap">		
				<xsl:with-param name="text" select="$grafico"/>		
			</xsl:call-template>		
		</xsl:variable>	
		<xsl:variable name="daolow">
	       	<xsl:call-template name="LowerCase">       	
	       		<xsl:with-param name="text" select="$dao"/>     		
	       	</xsl:call-template>	       	
		</xsl:variable>	
		<xsl:variable name="collectorField_1" select="substring-after(value[@name='statistics']/block/field,'::')"/>		
		<xsl:variable name="collectorField_2">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$collectorField_1"/>				
			</xsl:call-template>			
		</xsl:variable>
		<xsl:variable name="collecto">		
			<xsl:call-template name="blockly.getValue">				
				<xsl:with-param name="value" select="value[@name='statistics']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="collecto_convert">
			<xsl:call-template name="convert_blocks">
				<xsl:with-param name="daolow" select="$daolow"></xsl:with-param>
				<xsl:with-param name="value" select="$collecto"></xsl:with-param>
				<xsl:with-param name="valueblock" select="wherevalue"></xsl:with-param>
				<xsl:with-param name="from" select="$collecto_type"></xsl:with-param>
				<xsl:with-param name="to" select="'Long'"></xsl:with-param>
				<xsl:with-param name="neto" select="neto"></xsl:with-param>
				<xsl:with-param name="valuechild" select="valuechild"></xsl:with-param>
				<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>
				<xsl:with-param name="block_name" select="block_name"></xsl:with-param>
			</xsl:call-template>	
		</xsl:variable>	
		<xsl:variable name="collectorField" select="concat('get',$collectorField_2)"/>
		<xsl:variable name="collectorFilho" select="value[@name='statistics']/block/value/block/field"/>		
		<xsl:variable name="col_type_filho" select="substring-before($collectorFilho,'::')"/>	
		<xsl:variable name="collectorFilho_low" select="substring-after($collectorFilho,'::')"/>		
		<xsl:variable name="collector_Filho">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$collectorFilho_low"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="daofilter" select="concat($daolow,'filter')"/>		
		<xsl:variable name="andWheres">		
			<xsl:call-template name="listar.andWheres">			
				<xsl:with-param name="daofilter" select="$daofilter"/>			
				<xsl:with-param name="total" select="$mutation"/>				
				<xsl:with-param name="valueAttrName" select="'ADD'"/>				
				<xsl:with-param name="values" select="value"/>		
			</xsl:call-template>			
		</xsl:variable>			
		<xsl:variable name="eixo_filho" select="value[@name='groupby']/block/value/block/field"/>		
		<xsl:variable name="type_filho" select="substring-before($eixo_filho,'::')"/>	
		<xsl:variable name="value_filho_low" select="substring-after($eixo_filho,'::')"/>		
		<xsl:variable name="value_filho">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$value_filho_low"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="typegroup" select="substring-before(value[@name='groupby']/block/field,'::')"/>		
		<xsl:variable name="groupby_1" select="substring-after(value[@name='groupby']/block/field,'::')"/>		
		<xsl:variable name="groupby_2">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$groupby_1"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="groupby" select="concat('get',$groupby_2)"/>		
		<xsl:variable name="options">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
			</xsl:call-template>			
		</xsl:variable>
		<xsl:value-of select="$newlineTab1"/>			 
		<xsl:text>try{</xsl:text>			
		<xsl:value-of select="$newlineTab1"/>	
		<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>			
		<xsl:value-of select="$andWheres"/>		
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List  = </xsl:text><xsl:value-of select="$daofilter"/><xsl:text>.all();</xsl:text>		
		<xsl:value-of select="$newlineTab1"/>			
		<xsl:variable name="rowtypemap">			
			<xsl:choose>				
				<xsl:when test="contains($typegroup,'_FK#')">					
					<xsl:variable name="replaced_field">					
						<xsl:call-template name="replace-all">								
							<xsl:with-param name="text" select="$typegroup"/>									
							<xsl:with-param name="replace" select="'_FK#'"/>									
							<xsl:with-param name="by" select="''"/>									
						</xsl:call-template>								
					</xsl:variable>							
					<xsl:value-of select="$replaced_field"></xsl:value-of>						
				</xsl:when>						
				<xsl:otherwise>							
					<xsl:value-of select="$typegroup"></xsl:value-of>						
				</xsl:otherwise>						
			</xsl:choose>		
		</xsl:variable>				
		<xsl:choose>				
			<xsl:when test="$eixo_filho != ''">					
				<xsl:text>Map&lt;</xsl:text><xsl:value-of select="$type_filho"/><xsl:text>, LongSummaryStatistics&gt; value = </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.stream().collect(Collectors.groupingBy(e -> e.</xsl:text>
				<xsl:value-of select="$groupby"/><xsl:text>().get</xsl:text><xsl:value-of select="$value_filho"/><xsl:text>(), Collectors.summarizingLong(</xsl:text><xsl:value-of select="$daolow"/><xsl:text> -> </xsl:text><xsl:value-of select="$collecto_convert"/>	
				<xsl:text>)));</xsl:text>					
			</xsl:when>					
			<xsl:otherwise>					
				<xsl:text>Map&lt;</xsl:text><xsl:value-of select="$rowtypemap"/><xsl:text>, LongSummaryStatistics&gt; value = </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.stream().collect(Collectors.groupingBy(</xsl:text><xsl:value-of select="$dao"/>
				<xsl:text>::</xsl:text><xsl:value-of select="$groupby"/><xsl:text>, Collectors.summarizingLong(</xsl:text><xsl:value-of select="$daolow"/><xsl:text> -> </xsl:text><xsl:value-of select="$collecto_convert"/>	
				<xsl:text>)));</xsl:text>				
			</xsl:otherwise>				
		</xsl:choose>				
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>if(!</xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.isEmpty()){</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>
		<xsl:text>model.set</xsl:text><xsl:value-of select="$graficoup"/><xsl:text>(new ArrayList&lt;&gt;());</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>		
		<xsl:value-of select="$daolow"/><xsl:text>List.stream().forEach(</xsl:text><xsl:value-of select="$daolow"></xsl:value-of><xsl:text>->{</xsl:text>		
		<xsl:value-of select="$newlineTab3"></xsl:value-of>		
		<xsl:value-of select="$graficoup"/><xsl:text> c = new </xsl:text><xsl:value-of select="$graficoup"/><xsl:text>();</xsl:text>		
		<xsl:value-of select="$options"/>	
		<xsl:value-of select="$newlineTab3"/>		
		<xsl:text>model.get</xsl:text><xsl:value-of select="$graficoup"/><xsl:text>().add(c);</xsl:text>		
		<xsl:value-of select="$newlineTab2">		
		</xsl:value-of><xsl:text>});</xsl:text>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>}</xsl:text>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>}catch ( Exception e ) {</xsl:text>		
		<xsl:value-of select="$newlineTab2"></xsl:value-of>		
		<xsl:text>e.printStackTrace();</xsl:text>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>}</xsl:text> 		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
	</xsl:template>
		
	<!-- //////////////////////////////////////// EIXO X //////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.eixo_x" >		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='eixo']/block/field,'::')"/>	
		<xsl:variable name="eixo">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='eixo']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="eixo_convert">		
			<xsl:call-template name="convert_blocks">					
				<xsl:with-param name="daolow" select="daolow"></xsl:with-param>				
				<xsl:with-param name="value" select="$eixo"></xsl:with-param>				
				<xsl:with-param name="valueblock" select="valueblock"></xsl:with-param>				
				<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>				
				<xsl:with-param name="to" select="'String'"></xsl:with-param>				
				<xsl:with-param name="neto" select="neto"></xsl:with-param>				
				<xsl:with-param name="valuechild" select="value_namee"></xsl:with-param>				
				<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>				
				<xsl:with-param name="block_name" select="block_name"></xsl:with-param>				
			</xsl:call-template>					
		</xsl:variable>		
		<xsl:value-of select="$newlineTab3"></xsl:value-of>
		<xsl:text>c.setEixoX(</xsl:text><xsl:value-of select="$eixo_convert"/><xsl:text>);</xsl:text>		
	</xsl:template>
	
	<!-- //////////////////////////////////////// EIXO Y /////////////////////////////////////////////////////////////////// -->
		
	<xsl:template name="blockly.element.eixo_y" >		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='eixo']/block/field,'::')"/>		
		<xsl:variable name="block_check" select="../../../../../block/field[@name='3D']"/>		
		<xsl:variable name="z_exist" select ="next/block[@type='EixoZ']"/>	
		<xsl:variable name="eixo">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='eixo']"/>				
			</xsl:call-template>			
		</xsl:variable>					
		<xsl:variable name="eixo_convert">		
			<xsl:call-template name="convert_blocks">							
				<xsl:with-param name="daolow" select="daolow"></xsl:with-param>						
				<xsl:with-param name="value" select="$eixo"></xsl:with-param>						
				<xsl:with-param name="valueblock" select="valueblock"></xsl:with-param>					
				<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>						
				<xsl:with-param name="to" select="'String'"></xsl:with-param>						
				<xsl:with-param name="neto" select="neto"></xsl:with-param>						
				<xsl:with-param name="valuechild" select="value_namee"></xsl:with-param>						
				<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>						
				<xsl:with-param name="block_name" select="block_name"></xsl:with-param>						
			</xsl:call-template>							
		</xsl:variable>				
		<xsl:value-of select="$newlineTab3"></xsl:value-of>	
		<xsl:text>c.setEixoY(</xsl:text><xsl:value-of select="$eixo_convert"/><xsl:text>);</xsl:text>				
	</xsl:template>
	
	<!-- //////////////////////////////////////// EIXO Y_Z /////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.eixo_y_z" >
		<xsl:variable name="collector" select="field[@name='collectors']"/>	
		<xsl:variable name="collectorValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$collector"/>
			</xsl:call-template>
		</xsl:variable>	
		<xsl:variable name="eixo">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='eixo']"/>				
			</xsl:call-template>			
		</xsl:variable>				
		<xsl:value-of select="$newlineTab3"></xsl:value-of>		
		<xsl:text>c.setEixoY(value.get(</xsl:text><xsl:value-of select="$eixo"/><xsl:text>)</xsl:text><xsl:value-of select="$collectorValue"/><xsl:text>);</xsl:text>		
	</xsl:template>
	
	<!-- //////////////////////////////////////// EIXO Z /////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.eixo_z" >
		<xsl:variable name="collector" select="field[@name='collectors']"/>	
		<xsl:variable name="collectorValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$collector"/>
			</xsl:call-template>
		</xsl:variable>	
		<xsl:variable name="eixo">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='eixo']"/>				
			</xsl:call-template>			
		</xsl:variable>				
		<xsl:value-of select="$newlineTab3"></xsl:value-of>		
		<xsl:text>c.setEixoZ(value.get(</xsl:text><xsl:value-of select="$eixo"/><xsl:text>)</xsl:text><xsl:value-of select="$collectorValue"/><xsl:text>);</xsl:text>		
	</xsl:template>
		
</xsl:stylesheet>