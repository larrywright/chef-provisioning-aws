require 'chef/provisioning/aws_driver'
with_driver 'aws'

with_data_center 'us-west-2' do
    machine "SRV_OR_Web_1" do
        machine_options :bootstrap_options => {
          :key_name => 'Tst_Prov'
        }
    end
    
    aws_ebs_volume "my_ebs_volume" do
      size '300'
      mount_point '/dev/sdf'
    end

#Delete the volume - WARNING: this will remove all of your data.
    aws_ebs_volume "my_ebs_volume" do
        action :delete
    end
end
