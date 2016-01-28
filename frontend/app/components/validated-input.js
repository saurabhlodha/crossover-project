import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Component.extend(EmberValidations, {

  actions: {
    showErrors: function() {
      this.set("showError", true);
    }
  }
 
});
