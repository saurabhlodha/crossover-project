import Ember from 'ember';

export default Ember.Controller.extend({
  actions : {

    createUser() {
      var self = this;
      var email     = this.get('email');
      var access_level      = this.get('access_level');
      var password  = this.get('password');


      var newUser = this.store.createRecord('user', {
        email:    email,
        access_level:     access_level,
        password: password
      });

      newUser.save().then(() => {

        this.transitionToRoute('users');

      }, ()=> {
        // failed
        alert('Validations failed on server. Please try again');
        newUser.deleteRecord();

      }).catch(() => {

      }).finally(() => {

        this.setProperties({email: '', access_level: '', password: ''});
        
      });
    }
    
  }
});
