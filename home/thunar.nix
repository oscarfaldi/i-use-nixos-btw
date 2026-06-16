{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    xfce.thunar
  ];

  # Using declarative scheme for XML and forcing it to not get overwritten by xfconfd
  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml" = {
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <channel name="thunar" version="1.0">
        <property name="last-view" type="string" value="ThunarDetailsView"/>
        <property name="last-icon-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_50_PERCENT"/>
        <property name="last-details-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_38_PERCENT"/>
        <property name="last-show-hidden" type="bool" value="true"/>
        <property name="last-location-bar" type="string" value="ThunarLocationButtons"/>
        <property name="shortcuts-icon-size" type="string" value="THUNAR_ICON_SIZE_24"/>
        <property name="tree-icon-size" type="string" value="THUNAR_ICON_SIZE_16"/>
        <property name="shortcuts-icon-emblems" type="bool" value="true"/>
        <property name="misc-thumbnail-mode" type="string" value="THUNAR_THUMBNAIL_MODE_ALWAYS"/>
        <property name="misc-date-style" type="string" value="THUNAR_DATE_STYLE_LONG"/>
        <property name="misc-single-click" type="bool" value="false"/>
        <property name="misc-directory-specific-settings" type="bool" value="true"/>
        <property name="misc-image-preview-mode" type="string" value="THUNAR_IMAGE_PREVIEW_MODE_EMBEDDED"/>
        <property name="misc-symbolic-icons-in-sidepane" type="bool" value="false"/>
        <property name="misc-middle-click-in-tab" type="bool" value="false"/>
        <property name="misc-open-new-window-as-tab" type="bool" value="false"/>
        <property name="misc-transfer-use-partial" type="string" value="THUNAR_USE_PARTIAL_MODE_NEVER"/>
      </channel>
    '';
    force = true; 
  };
}
