Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5317D8A
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 17:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638EB897D7;
	Wed,  8 May 2019 15:51:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720073.outbound.protection.outlook.com [40.107.72.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FF5897D4
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 15:51:40 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2389.namprd12.prod.outlook.com (52.132.141.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Wed, 8 May 2019 15:51:38 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 15:51:38 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdgpu/VCE: set no_user_fence flag to true
Thread-Topic: [PATCH 3/6] drm/amdgpu/VCE: set no_user_fence flag to true
Thread-Index: AQHVBbXsZZW5gO9s60ORip2NcIZhKA==
Date: Wed, 8 May 2019 15:51:38 +0000
Message-ID: <20190508155100.7810-3-leo.liu@amd.com>
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
x-ms-office365-filtering-correlation-id: d8f11a7c-fc28-4108-ddfa-08d6d3cd0e67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2389; 
x-ms-traffictypediagnostic: DM5PR12MB2389:
x-microsoft-antispam-prvs: <DM5PR12MB2389E9CF87B0D051684107DEE5320@DM5PR12MB2389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(376002)(366004)(396003)(199004)(189003)(99286004)(66556008)(3846002)(6116002)(14454004)(76176011)(6506007)(386003)(26005)(52116002)(2616005)(316002)(446003)(72206003)(11346002)(2501003)(6436002)(186003)(64756008)(66946007)(66446008)(73956011)(66476007)(478600001)(486006)(86362001)(8676002)(476003)(81156014)(81166006)(102836004)(8936002)(50226002)(6916009)(68736007)(2351001)(71200400001)(71190400001)(25786009)(4326008)(6512007)(256004)(6486002)(5640700003)(53936002)(7736002)(66066001)(2906002)(305945005)(36756003)(5660300002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2389;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +cMyKXxaFlHT9Hep+CI1kciHPgbu8PcBOs6/EnW5PlKIGGcz15QzT0a/x0dDVYiY1JqeNLxusVv/DAkOI0vUmMahIJjWO7V6u7MO+eE02F4nB8eFzqegel+p1RkDcv54LoBtVKzAA5z11C7x1EBwlVA0Vn4CzLsZnQY2TVrYC68JQuEfw6rnfwMD/WZapHfx7qCu4DVgStHY0TDVm8GHfj7rc3kGC5crNOKSFrL9Hs1lxUjFmihGuj4NIOeOQl/Ijzt1aEKwSeKbF1CCRiIR8WF0uu3zb9lGuJkcfloq2lyuX8L8OA19qcq/8Pz7F4GW1hcK3nnmzrauq1gl4jqzXw6C+xNYTq4xQdspWR/dypBAXnt5sdeG49HxolEBgYVEglftxp+2VUCONplKEDztXEqshA5WfKg1BkWP80iBkzo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f11a7c-fc28-4108-ddfa-08d6d3cd0e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 15:51:38.5289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilsq4nj+ie3f+V7Y93ibxz+JY0qAZEWWJTqkLYwUb+Y=;
 b=gSXQjGmwRhAc5qDsHKxNeOz/AtaLD4loHp5Jv6P8fwOu+jVLtNp8DFnIcOtgrglbKHfqDXvJQI3Zg7sSaufQ5AF4qIPpPptoC0pgjw3ExRigN712LjBG99EwYStBCNEii+U4ljgjpmQ/jfmXL21aG3dwU5NyqxtMpwM6fAV0rTw=
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

VGhlcmUgaXMgbm8gdXNlciBmZW5jZSBzdXBwb3J0IGZvciBWQ0UNCg0KU2lnbmVkLW9mZi1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNlX3YyXzAuYyB8IDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92M18w
LmMgfCAyICsrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyB8IDEgKw0K
IDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNlX3YyXzAuYw0KaW5kZXggNDAzNjNjYTZjNWYxLi5hYjBjYjgzMjU3OTYgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jDQpAQCAtNjA1LDYgKzYwNSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdmNlX3YyXzBfcmluZ19mdW5jcyA9IHsN
CiAJLmFsaWduX21hc2sgPSAweGYsDQogCS5ub3AgPSBWQ0VfQ01EX05PX09QLA0KIAkuc3VwcG9y
dF82NGJpdF9wdHJzID0gZmFsc2UsDQorCS5ub191c2VyX2ZlbmNlID0gdHJ1ZSwNCiAJLmdldF9y
cHRyID0gdmNlX3YyXzBfcmluZ19nZXRfcnB0ciwNCiAJLmdldF93cHRyID0gdmNlX3YyXzBfcmlu
Z19nZXRfd3B0ciwNCiAJLnNldF93cHRyID0gdmNlX3YyXzBfcmluZ19zZXRfd3B0ciwNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNlX3YzXzAuYw0KaW5kZXggNmVjNjVjZjExMTEyLi4zNjkwMmVj
MTZkY2YgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jDQpAQCAtODk0LDYg
Kzg5NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdmNlX3YzXzBf
cmluZ19waHlzX2Z1bmNzID0gew0KIAkuYWxpZ25fbWFzayA9IDB4ZiwNCiAJLm5vcCA9IFZDRV9D
TURfTk9fT1AsDQogCS5zdXBwb3J0XzY0Yml0X3B0cnMgPSBmYWxzZSwNCisJLm5vX3VzZXJfZmVu
Y2UgPSB0cnVlLA0KIAkuZ2V0X3JwdHIgPSB2Y2VfdjNfMF9yaW5nX2dldF9ycHRyLA0KIAkuZ2V0
X3dwdHIgPSB2Y2VfdjNfMF9yaW5nX2dldF93cHRyLA0KIAkuc2V0X3dwdHIgPSB2Y2VfdjNfMF9y
aW5nX3NldF93cHRyLA0KQEAgLTkxNyw2ICs5MTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFt
ZGdwdV9yaW5nX2Z1bmNzIHZjZV92M18wX3Jpbmdfdm1fZnVuY3MgPSB7DQogCS5hbGlnbl9tYXNr
ID0gMHhmLA0KIAkubm9wID0gVkNFX0NNRF9OT19PUCwNCiAJLnN1cHBvcnRfNjRiaXRfcHRycyA9
IGZhbHNlLA0KKwkubm9fdXNlcl9mZW5jZSA9IHRydWUsDQogCS5nZXRfcnB0ciA9IHZjZV92M18w
X3JpbmdfZ2V0X3JwdHIsDQogCS5nZXRfd3B0ciA9IHZjZV92M18wX3JpbmdfZ2V0X3dwdHIsDQog
CS5zZXRfd3B0ciA9IHZjZV92M18wX3Jpbmdfc2V0X3dwdHIsDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3ZjZV92NF8wLmMNCmluZGV4IGMwZWMyNzk5MWMyMi4uZTI2N2IwNzNmNTI1IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYw0KQEAgLTEwNjksNiArMTA2OSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdmNlX3Y0XzBfcmluZ192bV9mdW5j
cyA9IHsNCiAJLmFsaWduX21hc2sgPSAweDNmLA0KIAkubm9wID0gVkNFX0NNRF9OT19PUCwNCiAJ
LnN1cHBvcnRfNjRiaXRfcHRycyA9IGZhbHNlLA0KKwkubm9fdXNlcl9mZW5jZSA9IHRydWUsDQog
CS52bWh1YiA9IEFNREdQVV9NTUhVQiwNCiAJLmdldF9ycHRyID0gdmNlX3Y0XzBfcmluZ19nZXRf
cnB0ciwNCiAJLmdldF93cHRyID0gdmNlX3Y0XzBfcmluZ19nZXRfd3B0ciwNCi0tIA0KMi4xNy4x
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
