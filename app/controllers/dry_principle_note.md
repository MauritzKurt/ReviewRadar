Your controllers repeat Pundit authorizations multiple times in multiple places - this can be
DRYed up into something like a `before_action` at the top of each controller.