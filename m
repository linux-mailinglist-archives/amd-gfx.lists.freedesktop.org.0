Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371705FB72
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63036E369;
	Thu,  4 Jul 2019 16:06:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4586C6E369
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:00 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by DM5PR12MB1193.namprd12.prod.outlook.com (2603:10b6:3:70::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 16:05:58 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:05:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:05:57 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:55 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/17] drm/amdgpu: add jpeg enc register offsets
Date: Thu, 4 Jul 2019 12:04:15 -0400
Message-ID: <20190704160429.14758-3-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(53416004)(126002)(70586007)(68736007)(7736002)(5660300002)(305945005)(2351001)(70206006)(478600001)(3846002)(6916009)(426003)(2906002)(6116002)(2616005)(2876002)(50226002)(446003)(47776003)(486006)(476003)(36756003)(53936002)(77096007)(81166006)(356004)(6666004)(48376002)(186003)(16526019)(4326008)(50466002)(16586007)(336012)(11346002)(316002)(26005)(1076003)(8676002)(76176011)(72206003)(51416003)(81156014)(86362001)(8936002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1193; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f96c6bb7-1404-481d-e2f2-08d700998061
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB1193; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1193:
X-Microsoft-Antispam-PRVS: <DM5PR12MB119357C52C6CAFAFE4F4D65B87FA0@DM5PR12MB1193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:233;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QTBmcEX2/0sq23DEIoVzm0xAqYU5JdcMN9vCUCdM2/d368imPebcCmnGtYJJbbDi4vkeXRy3gQ27gXnQtF5VNlIdIQBw3+KtDLZTixClq3VlDfwBtySAKaN7UUN3g/V9+Xdf7RIp9r2eBzokfGqejfPi5M41HTAXEjCHo9vd/NQZ0M4QMX+jSgSO+z2FSl4+omyI0KD0p4BRumzryY7l7UaGs51m8d3AxWkpkU5bcj/hIT5s7epkPpS3pZK9W9U1jyxpLapUbBB2t5AAL3ACapj4SkcYRXGcMKEhKaA+Lg+b+PlZ/a9wC8eHjKu7Qycxl7mjNLAWIDo7sbfEmafSRMLIzNS5x8frE2ASOghvLR0wLick/eM9p1dhhsYL9W6Dia56XatETq1LDE7v2n/45toJ3aDRfRs0zE+IKh6hfnI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:05:57.8498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f96c6bb7-1404-481d-e2f2-08d700998061
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1193
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL8HRCct8rnXlouCHABuKwLN+Ttko+V554rf8RcGB/c=;
 b=sirGSl/J18xZe2Bwh97oVsuSX86sn7Ytdhy+Hlp1rKfU94dnK+edYp+gpx9o3T/aW+5RoUHipBqAReTTSFQyEJPP69UkaoakWFWleNZtUof+rpYAlM1x2f0/ZTBnpJ7z6fwq4sX4hpV1DcXW7ih96bOzWLYL1yVnOY9iRygY/3c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBqcGVnIGVuY29k
ZSByZWdpc3RlcnMgb2Zmc2V0cy4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95dWFu
LnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyB8
IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKaW5kZXggMWI5NzcwY2I2NTBiLi40
YmRkNzNjMzMyNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwpAQCAtNjQs
NyArNjQsMjYgQEAKICNkZWZpbmUgbW1VVkRfSlJCQ19TVEFUVVNfSU5URVJOQUxfT0ZGU0VUCQkJ
CTB4NDA4OQogI2RlZmluZSBtbVVWRF9KUEVHX1BJVENIX0lOVEVSTkFMX09GRlNFVAkJCQkweDQw
MWYKIAorI2RlZmluZSBtbVVWRF9KUkJDX0VOQ19FWFRFUk5BTF9SRUdfSU5URVJOQUxfT0ZGU0VU
IAkJCTB4MWZmZmYKKyNkZWZpbmUgbW1VVkRfSlBFR19FTkNfR1BDT01fQ01EX0lOVEVSTkFMX09G
RlNFVAkJCTB4NDA2ZQorI2RlZmluZSBtbVVWRF9KUEVHX0VOQ19HUENPTV9EQVRBMF9JTlRFUk5B
TF9PRkZTRVQJCQkweDQwNmYKKyNkZWZpbmUgbW1VVkRfSlBFR19FTkNfR1BDT01fREFUQTFfSU5U
RVJOQUxfT0ZGU0VUCQkJMHg0MDcwCisjZGVmaW5lIG1tVVZEX0xNSV9FSlJCQ19SQl9NRU1fV1Jf
NjRCSVRfQkFSX0xPV19JTlRFUk5BTF9PRkZTRVQJCTB4NDEwMAorI2RlZmluZSBtbVVWRF9MTUlf
RUpSQkNfUkJfTUVNX1dSXzY0QklUX0JBUl9ISUdIX0lOVEVSTkFMX09GRlNFVCAJMHg0MTAxCisj
ZGVmaW5lIG1tVVZEX0pNSV9FTkNfSlJCQ19JQl9WTUlEX0lOVEVSTkFMX09GRlNFVAkJCTB4NDBk
MgorI2RlZmluZSBtbVVWRF9KTUlfRU5DX0pQRUdfVk1JRF9JTlRFUk5BTF9PRkZTRVQJCQkJMHg0
MGQ0CisjZGVmaW5lIG1tVVZEX0xNSV9FSlJCQ19JQl82NEJJVF9CQVJfTE9XX0lOVEVSTkFMX09G
RlNFVCAJCTB4NDBmZQorI2RlZmluZSBtbVVWRF9MTUlfRUpSQkNfSUJfNjRCSVRfQkFSX0hJR0hf
SU5URVJOQUxfT0ZGU0VUCQkweDQwZmYKKyNkZWZpbmUgbW1VVkRfSlJCQ19FTkNfSUJfU0laRV9J
TlRFUk5BTF9PRkZTRVQJCQkJMHg0MGEyCisjZGVmaW5lIG1tVVZEX0xNSV9FSlJCQ19SQl9NRU1f
UkRfNjRCSVRfQkFSX0xPV19JTlRFUk5BTF9PRkZTRVQJCTB4NDEwMgorI2RlZmluZSBtbVVWRF9M
TUlfRUpSQkNfUkJfTUVNX1JEXzY0QklUX0JBUl9ISUdIX0lOVEVSTkFMX09GRlNFVCAJMHg0MTAz
CisjZGVmaW5lIG1tVVZEX0pSQkNfRU5DX1JCX0NPTkRfUkRfVElNRVJfSU5URVJOQUxfT0ZGU0VU
CQkJMHg0MGE1CisjZGVmaW5lIG1tVVZEX0pSQkNfRU5DX1JCX1JFRl9EQVRBX0lOVEVSTkFMX09G
RlNFVAkJCTB4NDBhNAorI2RlZmluZSBtbVVWRF9KUkJDX0VOQ19TVEFUVVNfSU5URVJOQUxfT0ZG
U0VUCQkJCTB4NDBhOQorI2RlZmluZSBtbVVWRF9KUEVHX0VOQ19TQ1JBVENIMF9JTlRFUk5BTF9P
RkZTRVQJCQkJMHg0MDc2CisKICNkZWZpbmUgSlJCQ19ERUNfRVhURVJOQUxfUkVHX1dSSVRFX0FE
RFIJCQkJMHgxODAwMAorI2RlZmluZSBKUkJDX0VOQ19FWFRFUk5BTF9SRUdfV1JJVEVfQUREUgkJ
CQkweDFjMDAwCiAKIHN0YXRpYyBpbnQgdmNuX3YyXzBfc3RvcChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldik7CiBzdGF0aWMgdm9pZCB2Y25fdjJfMF9zZXRfZGVjX3JpbmdfZnVuY3Moc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
