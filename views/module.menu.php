<?php
$result = '';

$menuRec = Menu::getMenuByParent(0, 1);

$current_url = $_SERVER["REQUEST_URI"];
$data = explode('/', $current_url);

if ($menuRec):
    $result .= '<ul class="navbar-nav m-auto">';
    foreach ($menuRec as $menuRow):
        $linkActive = $PlinkActive = '';
        $tot = strlen(SITE_FOLDER) + 1;
        $data = substr($_SERVER['REQUEST_URI'], $tot);
        

        if (!empty($data)):
            $linkActive = ($menuRow->linksrc == $data) ? " active " : "";
            $parentInfo = Menu::find_by_linksrc($data);
            if ($parentInfo):
                $PlinkActive = ($menuRow->id == $parentInfo->parentOf) ? " active " : "";
            endif;
        endif;

        $menusubRec = Menu::getMenuByParent($menuRow->id, 1);
        $subclass = !empty($menusubRec) ? 'nav-item dropdown' : 'nav-item';
        $classLink = !empty($menusubRec) ? 'nav-link dropdown-toggle' : 'nav-link';
        $chkchild = !empty($menusubRec) ? '<i class="ti-angle-down"></i>' : '';
        $attributechild = !empty($menusubRec) ? 'role="button"  aria-expanded="false"' : '';
        $drop1 = !empty($menusubRec) ? '' : '';
        $result .=  '<li class="'.$subclass.'">';
        $result .= getMenuList($menuRow->name, $menuRow->linksrc, $menuRow->linktype, $linkActive . $PlinkActive . $classLink, $chkchild,$attributechild);
        /* Second Level Menu */
        if ($menusubRec):
            $result .= '<ul class="dropdown-menu">';
            foreach ($menusubRec as $menusubRow):
                $menusub2Rec = Menu::getMenuByParent($menusubRow->id, 1);
                $chkparent2 = (!empty($menusub2Rec)) ? 'nav-link dropdown-toggle' : 'dropdown-item';
                $drop2 = !empty($menusub2Rec) ? 'nav-item dropdown' : 'nav-item';
                $result .= '<li>';
                $result .= getMenuListchild($menusubRow->name, $menusubRow->linksrc, $menusubRow->linktype, $chkparent2, '');
                /* Third Level Menu */
                if ($menusub2Rec):
                    $result .= '<ul class="dropdown-menu">';
                    foreach ($menusub2Rec as $menusub2Row):
                        $menusub3Rec = Menu::getMenuByParent($menusub2Row->id, 1);
                        $chkparent3 = (!empty($menusub3Rec)) ? '' : '';
                        $drop3 = !empty($menusub3Rec) ? 'class="dropdown"' : '';
                        $result .= '<li ' . $drop3 . '>';
                        $result .= getMenuList($menusub2Row->name, $menusub2Row->linksrc, $menusub2Row->linktype, '', $chkparent3);
                        /* Fourth Level Menu */
                        if ($menusub3Rec):
                            $result .= '<ul class="dropdown-menu">';
                            foreach ($menusub3Rec as $menusub3Row):
                                $menusub4Rec = Menu::getMenuByParent($menusub3Row->id, 1);
                                $chkparent4 = (!empty($menusub4Rec)) ? 1 : 0;
                                $result .= '<li id="menu-item-' . $menusub2Row->id . '">';
                                $result .= getMenuList($menusub3Row->name, $menusub3Row->linksrc, $menusub3Row->linktype, '', $chkparent4);
                                /* Fifth Level Menu */
                                if ($menusub4Rec):
                                    $result .= '<ul>';
                                    foreach ($menusub4Rec as $menusub4Row):
                                        $menusub5Rec = Menu::getMenuByParent($menusub4Row->id, 1);
                                        $chkparent5 = (!empty($menusub4Rec)) ? 1 : 0;
                                        $result .= '<li>' . getMenuList($menusub4Row->name, $menusub4Row->linksrc, $menusub4Row->linktype, $chkparent5) . '</li>';
                                    endforeach;
                                    $result .= '</ul>';
                                endif;
                                $result .= '</li>';
                            endforeach;
                            $result .= '</ul>';
                        endif;
                        $result .= '</li>';
                    endforeach;
                    $result .= '</ul>';
                endif;
                $result .= '</li>';
            endforeach;
            $result .= '
            </ul>
            ';
        endif;
        $result .= '</li>';
    endforeach;
    $result .= '</ul>';
