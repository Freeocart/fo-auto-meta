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
      self::SETTINGS_GROUP . '_information_title' => '',
      self::SETTINGS_GROUP . '_force_replace_information_title' => false,
      self::SETTINGS_GROUP . '_information_description' => '',
      self::SETTINGS_GROUP . '_force_replace_information_description' => false,
      // customize seo metatags on non-editable pages
      self::SETTINGS_GROUP . '_contacts_page_title' => '',
      self::SETTINGS_GROUP . '_contacts_page_description' => '',
      self::SETTINGS_GROUP . '_manufacturer_title' => '',
      self::SETTINGS_GROUP . '_manufacturer_description' => '',
      self::SETTINGS_GROUP . '_reviews_title' => '',
      self::SETTINGS_GROUP . '_reviews_description' => '',
      self::SETTINGS_GROUP . '_sitemap_title' => '',
      self::SETTINGS_GROUP . '_sitemap_description' => '',
      self::SETTINGS_GROUP . '_products_special_title' => '',
      self::SETTINGS_GROUP . '_products_special_description' => '',
      self::SETTINGS_GROUP . '_voucher_title' => '',
      self::SETTINGS_GROUP . '_voucher_description' => '',
      self::SETTINGS_GROUP . '_faq_title' => '',
      self::SETTINGS_GROUP . '_faq_description' => ''
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
      return array_replace_recursive($this->defaultSettings(), $settings[self::SETTINGS_GROUP_KEY]);
    }
  }

  public function saveSettings ($settings) {
    $this->load->model('setting/setting');
    $settings = array_replace_recursive($this->defaultSettings(), $settings);
    $this->model_setting_setting->editSettingValue(self::SETTINGS_GROUP, self::SETTINGS_GROUP_KEY, $settings);
  }
}