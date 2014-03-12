# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'control-group form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :bootstrap_boolean, tag: 'div', class: 'control-group form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :bootstrap_group, tag: 'div', class: "control-group form-group", error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |item|
        item.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :bootstrap_horizontal, tag: 'div', class: 'control-group form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { tag: 'div', class: 'control-label col-sm-2' }
    b.wrapper tag: 'div', class: 'controls col-sm-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :bootstrap_boolean_horizontal, tag: 'div', class: 'control-group form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.wrapper tag: 'div', class: 'controls col-sm-offset-2 col-sm-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :bootstrap_group_horizontal, tag: 'div', class: "control-group form-group", error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { tag: 'div', class: 'control-label col-sm-2' }
    b.wrapper tag: 'div', class: 'controls col-sm-10' do |input|
      input.wrapper tag: 'div', class: 'input-group' do |item|
        item.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
