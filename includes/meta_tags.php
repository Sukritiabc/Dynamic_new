<?php
// SEO Meta Tags And Meta Description

function className_metatags()
{
    $current_url = pathinfo($_SERVER["PHP_SELF"]);
    $fileName = $current_url['filename'];

    if ($fileName == 'inner'):
        $className = 'Article';
        return $className;
        exit;
    endif;

    if ($fileName == 'career-form'):
        $className = 'vacency';
        return $className;
        exit;
    endif;

    if ($fileName == 'subpkgdetail'):
        $className = 'Subpackage';
        return $className;
        exit;
    endif;
    if ($fileName == 'conference_detail'):
        $className = 'Subpackage';
        return $className;
        exit;
    endif;

    if ($fileName == 'service_list'):
        $className = 'Services';
        return $className;
        exit;
    endif;
    if ($fileName == 'dining_list'):
        $className = 'Dining';
        return $className;
        exit;
    endif;
    if($fileName=='book'):
		$className = 'Offers';
		return $className;
		exit;
	endif;	

    if ($fileName != 'index'):
        $className = ucfirst(strtolower($fileName));
        return $className;
        exit;
    endif;

    return '';
}

function MetaTagsFor_SEO()
{

    $c_url = pathinfo($_SERVER["PHP_SELF"]);
    $chk = $c_url['filename'];
    $config = Config::find_by_id(1);
    $sitetitle = (!empty($config->meta_title) and $chk == 'index') ? $config->meta_title : $config->sitetitle;
    $keywords = $config->site_keywords;
    $description = $config->site_description;

    $addtitle = '';
    $class = className_metatags();

    // Transaction start
    if (isset($_REQUEST['slug']) and !empty($_REQUEST['slug'])) {
        if ($class == 'Global') {
            $nrec = Mlink::find_by_slug(addslashes($_REQUEST['slug']));
            if (!empty($nrec)) {
                $cls = new $nrec->mod_class;
                $rec = $cls->find_by_slug(addslashes($_REQUEST['slug']));
                if (!empty($rec)) {
                    $addtitle = !empty($rec->meta_title) ? $rec->meta_title : $rec->title;
                    if (!empty($rec->meta_keywords)) {
                        $keywords = $rec->meta_keywords;
                        $description = $rec->meta_description;
                    }
                }
            }
        } else {
            $cls = new $class;
            $rec = $cls->find_by_slug(addslashes($_REQUEST['slug']));
            if (!empty($rec)) {
                $addtitle = !empty($rec->meta_title) ? $rec->meta_title : $rec->title;
                if (!empty($rec->meta_keywords)) {
                    $keywords = $rec->meta_keywords;
                    $description = $rec->meta_description;
                }
            }
        }
    }

    if (isset($_REQUEST['id']) and !empty($_REQUEST['id'])) {
        $cls = new $class;
        $rec = $cls->find_by_id($_REQUEST['id']);
        if ($rec) {
            $addtitle = $rec->title;
        }
    }

    $altclass = !empty($class) ? $class : '';
    $addtitle = !empty($addtitle) ? $addtitle : $altclass;
    $addsep = !empty($addtitle) ? ' - ' : '';

    // $sociallinks = SocialNetworking::getSocialNetwork();
    // $sameas = '';
    // foreach ($sociallinks as $social) {
    //     if (end($sociallinks) === $social) {
    //         $sameas .= '"' . $social->linksrc . '"';
    //     } else {
    //         $sameas .= '"' . $social->linksrc . '",';
    //     }

    // }
    // $schema = '';
    // $schema .= '<script type="application/ld+json">
	// {
	// 	"@context": "http://schema.org/",
	// 	"@type": "Organization",
	// 	"headline": "' . $config->sitetitle . '|' . $config->sitename . '",
	// 	"keywords": "' . $config->site_keywords . '",
	// 	"description": "' . $config->site_description . '",
	// 	"url": "' . BASE_URL . '",
	// 	"sameAs": [
	// 				' . $sameas . '
	// 				],
	// 	"image": {
	// 	  "@type": "ImageObject",
	// 	  "height": "",
	// 	  "width": "",
	// 	  "url": "' . IMAGE_PATH . 'preference/' . $config->logo_upload . '"
	// 	},
	// 	"author": "' . $config->sitetitle . '",
	// 	"publisher": {
	// 	  "@type": "Organization",
	// 	  "logo": {
	// 		"@type": "ImageObject",
	// 		"url": "' . IMAGE_PATH . 'preference/' . $config->logo_upload . '"
	// 	  },
	// 	  "name": "' . $config->sitetitle . '|' . $config->sitename . '"
	//   }';
    // if (!empty($config->schema_code)) {
    //     $schema .= ',' . $config->schema_code;
    // }
    // $schema .= '}</script>';

    // $schema .= '<script type="text/javascript">
    //     !function(e,n){
    //         var t="bookingengine",o="integration",i=e[t]=e[t]||{},a=i[o]=i[o]||{},r="__cq",c="__loader",d="getElementsByTagName";
    //         if(n=n||[],a[r]=a[r]?a[r].concat(n):n,!a[c]){a[c]=!0;var l=e.document,g=l[d]("head")[0]||l[d]("body")[0];
    //         !function n(i){if(0!==i.length){var a=l.createElement("script");a.type="text/javascript",a.async=!0,a.src="https://"+i[0]+"/integration/loader.js",
    //         a.onerror=a.onload=function(n,i){return function(){e[t]&&e[t][o]&&e[t][o].loaded||(g.removeChild(n),i())}}(a,(function(){n(i.slice(1,i.length))})),g.appendChild(a)}}(
    //         ["np-ibe.hopenapi.com", "ibe.hopenapi.com", "ibe.behopenapi.com"])}
    //     }(window, [
    //         ["setContext", "BE-INT-templebellnepal-com_2025-06-17", "en"],
    //         ["embed", "booking-form", {
    //             container: "be-booking-form"
    //         }],
    //         ["embed", "search-form", {
    //             container: "be-search-form"
    //         }]
    //     ]);
    //     </script>';
// === Dynamic JSON-LD builder (replace your old $schema block with this) ===
$schemaGraph = [];

// 1) WebSite
$schemaGraph[] = [
  "@type" => "WebSite",
  "@id" => rtrim(BASE_URL, '/') . "#website",
  "url" => BASE_URL,
  "name" => $config->sitename
];

// 2) Organization
$sociallinks = SocialNetworking::getSocialNetwork();
$sameAs = [];
foreach ($sociallinks as $s) {
    if (!empty($s->linksrc)) $sameAs[] = $s->linksrc;
}
$org = [
  "@type" => "Organization",
  "@id" => rtrim(BASE_URL, '/') . "#organization",
  "name" => $config->sitename,
  "url" => BASE_URL,
  "logo" => IMAGE_PATH . 'preference/' . $config->logo_upload
];
if (!empty($sameAs)) $org['sameAs'] = $sameAs;
$schemaGraph[] = $org;

// 3) Determine real page class (handle Global via Mlink)
$class = className_metatags();
$slug = isset($_REQUEST['slug']) ? trim($_REQUEST['slug']) : '';
$mainClass = $class;
if (strtolower($class) === 'global' && !empty($slug)) {
    $mdata = Mlink::find_by_slug(addslashes($slug));
    if (!empty($mdata) && !empty($mdata->mod_class)) {
        $mainClass = $mdata->mod_class;
        if (empty($rec) && class_exists($mainClass)) {
            $tmp = new $mainClass;
            if (method_exists($tmp, 'find_by_slug')) {
                $rec = $tmp->find_by_slug(addslashes($slug));
            }
        }
    }
}

// 4) Map class to schema type and page kind
$mc = strtolower($mainClass);
$schemaType = 'WebPage';
$pageKind = 'general';

if (in_array($mc, ['article','blog','news'])) {
    $schemaType = 'Article';
    $pageKind = 'detail';
} elseif (in_array($mc, ['subpackage','product','offers'])) {
    $schemaType = 'Product';
    $pageKind = 'detail';
} elseif (in_array($mc, ['package','services','facilities','dining','rooms','gallery','news','packages'])) {
    $schemaType = 'CollectionPage';
    $pageKind = 'listing';
} else {
    if (in_array(strtolower($class), ['services','dining','rooms','gallery','news','packages'])) {
        $schemaType = 'CollectionPage';
        $pageKind = 'listing';
    } else {
        $schemaType = 'WebPage';
        $pageKind = 'general';
    }
}

// 5) Page-level schema
if ($pageKind === 'detail' && !empty($rec)) {
    $imageUrl = IMAGE_PATH . 'preference/' . ($config->fb_upload ?: $config->logo_upload);

    if (!empty($rec->banner_image)) {
        $imgs = @unserialize($rec->banner_image);
        if ($imgs && !empty($imgs[0]) && file_exists(SITE_ROOT . 'images/package/banner/' . $imgs[0])) {
            $imageUrl = IMAGE_PATH . 'package/banner/' . $imgs[0];
        }
    } elseif (!empty($rec->image)) {
        $imgs = @unserialize($rec->image);
        if ($imgs && !empty($imgs[0]) && file_exists(SITE_ROOT . 'images/articles/' . $imgs[0])) {
            $imageUrl = IMAGE_PATH . 'articles/' . $imgs[0];
        } elseif ($imgs && !empty($imgs[0]) && file_exists(SITE_ROOT . 'images/subpackage/' . $imgs[0])) {
            $imageUrl = IMAGE_PATH . 'subpackage/' . $imgs[0];
        }
    } elseif (!empty($rec->list_image) && file_exists(SITE_ROOT . 'images/offers/listimage/' . $rec->list_image)) {
        $imageUrl = IMAGE_PATH . 'offers/listimage/' . $rec->list_image;
    }

    $pageObj = [
        "@type" => $schemaType,
        "@id" => rtrim(BASE_URL, '/') . "#webpage",
        "name" => $rec->title ?? $addtitle ?? $config->sitename,
        "headline" => $rec->title ?? null,
        "description" => $rec->meta_description ?? $description,
        "image" => [$imageUrl],
        "url" => rtrim(BASE_URL, '/') . $_SERVER['REQUEST_URI']
    ];
    if (!empty($rec->added_date)) $pageObj['datePublished'] = date('c', strtotime($rec->added_date));
    if (!empty($rec->updated_date)) $pageObj['dateModified'] = date('c', strtotime($rec->updated_date));

    $schemaGraph[] = array_filter($pageObj, fn($v) => $v !== null && $v !== '');
}
elseif ($pageKind === 'listing') {
    $schemaGraph[] = [
        "@type" => "CollectionPage",
        "@id" => rtrim(BASE_URL, '/') . "#webpage",
        "name" => $addtitle ?: $config->sitename,
        "description" => $description,
        "url" => rtrim(BASE_URL, '/') . $_SERVER['REQUEST_URI']
    ];
}
else {
    $schemaGraph[] = [
        "@type" => "WebPage",
        "@id" => rtrim(BASE_URL, '/') . "#webpage",
        "name" => $addtitle ?: $config->sitename,
        "description" => $description,
        "url" => rtrim(BASE_URL, '/') . $_SERVER['REQUEST_URI']
    ];
}

// 6) Final JSON-LD output
$schema = '<script type="application/ld+json">' . "\n" .
          json_encode([
              "@context" => "https://schema.org",
              "@graph" => $schemaGraph
          ], JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) .
          "\n</script>";








    $seoSources = '<title>' . $addtitle . $addsep . $sitetitle . '</title>' . "\n";
    $seoSources .= '<meta charset="utf-8">' . "\n";
    $seoSources .= '<meta http-equiv="X-UA-Compatible" content="IE=edge">' . "\n";
    $seoSources .= '<meta name="viewport" content="width=device-width, initial-scale=1">' . "\n";
    $seoSources .= '<meta name="robots" content="index,follow">' . "\n";
    $seoSources .= '<meta name="Googlebot" content="index, follow"/>' . "\n";
    $seoSources .= '<meta name="distribution" content="Global">' . "\n";
    $seoSources .= '<meta name="revisit-after" content="2 Days" />' . "\n";
    $seoSources .= '<meta name="classification" content="Hotel, Hotels in Nepal" />' . "\n";
    $seoSources .= '<meta name="category" content="Hotel, Hotels in Nepal" />' . "\n";
    $seoSources .= '<meta name="language" content="en-us" />' . "\n";
    $seoSources .= '<meta name="keywords" content="' . $keywords . '">' . "\n";
    $seoSources .= '<meta name="description" content="' . $description . '">' . "\n";
    $seoSources .= '<meta name="author" content="Longtail-e-media">' . "\n\n";

    //Facebook and twitter sharing
    $seoSources .= '<meta property="og:title" content="' . $sitetitle . '">' . "\n";
    $seoSources .= '<meta property="og:description" content="' . $description . '">' . "\n";
    if (isset($_REQUEST['slug']) and !empty($_REQUEST['slug'])) {
        if ($class == 'Global') {
            $nrec = Mlink::find_by_slug(addslashes($_REQUEST['slug']));
            if (!empty($nrec)) {
                $cls = new $nrec->mod_class;
                $classname = $nrec->mod_class;
                
                if ($classname == 'Article') {
                    $rec = $cls->find_by_slug(addslashes($_REQUEST['slug']));
                    if (!empty($rec)) {
                        $images = unserialize($rec->image);
                        if (!empty($images)) {
                            $img = $images[0];
                            $imagePath = SITE_ROOT . 'images/articles/' . $img;
                            if (file_exists($imagePath)) {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'articles/' . $img . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'articles/' . $img . '">' . "\n";
                            } else {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                            }
                        } else {
                            $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                        }
                    } else {
                        $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                        $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                    }
                }
                if ($classname == 'Package') {
                    $rec = $cls->find_by_slug(addslashes($_REQUEST['slug']));
                    if (!empty($rec)) {
                        $images = unserialize($rec->banner_image);
                        if (!empty($images)) {
                            $img = $images[0];
                            $imagePath = SITE_ROOT . 'images/package/banner/' . $img;
                            if (file_exists($imagePath)) {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'package/banner/' . $img . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'package/banner/' . $img . '">' . "\n";
                            } else {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                            }
                        } else {
                            $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                        }
                    } else {
                        $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                        $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                    }
                }
                if ($classname == 'Subpackage') {
                    $rec = $cls->find_by_slug(addslashes($_REQUEST['slug']));
                    if (!empty($rec)) {
                        $images = unserialize($rec->image);
                        if (!empty($images)) {
                            $img = $images[0];
                            $imagePath = SITE_ROOT . 'images/subpackage/' . $img;
                            if (file_exists($imagePath)) {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'subpackage/' . $img . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'subpackage/' . $img . '">' . "\n";
                            } else {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                            }
                        } else {
                            $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                        }
                    } else {
                        $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                        $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                    }
                }
                    
                if ($classname == 'offers') {
                    $rec = $cls->find_by_slug(addslashes($_REQUEST['slug']));
                    
                    if (!empty($rec)) {
                        $images = unserialize($rec->image);
                        if (!empty($images)) {
                            $img = $images[0];
                            $imagePath = SITE_ROOT . 'images/subpackage/' . $img;
                            if (file_exists($imagePath)) {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'subpackage/' . $img . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'subpackage/' . $img . '">' . "\n";
                            } else {
                                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                            }
                        } else {
                            $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                        }
                    } else {
                        $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                        $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
                    }
                }
            } else {
                $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
                $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
            }
        }elseif($class == 'Offers'){
            $offers = Offers::find_by_slug(addslashes($_REQUEST['slug']));
            // pr($offers);
            
           $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'offers/listimage/' . $offers->list_image . '">' . "\n";
            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'offers/listimage/' . $offers->list_image . '">' . "\n";
        }
         elseif($class == 'Blog'){
            $offers = Blog::find_by_slug(addslashes($_REQUEST['slug']));
            // pr($offers);
            
           $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'blog/' . $offers->image . '">' . "\n";
            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'blog/' . $offers->image . '">' . "\n";
            $seoSources .= '<meta property="og:title" content="' . $offers->title . '">' . "\n";
        }
         else {
            $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
            $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
        }
    } else {
        $seoSources .= '<meta property="og:image" content="' . IMAGE_PATH . 'preference/' . $config->fb_upload . '">' . "\n";
        $seoSources .= '<meta property="twitter:image" content="' . IMAGE_PATH . 'preference/' . $config->twitter_upload . '">' . "\n";
    }

    $tot = strlen(SITE_FOLDER) + 1;
    $data = substr($_SERVER['REQUEST_URI'], $tot);
    $seoSources .= '<meta property="og:url" content="' . BASE_URL . $data . '">' . "\n";
    $seoSources .= '<meta property="og:type" content="website">' . "\n";
    $seoSources .= '<meta property="twitter:card" content="summary_large_image">' . "\n\n";
//    $seoSources .= '<link rel="canonical" href="' . curPageURL() . '" />' . "\n";

    $seoSources .= '<base url="' . BASE_URL . '"/>' . "\n";
    $seoSources .= $config->google_anlytics . "\n";
    $seoSources .= $schema . "\n";
    $seoSources .= $config->headers . "\n";

    return $seoSources;
}

?>
