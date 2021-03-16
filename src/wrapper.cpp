
#include <boost/python.hpp>

#include "functions.hpp"

using namespace boost::python;

BOOST_PYTHON_MODULE(wrapped) {
    def("hello_world", hello_world);
}
