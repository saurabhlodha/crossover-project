import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Mixin.create(EmberValidations, {

  validations : {
    'model.description': {
      presence: true
    },
    'model.status': {
      presence: true
    },
    'model.request_id': {
      presence: true    },
    'model.user_id': {
      presence: true
    }
  }
});
