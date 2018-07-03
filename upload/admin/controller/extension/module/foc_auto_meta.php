<?php

class ControllerExtensionModuleFocAutoMeta extends Controller {

  public function __construct ($registry) {
    $this->load->model('extension/module/foc_auto_meta');

    return parent::__construct($registry);
  }

  public function install () {
    $this->model_extension_module_foc_auto_meta->install();
  }

  public function uninstall () {
    $this->model_extension_module_foc_auto_meta->uninstall();
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

    $data['fam_settings'] = $this->model_extension_module_foc_auto_meta->getSettings();

    if ($this->request->server['REQUEST_METHOD'] == 'POST') {
      $post = $this->request->post;

      $validKeys = array_keys($this->model_extension_module_foc_auto_meta->defaultSettings());

      foreach ($validKeys as $key) {
        if (isset($post[$key])) {
          $data['fam_settings'][$key] = $post[$key];
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