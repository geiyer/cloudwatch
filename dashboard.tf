locals {
  ec2_cpu_stats = <<EOF
    {
      "type": "metric",
      "width": 12,
      "height": 3,
      "properties": {
        "title": "EC2 Instance CPU",
        "region": "${var.region}",
        "stat": "Average",
        "period": 600,
        "view": "singleValue",
        "metrics": [
          [
            "AWS/EC2", "CPUUtilization",
            "InstanceId", "${aws_instance.web.id}"        
          ]
        ]
      }
    }
EOF
  dashboard_body = <<EOF1
  {
    "widgets": [
      ${local.ec2_cpu_stats}
    ]
  }
  EOF1
}


# output "json" {
#   value = "${replace(local.dashboard_body, "/\"([0-9]+)\"/", "$1")}"
# }


 resource "aws_cloudwatch_dashboard" "main" {
   dashboard_name = "web-dashboard"
   dashboard_body = "${replace(local.dashboard_body, "/\"([0-9]+)\"/", "$1")}"
 }