endif;

$jVars['module:res-menu'] = $result;






$result = '';

$menuRec = Menu::getMenuByParent(0, 1);

$current_url = $_SERVER["REQUEST_URI"];
$data = explode('/', $current_url);

if ($menuRec):
    $result .= '<ul class="nav gap-4 fs-5" id="responsive-menu">';
    foreach ($menuRec as $menuRow):
        $linkActive = $PlinkActive = '';
        $tot = strlen(SITE_FOLDER) + 2;
        $data = substr($_SERVER['REQUEST_URI'], $tot);

        if (!empty($data)):
            $linkActive = ($menuRow->linksrc == $data) ? " active" : "";
            $parentInfo = Menu::find_by_linksrc($data);
            if ($parentInfo):
                $PlinkActive = ($menuRow->id == $parentInfo->parentOf) ? " active" : "";
            endif;
        endif;

        $menusubRec = Menu::getMenuByParent($menuRow->id, 1);
        $subclass = ($menusubRec) ? ' submenu dropdown ' : '';
        $classLink = !empty($menusubRec) ? ' dropdown-toggle' : '';
        $chkchild = !empty($menusubRec) ? ' data-bs-toggle="dropdown" role="button" ' : ' role="button" aria-haspopup="true" aria-expanded="false" ';
        $drop1 = !empty($menusubRec) ? ' <i class=icon-down-open-mini></i>' : '';
        $result .= '<li class="'. $subclass .$linkActive . $PlinkActive.' ">';
        $result .= getMenuList($menuRow->name, $menuRow->linksrc, $menuRow->linktype, $linkActive . $PlinkActive . $classLink, $chkchild);
        /* Second Level Menu */
        if ($menusubRec):
            $result .= '<ul class="dropdown-menu">';
            foreach ($menusubRec as $menusubRow):
                $menusub2Rec = Menu::getMenuByParent($menusubRow->id, 1);
                $chkparent2 = (!empty($menusub2Rec)) ? 1 : 0;
                $drop2 = !empty($menusub2Rec) ? 'class="dropdown"' : '';
                $result .= '<li>';
                $result .= getMenuList($menusubRow->name, $menusubRow->linksrc, $menusubRow->linktype, '', $chkparent2);
                /* Third Level Menu */
                if ($menusub2Rec):
                    $result .= '<ul class="dropdown-menu">';
                    foreach ($menusub2Rec as $menusub2Row):
                        $menusub3Rec = Menu::getMenuByParent($menusub2Row->id, 1);
                        $chkparent3 = (!empty($menusub3Rec)) ? 1 : 0;
                        $drop3 = !empty($menusub3Rec) ? 'class="dropdown"' : '';
                        $result .= '<li id="menu-item-' . $menusub2Row->id . '" ' . $drop3 . '>';
                        $result .= getMenuList($menusub2Row->name, $menusub2Row->linksrc, $menusub2Row->linktype, '', $chkparent3);
                        /* Fourth Level Menu */
                        if ($menusub3Rec):
                            $result .= '<ul class="dropdown-menu">';
                            foreach ($menusub3Rec as $menusub3Row):
                                $menusub4Rec = Menu::getMenuByParent($menusub3Row->id, 1);
                                $chkparent4 = (!empty($menusub4Rec)) ? 1 : 0;
                                $result .= '<li id="menu-item-' . $menusub2Row->id . '">';
                                $result .= getMenuList($menusub3Row->name, $menusub3Row->linksrc, $menusub3Row->linktype, '', $chkparent4);
                                /* Fifth Level Menu */
                                if ($menusub4Rec):
                                    $result .= '<ul>';
                                    foreach ($menusub4Rec as $menusub4Row):
                                        $menusub5Rec = Menu::getMenuByParent($menusub4Row->id, 1);
                                        $chkparent5 = (!empty($menusub4Rec)) ? 1 : 0;
                                        $result .= '<li>' . getMenuList($menusub4Row->name, $menusub4Row->linksrc, $menusub4Row->linktype, $chkparent5) . '</li>';
                                    endforeach;
                                    $result .= '</ul>';
                                endif;
                                $result .= '</li>';
                            endforeach;
                            $result .= '</ul>';
                        endif;
                        $result .= '</li>';
                    endforeach;
                    $result .= '</ul>';
                endif;
                $result .= '</li>';
            endforeach;
            $result .= '</ul>';
        endif;
        $result .= '</li>';
    endforeach;
    $result .= '</ul>';
