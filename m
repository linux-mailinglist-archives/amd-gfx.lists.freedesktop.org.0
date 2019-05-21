Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537924725
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 06:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8040089211;
	Tue, 21 May 2019 04:56:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C15089211
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 04:56:23 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2752.namprd12.prod.outlook.com (52.135.107.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 21 May 2019 04:56:21 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 04:56:21 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix fence timeout after gpu reset
Thread-Topic: [PATCH] drm/amdgpu: Fix fence timeout after gpu reset
Thread-Index: AQHVD5CjmvuGFSbKEUevsAooODXGkw==
Date: Tue, 21 May 2019 04:56:21 +0000
Message-ID: <SN6PR12MB28002B8D2D24CBC952AC969B87070@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 079308c1-d829-4841-e9d9-08d6dda8ab55
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2752; 
x-ms-traffictypediagnostic: SN6PR12MB2752:
x-microsoft-antispam-prvs: <SN6PR12MB27529FE1057A5F175A2F30C087070@SN6PR12MB2752.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(39860400002)(346002)(136003)(199004)(189003)(2501003)(7696005)(186003)(68736007)(26005)(5660300002)(476003)(52536014)(71190400001)(86362001)(486006)(4326008)(2351001)(66066001)(74316002)(54906003)(7736002)(71200400001)(478600001)(55016002)(9686003)(305945005)(99286004)(6506007)(8676002)(5640700003)(64756008)(66946007)(66446008)(25786009)(76116006)(91956017)(8936002)(53936002)(73956011)(102836004)(14454004)(6916009)(66556008)(256004)(66476007)(14444005)(81156014)(6436002)(81166006)(2906002)(33656002)(316002)(72206003)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2752;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OeUvXCfmAo3oXWanpibg3fgplNSqkmuSyqB2uQQ1nBk0GG3HQgzGUce8moAfe1OPAs1vZ7BpAyD1U4eJm+NFFx+45a5KAD4q1jfTlg4P6L9CSrWNCOBS/jbFTgoRuQus+2Yz0lp/teNYbJ0ZTi44UP7uSoTQL1YL/CLyT9Gtdn4io9C1n7hlx8Htln+Hy+xheAqSBQyIoMDrqW6HsMgLfPzn/DS+oOtpkyikPEXIAaIYmwAablny1nzoAiwsGErUNUPI7sCNa35Z+0wLfzMXBpxcNBiYLQ4+W6YWEJiXGgNz5JHFvIdyZW71nLgpNFQ2katBp4EXLYNBUSuLIyEr4N2THIcAGplnEvPQhDlWKvt9QOwRuKGagF17a99yZ8UoeHC3DlecXkxmaOEAQMOqn2SWgWl/NlG9+Hve86okc28=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079308c1-d829-4841-e9d9-08d6dda8ab55
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 04:56:21.6973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6kIzZucLXmSkjhWzTSFgoO4uxG0iHYe30MX/kvO7Ns=;
 b=tBg0USWcH4h1QjhzSX/lSmpuxCTDNCjcYgpXYZM4QMhFlR+4i4VOR/bycGTCIkpvjoanZo+KtjhjCVhEsLhW8prkP5U1YKuxffT4c20hUOYrRPmIRjwI/hMiUHCwGTycnc55MRl1rpEJXY2/iPtVNHePhtbJYqIxtahWSMjTD8o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bGF0ZSBpbml0IHdvcmsgd2lsbCBkbyBJQiB0ZXN0cywgdGhlcmUgaXMgYSByYWNlIGJldHdlZW4g
bGF0ZV9pbml0X3dvcmsKYW5kIGludGVycnVwdCBlbmFibGVtZW50LiBTbyBjYWxsIHJlc3VtZSBo
ZWxwZXIgaW4gYWR2YW5jZS4gT3RoZXJ3aWNlIGhpdApyZW5jZSB0aW1lb3V0LgoKU2lnbmVkLW9m
Zi1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAxNzNhZjdlYmIzZjYuLjIzNjEyNzE4ZDg0
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzU0
NSwxNiArMzU0NSwxOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kb19hc2ljX3Jlc2V0KHN0cnVjdCBh
bWRncHVfaGl2ZV9pbmZvICpoaXZlLAogCQkJCWlmICh2cmFtX2xvc3QpCiAJCQkJCWFtZGdwdV9k
ZXZpY2VfZmlsbF9yZXNldF9tYWdpYyh0bXBfYWRldik7CiAKKwkJCQkvKiBVcGRhdGUgUFNQIEZX
IHRvcG9sb2d5IGFmdGVyIHJlc2V0ICovCisJCQkJaWYgKGhpdmUgJiYgdG1wX2FkZXYtPmdtYy54
Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpCisJCQkJCXIgPSBhbWRncHVfeGdtaV91cGRhdGVf
dG9wb2xvZ3koaGl2ZSwgdG1wX2FkZXYpOworCisJCQkJLyogbGF0ZV9pbml0X3dvcmsgZG8gaWIg
dGVzdHMsIHNvIGVuYWJsZSBpbnRlcnJ1cHQuICovCisJCQkJYW1kZ3B1X2lycV9ncHVfcmVzZXRf
cmVzdW1lX2hlbHBlcih0bXBfYWRldik7CisKIAkJCQlyID0gYW1kZ3B1X2RldmljZV9pcF9sYXRl
X2luaXQodG1wX2FkZXYpOwogCQkJCWlmIChyKQogCQkJCQlnb3RvIG91dDsKIAogCQkJCS8qIG11
c3Qgc3VjY2VlZC4gKi8KIAkJCQlhbWRncHVfcmFzX3Jlc3VtZSh0bXBfYWRldik7Ci0KLQkJCQkv
KiBVcGRhdGUgUFNQIEZXIHRvcG9sb2d5IGFmdGVyIHJlc2V0ICovCi0JCQkJaWYgKGhpdmUgJiYg
dG1wX2FkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpCi0JCQkJCXIgPSBhbWRn
cHVfeGdtaV91cGRhdGVfdG9wb2xvZ3koaGl2ZSwgdG1wX2FkZXYpOwogCQkJfQogCQl9CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
