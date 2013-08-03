module.exports = function (grunt) {
    // load all grunt tasks
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.initConfig({
        compass:{
            dev:{
                options:{
                    config:"assets/config.rb",
                    force:true
                }
            }
        },
        watch:{
            sass:{
                files:['assets/sass/**/*.scss'],
                tasks:['compass:dev']
            },
            livereload:{
                files:['assets/stylesheets/*.css', 'assets/images/*', 'assets/javascripts/*.js'],
                options:{
                    livereload:true
                }
            }
        }
    });

    grunt.registerTask('default', 'watch');
};