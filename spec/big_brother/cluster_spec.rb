require 'spec_helper'

describe BigBrother::Cluster do
  describe "monitor!" do
    it "marks the cluster as monitored" do
      cluster = BigBrother::Cluster.new('test')
      cluster.should_not be_monitored
      cluster.monitor!
      cluster.should be_monitored
    end
  end

  describe "unmonitor!" do
    it "marks the cluster as unmonitored" do
      cluster = BigBrother::Cluster.new('test')
      cluster.monitor!
      cluster.should be_monitored
      cluster.unmonitor!
      cluster.should_not be_monitored
    end
  end

  describe "monitor_nodes" do
    it "marks the cluster as no longer requiring monitoring" do
      cluster = BigBrother::Cluster.new('test')
      cluster.needs_check?.should be_true
      cluster.monitor_nodes
      cluster.needs_check?.should be_false
    end
  end
end
