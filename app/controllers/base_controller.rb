#
# This Base class implements behaviour that is
# shared among ALL types of Controllers.
#
# Base classes will never be instanciated in our app.
# no BaseController.new
#
# They are simply wrappers/containers to encapsulate
# shared/common code so that we can be DRY:
# Don't Repeat Yourself

class BaseController
  def initialize(repository)
    @repository = repository
  end

  def list
    elements = @repository.all
    @view.display_elements(elements)
  end
end
