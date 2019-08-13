Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8A8C16A
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 21:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14CE6E133;
	Tue, 13 Aug 2019 19:20:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730087.outbound.protection.outlook.com [40.107.73.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC086E133
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 19:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2m6Rso9fEoegflL4oN2xcwGWYLOmH6e+okn1f4j8mGTXPtPjJUXUkN407vpnyrFJo8hixcqD4XqpgPC9iQCBiLQXho0zQ7opDiyPwfAHlTIT7u/WE/Ee4p5X9zBXc5gdfJRpEtEO4c8xikhexwse/nKtpK2fowZQcwiJg8KffwN7+6AKbXhzYZLLGRYl3fIhDbaRpKXMBvzEQ6YvLK+9ZrE4OOlkivfXMtvXy3qXFC4gUk69l35UoTQypQDnZG4DoUT6/7alyxuDAGLcaQEQRQbA0cNAQn/JV2puagoT5CCyiHXwDq/Yzqoc/Ab3ODakR7PAbi5wrs7oka418IvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfnmLGmegwCp2uqEEv8vHptKqM5sfpU5wIwpDE+qGL4=;
 b=JoL3991gO8yxDq4a4qbBWkbgLsLrGNeXMZ9xNdJHLHAl2+YVdsHqwC0zVntfWO8aAVzKQYy+HrAN9T5GfPQ9syEWYWTvtXwDH3paFN6f0nwxUE1bNdCT2ZbQRFkBBU7+hmtj4SIYkVcJahAAMg3ZRcTb2pj9HHVXtXoA3bvI0ZxcMAuwUDEQXZx3ZhBMTYk2Ea0FovTYSMtfQX1fK0hPCz2+lQMNYOgLqRHBFQbPvpqCC+NP4opgxRrzhqjkAhyqQgxIv1sfg49W2Q0VCw47aGsfXrHHLz1wHVtAG310dYsHrn17W8anOc28Pg0h+6uJsE3IxMd5nIsZOzIV88LmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2955.namprd12.prod.outlook.com (20.179.104.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 19:20:19 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 19:20:19 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Fill amdgpu_task_info for KFD VMs
Thread-Topic: [PATCH] drm/amdkfd: Fill amdgpu_task_info for KFD VMs
Thread-Index: AQHVUgwl4whMPfTz906eU30xRHb6MA==
Date: Tue, 13 Aug 2019 19:20:19 +0000
Message-ID: <20190813192007.15881-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f248441-5fb0-475a-9680-08d72023476f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2955; 
x-ms-traffictypediagnostic: DM6PR12MB2955:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB29556F0CED605D8BF8627E90F0D20@DM6PR12MB2955.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(199004)(189003)(4326008)(81166006)(36756003)(8676002)(71190400001)(86362001)(71200400001)(53936002)(186003)(486006)(26005)(66066001)(6512007)(6916009)(3846002)(81156014)(7736002)(50226002)(256004)(8936002)(6116002)(305945005)(2501003)(25786009)(52116002)(1076003)(6436002)(102836004)(478600001)(316002)(4744005)(2351001)(6506007)(6486002)(386003)(2906002)(66476007)(66556008)(14454004)(64756008)(66446008)(99286004)(2616005)(476003)(5660300002)(5640700003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2955;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e6qQQhXqQjxfQBwVUOs7qtIU/xOj7XMSWmGnI4KqxiyNtIORPi66woqGYfQbGDi16mw3mWgO7CwhDl0lVFKhZ0Kf07VoIeX5XoklBm3vI/cf+E24M95JKevATFBnw3aeP7V4Paxhw5jf4mGtvGRFx7EyvKB8TGSfZ9adChRMLcLf5t1MW9KGg5Igq9+cgj38UvvYQHBHHzPM3G/ZXG5SXsZWHhVXO/W0jjpRdpVGjmyIC2l0qd/OOGIsiMO8enyln4rHFNOEGCjJvVEdo/5iZRB5wwWrA1HkOM9up2uALxjCVeG6tyuEWfwfe2JIGBesrMAKTy9NlGxpzegH9ub8OaxQbAG90PTmnupb+Goy52NGJ3lc6xbiLvZWOTPQ5CYI9S3CP9DgmJ8afxOnaN0XvD4s0So95nzsBtjv7qNFR7M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f248441-5fb0-475a-9680-08d72023476f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 19:20:19.4292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBAsx1VCVMWOQcxTWXN0nvVmfI7Aafk08mbK5HkyOZDbg8PKVciTjdg+93kiJukJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfnmLGmegwCp2uqEEv8vHptKqM5sfpU5wIwpDE+qGL4=;
 b=2bSn1VmPJFTgMu1z5TKyDy7MZ6ikYz0p6UDkTQvI1hrzH6KLC9dW0NssRCOBqJxGt6zeZx1i+9aaJ89cA6+3Rpg0O0uYTBPpTWxgEYM42y66w2NyHwGDFl6xkn0TA3DZE+nhbveUwhhLfZCIEPPXAz/NFsXG0OEVlzwigfHu8Us=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGFtZGdwdV90YXNrX2luZm8gd2lsbCBiZSB1c2VkIHdoZW4gcHJpbnRpbmcgVk0gcGFnZSBm
YXVsdCBmb3IgS0ZECnByb2Nlc3Nlcy4KCkNoYW5nZS1JZDogSWZkOTgzZGI1ZGNlYjFkNDc3ZTcy
ODdlNDg5M2Y4MDU2NWE3YTZiMDYKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcHJvY2Vzcy5jCmluZGV4IDhmMTA3NmMwYzg4YS4uMmVjNDI3NDlmOTcxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKQEAgLTgwMSw2ICs4MDEs
OCBAQCBpbnQga2ZkX3Byb2Nlc3NfZGV2aWNlX2luaXRfdm0oc3RydWN0IGtmZF9wcm9jZXNzX2Rl
dmljZSAqcGRkLAogCQlyZXR1cm4gcmV0OwogCX0KIAorCWFtZGdwdV92bV9zZXRfdGFza19pbmZv
KHBkZC0+dm0pOworCiAJcmV0ID0ga2ZkX3Byb2Nlc3NfZGV2aWNlX3Jlc2VydmVfaWJfbWVtKHBk
ZCk7CiAJaWYgKHJldCkKIAkJZ290byBlcnJfcmVzZXJ2ZV9pYl9tZW07Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
