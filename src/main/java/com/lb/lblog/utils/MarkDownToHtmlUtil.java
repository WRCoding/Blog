package com.lb.lblog.utils;

import org.commonmark.Extension;
import org.commonmark.ext.gfm.tables.TablesExtension;
import org.commonmark.node.Link;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.AttributeProvider;
import org.commonmark.renderer.html.AttributeProviderContext;
import org.commonmark.renderer.html.AttributeProviderFactory;
import org.commonmark.renderer.html.HtmlRenderer;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * markdown转HTML工具类
 * @author LB
 * @create 2019-07-21 9:51
 */
public class MarkDownToHtmlUtil {

    public static String mdToHtml(String articleContent){
        if(StringUtils.isEmpty(articleContent)){
            return "";
        }
        List<Extension> tableExtension = Arrays.asList(TablesExtension.create());
        Parser parser = Parser.builder().extensions(tableExtension).build();
        Node document = parser.parse(articleContent);
        HtmlRenderer renderer = HtmlRenderer.builder().extensions(tableExtension)
                .attributeProviderFactory(new AttributeProviderFactory() {
                    @Override
                    public AttributeProvider create(AttributeProviderContext context) {
                        return new CustomAttributeProvider();
                    }
                }).build();
        String content = renderer.render(document);
        return content;
    }

    static class CustomAttributeProvider implements AttributeProvider{

        @Override
        public void setAttributes(Node node, String tagName, Map<String, String> attributes) {
            if (node instanceof Link){
                attributes.put("target","_blank");
            }
        }
    }
}
