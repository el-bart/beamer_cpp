#include <utility>
#include <unistd.h>

namespace But
{
namespace System
{

class Desc
{
public:
  using value_type = int;

  explicit Desc(const value_type desc=-1):
    desc_{desc}
  { }
  ~Desc() { close(desc_); }

  Desc(Desc const&) = delete;
  Desc& operator=(Desc const&) = delete;

  value_type get() const { return desc_; }

  value_type release()
  {
    const auto tmp = desc_;
    desc_ = -1;
    return tmp;
  }

  void reset(const value_type desc = -1)
  {
    if( opened() )
      close(desc_);
    desc_ = desc;
  }

  bool opened() const { return get() != -1; }

  void swap(Desc& other)
  {
    std::swap(other.desc_, desc_);
  }

private:
  value_type desc_;
};

}
}
