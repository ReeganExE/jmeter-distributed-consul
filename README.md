# Apache JMeter Distributed Testing with Docker

The Apache JMeter™ application is open source software, a 100% pure Java application designed to **load test** functional behavior and measure performance. It can be used to simulate a heavy load on a server, group of servers, network or object to test its strength or to analyze overall performance under different load types.

How do I clustering the test runner?

# Distributed Testing

JMeter already supported Distributed Testing. You would need to read this [Distributed Testing Step-by-step](https://jmeter.apache.org/usermanual/jmeter_distributed_testing_step_by_step.html).

![](https://jmeter.apache.org/images/screenshots/distributed-names.svg)

But you might concern these questions:
- How do I control number of slaves to be run
- How to automatically get all salves IP addresses when a Master starts (rather than put them manually)
- How do I only run Slaves when I need (as they compute system resource)
- How to pass test data (user data) to each slave?

By using along with an orchestration tool like Docker Swarm, Rancher, K8s, ... You could easily solve above questions.

In this example, we're using [HashiCorp Consul](https://www.consul.io/) as a service discovery.