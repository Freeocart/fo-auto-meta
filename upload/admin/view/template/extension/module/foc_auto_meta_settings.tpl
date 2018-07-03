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

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['product_title']; ?></label>
            <div class="col-sm-10">
              <textarea name="field_product_title" rows="3" class="form-control"><?php echo $fam_settings['product_title']; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['force_replace']; ?></label>
            <div class="col-sm-10">
              <input type="hidden" value="0" name="force_replace_product_title">
              <input type="checkbox" value="<?php echo $fam_settings['force_replace_product_title'] ?>" name="force_replace_product_title">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['product_description']; ?></label>
            <div class="col-sm-10">
              <textarea name="field_product_description" rows="3" class="form-control"><?php echo $fam_settings['product_description']; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['force_replace']; ?></label>
            <div class="col-sm-10">
              <input type="hidden" value="0" name="force_replace_product_description">
              <input type="checkbox" value="<?php echo $fam_settings['force_replace_product_description'] ?>" name="force_replace_product_description">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['category_title']; ?></label>
            <div class="col-sm-10">
              <textarea name="field_category_title" rows="3" class="form-control"><?php echo $fam_settings['category_title']; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['force_replace']; ?></label>
            <div class="col-sm-10">
              <input type="hidden" value="0" name="force_replace_category_title">
              <input type="checkbox" value="<?php echo $fam_settings['force_replace_category_title'] ?>" name="force_replace_category_title">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['category_description']; ?></label>
            <div class="col-sm-10">
              <textarea name="field_category_description" rows="3" class="form-control"><?php echo $fam_settings['category_description']; ?></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2"><?php echo $language['force_replace']; ?></label>
            <div class="col-sm-10">
              <input type="hidden" value="0" name="force_replace_category_description">
              <input type="checkbox" value="<?php echo $fam_settings['force_replace_category_description'] ?>" name="force_replace_category_description">
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>

</div>

<?php echo $footer; ?>