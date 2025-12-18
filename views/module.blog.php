<?php
$bl =  '';

if (defined('BLOG_PAGE')) {
    $record = Blog::get_allblog();
    $linkTarget='';
    $pagelink='';
    if (!empty($record)) {
        
        
            $bl .= '
            <div class="banner-header section-padding valign  bg-darkbrown1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center caption mt-90">
                    <h1>Our Blog</h1>
                </div>
            </div>
        </div>
    </div>
<section class="news section-padding">
        <div class="container">
            <div class="row">
        
                ';
        
            foreach ($record as $homebl) {
            
           if(!empty($homebl->linksrc)){
            // $pagelink = ($homebl->linktype == 1) ? ' target="_blank" rel="noreferrer" ' : '';
            $linkTarget = ($homebl->linktype == 1) ? ' target="_blank" rel="noreferrer" ' : '';
                $linksrc = ($homebl->linktype == 1) ? $homebl->linksrc : BASE_URL.$homebl->linksrc;
           }
           else{
                $linksrc= BASE_URL. 'blog/'. $homebl->slug;
           }
           $bl .='
           <div class="col-md-4">
                    <div class="item">
                        <div class="position-re o-hidden"> 
                            <img src="' . IMAGE_PATH . 'blog/' . $homebl->image . '" alt="' . $homebl->title . '">
                        </div>
                        <div class="con position-re">
                            <h5><a href="'.$linksrc.'" '.$linkTarget.'>' . $homebl->title . '</a></h5>
                            <div class="date">
                                <a href="#"> <span>' . date("M", strtotime($homebl->blog_date)) . '</span> <i>' . date("d", strtotime($homebl->blog_date)) . '</i> <span>' . date("y", strtotime($homebl->blog_date)) . '</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                  
           ';
        }
        $bl.='  </div>
        </div>
    </section>';
    } else {
        redirect_to(BASE_URL);
    }
}
$jVars['module:bloglist'] = $bl;
$linkTarget='';
$homebloglist = '';
$homeblogs ='';
if (defined('HOME_PAGE')) {
    $homeblog = Blog:: get_latestblog_by(3);
    // $homeblogs = Blog:: get_latestblog_by(3);
    if (!empty($homeblog)) {
       
        
        foreach ($homeblog as $homebl) {
            
           if(!empty($homebl->linksrc)){
            // $pagelink = ($homebl->linktype == 1) ? ' target="_blank" rel="noreferrer"' : '';
            $linkTarget = ($homebl->linktype == 1) ? ' target="_blank" rel="noreferrer"' : '';
                $linksrc = ($homebl->linktype == 1) ? $homebl->linksrc : BASE_URL.$homebl->linksrc;
           }
           else{
                $linksrc=  BASE_URL. 'blog/' .$homebl->slug;
           }
           $homebloglist .='

           <div class="item">
                            <div class="position-re o-hidden"> <img src="' . IMAGE_PATH . 'blog/' . $homebl->image . '" alt="blog_image">
                                </div>
                            <div class="con position-re">
                                <h5><a href="'.$linksrc.'" '.$linkTarget.'>' . $homebl->title . '</a></h5>
                                <div class="date">
                                    <a href="'.$linksrc.'" '.$linkTarget.'> <span>' . date('M', strtotime($homebl->blog_date)) . '</span> <i>' . date('d', strtotime($homebl->blog_date)) . '</i> <span>' . date('Y', strtotime($homebl->blog_date)) . '</span></a>
                                </div>
                            </div>
                        </div>

 
                  
           ';
        }
        $homeblogs='   <section class="news section-padding news-image">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-30 text-center">
                    <div class="section-subtitle">Blog</div>
                    <div class="section-title">Latest News</div>
                </div>
            </div>
             <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel owl-theme">
                '.$homebloglist.'
                 </div>
                </div>
            </div>
        </div>
    </section>
        ';
    }
}

$jVars['module:homebloglist'] = $homeblogs;