endif;

$jVars['module:res-menu1'] = $result;


// Footer Menu List
$resfooter = '';
$FmenuRec = Menu::getMenuByParent(0, 2);
if ($FmenuRec):
    $resfooter .= '<ul class="footer-explore-list list-unstyled">';

    foreach ($FmenuRec as $FmenuRow):
        $resfooter .= '<li>';
        $resfooter .= getMenuList($FmenuRow->name, $FmenuRow->linksrc, $FmenuRow->linktype, '');
        $resfooter .= '</li>';
    endforeach;
    $resfooter .= '</ul>';
endif;


$jVars['module:footer-menu'] = $resfooter;

$result = '';

$menuRec = Menu::getMenuByParent(0, 3);

$current_url = $_SERVER["REQUEST_URI"];
$data = explode('/', $current_url);

if ($menuRec):
    $result .= '<h3 class="ul-footer-widget-title">RESOURCES</h3>

            <div class="ul-footer-widget-links">';
    foreach ($menuRec as $menuRow):
        $linkActive = $PlinkActive = '';
        $tot = strlen(SITE_FOLDER) + 2;
        $data = substr($_SERVER['REQUEST_URI'], $tot);

        if (!empty($data)):
            $linkActive = ($menuRow->linksrc == $data) ? "" : "";
            $parentInfo = Menu::find_by_linksrc($data);
            if ($parentInfo):
                $PlinkActive = ($menuRow->id == $parentInfo->parentOf) ? " " : "";
            endif;
        endif;

        $menusubRec = Menu::getMenuByParent($menuRow->id, 1);
        $subclass = ($menusubRec) ? ' submenu dropdown ' : '';
        $classLink = '';
        $chkchild = !empty($menusubRec) ? '1' : '';
        $drop1 = !empty($menusubRec) ? '' : '';
        $result .= '';
        $result .= getMenuFootList($menuRow->name, $menuRow->linksrc, $menuRow->linktype, $linkActive . $PlinkActive . $classLink, $chkchild);

        $result .= '';
    endforeach;
    $result .= '</div>';
endif;



$jVars['module:footer-menu1'] = $result;

//menu for uc
$result_uc = '';

$menuRec_uc = Menu::getMenuByParent(0, 1,1);

$current_url = $_SERVER["REQUEST_URI"];
$data = explode('/', $current_url);

