#--
#Copyright 2007 Nominet UK
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License. 
#You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0 
#
#Unless required by applicable law or agreed to in writing, software 
#distributed under the License is distributed on an "AS IS" BASIS, 
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
#See the License for the specific language governing permissions and 
#limitations under the License.
#++
require 'rubygems'
require 'test/unit'
require 'Net/DNS'
class TestRrOpt < Test::Unit::TestCase
  def test_RrOpt
    size=2048;
    ednsflags=0x9e22;
    
    
    optrr= Net::DNS::RR.create( { :type         => 'OPT',
			  :name         => '',
			  :class        => size,  # Decimal UDPpayload
			  :ednsflags    => ednsflags # first bit set see RFC 3225
    })
    # @TODO replace DO bit stuff when DNSSEC is implemented
    #assert(optrr.do,"DO bit set")
    #assert_equal(optrr.clear_do,0x1e22,"Clearing do, leaving the other bits ");
    #assert(!optrr.do,"DO bit cleared")
    #assert_equal(optrr.set_do,0x9e22,"Clearing do, leaving the other bits ");
    
    
    assert_equal(optrr.size,2048,"Size read")
    assert_equal(optrr.size=(1498),1498,"Size set")
    
  end
end