$blog_detail = $recent_posts = '';
if (defined("BLOG_PAGE") ) {
    $slug = !empty($_REQUEST['slug']) ? $_REQUEST['slug'] : '';
    $Blogs = Blog::find_by_slug($slug);
    // pr($Blogs);
   

    if (!empty($slug)) {
        $blog_detail .= '
        <div class="banner-header section-padding valign bg-img bg-position-bottom" data-overlay-dark="5" data-background="'.IMAGE_PATH.'blog/banner/' . $Blogs->banner_image . '">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-left caption mt-90">
                    <h1>' . $Blogs->title . '</h1>
                    <div class="post">
                        <div class="author"> <img src="'.BASE_URL.'template/web/img/favicon.png" alt="blog_image" class="avatar"> <span>' . $Blogs->title . '</span> </div>
                        <div class="date-comment"> <i class="ti-calendar"></i> ' . date('d M y', strtotime($Blogs->blog_date)) . ' </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       
        
               ';
        
        $blog_detail .= '
           <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12"> 
                    <img src="' . IMAGE_PATH . 'blog/' . $Blogs->image . '" class="mb-30" alt="blog_image">
                    <div class="row share3">
                        <div class="col-md-8">
                            <h2>' . $Blogs->title . '</h2>
                        </div>
                        <div class="col-md-4">
                            <ul class="text-end">
                                <li>Share:</li>
                                <li><a href="https://www.linkedin.com/sharing/share-offsite/?url=' . urlencode(BASE_URL . "blog/" . $Blogs->slug) . '" data-toggle="tooltip" data-placement="top" title="LinkedIn" target="_blank" rel="noreferrer"><i class="fa-brands fa-linkedin"></i></a></li>
                                <li><a href="http://www.facebook.com/share.php?u=' . urlencode(BASE_URL . "blog/" . $Blogs->slug) . '&caption=' . urlencode($Blogs->title) . '&description=' . urlencode(strip_tags(substr($Blogs->content, 0, 150))) . '&picture=' . urlencode(IMAGE_PATH . "blog/" . $Blogs->image) . '" data-toggle="tooltip" data-placement="top" title="Facebook" target="_blank" rel="noreferrer"><i class="ti-facebook"></i></a></li>
                                <li><a href="https://www.pinterest.com/pin/create/button/?url=' . urlencode(BASE_URL . "blog/" . $Blogs->slug) . '&media=' . urlencode(IMAGE_PATH . "blog/" . $Blogs->image) . '&description=' . urlencode(strip_tags(substr($Blogs->content, 0, 150))) . '" data-toggle="tooltip" data-placement="top" title="Pinterest" target="_blank" rel="noreferrer"><i class="ti-pinterest"></i></a></li>
                                <li><a href="https://twitter.com/share?url=' . urlencode(BASE_URL . "blog/" . $Blogs->slug) . '&text=' . urlencode($Blogs->title) . '" data-toggle="tooltip" data-placement="top" title="Twitter" target="_blank" rel="noreferrer"><i class="ti-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    ' . $Blogs->content . '
                </div>


                    

   ';
                                
$blog_detail .='<div class="col-lg-4 col-md-12">
                    <div class="news2-sidebar row">';
        $recents = Blog::get_latestblog_by(3);
        if (!empty($recents)) {
            $blog_detail .='  <div class="col-md-12">
                            <div class="widget">
                                <div class="widget-title">
                                    <h6>Recent Posts</h6>
                                </div>
                                <ul class="recent">';
            foreach ($recents as $recent) {
                if ($recent->title != $Blogs->title) {
                    $blog_detail .= '
                    <li>
                        <div class="thum"> 
                        <img src="' . IMAGE_PATH . 'blog/' . $recent->image . '" alt="blog_imnage"> 
                        </div> 
                        <a href="' . BASE_URL . 'blog/' . $recent->slug . '">' . $recent->title . '</a>
                    </li>
                                    
                    
                 ';
                }
                
            }
            $blog_detail .= '
                </ul>
                            </div>
                        </div>';       
            }
            $blog_detail .= '
          <!-- Contact Form -->
                        <div class="col-lg-12 col-md-12 mb-30">
                            <div class="widget widget2">
                                <h5 class="mb-30">Leave a Comment</h5>
                                <form id="contactform" class="row">
                                <input type="hidden" name="blogname" value=" ' . $Blogs->title . '"/>
                                    <div class="col-md-12">
                                        <input type="text" name="name" id="name" placeholder="Full Name *" required="">
                                    </div>
                                    <div class="col-md-12">
                                        <input type="email" name="email" id="email" placeholder="Email Address *" required="">
                                    </div>
                                    <div class="col-md-12">
                                        <textarea name="message" id="message" cols="40" rows="4" placeholder="Your Comment *" required=""></textarea>
                                    </div>
                                    <div id="result_msg"></div>
                                    <div class="col-md-12">
                                        <button type="submit" id="submit" class="butn-dark2" style="margin-top:15px;"><span>Send Comment</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>';
    } else {
       $blog_detail .= '

    <div class="banner-header section-padding valign bg-darkbrown1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center caption mt-90">
                    <h1>Our Blog</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="news section-padding">
        <div class="container">
            <div class="row">
';

$page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"]))? $_REQUEST["pageno"] : 1;
$year = (isset($_REQUEST["year"]) and !empty($_REQUEST["year"])) ? $_REQUEST["year"] : "";

if (!empty($year)) {
    $sql = "SELECT * FROM tbl_blog WHERE status='1' AND YEAR(news_date) = " . $year . " ORDER BY news_date DESC";
} else {
    $sql = "SELECT * FROM tbl_blog WHERE status='1' ORDER BY blog_date DESC";
}
$limit = 3;
$total = $db->num_rows($db->query($sql));
$startpoint = ($page * $limit) - $limit; 
$sql.=" LIMIT ".$startpoint.",".$limit;
$query = $db->query($sql);
$Blogs=Blog::find_by_sql($sql);

foreach ($Blogs as $homebl) {
    if(!empty($homebl->linksrc)){
        $linkTarget = ($homebl->linktype == 1) ? ' target="_blank" rel="noreferrer"' : '';
        $linksrc = ($homebl->linktype == 1) ? $homebl->linksrc : BASE_URL.$homebl->linksrc;
    } else {
        $linksrc= BASE_URL. 'blog/'. $homebl->slug;
    }
$blog_ids[] = $homebl->id;
    $blog_detail .='
    <div class="col-md-4">
                    <div class="item">
                        <div class="position-re o-hidden"> <img src="' . IMAGE_PATH . 'blog/' . $homebl->image . '" alt="home_image">
                            </div>
                        <div class="con position-re">
                            <h5><a href="'.BASE_URL.'blog/' . $homebl->slug . '">' . $homebl->title . '</a></h5>
                            <div class="date">
                                <a href="'.BASE_URL.'blog/' . $homebl->slug . '"> <span>' . date("M", strtotime($homebl->blog_date)) . '</span> <i>' . date("d", strtotime($homebl->blog_date)) . '</i> <span>' . date("Y", strtotime($homebl->blog_date)) . '</span></a>
                            </div>
                        </div>
                    </div>
                </div>

    ';
}

$blog_detail .= get_front_pagination($total, $limit, $page, BASE_URL . 'blog');



$blog_detail .= '
          </div>
        </div>
    </section>
';

    
    }
}


$jVars['module:blog-detail'] = $blog_detail;
$jVars['module:blog-recent-posts'] = $recent_posts;


?>