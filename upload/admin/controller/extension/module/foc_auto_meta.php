<?php

class ControllerExtensionModuleFocAutoMeta extends Controller {

  public function __construct ($registry) {
    $parentResult = parent::__construct($registry);
    $this->load->model('extension/module/foc_auto_meta');

    return $parentResult;
  }

  public function install () {
     // Remove unnecessary template version
     $templatePath = DIR_APPLICATION . 'view/template/extension/module/';
     $viewFile = 'foc_auto_meta_settings.twig';

     if ($this->isOpencart3()) {
       $viewFile = 'foc_auto_meta_settings.tpl';
     }

     if (is_file($templatePath . $viewFile)) {
       unlink($templatePath . $viewFile);
     }

    $this->model_extension_module_foc_auto_meta->install();
  }

  public function uninstall () {
    $this->model_extension_module_foc_auto_meta->uninstall();
  }

  private function isOpencart3 () {
    $version_chars = explode('.', VERSION);
    return (int)$version_chars[0] === 3;
  }

  private function getTokenParam () {
    if (isset($this->session->data['user_token'])) {
      return 'user_token=' . $this->session->data['user_token'];
    }
    else {
      return 'token=' . $this->session->data['token'];
    }
  }

  private function createUrl ($url) {
    return $this->url->link($url, $this->getTokenParam(), 'SSL');
  }

  public function index () {
    $data = array();

    $validKeys = array_keys($this->model_extension_module_foc_auto_meta->defaultSettingsItem());

    $this->load->model('localisation/language');
    $this->language->load('extension/module/foc_auto_meta');

    $data['heading_title'] = $this->language->get('heading_title');
    $data['breadcrumbs'] = $this->breadcrumbs();
    $data['action'] = $this->createUrl('extension/module/foc_auto_meta');

    $data['fam_settings'] = $this->model_extension_module_foc_auto_meta->getSettings();

    $data['languages'] = $this->model_localisation_language->getLanguages();
    $data['language_id'] = $this->config->get('config_language_id');

    $data['label_additional'] = $this->language->get('label_additional');

    $data['labels'] = array();

    foreach ($validKeys as $key) {
      $data['labels'][$key] = $this->language->get('field_' . $key);
    }

    $data['labels']['force_replace'] = $this->language->get('force_replace');

    $data['button_save'] = $this->language->get('button_save');

    if ($this->request->server['REQUEST_METHOD'] == 'POST') {
      $post = $this->request->post;
      if (isset($post['foc_auto_meta'])) {
        foreach ($post['foc_auto_meta'] as $lang_id => $meta_data) {
          foreach ($meta_data as $key => $value) {
            $data['fam_settings'][$lang_id][$key] = $value;
          }
        }
      }

      $this->model_extension_module_foc_auto_meta->saveSettings($data['fam_settings']);

      $this->response->redirect($this->createUrl('extension/module/foc_auto_meta/index'));
    }

    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('extension/module/foc_auto_meta_settings', $data));
  }

  private function breadcrumbs () {
    $breadcrumbs = array();

    $breadcrumbs[] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->createUrl('common/home'),
			'separator' => false
    );
    $breadcrumbs[] = array(
      'text'      => $this->language->get('text_extension'),
      'href'      => $this->createUrl('extension/extension'),
      'separator' => ' :: '
    );
		$breadcrumbs[] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->createUrl('extension/module/foc_auto_meta'),
			'separator' => ' :: '
    );

    return $breadcrumbs;
  }
}