resource "aws_iam_user" "test-ec2" {
  name = "test-view-ec2"
  path = "/system/"

  tags = {
    tag-key = "ec2-view-only"
  }
}

resource "aws_iam_access_key" "test-ec2" {
  user = aws_iam_user.test-ec2.name
}

data "aws_iam_policy_document" "ec2-read-only" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:List*",
  ]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ec2-read-only" {
  name   = "view-ec2"
  user   = aws_iam_user.test-ec2.name
  policy = data.aws_iam_policy_document.ec2-read-only.json
}