<?php

class ModelExtensionModuleFocAutoMeta extends Model {

  const SETTINGS_GROUP = 'foc_auto_meta';
  const SETTINGS_GROUP_KEY = 'foc_auto_meta_data';

  public function defaultSettingsItem () {
    return array(
      self::SETTINGS_GROUP . '_product_title' => '',
      self::SETTINGS_GROUP . '_force_replace_product_title' => false,
      self::SETTINGS_GROUP . '_product_description' => '',
      self::SETTINGS_GROUP . '_force_replace_product_description' => false,
      self::SETTINGS_GROUP . '_category_title' => '',
      self::SETTINGS_GROUP . '_force_replace_category_title' => false,
      self::SETTINGS_GROUP . '_category_description' => '',
      self::SETTINGS_GROUP . '_force_replace_category_description' => false,
    );
  }

  public function defaultSettings () {
    $default = array();
    $this->load->model('localisation/language');

    $languages = $this->model_localisation_language->getLanguages();

    foreach ($languages as $language) {
      $default[$language['language_id']] = $this->defaultSettingsItem();
    }

    return $default;
  }

  public function install () {
    $this->load->model('setting/setting');
    $this->model_setting_setting->editSetting(self::SETTINGS_GROUP, array(
      self::SETTINGS_GROUP_KEY => $this->defaultSettings()
    ));
  }

  public function uninstall () {
    $this->load->model('setting/setting');
    $this->model_setting_setting->deleteSetting(self::SETTINGS_GROUP);
  }

  public function getSettings () {
    $this->load->model('setting/setting');
    $settings = $this->model_setting_setting->getSetting(self::SETTINGS_GROUP);

    if (is_null($settings) || !isset($settings[self::SETTINGS_GROUP_KEY])) {
      return $this->defaultSettings();
    }
    else {
      return $settings[self::SETTINGS_GROUP_KEY];
    }
  }

  public function saveSettings ($settings) {
    $this->load->model('setting/setting');
    $settings = array_replace($this->defaultSettings(), $settings);
    $this->model_setting_setting->editSettingValue(self::SETTINGS_GROUP, self::SETTINGS_GROUP_KEY, $settings);
  }
}