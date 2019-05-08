Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A741B17D88
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 17:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAE5897CD;
	Wed,  8 May 2019 15:51:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4E6897CD
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 15:51:38 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2533.namprd12.prod.outlook.com (52.132.141.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 15:51:37 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 15:51:37 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdgpu/UVD: set no_user_fence flag to true
Thread-Topic: [PATCH 2/6] drm/amdgpu/UVD: set no_user_fence flag to true
Thread-Index: AQHVBbXr11tJ68EGkE2PflnYnmiQTw==
Date: Wed, 8 May 2019 15:51:37 +0000
Message-ID: <20190508155100.7810-2-leo.liu@amd.com>
References: <20190508155100.7810-1-leo.liu@amd.com>
In-Reply-To: <20190508155100.7810-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ee43a77-bccd-4de2-59a0-08d6d3cd0d8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2533; 
x-ms-traffictypediagnostic: DM5PR12MB2533:
x-microsoft-antispam-prvs: <DM5PR12MB2533B7DE93833430882CE753E5320@DM5PR12MB2533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(53936002)(305945005)(72206003)(6916009)(66066001)(71200400001)(71190400001)(4326008)(256004)(25786009)(6116002)(3846002)(7736002)(316002)(8676002)(1076003)(81156014)(81166006)(2351001)(86362001)(36756003)(5660300002)(478600001)(14454004)(50226002)(68736007)(8936002)(486006)(446003)(2501003)(11346002)(2616005)(476003)(6512007)(66946007)(66446008)(64756008)(66556008)(66476007)(2906002)(73956011)(102836004)(6506007)(386003)(6486002)(6436002)(52116002)(76176011)(5640700003)(186003)(26005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2533;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CMLt3EPsBiysEIVAIJgThyFKB/zAM7R0U6Q6nExiAvso2ci2X7iKpvo3IUiNMGH/9k8foEiDRZ8UXBsnPZ3+dCG5o5Hflnv5tggTg4KQlmsUSCBjaXLk5x6AU5PMJBGKP/94TIevzPDedr9zAT6g78qwBrrQll/VCtn9+mEwVfGkdW3X2+aVB/CAcyUZ12Gb/+isdl9Q/tBNdEu+9kTCfn26qUH5mD2aI0NrvJYkSMUot9v3S/EkUvf6Pu6SmYCRYkSvnbmljyqvLOdUPK329dt2WUsPXB1crH5f/iYoYY18OgYepGXKEBqyexIDnSLHdvpybrQfvg8GxxeFGzLyBEFgtMuwPegOg2pCVa/SfL4eOob+8moiUMG+DDi+PPNHRgYnh5Qgd9vF7DSSXV55Pa6cGynamyeMZUErgFX6x44=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee43a77-bccd-4de2-59a0-08d6d3cd0d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 15:51:37.1200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsLCsgef81VnT70/R6vSsJJ7xW89oLgZqOw0OK4JYQ0=;
 b=lzp/zzPAI1dy48ndAOs0I8r4DY6a8+Yc7vifwmJs9SoDHUBsWdIfgbsPkMB8dgwmxbQKlvBnUMcdQtMAVa+2/6oS/v5b99SCI6M6ePYzgmVI4NWtswH0CE5OQHcA7aj97/7iKhDAWscMDMnh4qiKhVknBnZdZT/W46I8L7iPdP0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gdXNlciBmZW5jZSBzdXBwb3J0IGZvciBVVkQNCg0KU2lnbmVkLW9mZi1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdXZkX3Y0XzIuYyB8IDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NV8w
LmMgfCAxICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jIHwgMyArKysN
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jIHwgMiArKw0KIDQgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjRfMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y0
XzIuYw0KaW5kZXggYzRmYjU4NjY3ZmQ0Li5iZjMzODUyODBkM2YgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjRfMi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjRfMi5jDQpAQCAtNzQxLDYgKzc0MSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdXZkX3Y0XzJfcmluZ19mdW5jcyA9IHsNCiAJLnR5cGUg
PSBBTURHUFVfUklOR19UWVBFX1VWRCwNCiAJLmFsaWduX21hc2sgPSAweGYsDQogCS5zdXBwb3J0
XzY0Yml0X3B0cnMgPSBmYWxzZSwNCisJLm5vX3VzZXJfZmVuY2UgPSB0cnVlLA0KIAkuZ2V0X3Jw
dHIgPSB1dmRfdjRfMl9yaW5nX2dldF9ycHRyLA0KIAkuZ2V0X3dwdHIgPSB1dmRfdjRfMl9yaW5n
X2dldF93cHRyLA0KIAkuc2V0X3dwdHIgPSB1dmRfdjRfMl9yaW5nX3NldF93cHRyLA0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91dmRfdjVfMC5jDQppbmRleCA1MmJkOGE2NTQ3MzQuLjMyMTBhN2Jk
OWE2ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NV8wLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NV8wLmMNCkBAIC04NDksNiAr
ODQ5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB1dmRfdjVfMF9y
aW5nX2Z1bmNzID0gew0KIAkudHlwZSA9IEFNREdQVV9SSU5HX1RZUEVfVVZELA0KIAkuYWxpZ25f
bWFzayA9IDB4ZiwNCiAJLnN1cHBvcnRfNjRiaXRfcHRycyA9IGZhbHNlLA0KKwkubm9fdXNlcl9m
ZW5jZSA9IHRydWUsDQogCS5nZXRfcnB0ciA9IHV2ZF92NV8wX3JpbmdfZ2V0X3JwdHIsDQogCS5n
ZXRfd3B0ciA9IHV2ZF92NV8wX3JpbmdfZ2V0X3dwdHIsDQogCS5zZXRfd3B0ciA9IHV2ZF92NV8w
X3Jpbmdfc2V0X3dwdHIsDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dXZkX3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCmluZGV4
IGM5ZWRkZGY5Zjg4YS4uYzYxYTMxNGM1NmNjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdXZkX3Y2XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dXZkX3Y2XzAuYw0KQEAgLTE1MDIsNiArMTUwMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1k
Z3B1X3JpbmdfZnVuY3MgdXZkX3Y2XzBfcmluZ19waHlzX2Z1bmNzID0gew0KIAkudHlwZSA9IEFN
REdQVV9SSU5HX1RZUEVfVVZELA0KIAkuYWxpZ25fbWFzayA9IDB4ZiwNCiAJLnN1cHBvcnRfNjRi
aXRfcHRycyA9IGZhbHNlLA0KKwkubm9fdXNlcl9mZW5jZSA9IHRydWUsDQogCS5nZXRfcnB0ciA9
IHV2ZF92Nl8wX3JpbmdfZ2V0X3JwdHIsDQogCS5nZXRfd3B0ciA9IHV2ZF92Nl8wX3JpbmdfZ2V0
X3dwdHIsDQogCS5zZXRfd3B0ciA9IHV2ZF92Nl8wX3Jpbmdfc2V0X3dwdHIsDQpAQCAtMTUyNyw2
ICsxNTI4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB1dmRfdjZf
MF9yaW5nX3ZtX2Z1bmNzID0gew0KIAkudHlwZSA9IEFNREdQVV9SSU5HX1RZUEVfVVZELA0KIAku
YWxpZ25fbWFzayA9IDB4ZiwNCiAJLnN1cHBvcnRfNjRiaXRfcHRycyA9IGZhbHNlLA0KKwkubm9f
dXNlcl9mZW5jZSA9IHRydWUsDQogCS5nZXRfcnB0ciA9IHV2ZF92Nl8wX3JpbmdfZ2V0X3JwdHIs
DQogCS5nZXRfd3B0ciA9IHV2ZF92Nl8wX3JpbmdfZ2V0X3dwdHIsDQogCS5zZXRfd3B0ciA9IHV2
ZF92Nl8wX3Jpbmdfc2V0X3dwdHIsDQpAQCAtMTU1NSw2ICsxNTU3LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB1dmRfdjZfMF9lbmNfcmluZ192bV9mdW5jcyA9IHsN
CiAJLmFsaWduX21hc2sgPSAweDNmLA0KIAkubm9wID0gSEVWQ19FTkNfQ01EX05PX09QLA0KIAku
c3VwcG9ydF82NGJpdF9wdHJzID0gZmFsc2UsDQorCS5ub191c2VyX2ZlbmNlID0gdHJ1ZSwNCiAJ
LmdldF9ycHRyID0gdXZkX3Y2XzBfZW5jX3JpbmdfZ2V0X3JwdHIsDQogCS5nZXRfd3B0ciA9IHV2
ZF92Nl8wX2VuY19yaW5nX2dldF93cHRyLA0KIAkuc2V0X3dwdHIgPSB1dmRfdjZfMF9lbmNfcmlu
Z19zZXRfd3B0ciwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRf
djdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYw0KaW5kZXggMjE5
MWQzZDBhMjE5Li5jZGI5NmQ0Y2I0MjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91dmRfdjdfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRf
djdfMC5jDQpAQCAtMTc1OSw2ICsxNzU5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVf
cmluZ19mdW5jcyB1dmRfdjdfMF9yaW5nX3ZtX2Z1bmNzID0gew0KIAkudHlwZSA9IEFNREdQVV9S
SU5HX1RZUEVfVVZELA0KIAkuYWxpZ25fbWFzayA9IDB4ZiwNCiAJLnN1cHBvcnRfNjRiaXRfcHRy
cyA9IGZhbHNlLA0KKwkubm9fdXNlcl9mZW5jZSA9IHRydWUsDQogCS52bWh1YiA9IEFNREdQVV9N
TUhVQiwNCiAJLmdldF9ycHRyID0gdXZkX3Y3XzBfcmluZ19nZXRfcnB0ciwNCiAJLmdldF93cHRy
ID0gdXZkX3Y3XzBfcmluZ19nZXRfd3B0ciwNCkBAIC0xNzkxLDYgKzE3OTIsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHV2ZF92N18wX2VuY19yaW5nX3ZtX2Z1bmNz
ID0gew0KIAkuYWxpZ25fbWFzayA9IDB4M2YsDQogCS5ub3AgPSBIRVZDX0VOQ19DTURfTk9fT1As
DQogCS5zdXBwb3J0XzY0Yml0X3B0cnMgPSBmYWxzZSwNCisJLm5vX3VzZXJfZmVuY2UgPSB0cnVl
LA0KIAkudm1odWIgPSBBTURHUFVfTU1IVUIsDQogCS5nZXRfcnB0ciA9IHV2ZF92N18wX2VuY19y
aW5nX2dldF9ycHRyLA0KIAkuZ2V0X3dwdHIgPSB1dmRfdjdfMF9lbmNfcmluZ19nZXRfd3B0ciwN
Ci0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
