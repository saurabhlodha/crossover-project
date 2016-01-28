import Ember from 'ember';

export default Ember.Controller.extend({
  actions : {

    updateUser(id) {
      var self = this;
      var email = this.get('model.email');
      var access_level  = this.get('model.access_level');
      var password = this.get('password');

      this.store.findRecord('user', id).then(function(user) {

        // update the user
        user.set('email', email);
        user.set('access_level', access_level);
        if (password && password.length>8) {
          user.set('password', password);
        }

        // save on the server
        user.save().then(() => {

          // clear password locally
          user.set('password', undefined);

        }, (err) => {

          // save on server failed.
          alert('Validation failed on server. Please try again.');

        }).catch(() => {

          console.log('Exception in users : edit : updateUser ');

        }).finally(() => {

          self.setProperties({email: '', access_level: '', password: undefined});

          self.store.unloadAll('user');
          self.store.findAll('user');

          self.transitionToRoute('users');
          
        });

      });
    }
    
  }
});
