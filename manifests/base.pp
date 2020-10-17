  node default {
  include git
  include firewall

  class { 'jenkins' :
    configure_firewall => true,
  }

  jenkins::plugin {
    "greenballs" : ;
    'credentials' : ;
    'ssh-credentials' : ;
    'durable-task' : ;
    'git-server' : ;
    'git-client' : ;
    'scm-api' : ;
    'git' : ;
    'workflow-aggregator' : ;
    'workflow-job' : ;
    'workflow-step-api' : ;
    'workflow-cps' : ;
    'workflow-support' : ;
    'workflow-durable-task-step' : ;
    'workflow-basic-steps' : ;
    'workflow-scm-step' : ;
    'workflow-api' : ;
    'workflow-cps-global-lib' : ;
  }

}