if ($menuRec_uc):
    $result_uc .= '<ul>';
    foreach ($menuRec_uc as $key => $menuRec_uc):
        $linkActive = $PlinkActive = '';
        $tot = strlen(SITE_FOLDER) + 2;
        $data = substr($_SERVER['REQUEST_URI'], $tot);

        if (!empty($data)):
            $linkActive = ($menuRec_uc->linksrc == $data) ? " " : "";
            $parentInfo = Menu::find_by_linksrc($data);
            if ($parentInfo):
                $PlinkActive = ($menuRec_uc->id == $parentInfo->parentOf) ? " " : "";
            endif;
        endif;

        $hrefId = '#mod-about';  

        if ($menuRec_uc->name == 'Our Location'):
            $hrefId = '#mod-map';
        elseif ($menuRec_uc->name == 'Career'):
            $hrefId = '#mod-career';
        endif;

        $locationStyle = '';
        if ($menuRec_uc->name == 'Our Location'):
            $locationStyle = ' style="border-right: 1px solid #dfc175; color: white;"';
        endif;

        
        $menusubRec = Menu::getMenuByParent($menuRec_uc->id, 1);
        $subclass = ($menusubRec) ? 'menu-item menu-item-has-children' : ' ';
        $classLink = !empty($menusubRec) ? '' : '';
        $chkchild = !empty($menusubRec) ? ' ' : '';
        $drop1 = !empty($menusubRec) ? ' <i class=icon-down-open-mini></i>' : '';
        $result_uc .=  '<li class="'. $subclass .$linkActive . $PlinkActive.' ' . $classLink . ' imgclass'.$key.'"'.$locationStyle .'">
        <style>
            .imgclass'.$key.' a::before {
                width: 28px;
                height: 28px;
                line-height: 28px;
                background-image: url('.IMAGE_PATH.'menu/' . $menuRec_uc->image . ') !important;
                left: 24px;
                background-size: contain;
            }
        </style>
        ';
        $result_uc .= getMenuList($menuRec_uc->name, $menuRec_uc->linksrc, $menuRec_uc->linksrc, $menuRec_uc->linktype, $linkActive . $PlinkActive . $classLink, $chkchild);
        /* Second Level Menu */
        if ($menusubRec):
            $result_uc .= '<ul class="sub-menu">';
            foreach ($menusubRec as $menusubRow):
                $menusub2Rec = Menu::getMenuByParent($menusubRow->id, 1);
                $chkparent2 = (!empty($menusub2Rec)) ? 1 : 0;
                $drop2 = !empty($menusub2Rec) ? 'menu-item' : 'menu-item';
                $result_uc .= '<li class="'.$drop2.'">';
                $result_uc .= getMenuList($menusubRow->name, $menusubRow->linksrc, $menusubRow->linktype, 'dropdown-item', $chkparent2);
                /* Third Level Menu */
                if ($menusub2Rec):
                    $result_uc .= '<ul class="sub-menu">';
                    foreach ($menusub2Rec as $menusub2Row):
                        $menusub3Rec = Menu::getMenuByParent($menusub2Row->id, 1);
                        $chkparent3 = (!empty($menusub3Rec)) ? 1 : 0;
                        $drop3 = !empty($menusub3Rec) ? 'class="dropdown"' : '';
                        $result_uc .= '<li id="menu-item-' . $menusub2Row->id . '" ' . $drop3 . '>';
                        $result_uc .= getMenuList($menusub2Row->name, $menusub2Row->linksrc, $menusub2Row->linktype, '', $chkparent3);
                        /* Fourth Level Menu */
                        if ($menusub3Rec):
                            $result_uc .= '<ul class="dropdown-menu">';
                            foreach ($menusub3Rec as $menusub3Row):
                                $menusub4Rec = Menu::getMenuByParent($menusub3Row->id, 1);
                                $chkparent4 = (!empty($menusub4Rec)) ? 1 : 0;
                                $result_uc .= '<li id="menu-item-' . $menusub2Row->id . '">';
                                $result_uc .= getMenuList($menusub3Row->name, $menusub3Row->linksrc, $menusub3Row->linktype, '', $chkparent4);
                                /* Fifth Level Menu */
                                if ($menusub4Rec):
                                    $result_uc .= '<ul>';
                                    foreach ($menusub4Rec as $menusub4Row):
                                        $menusub5Rec = Menu::getMenuByParent($menusub4Row->id, 1);
                                        $chkparent5 = (!empty($menusub4Rec)) ? 1 : 0;
                                        $result_uc .= '<li>' . getMenuList($menusub4Row->name, $menusub4Row->linksrc, $menusub4Row->linktype, $chkparent5) . '</li>';
                                    endforeach;
                                    $result_uc .= '</ul>';
                                endif;
                                $result_uc .= '</li>';
                            endforeach;
                            $result_uc .= '</ul>';
                        endif;
                        $result_uc .= '</li>';
                    endforeach;
                    $result_uc .= '</ul>';
                endif;
                $result_uc .= '</li>';
            endforeach;
            $result_uc .= '</ul>';
        endif;
      
        
        $result_uc .= '</li>';
    endforeach;
    $result_uc .= '</ul>';
endif;

$jVars['module:res-menu-uc'] = $result_uc;

?>