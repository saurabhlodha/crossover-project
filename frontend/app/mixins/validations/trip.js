import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Mixin.create(EmberValidations, {

  validations : {
    'model.destination': {
      presence: true
    },
    'model.start_date': {
      presence: true    },
    'model.end_date': {
      presence: true
    }
  }


});
