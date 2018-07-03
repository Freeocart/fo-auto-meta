<?php

class ModelExtensionModuleFocAutoMeta extends Model {

  const SETTINGS_GROUP = 'foc_auto_meta';

  public function defaultSettings () {
    return array(
      'product_title' => '',
      'force_replace_product_title' => false,
      'product_description' => '',
      'force_replace_product_description' => false,
      'category_title' => '',
      'force_replace_category_title' => false,
      'category_description' => '',
      'force_replace_category_description' => false,
    );
  }

  public function install () {
    $this->load->model('setting/setting');
    $this->model_setting_setting->editSetting(self::SETTINGS_GROUP, $this->defaultSettings());
  }

  public function uninstall () {
    $this->load->model('setting/setting');
    $this->model_setting_setting->deleteSetting(self::SETTINGS_GROUP);
  }

  public function getSettings () {
    $this->load->model('setting/setting');
    $settings = $this->model_setting_setting->getSettingValue(self::SETTINGS_GROUP);

    if (is_null($settings)) {
      $settings = $this->defaultSettings();
    }

    return $settings;
  }

  public function saveSettings ($settings) {
    $this->load->model('setting/setting');
    $settings = array_replace($this->defaultSettings(), $settings);
    $this->model_setting_setting->editSetting(self::SETTINGS_GROUP, $settings);
  }
}