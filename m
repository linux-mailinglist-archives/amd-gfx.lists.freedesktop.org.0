Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9597BFAEA
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C150B6EE0E;
	Thu, 26 Sep 2019 21:27:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562B56EE10
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wp7/Pp0VvvB1H5XfgZodyiSS36em6YyfuqYdDTKqzSCzpTWPiLGzOkBRBtyc6zbi46tUdYjFFwE/69F8x0hGYURvI50nDA5HRYGdvWnuMKgGMv8VM11lLsrDN8gN5U/r/qGKYrGwdmie4lNyQ6OpiWzHp/vSDgugGNrur4Bry1HuXOXWjSucKnsVL5VsX58hOP2Z+gVd0tHyEP4X7kM+OK6WIrhxGWt3c0Fjtz5BnAW6EGnmkyS+4ONaEluUZHtlGj2VcSHZ0QgOM4b97d3cjVwM3RHEgwIZg8uO29LydJvjf7c86EgZSgvU/huHOjh1gp49QpVqHVMnnbD3sjAdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkpwoSVDQEXqx97m09rVbHGHs1NBARafkYUkupweL84=;
 b=TnMXF+Gs55OalpGt+3hGJdWPgBzt5ySSX75elLMMM/2JGcQjyAwFcvGEM/6hZO7XugR3P2Rjc8/ZUA4FnCBLE9dQSx8yHsSeYpXVxxIOO/lbZCrynEKLjMJYmk6nLaoEaKsI3r45yMyxbDRmk0mtMouFXeye41y/OzlUbncoOvuDHA51qIyddPM5WdTZjJk4M11M5CkZ3n+O26GaJ/hZ/XBu78ZzeTW94520stjFyzs9YOSsY7YPBc2MD4kOsOhkMFpOSzIwLT6COFdnz7VJkDRrC56mp2HnsLcbGdcIEdVyl2KRNMFkWmZGl8EpqJkI4hHI+qhXjOIFeLTs4mR2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3850.namprd12.prod.outlook.com (10.255.173.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 21:27:15 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 21:27:15 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored info
 for non HWS
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info for non HWS
Thread-Index: AQHVdLEqMhz3ZnYETkOL3k0d2Dkq9Q==
Date: Thu, 26 Sep 2019 21:27:15 +0000
Message-ID: <20190926212640.28989-2-Yong.Zhao@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926212640.28989-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddceae35-6aa4-4630-535e-08d742c84cf3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3850; 
x-ms-traffictypediagnostic: DM6PR12MB3850:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB38501C82B8A95D8714B7A516F0860@DM6PR12MB3850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(2906002)(6436002)(50226002)(6916009)(1076003)(99286004)(14454004)(316002)(66476007)(66066001)(3846002)(2501003)(71200400001)(86362001)(71190400001)(305945005)(7736002)(66946007)(478600001)(5640700003)(256004)(186003)(52116002)(6512007)(81156014)(66446008)(81166006)(486006)(2351001)(446003)(66556008)(2616005)(8676002)(476003)(102836004)(11346002)(6506007)(6486002)(6116002)(8936002)(4326008)(386003)(26005)(64756008)(76176011)(5660300002)(25786009)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3850;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xLhFV0qKA3H+U+jTyskDYMDzD8SobPC+qAogBeOoNgNo1w8n8ztKYD2uqfgJDhzYTRrpDp0t8aKyG5FG/+WzhJxiMFa92w8I+iJIpMvl5dRNJx/tG1pwID/R2HhOmJWVkH5uHsgsZOH7Ln7+/OJJx6R/t7nA/OXUHVnoxHDC/l/ws+2aeW9dFbQV4qspy9etfEUkQQZCZGwIR5xED6b3A9otlrukXSNB0Lmo7IyHgpKqrshdZRvk53rArSlJniV8swrhVpYCADaxHXXyq3TGIlJAGEgJMf1khEsyl4X5S3cxyGYuOPppnf4s/WhErYSCgjNCLd3VKOWMKqqKS0hCyFch8VWLE2gqed/2eVHDEMpqAJ9IdIXBuCvF/lF4M4k4hYxwJNVE3xxfmaMKiuvmOPLBMuB9PrbWypCjfkRAuyg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddceae35-6aa4-4630-535e-08d742c84cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:27:15.0780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kzNIFm/8K0HGpxSWx9H1I7sYSZKAiRAVSr5LMHWZjpRWGB941OHVvcfnhRv9hIL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkpwoSVDQEXqx97m09rVbHGHs1NBARafkYUkupweL84=;
 b=hPkSiVnoknjU2cCZH+ziwi1R4HU2fr0iS9qNyVKox8E7Nw8qdXoNffgSEHq+obIHsh7susZqGqKgP5VP68jWXaNrVW7/0MakcU96BJTocKkGIEjJO1a2QItExyvUI4UURrEjqV8O5i5K0n/Q9FsO9lslJkr26dZfN0wyvEfAW6k=
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

QmVjYXVzZSB3ZSByZWNvcmQgdGhlIG1hcHBpbmcgdW5kZXIgbm9uIEhXUyBtb2RlIGluIHRoZSBz
b2Z0d2FyZSwKd2UgY2FuIHF1ZXJ5IHBhc2lkIHRocm91Z2ggdm1pZCB1c2luZyB0aGUgc3RvcmVk
IG1hcHBpbmcgaW5zdGVhZCBvZgpyZWFkaW5nIGZyb20gQVRDIHJlZ2lzdGVycy4KClRoaXMgYWxz
byBwcmVwYXJlcyBmb3IgdGhlIGRlZmVhdHVyZWQgQVRDIGJsb2NrIGluIGZ1dHVyZSBBU0lDcy4K
CkNoYW5nZS1JZDogSTc4MWNiOWQzMGRjMGNjOTMzNzk5MDhmZjFjZjhkYTc5OGJiMjZmMTMKU2ln
bmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jCmluZGV4IGFiOGE2OTVjNGEzYy4u
OWZmZjAxYzBmYjllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
aW50X3Byb2Nlc3NfdjkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50
X3Byb2Nlc3NfdjkuYwpAQCAtNTgsOCArNTgsOCBAQCBzdGF0aWMgYm9vbCBldmVudF9pbnRlcnJ1
cHRfaXNyX3Y5KHN0cnVjdCBrZmRfZGV2ICpkZXYsCiAJCW1lbWNweShwYXRjaGVkX2locmUsIGlo
X3JpbmdfZW50cnksCiAJCQkJZGV2LT5kZXZpY2VfaW5mby0+aWhfcmluZ19lbnRyeV9zaXplKTsK
IAotCQlwYXNpZCA9IGRldi0+a2ZkMmtnZC0+Z2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFz
aWQoCi0JCQkJZGV2LT5rZ2QsIHZtaWQpOworCQlwYXNpZCA9IGRldi0+ZHFtLT52bWlkX3Bhc2lk
W3ZtaWRdOworCQlXQVJOX09OQ0UocGFzaWQgPT0gMCwgIk5vIFBBU0lEIGFzc2lnbmVkIGZvciBW
TUlEICVkXG4iLCB2bWlkKTsKIAogCQkvKiBQYXRjaCB0aGUgcGFzaWQgZmllbGQgKi8KIAkJcGF0
Y2hlZF9paHJlWzNdID0gY3B1X3RvX2xlMzIoKGxlMzJfdG9fY3B1KHBhdGNoZWRfaWhyZVszXSkK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
