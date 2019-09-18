Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A9B59A2
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 04:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A9F6E13F;
	Wed, 18 Sep 2019 02:20:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680045.outbound.protection.outlook.com [40.107.68.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822CF6E13F
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 02:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBrWktiN0JGvnKGRulOaK1Z2GUeaZBKqNMNBmlvZ4ltdpEd+P+4cWnbL4J6n4PNvMlUUGZOy0VHVTzKlxhBx6rNnoOqW7eW1kd0iFegiz5REV3gKB4nTKyqvjO0XjwAwz0y3gf4mWvQCTTvtth9v/9Vpc+rPzUTtYqQH+soccghjo2uTPDTsyikmSA0Vc7k+n9tXweO1h2az0YFAytmG0QN7zvTOyvjCUM+W6gjs23eYWxjHM/AB5C70R2IXAa21+05FBJbzxumVM+7GOem3CHnxJMiNkVzSn/xzIND6eXR6DrCF+KcjF4JBfI+nkzjSF59w2oJrQ/9mlT4RKHPnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q17eLTWxd/sr+IDnLXOt8rHkRX52oCNB79Oe8UMX7W0=;
 b=RyUcXLewRgNnzFnm4ASDx1zmQ/VDLnuiWrvHg4ToOZbyFKWc/DzwdQ5WwvWe/+L3bAqGRSDAYede0i67pWN+O8sx3UGW/bT0FdRke6+7o7Be8dgVAvz4/XgYbdbtFiKgiHV48IfT2lHOnpzoDOu0Sa1wekRY0ag/7AojevN6xMyTqk17DwswbZeTTafc5wHbArMP4cjEuQBm37CXVezdcvN2EEY+OUfNW9/RZ54AZ7TD01FxM/G2vbr8fGtP4WnGBtPVFdRwxnCUTCmGyEpexauutt7icnivXc5L+k/4uUR9jftSfD0UW33iaw+Q50Cl0uBiOLEPS57FwU1rdiZKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4053.namprd12.prod.outlook.com (20.180.17.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 18 Sep 2019 02:20:44 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 02:20:43 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Clements, John" <John.Clements@amd.com>
Subject: RE: [PATCH] drm/amdgpu: do not init mec2 jt for renoir
Thread-Topic: [PATCH] drm/amdgpu: do not init mec2 jt for renoir
Thread-Index: AQHVbazac6f2MA7mIkOvhQ85Vcv7M6cws/Yw
Date: Wed, 18 Sep 2019 02:20:43 +0000
Message-ID: <CH2PR12MB37674907BBF8A77CEFD7E6DDFE8E0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190917230828.6818-1-Hawking.Zhang@amd.com>
 <20190917230828.6818-2-Hawking.Zhang@amd.com>
In-Reply-To: <20190917230828.6818-2-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46831b65-e617-4583-df27-08d73bdecf1e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4053; 
x-ms-traffictypediagnostic: CH2PR12MB4053:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4053C480473DA4B81E4E40B5FE8E0@CH2PR12MB4053.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(13464003)(199004)(189003)(4326008)(6246003)(7696005)(99286004)(53546011)(6506007)(76176011)(5660300002)(33656002)(52536014)(76116006)(486006)(26005)(11346002)(476003)(446003)(66446008)(64756008)(66556008)(66476007)(102836004)(66946007)(186003)(6116002)(3846002)(2906002)(9686003)(8936002)(25786009)(2501003)(81166006)(71200400001)(71190400001)(81156014)(8676002)(14454004)(966005)(86362001)(66066001)(478600001)(6636002)(256004)(6436002)(6306002)(55016002)(229853002)(7736002)(305945005)(316002)(74316002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4053;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v7hEeDU5XksGmyQNReSs+RbrFAJhkmkq28qF4xlX4KWIT+MutZ94rAijxeG2iz9DoC0kwFseYfSkDG4bXURQr05nGjg/ApSsglGTF+t/jOuojhpcliG//Qg53DaKg2vtjbbSy/or9w+GtCiHM4/F/7SlS5DcGUOvdLSljUX8ssIDRuhAkQL4pcr6XymmlQ4XmcgVecaSfr0Wt1zXFmF8xFsp+Ebxm1AxZWumkH+s+aqkFX0CEt/pr9VzkovfnK2gEGXfL/SmI3zLdV/TawEuiF7L4WOsLIKUDlA8BMcOdAwkdzDtxOB0EjhSvapQHeu4EpimMAMOqYqKW/6GREa0mZOMAqPVDxs9az7zIQPF4PWA1YD5OTO4P3gzehDiYvJASyAUyRHopMdwjLxdHZcN6pHhIQCT4Pc8Opn3hrAPz04=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46831b65-e617-4583-df27-08d73bdecf1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 02:20:43.4563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 14sj7v9ux5J1wQd5/N7E3ZTSoHlJcyLJxa17r1lrjnC8Y386SLIFOlY1wrTXeeSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q17eLTWxd/sr+IDnLXOt8rHkRX52oCNB79Oe8UMX7W0=;
 b=HmsFqJ4S8+7L450DQ9CP8sv+fxlwSVFbJUUln+EZrKRWzwPiizDPlWn14qXLeYhOQETQarAe3EqwG2RvietGQENB1626FPujUg0c9F54o4CdyedCKpNb77SdTEONT3cWcUE/YiVDRn3UwINmuppkYX3fvUfn9YJFLBKBHcLnuaM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpoYW5nLCBIYXdraW5nDQpTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSA3OjA5IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IENsZW1lbnRzLCBKb2huIDxKb2huLkNsZW1lbnRzQGFtZC5jb20+DQpDYzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dTogZG8gbm90IGluaXQgbWVjMiBqdCBmb3IgcmVub2lyDQoNCkZvciBBU0lDcyBsaWtlIHJlbm9p
ci9hcmN0LCBkcml2ZXIgZG9lc24ndCBuZWVkIHRvIGxvYWQgbWVjMiBqdC4NCndoZW4gbWVjMSBq
dCBpcyBsb2FkZWQsIG1lYzIganQgd2lsbCBiZSBsb2FkZWQgYXV0b21hdGljYWxseSBzaW5jZSB0
aGUgd3JpdGUgaXMgYWN0YXVsbHkgYnJvYWRjYXN0ZWQgdG8gYm90aC4NCg0KV2UgbmVlZCB0byBt
b3JlIHRpbWUgdG8gdGVzdCBvdGhlciBnZng5IGFzaWMuIGJ1dCBmb3Igbm93IHdlIHNob3VsZCBi
ZSBhYmxlIHRvIGRyYXcgY29uY2x1c2lvbiB0aGF0IG1lYzIganQgaXMgbm90IG5lZWRlZCBmb3Ig
cmVub2lyIGFuZCBhcmN0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMgfCA0IC0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAg
fCAzICsrLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQppbmRleCA2ZTQ5NDMz
ZGQ4NzQuLmNlMzY4NzZkNjRkZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wc3AuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jDQpAQCAtMTA2OCwxMCArMTA2OCw2IEBAIHN0YXRpYyBpbnQgcHNwX25wX2Z3X2xvYWQo
c3RydWN0IHBzcF9jb250ZXh0ICpwc3ApDQogCQkgICAgIHVjb2RlLT51Y29kZV9pZCA9PSBBTURH
UFVfVUNPREVfSURfQ1BfTUVDMl9KVCkpDQogCQkJLyogc2tpcCBtZWMgSlQgd2hlbiBhdXRvbG9h
ZCBpcyBlbmFibGVkICovDQogCQkJY29udGludWU7DQotCQkvKiBSZW5vaXIgb25seSBuZWVkcyB0
byBsb2FkIG1lYyBqdW1wIHRhYmxlIG9uZSB0aW1lICovDQotCQlpZiAoYWRldi0+YXNpY190eXBl
ID09IENISVBfUkVOT0lSICYmDQotCQkgICAgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09E
RV9JRF9DUF9NRUMyX0pUKQ0KLQkJCWNvbnRpbnVlOw0KIA0KIAkJcHNwX3ByaW50X2Z3X2hkcihw
c3AsIHVjb2RlKTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KaW5kZXgg
NDljNjg2ZTgwZWE1Li5iMTNlNDgzMzJkYzggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jDQpAQCAtMTMyMSw3ICsxMzIxLDggQEAgc3RhdGljIGludCBnZnhfdjlfMF9pbml0
X2NwX2NvbXB1dGVfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIA0KIAkJ
CS8qIFRPRE86IERldGVybWluZSBpZiBNRUMyIEpUIEZXIGxvYWRpbmcgY2FuIGJlIHJlbW92ZWQN
CiAJCQkJIGZvciBhbGwgR0ZYIFY5IGFzaWMgYW5kIGFib3ZlICovDQotCQkJaWYgKGFkZXYtPmFz
aWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKSB7DQorCQkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBD
SElQX0FSQ1RVUlVTICYmDQorCQkJICAgIGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1JFTk9JUikg
ew0KIAkJCQlpbmZvID0gJmFkZXYtPmZpcm13YXJlLnVjb2RlW0FNREdQVV9VQ09ERV9JRF9DUF9N
RUMyX0pUXTsNCiAJCQkJaW5mby0+dWNvZGVfaWQgPSBBTURHUFVfVUNPREVfSURfQ1BfTUVDMl9K
VDsNCiAJCQkJaW5mby0+ZncgPSBhZGV2LT5nZngubWVjMl9mdzsNCi0tDQoyLjE3LjENCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFp
bGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
