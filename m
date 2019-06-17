Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C574486C4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 17:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E6F89271;
	Mon, 17 Jun 2019 15:14:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2789271
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 15:14:39 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1922.namprd12.prod.outlook.com (10.175.101.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 15:14:37 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332%7]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 15:14:37 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
Thread-Topic: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
Thread-Index: AQHVJRtINCXoZMZ3kUmyU/RChnTlRaaf9GOA
Date: Mon, 17 Jun 2019 15:14:37 +0000
Message-ID: <BN6PR12MB161858B2EF2FDE6983B8AF8085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190617144500.29491-1-alexander.deucher@amd.com>
In-Reply-To: <20190617144500.29491-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:9d6f:eb5c:5991:9000]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 272bae29-a25b-447d-5131-08d6f3368367
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1922; 
x-ms-traffictypediagnostic: BN6PR12MB1922:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB19227C9A978CE518B6D1E19985EB0@BN6PR12MB1922.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(366004)(39860400002)(13464003)(199004)(189003)(6436002)(11346002)(46003)(6306002)(8936002)(72206003)(71200400001)(71190400001)(76116006)(68736007)(73956011)(25786009)(478600001)(8676002)(33656002)(55016002)(99286004)(110136005)(229853002)(74316002)(186003)(316002)(66446008)(76176011)(64756008)(4326008)(66476007)(2501003)(6246003)(6506007)(66946007)(14444005)(9686003)(81166006)(81156014)(53546011)(256004)(14454004)(52536014)(486006)(476003)(5660300002)(53936002)(102836004)(2906002)(86362001)(305945005)(66556008)(7696005)(6116002)(446003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1922;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IHSb4cy6vOW8htAbG7+BazQspU8vfWNl5UzkHb4s077LLb2wgdidqdiCp4rhmWpJ06+LZ6w478opCl1jKhbymcM81OQ3wGa+z5jUYk4lDSHTh4S/EnuNbZHMCKCgbNrdU5sMC6FeLf/5A/reRD8aBjGdXrSm889lUxuUPxZXdYaufArTV341iSLKF0Zz9ZNBoN+8wRMko/MS1vo7JCXg5/3ImYwJpdqPqaQZh4VPMZFXiRBYP6bt2oyJs3olmg2XO6ZGKfkNoj+cNMfX/sPn6wXetwonoOYa3ByAjaHOWWb+56Kx6qpVNmGQaj8hhO7sAYH807j7w3u+Dcx4g8AubzDs8TZ8YxBAdOT1eW4J5ZeqzQs0EFKudGQN/TpbZl/SfPAYCpWBwOuHPpfbJ1AY8nnDY59n5vYnfsKte/kO3Ts=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272bae29-a25b-447d-5131-08d6f3368367
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 15:14:37.6162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhiRV33i2oX2o++r74EL6sdFgtU+InwkazRy2IKaXFg=;
 b=nPGg+Gm/W6303OSH4WL9Dz22ObKKov5NLSrtfCImmyCYh2vQi3vhakYnIBQ4Yo3YK7YCvrY+XE2a8ayi/dluykLeh0WMlc1islrK7RIFBHoN0hqIPG/0/X4kQccRuhgr3ArVC5kUgFDV+aoNPN2Gw80NMkLgL8heBDynuRHfwxI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhbHNvIHdvcmtlZC4gSSBkb24ndCB0aGluayB0aGF0IEknbSBxdWFsaWZpZWQgZW5vdWdo
IHRvIFJCIGl0LCBidXQgeW91IGNhbiBhZGQgbXkNCg0KVmVyaWZpZWQtQnk6IEtlbnQgUnVzc2Vs
bCA8a2VudC5ydXNzZWxsQGFtZC5jb20+DQoNCiBLZW50DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgQWxleCBEZXVjaGVyDQpTZW50OiBNb25kYXksIEp1bmUgMTcsIDIw
MTkgMTA6NDUgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNo
ZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZGdwdTogd2FpdCB0byBmZXRjaCB0aGUgdmJpb3MgdW50aWwgYWZ0ZXIgY29tbW9u
IGluaXQNCg0KV2UgbmVlZCB0aGUgYXNpY19mdW5jcyBzZXQgZm9yIHRoZSBnZXQgcm9tIGNhbGxi
YWNrcyBpbiBzb21lIGNhc2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCAyNCArKysrKysrKysrKystLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQppbmRleCA0YTgzNmRiMTAwMGYuLmUyNjMwM2Jj
NTY3ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQpA
QCAtMTUzNCwxNyArMTUzNCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9lYXJseV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKQ0KIAkJYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7DQogDQotCS8q
IFJlYWQgQklPUyAqLw0KLQlpZiAoIWFtZGdwdV9nZXRfYmlvcyhhZGV2KSkNCi0JCXJldHVybiAt
RUlOVkFMOw0KLQ0KLQlyID0gYW1kZ3B1X2F0b21iaW9zX2luaXQoYWRldik7DQotCWlmIChyKSB7
DQotCQlkZXZfZXJyKGFkZXYtPmRldiwgImFtZGdwdV9hdG9tYmlvc19pbml0IGZhaWxlZFxuIik7
DQotCQlhbWRncHVfdmZfZXJyb3JfcHV0KGFkZXYsIEFNREdJTV9FUlJPUl9WRl9BVE9NQklPU19J
TklUX0ZBSUwsIDAsIDApOw0KLQkJcmV0dXJuIHI7DQotCX0NCi0NCiAJZm9yIChpID0gMDsgaSA8
IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgew0KIAkJaWYgKChhbWRncHVfaXBfYmxvY2tfbWFz
ayAmICgxIDw8IGkpKSA9PSAwKSB7DQogCQkJRFJNX0VSUk9SKCJkaXNhYmxlZCBpcCBibG9jazog
JWQgPCVzPlxuIiwgQEAgLTE1NjYsNiArMTU1NSwxOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZp
Y2VfaXBfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCQkJYWRldi0+
aXBfYmxvY2tzW2ldLnN0YXR1cy52YWxpZCA9IHRydWU7DQogCQkJfQ0KIAkJfQ0KKwkJLyogZ2V0
IHRoZSB2YmlvcyBhZnRlciB0aGUgYXNpY19mdW5jcyBhcmUgc2V0IHVwICovDQorCQlpZiAoYWRl
di0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgPT0gQU1EX0lQX0JMT0NLX1RZUEVfQ09NTU9O
KSB7DQorCQkJLyogUmVhZCBCSU9TICovDQorCQkJaWYgKCFhbWRncHVfZ2V0X2Jpb3MoYWRldikp
DQorCQkJCXJldHVybiAtRUlOVkFMOw0KKw0KKwkJCXIgPSBhbWRncHVfYXRvbWJpb3NfaW5pdChh
ZGV2KTsNCisJCQlpZiAocikgew0KKwkJCQlkZXZfZXJyKGFkZXYtPmRldiwgImFtZGdwdV9hdG9t
Ymlvc19pbml0IGZhaWxlZFxuIik7DQorCQkJCWFtZGdwdV92Zl9lcnJvcl9wdXQoYWRldiwgQU1E
R0lNX0VSUk9SX1ZGX0FUT01CSU9TX0lOSVRfRkFJTCwgMCwgMCk7DQorCQkJCXJldHVybiByOw0K
KwkJCX0NCisJCX0NCiAJfQ0KIA0KIAlhZGV2LT5jZ19mbGFncyAmPSBhbWRncHVfY2dfbWFzazsN
Ci0tDQoyLjIwLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
