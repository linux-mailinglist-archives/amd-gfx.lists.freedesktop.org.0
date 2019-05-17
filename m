Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910092121E
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 04:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6F8980C;
	Fri, 17 May 2019 02:39:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCE38980C
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 02:39:11 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3662.namprd12.prod.outlook.com (10.255.86.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 02:39:10 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765%5]) with mapi id 15.20.1856.012; Fri, 17 May 2019
 02:39:10 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
Thread-Topic: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
Thread-Index: AQHVC99CrDqQZAJCpkekPlcwIy0bl6Zum5TA
Date: Fri, 17 May 2019 02:39:10 +0000
Message-ID: <MN2PR12MB3039BD8CF5208A1667D34B29E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558008150-20674-1-git-send-email-yttao@amd.com>
In-Reply-To: <1558008150-20674-1-git-send-email-yttao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b788905-8d90-46ea-d9b0-08d6da70d782
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3662; 
x-ms-traffictypediagnostic: MN2PR12MB3662:
x-microsoft-antispam-prvs: <MN2PR12MB36626F2BC00649461A5B8CB6E50B0@MN2PR12MB3662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(346002)(376002)(39860400002)(189003)(199004)(51874003)(13464003)(8936002)(25786009)(8676002)(316002)(68736007)(4326008)(81166006)(81156014)(9686003)(86362001)(72206003)(446003)(11346002)(55016002)(476003)(52536014)(486006)(478600001)(2906002)(14454004)(2501003)(66066001)(6116002)(3846002)(256004)(5660300002)(186003)(26005)(71190400001)(7736002)(229853002)(71200400001)(6506007)(76176011)(305945005)(7696005)(53546011)(110136005)(74316002)(102836004)(33656002)(99286004)(76116006)(66946007)(73956011)(66476007)(66556008)(64756008)(53936002)(66446008)(6246003)(6436002)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3662;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YfsNyCmoeVqOMRnOjHWpbnyY/U8HHLONtCvA3AIa9uiblSGEyte31VICnGhz8CzHudf9OIBiWpjRZSRCVLKXYLUqI93GoJeI2KBrZAm/16NpspQ27fA149uFcorKZY7X6SmCsvwijWYEb6hiqiCR3aVhZFsC5LGacewMyREB7TJTkqtM3yS2HH5BOA1G/SRlttxPSyNJ7pyzWH9wUWlEV+DUVtA0o6VsK1NbdNYOJxtGAeF3LElIETcisfy6niprI1SQAhOQpTqGLR5qUsrGjVn6mI0XOkiUvt6T/wJbxb9igEFMiyAds54LedpV27mBcgoSDhfbj6fuk6nhLPWQlov6+5Tf4hlTRFFLJixWn5tRFwxyDfjFAN5+2b7DfFh5ptQjhLRCxOCP64JZSxV01ZtOO6Yozz5CaIxehM+/iIo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b788905-8d90-46ea-d9b0-08d6da70d782
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 02:39:10.4241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxOxg+OAByY6RoKzYW857x/H/DOaeZyjHafEWWK12SM=;
 b=jPLI9+hdsOpCtjhvfnoeL/xh0p6HnyueaO+clqW7Hr6/IYcjAbyNEZUzRdo3pvdxudpFFR19odtXUfXwbRM9u939NAX57tZyOXSlinEysjuRV2cFCOiR/ZCf1L51XdWP7iimo3AdGQ/Qp/rSkUoLdaPVjsD+0lEFHTWKbWKdk6A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Cc: "Huang, Trigger" <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uLgoKSGkgQ2hyaXN0aWFuIGFuZCBBbGV4CgoKQ2FuIHlvdSBoZWxwIHJldmlldyB0aGlz
PyBUaGFua3MgaW4gYWR2YW5jZS4KCgpCZXN0IFJlZ2FyZHMKWWludGlhbiBUYW8KCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPiAKU2Vu
dDogVGh1cnNkYXksIE1heSAxNiwgMjAxOSA4OjAzIFBNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogVGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQuY29tPjsgSHVhbmcs
IFRyaWdnZXIgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1k
Z3B1OiBzZXQgY29ycmVjdCB2cmFtX3dpZHRoIGZvciB2ZWdhMTAgdW5kZXIgc3Jpb3YKCkZvciBW
ZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJlYWQgZnJvbSBBVE9NIGFzIFJBVkVO
LCBhbmQgREYgcmVsYXRlZCByZWdpc3RlcnMgaXMgbm90IHJlYWRhYmxlLCBzZWVtcyBoYXJkY29y
ZCBpcyB0aGUgb25seSB3YXkgdG8gc2V0IHRoZSBjb3JyZWN0IHZyYW1fd2lkdGgKClNpZ25lZC1v
ZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IGMyMjE1NzAuLmE0
MTc3NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtODQ4LDYgKzg0
OCwxMyBAQCBzdGF0aWMgaW50IGdtY192OV8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJCWFkZXYtPmdtYy52cmFtX3dpZHRoID0gbnVtY2hhbiAqIGNoYW5zaXplOwogCX0K
IAorCS8qIEZvciBWZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJlYWQgZnJvbSBB
VE9NIGFzIFJBVkVOLAorCSAqIGFuZCBERiByZWxhdGVkIHJlZ2lzdGVycyBpcyBub3QgcmVhZGFi
bGUsIHNlZW1zIGhhcmRjb3JkIGlzIHRoZQorCSAqIG9ubHkgd2F5IHRvIHNldCB0aGUgY29ycmVj
dCB2cmFtX3dpZHRoICovCisJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiAoYWRldi0+YXNp
Y190eXBlID09IENISVBfVkVHQTEwKSkgeworCQlhZGV2LT5nbWMudnJhbV93aWR0aCA9IDIwNDg7
CisJfQorCiAJLyogc2l6ZSBpbiBNQiBvbiBzaSAqLwogCWFkZXYtPmdtYy5tY192cmFtX3NpemUg
PQogCQlhZGV2LT5uYmlvX2Z1bmNzLT5nZXRfbWVtc2l6ZShhZGV2KSAqIDEwMjRVTEwgKiAxMDI0
VUxMOwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
