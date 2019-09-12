Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D0B083D
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 07:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700EC6E12F;
	Thu, 12 Sep 2019 05:22:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDFF6E12F
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 05:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCLVfNy8sDJX6HIF7ddJg29rNjtBc63Ya9EMANFvyB6MhSQKE9SFjspBCShyEv19GNWzGmZ0Ft2CwxDDj9ysT1u/21J3OH4E2vrn2c6bH7yGkj3jVQLQjtV2jaIYe2Lp/PWxXG8+M15Evxd6wAVrmVarL6t4C6dYFJzBiAMJRYKh+sM2ZXgffx/Ue6ftchUvA0l3nBw62Ojz8bm1v3TC5xkWJaXkkGUGybauoKb9AaFPNKa0dtkA5Pq+u0vN0q0tcRS8NYNOlBhlmPaZ7YZp6KX3vJaM7HR2v6fKeApVu5eRWm/BYbG+BsrxIG0/AEY62OkEAwUnxCOhHuULaFoGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgOFb1caSRd7PkoAgoE/WNP5N4GgrbSufVoe3I+PTag=;
 b=gbFCmXAtcPRquHTHzW38ru04M1gvoqyEu6s0bzd0f1B3JJG4+4qSMUZct6jbpU7i6awKP2noJOAJrINlm8+80vd8v5UUrmdXW7uIOXMvhBM2VhSIk/gt8FW9/C1JbTHcd5gJh/OcaJyQxlF36yF0cTqClYPpACN1u7WvXsiSfr5upFY1mha7PqSS8bT1t4xCXHMEsWc781m/Lj5OiHfwPdLCtFNeJmOxToRZlmimhzo1z2QHdcAyioLGR2mxgN615ZEOm85UKpj093mtTc3TW2d0RdHedwgQbvuP310ecD38XIQSsuMhjf8uAz/8T07rw/R3UJOgj5Zcs7+wNrOkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) by
 MN2PR12MB4240.namprd12.prod.outlook.com (52.135.48.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 05:22:19 +0000
Received: from MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5]) by MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5%4]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 05:22:19 +0000
From: <jianzh@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Navi12 SRIOV VF doesn't load TOC
Thread-Topic: [PATCH] drm/amdgpu: Navi12 SRIOV VF doesn't load TOC
Thread-Index: AQHVaSoMzempo8OpUUaV9RGP/6eoIw==
Date: Thu, 12 Sep 2019 05:22:19 +0000
Message-ID: <20190912052158.20362-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To MN2PR12MB3056.namprd12.prod.outlook.com
 (2603:10b6:208:ca::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7dd3850-b944-4f14-c575-08d737412e5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4240; 
x-ms-traffictypediagnostic: MN2PR12MB4240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42405505AC36597B060A34FEE1B00@MN2PR12MB4240.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(189003)(199004)(36756003)(6436002)(4326008)(5640700003)(25786009)(6486002)(2616005)(2351001)(486006)(305945005)(7736002)(50226002)(8936002)(316002)(8676002)(54906003)(6116002)(3846002)(2906002)(81156014)(81166006)(14454004)(71200400001)(66446008)(66556008)(478600001)(66476007)(64756008)(66946007)(256004)(53936002)(99286004)(5660300002)(1076003)(52116002)(6512007)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(71190400001)(2501003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4240;
 H:MN2PR12MB3056.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 07ksaM373A7e/jp53SBDoJjD6qr+Nn6ch4XGK2JJqm75Hw7MJBQ1kx7xBh1N/cSZIuy8qom3Oo60dJVC2uVgT2F5njZig63UQTWwXqxs762y77eYR2VWtPqMBAzsgsdAhb5lo7ypp4R/PrDbtTJcv7Ts3smibu2yxS0it5WdGJ/fdkuLbQTDkJKHGTpCsGHqaXNOHTX+8l+cqmW1LNgZm8ISoWHnCCfTn/PA7nD42Il45SUEjiboLGfrsk5ovA/NhAFVLUCkZfEAzA6kyiYsAHiNCww5hSQ3LqPM6/UKX3J20VC2Dv++HemFOjaBzrId5FbAQyT0mAjYfue2FJpackvpK8DAdlJffPDjH/kFxlkKCaAcU10yVEt1aj3dUrrILh/XOXb3EokhHnqRrq9/YEX2MiLC4MjChjtA21QrmmY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dd3850-b944-4f14-c575-08d737412e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 05:22:19.1409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MC97bVbTHHWPQD0WfYLs1TvbvpfrGAo0F74DIszeBQhZGWUCu1+jL1f7UFxri8iG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgOFb1caSRd7PkoAgoE/WNP5N4GgrbSufVoe3I+PTag=;
 b=GC8XasxWGyKurp+W0sydhifY8812fKOeY2VpeEC8QR+lriaXhRTe+YvX2C20q23pkpRjvogY3G3lvZbDqga8sGDh33XiSQHv8bgdxKv2Epclr+ogBelwuykq8z/Ov69ESgsot5AXevllvJN56ezwMqQZ3Il4ImKnjcebvzEGb3o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jiange.Zhao@amd.com; 
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Zhao,
 Jiange" <Jiange.Zhao@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+CgpJbiBTUklPViBjYXNlLCB0
aGUgYXV0b2xvYWQgc2VxdWVuY2UgaXMgdGhlIHNhbWUKCmFzIGJhcmUgbWV0YWwsIGV4Y2VwdCBW
RiB3b24ndCBsb2FkIFRPQy4KClNpZ25lZC1vZmYtYnk6IEppYW5nZSBaaGFvIDxKaWFuZ2UuWmhh
b0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8
IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCBmOTBhMGNkMTI4
MjcuLjc2MmM5N2NlODI1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YwpAQCAtMjUzLDcgKzI1Myw4IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKQogCiAJLyogRm9yIEFTSUNzIHN1cHBvcnQgUkxDIGF1dG9sb2FkLCBwc3Ag
d2lsbCBwYXJzZSB0aGUgdG9jCiAJICogYW5kIGNhbGN1bGF0ZSB0aGUgdG90YWwgc2l6ZSBvZiBU
TVIgbmVlZGVkICovCi0JaWYgKHBzcC0+dG9jX3N0YXJ0X2FkZHIgJiYKKwlpZiAoIWFtZGdwdV9z
cmlvdl92Zihwc3AtPmFkZXYpICYmCisJICAgIHBzcC0+dG9jX3N0YXJ0X2FkZHIgJiYKIAkgICAg
cHNwLT50b2NfYmluX3NpemUgJiYKIAkgICAgcHNwLT5md19wcmlfYnVmKSB7CiAJCXJldCA9IHBz
cF9sb2FkX3RvYyhwc3AsICZ0bXJfc2l6ZSk7CkBAIC0xMzA1LDkgKzEzMDYsNiBAQCBpbnQgcHNw
X3JsY19hdXRvbG9hZF9zdGFydChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAlpbnQgcmV0Owog
CXN0cnVjdCBwc3BfZ2Z4X2NtZF9yZXNwICpjbWQ7CiAKLQlpZiAoYW1kZ3B1X3NyaW92X3ZmKHBz
cC0+YWRldikpCi0JCXJldHVybiAwOwotCiAJY21kID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHBz
cF9nZnhfY21kX3Jlc3ApLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWNtZCkKIAkJcmV0dXJuIC1FTk9N
RU07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
