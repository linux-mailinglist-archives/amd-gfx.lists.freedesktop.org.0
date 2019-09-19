Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C78B73C6
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0966F8D1;
	Thu, 19 Sep 2019 07:12:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2982D6F8CA
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RstKf6Ahjv5rufUEkTDJOwMPgwgHcbEK+VZAzm5ItFBpecBkuxv2glBTH2MV4saNTN97fatF1lw9T39XTDeA4UmotpNL0uMyronBbMyIsSxDGWVR3qh+WXcUHOpX5IMtXOVqPLHud214DIfuy4qk9CWivn1V54u6eK6mUGb+Yf2GSjKwrr6m/3z9yI7UWcwL0zQHN7rdWp5uuRPr3m0T9rkCgTH7gyqrRItlJAojTVdehtAg1yohxbEyMIGXVsKfkfgujCNryG3glGiwrtK+dezMvGjrMqReTF/c0r5QgQOcPNBJQdpStzWle3pqNQzYQ6ladwkcWzbIL03cGgznXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyzIoXDXDpGdpUtHDLZKDLWufRnN1DWhT/n5NiOE8yY=;
 b=NOcxWQNWHOQRqBsDXCKvvxNPtmHSnc1aTfPOV2wRddOkDU9O5d/hEW/N6OvRxcJ5AN2scG1uD4YBd9ygZzy2L0B+6p3MQzI9mphVVCauEZVYCKpO9PlD6x1SW3NbZPmP30Fp1XBFvj5JZwTyGsKC4EqwvLj9pz1AmKOLOuBq0GvOHO6y8JSkQ4rd0c5AaPv6kBrmr3PucFCyURM/AsnHwfdEHooygkmP+dztXgY0U9mYOEyX00N9WFHVnecLV414l15bhorcxDt5KOcykue51X+RCzBXfeZN4xqDsTxbKHBLKqkzrABBoT9iABO0y9ZBLCT6IyS2gkbiEEozXtjqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:39 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:39 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Topic: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Index: AQHVbrmfh65heiGeKkKEN1nt4WVKzQ==
Date: Thu, 19 Sep 2019 07:12:39 +0000
Message-ID: <20190919071115.16552-6-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a5bca1e-89a7-41cd-48aa-08d73cd0c188
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894D43436A60F2D94A888FAB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(446003)(2501003)(52116002)(11346002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(76176011)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e0R9ZlAmwcFLTpEo3l+H9jbbUgXACzoXdJnnvD8L1M/2sgTd5pIPrG9uws/xlV7Fm8cigsgSrGXSAL6HjpgrJgTlwPgzmhiuwSKGowTYescvHEPcfz8VJka9veK4yawrUTfrtFWHdZIsq95Lkxzgzbc9BIyL3LuHfrU+HlHS5QFbfhi/ViCqbBi3XWvS6YoAptGrob3y4hvwmt7bKCgu7F39O1/6QRy/Qb7mw7TRnLXMuFbO04fAM640Q/iQcd4YuTT7ml7geAHEMGIgqmnJnp0bvKMIwIs/ZGUVmGsNwAfA4QoLoCC5tC4R7B6fAtNzjYoWiVut73WPFWrzXZGOGpHX/XHePrrl5NyYGSo/rOChu5IKfmdihv3I22c0iXFQy8tESlLGk3bmUzmRo0KH4QpuVY+o0EtCQatsssXnjq0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5bca1e-89a7-41cd-48aa-08d73cd0c188
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:39.6941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjE9saBiNXu2Zno6nPYloWvLlTwTkNw87dr3Gr9KkxRVSpfS89fm0H7NNyD5rKbH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyzIoXDXDpGdpUtHDLZKDLWufRnN1DWhT/n5NiOE8yY=;
 b=kwRXYS37t+MifFRDxCclNQcfjIqKP7mPnpDZPzSqhvme92AK3mn3JZOnLtMvEXc/f/r9n3LhWDVFCmlJsX+NoYxUt+vzi+T2VpCqjZ3ki0a8NW5DYLkB3kX8nIqgWEWlvhUgrYK1/xLftEiyhdOldf1DsjpG5CW5iYHX6wFvJzM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2ltcGxpZnkgY29kZSBsb2dpYyBhbmQgcmVmaW5lIHJldHVybiB2YWx1ZQoKU2lnbmVkLW9mZi1i
eTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jIHwgMzIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IGE4ZTRiN2Q4ODBmZS4uZjY4NWEyMzc3NjE1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMTk0MiwyNSArMTk0
MiwyNyBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCXVpbnQzMl90IGVycl9zb3VyY2U7CiAJaW50IGluc3RhbmNl
OwogCi0JaWYgKCFhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NL
X19HRlgpKSB7Ci0JCWluc3RhbmNlID0gc2RtYV92NF8wX2lycV9pZF90b19zZXEoZW50cnktPmNs
aWVudF9pZCk7Ci0JCWlmIChpbnN0YW5jZSA8IDApCi0JCQlyZXR1cm4gMDsKKwlpZiAoYW1kZ3B1
X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSkKKwkJZ290byBv
dXQ7CiAKLQkJc3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7Ci0JCWNhc2UgU0RNQTBfNF8wX19TUkNJ
RF9fU0RNQV9TUkFNX0VDQzoKLQkJCWVycl9zb3VyY2UgPSAwOwotCQkJYnJlYWs7Ci0JCWNhc2Ug
U0RNQTBfNF8wX19TUkNJRF9fU0RNQV9FQ0M6Ci0JCQllcnJfc291cmNlID0gMTsKLQkJCWJyZWFr
OwotCQlkZWZhdWx0OgotCQkJcmV0dXJuIDA7Ci0JCX0KKwlpbnN0YW5jZSA9IHNkbWFfdjRfMF9p
cnFfaWRfdG9fc2VxKGVudHJ5LT5jbGllbnRfaWQpOworCWlmIChpbnN0YW5jZSA8IDApCisJCWdv
dG8gb3V0OwogCi0JCWFtZGdwdV9zZG1hX3Byb2Nlc3NfcmFzX2RhdGFfY2IoYWRldiwgZXJyX2Rh
dGEsIGVudHJ5KTsKKwlzd2l0Y2ggKGVudHJ5LT5zcmNfaWQpIHsKKwljYXNlIFNETUEwXzRfMF9f
U1JDSURfX1NETUFfU1JBTV9FQ0M6CisJCWVycl9zb3VyY2UgPSAwOworCQlicmVhazsKKwljYXNl
IFNETUEwXzRfMF9fU1JDSURfX1NETUFfRUNDOgorCQllcnJfc291cmNlID0gMTsKKwkJYnJlYWs7
CisJZGVmYXVsdDoKKwkJZ290byBvdXQ7CiAJfQogCisJYW1kZ3B1X3NkbWFfcHJvY2Vzc19yYXNf
ZGF0YV9jYihhZGV2LCBlcnJfZGF0YSwgZW50cnkpOworCitvdXQ6CiAJcmV0dXJuIEFNREdQVV9S
QVNfU1VDQ0VTUzsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
