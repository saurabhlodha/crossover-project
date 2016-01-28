import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),

  actions: {
    authenticate() {
      let { identification, password } = this.getProperties('identification', 'password');
      this.get('session').authenticate('authenticator:devise', identification, password).then(() => {
      }, (err) => {
        alert('Error! Please check your email & password and try again.');
      })
      .catch((reason) => {
        // this.set('errorMessage', reason.error || reason);
        alert('Error! Please check your email & password and try again.');
      });
    }
  }
});