
#include <boost/python.hpp>

#include "functions.hpp"

using namespace boost::python;

BOOST_PYTHON_MODULE(wrapper) {
    def("hello_world", hello_world);
}
