<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">

  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="foc_auto_meta_form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form id="foc_auto_meta_form" class="form form-horizontal" action="<?php $action; ?>" method="POST">

          <ul class="nav nav-tabs">
            <?php foreach ($languages as $language) : ?>
            <li <?php if ($language['language_id'] == $language_id) : ?>class="active"<?php endif; ?>>
              <a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            </li>
            <?php endforeach; ?>
          </ul>

          <div class="tab-content">
            <?php foreach ($languages as $language) : ?>
            <div class="tab-pane <?php if ($language['language_id'] == $language_id) : ?>active<?php endif; ?>" id="language<?php echo $language['language_id']; ?>">

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_home_title'] ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_home_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_home_title'] ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_home_description'] ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_home_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_home_description'] ?></textarea>
                </div>
              </div>

              <!-- product -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_product_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_product_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_product_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace']; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_product_title]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_product_title']): ?>checked<?php endif;?> name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_product_title]">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_product_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_product_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_product_description']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace']; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_product_description]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_product_description']): ?>checked<?php endif;?> name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_product_description]">
                </div>
              </div>

              <!-- category -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_category_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_category_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_category_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace']; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_category_title]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_category_title']): ?>checked<?php endif;?> name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_category_title]">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_category_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_category_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_category_description']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace']; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_category_description]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_category_description']): ?>checked<?php endif;?>  name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_force_replace_category_description]">
                </div>
              </div>

              <!-- information -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_information_title'] ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_information_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_information_title'] ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace'] ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_information_title]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_information_title']) : ?>checked<?php endif ?> name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_information_title]">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_information_description'] ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_information_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_information_description'] ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace'] ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_information_description]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_information_description']) : ?>checked<?php endif ?> name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_information_description]">
                </div>
              </div>

              <!-- brand -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_brand_title'] ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_brand_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_brand_title'] ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace'] ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_brand_title]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_brand_title']) : ?>checked<?php endif ?> name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_brand_title]">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_brand_description'] ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_brand_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_brand_description'] ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['force_replace'] ?></label>
                <div class="col-sm-10">
                  <input type="hidden" value="0" name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_brand_description]">
                  <input type="checkbox" value="1" <?php if ($fam_settings[$language['language_id']]['foc_auto_meta_force_replace_brand_description']) : ?>checked<?php endif ?> name="foc_auto_meta[<?php echo $language['language_id'] ?>][foc_auto_meta_force_replace_brand_description]">
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h4><?php echo $label_additional; ?></h4>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_contacts_page_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_contacts_page_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_contacts_page_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_contacts_page_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_contacts_page_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_contacts_page_description']; ?></textarea>
                </div>
              </div>

              <!-- shop reviews page -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_reviews_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_reviews_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_reviews_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_reviews_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_reviews_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_reviews_description']; ?></textarea>
                </div>
              </div>

              <!-- sitemap html -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_sitemap_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_sitemap_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_sitemap_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_sitemap_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_sitemap_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_sitemap_description']; ?></textarea>
                </div>
              </div>

              <!-- products_special -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_products_special_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_products_special_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_products_special_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_products_special_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_products_special_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_products_special_description']; ?></textarea>
                </div>
              </div>

              <!-- faq module -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_faq_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_faq_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_faq_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_faq_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_faq_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_faq_description']; ?></textarea>
                </div>
              </div>

              <!-- voucher -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_voucher_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_voucher_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_voucher_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_voucher_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_voucher_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_voucher_description']; ?></textarea>
                </div>
              </div>

              <!-- manufacturer -->
              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_manufacturer_title']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_manufacturer_title]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_manufacturer_title']; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-sm-2"><?php echo $labels['foc_auto_meta_manufacturer_description']; ?></label>
                <div class="col-sm-10">
                  <textarea name="foc_auto_meta[<?php echo $language['language_id']; ?>][foc_auto_meta_manufacturer_description]" rows="3" class="form-control"><?php echo $fam_settings[$language['language_id']]['foc_auto_meta_manufacturer_description']; ?></textarea>
                </div>
              </div>

            </div>
          <?php endforeach; ?>
          </div>
        </form>
      </div>
    </div>
  </div>

</div>

<?php echo $footer; ?>