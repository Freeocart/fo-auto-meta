<?php

class ModelExtensionModuleFocAutoMeta extends Model {
  private const SETTINGS_GROUP = 'foc_auto_meta';

  public function defaultSettings () {
    return array(
      'product_title' => '',
      'product_description' => '',
      'category_title' => '',
      'category_description' => '',
      'force_replace' => false
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