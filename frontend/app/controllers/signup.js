import Ember from 'ember';

export default Ember.Controller.extend({
  actions : {

    signUp() {
      var self      = this;
      var email     = this.get('email');
      var password  = this.get('password');
      var access_level      = this.get('access_level');

      // this.validate().then(() => {

        var newUser = self.store.createRecord('user', {
          email     : email,
          password  : password,
          access_level  : access_level
        });

        // save on server
        newUser.save().then(() => {
          // clear fields
          self.setProperties({email: '', password: '', access_level: ''});
          // redirect to login
          self.transitionToRoute('login');

        }).catch(() => {

          alert('validations failed on server!');

        }).finally(() => {

          // flush user records on client, no matter what!
          self.store.unloadAll('user');

        });

      // }).catch(() => {

      //   alert('validations failed on client!');

      // }).finally(() => {

      //   console.log('in final');
      //   self.storeUnloadAll('user');
      
      // });

    }
    
  }
});