Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEC4C4A8
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 02:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F466E49C;
	Thu, 20 Jun 2019 00:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730065.outbound.protection.outlook.com [40.107.73.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450396E49C
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 00:55:15 +0000 (UTC)
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3734.namprd12.prod.outlook.com (52.132.244.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 20 Jun 2019 00:55:13 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c%4]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 00:55:13 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: update df_v3_6 for xgmi perfmons
Thread-Topic: [PATCH 1/2] drm/amdgpu: update df_v3_6 for xgmi perfmons
Thread-Index: AQHVJwKQQHmqSIL4IUytMthKTBpOhaajtylw
Date: Thu, 20 Jun 2019 00:55:13 +0000
Message-ID: <CH2PR12MB3831E26D12F49C5436EA773885E40@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20190620005313.56371-1-jonathan.kim@amd.com>
In-Reply-To: <20190620005313.56371-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:520:117:4121:155c:486c:39e1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 393d85ec-5cc8-4a02-7aba-08d6f519f409
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3734; 
x-ms-traffictypediagnostic: CH2PR12MB3734:
x-microsoft-antispam-prvs: <CH2PR12MB3734DABD77D91A5BE413E26C85E40@CH2PR12MB3734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(346002)(366004)(396003)(13464003)(189003)(199004)(53546011)(316002)(7696005)(81166006)(52536014)(6636002)(186003)(110136005)(76116006)(68736007)(5660300002)(71190400001)(8676002)(476003)(33656002)(2501003)(446003)(81156014)(6506007)(66556008)(64756008)(66476007)(6116002)(66446008)(66946007)(74316002)(72206003)(229853002)(2906002)(11346002)(305945005)(46003)(71200400001)(8936002)(7736002)(73956011)(25786009)(486006)(76176011)(55016002)(99286004)(14444005)(6246003)(15650500001)(6436002)(478600001)(30864003)(9686003)(102836004)(86362001)(53936002)(14454004)(53946003)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3734;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uAcB8SefAZ1bq0Isxi959qoRk6CtJRXxQWPyFFkL7+I0CNvd57VuS9kphAO9n+aUs1YXWYX6EKR1Zg05/1s2eliT/tEDqvKF0kwsgZtORgqBv8mhAJXG5oX68XuYGzY9IH7aIhtctRv5yJ2ULyz0NvJ6Pp69z45vVnA71URSHAP0Isqxkibj4LpQe+ptFm+fbiCC0qlm6GTM+G77o6Ts9KVrckhAjZNoS/ngSUBxuaVbx9yQ5s/C43zD/mAgn8BrGzvWnXd7948lddWpLp4N5mPksd0WyRhFtUobYzMl7m4sWqMFCmLjONQ0Sy7ToJucampMxty/E1Iop3xQDEGRPpVT/bSJX0lQuJK0ZSRmFpF9Lm4JANymcruglKc6TSFFJ5isFnjEHk8rulG+ZKHFqw223F+kyD6N/SgZjBDffPc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393d85ec-5cc8-4a02-7aba-08d6f519f409
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 00:55:13.6003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3734
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDhQ4Gh1BUtp8MVjAde7osZbJFNQ27DgzHLPsni3tJo=;
 b=CNTqrvGQVfPC+tHf76bNNkGnBv/DsZG4G51xszNt1twZhc3hDe6TIRIiu2kjkcz3+5J7rwJSeAqMZGx6veQ8C/pEYLtmYky8YKOZrSzs7Gp1YIHaBDfovs6QzEuTQujT/kEO5fuLJ/ySQWt0aSWEGbzgDhpl+2I7ZZI0b28362Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIEZlbGl4IGFzIHJlcXVlc3RlZCAtIFNpbXBsaWZ5aW5nIGFkZXYgZGYgcGVyZm1vbiBjb25m
aWcgYXNzaWduIG1hc2sgdG8gYmUgZml4ZWQgbGVuZ3RoIGFuZCByZWxhdGVkIHNpbXBsaWZpY2F0
aW9uLg0KDQpKb24NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtpbSwgSm9u
YXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxOSwg
MjAxOSA4OjUzIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLaW0s
IEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFu
LktpbUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogdXBkYXRlIGRm
X3YzXzYgZm9yIHhnbWkgcGVyZm1vbnMNCg0KdjQ6IGZpeGVkIGt6YWxsb2MgZXJyb3IgY2hlY2sg
YW5kIG1vZGlmaWVkIGRmIGZ1bmMgaW5pdCB0byByZXR1cm4gZXJyb3IgY29kZQ0KDQp2MzogZml4
ZWQgY2xlYW51cCBieSBhZGRpbmcgZmluaSB0byBmcmVlIHVwIGFkZXYgZGYgY29uZmlnIGNvdW50
ZXJzDQoNCnYyOiBzaW1wbGlmaWVkIGJ5IHJlbW92aW5nIHhnbWkgcmVmZXJlbmNlcyBpbiBmdW5j
dGlvbiBuYW1lcyBhbmQgbW92aW5nIHRvIGdlbmVyaWMgZGYgZnVuY3Rpb24gbmFtZXMuICBmaXhl
ZCBpc3N1ZSBieSByZW1vdmluZyBoYXJkY29kZWQgY2FrZSB0eCBkYXRhIGV2ZW50cy4gc3RyZWFt
bGluZWQgZXJyb3IgaGFuZGxpbmcgYnkgaGF2aW5nICBkZl92M182X3BtY19nZXRfY3RybCByZXR1
cm4gZXJyb3IgY29kZS4NCg0KYWRkIHBtdSBhdHRyaWJ1dGUgZ3JvdXBzIGFuZCBzdHJ1Y3R1cmVz
IGZvciBwZXJmIGV2ZW50cy4NCmFkZCBzeXNmcyB0byB0cmFjayBhdmFpbGFibGUgZGYgcGVyZm1v
biBjb3VudGVycyBmaXggb3ZlcmZsb3cgaGFuZGxpbmcgaW4gcGVyZm1vbiBjb3VudGVyIHJlYWRz
Lg0KDQpDaGFuZ2UtSWQ6IEk2MWY3MzFjMDA2NmIxNzgzNDY1NmM3NDZlN2VmZTAzOGM0ZjYyYWNm
DQpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggIHwgIDE3ICsgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDQ0OSArKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuaCB8ICAxOSArLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICB8ICAgNCArDQogNCBmaWxlcyBjaGFu
Z2VkLCAyMzEgaW5zZXJ0aW9ucygrKSwgMjU4IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaA0KaW5kZXggZDM1NWU5YTA5YWQxLi45MWNmY2M3YmU1YzEgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCkBAIC03MzIsNiArNzMyLDcgQEAgc3RydWN0
IGFtZF9wb3dlcnBsYXkgeyAgfTsNCiANCiAjZGVmaW5lIEFNREdQVV9SRVNFVF9NQUdJQ19OVU0g
NjQNCisjZGVmaW5lIEFNREdQVV9NQVhfREZfUEVSRk1PTlMgMTYNCiBzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSB7DQogCXN0cnVjdCBkZXZpY2UJCQkqZGV2Ow0KIAlzdHJ1Y3QgZHJtX2RldmljZQkJKmRk
ZXY7DQpAQCAtOTYyLDYgKzk2Myw3IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsNCiAJbG9uZwkJ
CQljb21wdXRlX3RpbWVvdXQ7DQogDQogCXVpbnQ2NF90CQkJdW5pcXVlX2lkOw0KKwl1aW50NjRf
dAlkZl9wZXJmbW9uX2NvbmZpZ19hc3NpZ25fbWFza1tBTURHUFVfTUFYX0RGX1BFUkZNT05TXTsN
CiB9Ow0KIA0KIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFtZGdwdV90dG1f
YWRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikgQEAgLTEyMDEsNCArMTIwMywxOSBAQCBz
dGF0aWMgaW5saW5lIGludCBhbWRncHVfZG1fZGlzcGxheV9yZXN1bWUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpIHsgcmV0dXJuICAjZW5kaWYNCiANCiAjaW5jbHVkZSAiYW1kZ3B1X29iamVj
dC5oIg0KKw0KKy8qIHVzZWQgYnkgZGZfdjNfNi5jIGFuZCBhbWRncHVfcG11LmMgKi8NCisjZGVm
aW5lIEFNREdQVV9QTVVfQVRUUihfbmFtZSwgX29iamVjdCkJCQkJXA0KK3N0YXRpYyBzc2l6ZV90
CQkJCQkJCQlcDQorX25hbWUjI19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwJCQkJCVwNCisJCQkg
ICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCQlcDQorCQkJICAgICAgIGNoYXIg
KnBhZ2UpCQkJCVwNCit7CQkJCQkJCQkJXA0KKwlCVUlMRF9CVUdfT04oc2l6ZW9mKF9vYmplY3Qp
ID49IFBBR0VfU0laRSAtIDEpOwkJCVwNCisJcmV0dXJuIHNwcmludGYocGFnZSwgX29iamVjdCAi
XG4iKTsJCQkJXA0KK30JCQkJCQkJCQlcDQorCQkJCQkJCQkJXA0KK3N0YXRpYyBzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSBwbXVfYXR0cl8jI19uYW1lID0gX19BVFRSX1JPKF9uYW1lKQ0KKw0KICNl
bmRpZg0KKw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0KaW5kZXggOGMwOWJmOTk0
YWNkLi4xMmUzZTY3MDEzZDkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kZl92M182LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0K
QEAgLTMwLDggKzMwLDEwNCBAQA0KIHN0YXRpYyB1MzIgZGZfdjNfNl9jaGFubmVsX251bWJlcltd
ID0gezEsIDIsIDAsIDQsIDAsIDgsIDAsDQogCQkJCSAgICAgICAxNiwgMzIsIDAsIDAsIDAsIDIs
IDQsIDh9Ow0KIA0KKy8qIGluaXQgZGYgZm9ybWF0IGF0dHJzICovDQorQU1ER1BVX1BNVV9BVFRS
KGV2ZW50LAkJImNvbmZpZzowLTciKTsNCitBTURHUFVfUE1VX0FUVFIoaW5zdGFuY2UsCSJjb25m
aWc6OC0xNSIpOw0KK0FNREdQVV9QTVVfQVRUUih1bWFzaywJCSJjb25maWc6MTYtMjMiKTsNCisN
CisvKiBkZiBmb3JtYXQgYXR0cmlidXRlcyAgKi8NCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAq
ZGZfdjNfNl9mb3JtYXRfYXR0cnNbXSA9IHsNCisJJnBtdV9hdHRyX2V2ZW50LmF0dHIsDQorCSZw
bXVfYXR0cl9pbnN0YW5jZS5hdHRyLA0KKwkmcG11X2F0dHJfdW1hc2suYXR0ciwNCisJTlVMTA0K
K307DQorDQorLyogZGYgZm9ybWF0IGF0dHJpYnV0ZSBncm91cCAqLw0KK3N0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlX2dyb3VwIGRmX3YzXzZfZm9ybWF0X2F0dHJfZ3JvdXAgPSB7DQorCS5uYW1lID0g
ImZvcm1hdCIsDQorCS5hdHRycyA9IGRmX3YzXzZfZm9ybWF0X2F0dHJzLA0KK307DQorDQorLyog
ZGYgZXZlbnQgYXR0cnMgKi8NCitBTURHUFVfUE1VX0FUVFIoY2FrZTBfcGNzb3V0X3R4ZGF0YSwN
CisJCSAgICAgICJldmVudD0weDcsaW5zdGFuY2U9MHg0Nix1bWFzaz0weDIiKTsNCitBTURHUFVf
UE1VX0FUVFIoY2FrZTFfcGNzb3V0X3R4ZGF0YSwNCisJCSAgICAgICJldmVudD0weDcsaW5zdGFu
Y2U9MHg0Nyx1bWFzaz0weDIiKTsNCitBTURHUFVfUE1VX0FUVFIoY2FrZTBfcGNzb3V0X3R4bWV0
YSwNCisJCSAgICAgICJldmVudD0weDcsaW5zdGFuY2U9MHg0Nix1bWFzaz0weDQiKTsNCitBTURH
UFVfUE1VX0FUVFIoY2FrZTFfcGNzb3V0X3R4bWV0YSwNCisJCSAgICAgICJldmVudD0weDcsaW5z
dGFuY2U9MHg0Nyx1bWFzaz0weDQiKTsNCitBTURHUFVfUE1VX0FUVFIoY2FrZTBfZnRpaW5zdGF0
X3JlcWFsbG9jLA0KKwkJICAgICAgImV2ZW50PTB4YixpbnN0YW5jZT0weDQ2LHVtYXNrPTB4NCIp
Ow0KK0FNREdQVV9QTVVfQVRUUihjYWtlMV9mdGlpbnN0YXRfcmVxYWxsb2MsDQorCQkgICAgICAi
ZXZlbnQ9MHhiLGluc3RhbmNlPTB4NDcsdW1hc2s9MHg0Iik7DQorQU1ER1BVX1BNVV9BVFRSKGNh
a2UwX2Z0aWluc3RhdF9yc3BhbGxvYywNCisJCSAgICAgICJldmVudD0weGIsaW5zdGFuY2U9MHg0
Nix1bWFzaz0weDgiKTsNCitBTURHUFVfUE1VX0FUVFIoY2FrZTFfZnRpaW5zdGF0X3JzcGFsbG9j
LA0KKwkJICAgICAgImV2ZW50PTB4YixpbnN0YW5jZT0weDQ3LHVtYXNrPTB4OCIpOw0KKw0KKy8q
IGRmIGV2ZW50IGF0dHJpYnV0ZXMgICovDQorc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmRmX3Yz
XzZfZXZlbnRfYXR0cnNbXSA9IHsNCisJJnBtdV9hdHRyX2Nha2UwX3Bjc291dF90eGRhdGEuYXR0
ciwNCisJJnBtdV9hdHRyX2Nha2UxX3Bjc291dF90eGRhdGEuYXR0ciwNCisJJnBtdV9hdHRyX2Nh
a2UwX3Bjc291dF90eG1ldGEuYXR0ciwNCisJJnBtdV9hdHRyX2Nha2UxX3Bjc291dF90eG1ldGEu
YXR0ciwNCisJJnBtdV9hdHRyX2Nha2UwX2Z0aWluc3RhdF9yZXFhbGxvYy5hdHRyLA0KKwkmcG11
X2F0dHJfY2FrZTFfZnRpaW5zdGF0X3JlcWFsbG9jLmF0dHIsDQorCSZwbXVfYXR0cl9jYWtlMF9m
dGlpbnN0YXRfcnNwYWxsb2MuYXR0ciwNCisJJnBtdV9hdHRyX2Nha2UxX2Z0aWluc3RhdF9yc3Bh
bGxvYy5hdHRyLA0KKwlOVUxMDQorfTsNCisNCisvKiBkZiBldmVudCBhdHRyaWJ1dGUgZ3JvdXAg
Ki8NCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBkZl92M182X2V2ZW50X2F0dHJfZ3Jv
dXAgPSB7DQorCS5uYW1lID0gImV2ZW50cyIsDQorCS5hdHRycyA9IGRmX3YzXzZfZXZlbnRfYXR0
cnMNCit9Ow0KKw0KKy8qIGRmIGV2ZW50IGF0dHIgZ3JvdXBzICAqLw0KK2NvbnN0IHN0cnVjdCBh
dHRyaWJ1dGVfZ3JvdXAgKmRmX3YzXzZfYXR0cl9ncm91cHNbXSA9IHsNCisJCSZkZl92M182X2Zv
cm1hdF9hdHRyX2dyb3VwLA0KKwkJJmRmX3YzXzZfZXZlbnRfYXR0cl9ncm91cCwNCisJCU5VTEwN
Cit9Ow0KKw0KKy8qIGdldCB0aGUgbnVtYmVyIG9mIGRmIGNvdW50ZXJzIGF2YWlsYWJsZSAqLyBz
dGF0aWMgc3NpemVfdCANCitkZl92M182X2dldF9kZl9jbnRyX2F2YWlsKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCisJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KKwkJY2hhciAqYnVmKQ0K
K3sNCisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7DQorCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZGV2Ow0KKwlpbnQgaSwgY291bnQ7DQorDQorCWRkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
CisJYWRldiA9IGRkZXYtPmRldl9wcml2YXRlOw0KKwljb3VudCA9IDA7DQorDQorCWZvciAoaSA9
IDA7IGkgPCBERl9WM182X01BWF9DT1VOVEVSUzsgaSsrKSB7DQorCQlpZiAoYWRldi0+ZGZfcGVy
Zm1vbl9jb25maWdfYXNzaWduX21hc2tbaV0gPT0gMCkNCisJCQljb3VudCsrOw0KKwl9DQorDQor
CXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwJIiVpXG4iLCBjb3VudCk7DQorfQ0KKw0K
Ky8qIGRldmljZSBhdHRyIGZvciBhdmFpbGFibGUgcGVyZm1vbiBjb3VudGVycyAqLyBzdGF0aWMg
DQorREVWSUNFX0FUVFIoZGZfY250cl9hdmFpbCwgU19JUlVHTywgZGZfdjNfNl9nZXRfZGZfY250
cl9hdmFpbCwgTlVMTCk7DQorDQorLyogaW5pdCBwZXJmbW9ucyAqLw0KIHN0YXRpYyB2b2lkIGRm
X3YzXzZfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgIHsNCisJaW50IGksIHJldDsN
CisNCisJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX2RmX2Nu
dHJfYXZhaWwpOw0KKwlpZiAocmV0KQ0KKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gY3JlYXRlIGZp
bGUgZm9yIGF2YWlsYWJsZSBkZiBjb3VudGVyc1xuIik7DQorDQorCWZvciAoaSA9IDA7IGkgPCBB
TURHUFVfTUFYX0RGX1BFUkZNT05TOyBpKyspDQorCQlhZGV2LT5kZl9wZXJmbW9uX2NvbmZpZ19h
c3NpZ25fbWFza1tpXSA9IDA7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGRmX3YzXzZfZW5hYmxlX2Jy
b2FkY2FzdF9tb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBAQCAtMTA1LDI4ICsyMDEs
MTkgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9nZXRfY2xvY2tnYXRpbmdfc3RhdGUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkqZmxhZ3MgfD0gQU1EX0NHX1NVUFBPUlRfREZfTUdDRzsN
CiB9DQogDQotLyogaG9sZCBjb3VudGVyIGFzc2lnbm1lbnQgcGVyIGdwdSBzdHJ1Y3QgKi8gLXN0
cnVjdCBkZl92M182X2V2ZW50X21hc2sgew0KLQkJc3RydWN0IGFtZGdwdV9kZXZpY2UgZ3B1Ow0K
LQkJdWludDY0X3QgY29uZmlnX2Fzc2lnbl9tYXNrW0FNREdQVV9ERl9NQVhfQ09VTlRFUlNdOw0K
LX07DQotDQogLyogZ2V0IGFzc2lnbmVkIGRmIHBlcmZtb24gY3RyIGFzIGludCAqLyAtc3RhdGlj
IHZvaWQgZGZfdjNfNl9wbWNfY29uZmlnXzJfY250cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCi0JCQkJICAgICAgdWludDY0X3QgY29uZmlnLA0KLQkJCQkgICAgICBpbnQgKmNvdW50ZXIp
DQorc3RhdGljIGludCBkZl92M182X3BtY19jb25maWdfMl9jbnRyKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KKwkJCQkgICAgICB1aW50NjRfdCBjb25maWcpDQogew0KLQlzdHJ1Y3QgZGZf
djNfNl9ldmVudF9tYXNrICptYXNrOw0KIAlpbnQgaTsNCiANCi0JbWFzayA9IGNvbnRhaW5lcl9v
ZihhZGV2LCBzdHJ1Y3QgZGZfdjNfNl9ldmVudF9tYXNrLCBncHUpOw0KLQ0KLQlmb3IgKGkgPSAw
OyBpIDwgQU1ER1BVX0RGX01BWF9DT1VOVEVSUzsgaSsrKSB7DQotCQlpZiAoKGNvbmZpZyAmIDB4
MEZGRkZGRlVMKSA9PSBtYXNrLT5jb25maWdfYXNzaWduX21hc2tbaV0pIHsNCi0JCQkqY291bnRl
ciA9IGk7DQotCQkJcmV0dXJuOw0KLQkJfQ0KKwlmb3IgKGkgPSAwOyBpIDwgREZfVjNfNl9NQVhf
Q09VTlRFUlM7IGkrKykgew0KKwkJaWYgKChjb25maWcgJiAweDBGRkZGRkZVTCkgPT0NCisJCQkJ
CWFkZXYtPmRmX3BlcmZtb25fY29uZmlnX2Fzc2lnbl9tYXNrW2ldKQ0KKwkJCXJldHVybiBpOw0K
IAl9DQorDQorCXJldHVybiAtRUlOVkFMOw0KIH0NCiANCiAvKiBnZXQgYWRkcmVzcyBiYXNlZCBv
biBjb3VudGVyIGFzc2lnbm1lbnQgKi8gQEAgLTEzNiwxMCArMjIzLDcgQEAgc3RhdGljIHZvaWQg
ZGZfdjNfNl9wbWNfZ2V0X2FkZHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkJCSB1
aW50MzJfdCAqbG9fYmFzZV9hZGRyLA0KIAkJCQkgdWludDMyX3QgKmhpX2Jhc2VfYWRkcikNCiB7
DQotDQotCWludCB0YXJnZXRfY250ciA9IC0xOw0KLQ0KLQlkZl92M182X3BtY19jb25maWdfMl9j
bnRyKGFkZXYsIGNvbmZpZywgJnRhcmdldF9jbnRyKTsNCisJaW50IHRhcmdldF9jbnRyID0gZGZf
djNfNl9wbWNfY29uZmlnXzJfY250cihhZGV2LCBjb25maWcpOw0KIA0KIAlpZiAodGFyZ2V0X2Nu
dHIgPCAwKQ0KIAkJcmV0dXJuOw0KQEAgLTE3Nyw0MCArMjYxLDM4IEBAIHN0YXRpYyB2b2lkIGRm
X3YzXzZfcG1jX2dldF9yZWFkX3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAg
fQ0KIA0KIC8qIGdldCBjb250cm9sIGNvdW50ZXIgc2V0dGluZ3MgaS5lLiBhZGRyZXNzIGFuZCB2
YWx1ZXMgdG8gc2V0ICovIC1zdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRfY3RybF9zZXR0aW5n
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCitzdGF0aWMgaW50IGRmX3YzXzZfcG1jX2dl
dF9jdHJsX3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJCQkJICB1aW50
NjRfdCBjb25maWcsDQogCQkJCQkgIHVpbnQzMl90ICpsb19iYXNlX2FkZHIsDQogCQkJCQkgIHVp
bnQzMl90ICpoaV9iYXNlX2FkZHIsDQogCQkJCQkgIHVpbnQzMl90ICpsb192YWwsDQogCQkJCQkg
IHVpbnQzMl90ICpoaV92YWwpDQogew0KLQ0KLQl1aW50MzJfdCBldmVudHNlbCwgaW5zdGFuY2Us
IHVuaXRtYXNrOw0KLQl1aW50MzJfdCBlc181XzAsIGVzXzEzXzAsIGVzXzEzXzYsIGVzXzEzXzEy
LCBlc18xMV84LCBlc183XzA7DQotDQogCWRmX3YzXzZfcG1jX2dldF9hZGRyKGFkZXYsIGNvbmZp
ZywgMSwgbG9fYmFzZV9hZGRyLCBoaV9iYXNlX2FkZHIpOw0KIA0KLQlpZiAobG9fdmFsID09IE5V
TEwgfHwgaGlfdmFsID09IE5VTEwpDQotCQlyZXR1cm47DQotDQogCWlmICgoKmxvX2Jhc2VfYWRk
ciA9PSAwKSB8fCAoKmhpX2Jhc2VfYWRkciA9PSAwKSkgew0KLQkJRFJNX0VSUk9SKCJERiBQTUMg
YWRkcmVzc2luZyBub3QgcmV0cmlldmVkISBMbzogJXgsIEhpOiAleCIsDQorCQlEUk1fRVJST1Io
IltERiBQTUNdIGFkZHJlc3Npbmcgbm90IHJldHJpZXZlZCEgTG86ICV4LCBIaTogJXgiLA0KIAkJ
CQkqbG9fYmFzZV9hZGRyLCAqaGlfYmFzZV9hZGRyKTsNCi0JCXJldHVybjsNCisJCXJldHVybiAt
RU5YSU87DQorCX0NCisNCisJaWYgKGxvX3ZhbCAmJiBoaV92YWwpIHsNCisJCXVpbnQzMl90IGV2
ZW50c2VsLCBpbnN0YW5jZSwgdW5pdG1hc2s7DQorCQl1aW50MzJfdCBpbnN0YW5jZV8xMCwgaW5z
dGFuY2VfNTQzMiwgaW5zdGFuY2VfNzY7DQorDQorCQlldmVudHNlbCA9IERGX1YzXzZfR0VUX0VW
RU5UKGNvbmZpZykgJiAweDNmOw0KKwkJdW5pdG1hc2sgPSBERl9WM182X0dFVF9VTklUTUFTSyhj
b25maWcpICYgMHhmOw0KKwkJaW5zdGFuY2UgPSBERl9WM182X0dFVF9JTlNUQU5DRShjb25maWcp
Ow0KKw0KKwkJaW5zdGFuY2VfMTAgPSBpbnN0YW5jZSAmIDB4MzsNCisJCWluc3RhbmNlXzU0MzIg
PSAoaW5zdGFuY2UgPj4gMikgJiAweGY7DQorCQlpbnN0YW5jZV83NiA9IChpbnN0YW5jZSA+PiA2
KSAmIDB4MzsNCisNCisJCSpsb192YWwgPSAodW5pdG1hc2sgPDwgOCkgfCAoaW5zdGFuY2VfMTAg
PDwgNikgfCBldmVudHNlbDsNCisJCSpoaV92YWwgPSAoaW5zdGFuY2VfNzYgPDwgMjkpIHwgaW5z
dGFuY2VfNTQzMjsNCiAJfQ0KIA0KLQlldmVudHNlbCA9IEdFVF9FVkVOVChjb25maWcpOw0KLQlp
bnN0YW5jZSA9IEdFVF9JTlNUQU5DRShjb25maWcpOw0KLQl1bml0bWFzayA9IEdFVF9VTklUTUFT
Syhjb25maWcpOw0KLQ0KLQllc181XzAgPSBldmVudHNlbCAmIDB4M0ZVTDsNCi0JZXNfMTNfNiA9
IGluc3RhbmNlOw0KLQllc18xM18wID0gKGVzXzEzXzYgPDwgNikgKyBlc181XzA7DQotCWVzXzEz
XzEyID0gKGVzXzEzXzAgJiAweDAzMDAwVUwpID4+IDEyOw0KLQllc18xMV84ID0gKGVzXzEzXzAg
JiAweDBGMDBVTCkgPj4gODsNCi0JZXNfN18wID0gZXNfMTNfMCAmIDB4MEZGVUw7DQotCSpsb192
YWwgPSAoZXNfN18wICYgMHhGRlVMKSB8ICgodW5pdG1hc2sgJiAweDBGVUwpIDw8IDgpOw0KLQkq
aGlfdmFsID0gKGVzXzExXzggfCAoKGVzXzEzXzEyKTw8KDI5KSkpOw0KKwlyZXR1cm4gMDsNCiB9
DQogDQogLyogYXNzaWduIGRmIHBlcmZvcm1hbmNlIGNvdW50ZXJzIGZvciByZWFkICovIEBAIC0y
MTgsMjYgKzMwMCwyMSBAQCBzdGF0aWMgaW50IGRmX3YzXzZfcG1jX2Fzc2lnbl9jbnRyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJCQkgICB1aW50NjRfdCBjb25maWcsDQogCQkJCSAg
IGludCAqaXNfYXNzaWduZWQpDQogew0KLQ0KLQlzdHJ1Y3QgZGZfdjNfNl9ldmVudF9tYXNrICpt
YXNrOw0KIAlpbnQgaSwgdGFyZ2V0X2NudHI7DQogDQotCXRhcmdldF9jbnRyID0gLTE7DQotDQog
CSppc19hc3NpZ25lZCA9IDA7DQogDQotCWRmX3YzXzZfcG1jX2NvbmZpZ18yX2NudHIoYWRldiwg
Y29uZmlnLCAmdGFyZ2V0X2NudHIpOw0KKwl0YXJnZXRfY250ciA9IGRmX3YzXzZfcG1jX2NvbmZp
Z18yX2NudHIoYWRldiwgY29uZmlnKTsNCiANCiAJaWYgKHRhcmdldF9jbnRyID49IDApIHsNCiAJ
CSppc19hc3NpZ25lZCA9IDE7DQogCQlyZXR1cm4gMDsNCiAJfQ0KIA0KLQltYXNrID0gY29udGFp
bmVyX29mKGFkZXYsIHN0cnVjdCBkZl92M182X2V2ZW50X21hc2ssIGdwdSk7DQotDQotCWZvciAo
aSA9IDA7IGkgPCBBTURHUFVfREZfTUFYX0NPVU5URVJTOyBpKyspIHsNCi0JCWlmIChtYXNrLT5j
b25maWdfYXNzaWduX21hc2tbaV0gPT0gMFVMTCkgew0KLQkJCW1hc2stPmNvbmZpZ19hc3NpZ25f
bWFza1tpXSA9IGNvbmZpZyAmIDB4MEZGRkZGRlVMOw0KKwlmb3IgKGkgPSAwOyBpIDwgREZfVjNf
Nl9NQVhfQ09VTlRFUlM7IGkrKykgew0KKwkJaWYgKGFkZXYtPmRmX3BlcmZtb25fY29uZmlnX2Fz
c2lnbl9tYXNrW2ldID09IDBVKSB7DQorCQkJYWRldi0+ZGZfcGVyZm1vbl9jb25maWdfYXNzaWdu
X21hc2tbaV0gPQ0KKwkJCQkJCQljb25maWcgJiAweDBGRkZGRkZVTDsNCiAJCQlyZXR1cm4gMDsN
CiAJCX0NCiAJfQ0KQEAgLTI0OSw2NiArMzI2LDE3IEBAIHN0YXRpYyBpbnQgZGZfdjNfNl9wbWNf
YXNzaWduX2NudHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsICBzdGF0aWMgdm9pZCBkZl92
M182X3BtY19yZWxlYXNlX2NudHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkJCSAg
ICAgdWludDY0X3QgY29uZmlnKQ0KIHsNCi0NCi0Jc3RydWN0IGRmX3YzXzZfZXZlbnRfbWFzayAq
bWFzazsNCi0JaW50IHRhcmdldF9jbnRyOw0KLQ0KLQl0YXJnZXRfY250ciA9IC0xOw0KLQ0KLQlk
Zl92M182X3BtY19jb25maWdfMl9jbnRyKGFkZXYsIGNvbmZpZywgJnRhcmdldF9jbnRyKTsNCi0N
Ci0JbWFzayA9IGNvbnRhaW5lcl9vZihhZGV2LCBzdHJ1Y3QgZGZfdjNfNl9ldmVudF9tYXNrLCBn
cHUpOw0KKwlpbnQgdGFyZ2V0X2NudHIgPSBkZl92M182X3BtY19jb25maWdfMl9jbnRyKGFkZXYs
IGNvbmZpZyk7DQogDQogCWlmICh0YXJnZXRfY250ciA+PSAwKQ0KLQkJbWFzay0+Y29uZmlnX2Fz
c2lnbl9tYXNrW3RhcmdldF9jbnRyXSA9IDBVTEw7DQotDQorCQlhZGV2LT5kZl9wZXJmbW9uX2Nv
bmZpZ19hc3NpZ25fbWFza1t0YXJnZXRfY250cl0gPSAwVUxMOw0KIH0NCiANCi0vKg0KLSAqIGdl
dCB4Z21pIGxpbmsgY291bnRlcnMgdmlhIHByb2dyYW1tYWJsZSBkYXRhIGZhYnJpYyAoZGYpIGNv
dW50ZXJzIChtYXggNCkNCi0gKiB1c2luZyBjYWtlIHR4IGV2ZW50Lg0KLSAqDQotICogQGFkZXYg
LT4gYW1kZ3B1IGRldmljZQ0KLSAqIEBpbnN0YW5jZS0+IGN1cnJlbnRseSBjYWtlIGhhcyAyIGxp
bmtzIHRvIHBvbGwgb24gdmVnYTIwDQotICogQGNvdW50IC0+IGNvdW50ZXJzIHRvIHBhc3MNCi0g
Kg0KLSAqLw0KLQ0KLXN0YXRpYyB2b2lkIGRmX3YzXzZfZ2V0X3hnbWlfbGlua19jbnRyKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KLQkJCQkgICAgICAgaW50IGluc3RhbmNlLA0KLQkJCQkg
ICAgICAgdWludDY0X3QgKmNvdW50KQ0KLXsNCi0JdWludDMyX3QgbG9fYmFzZV9hZGRyLCBoaV9i
YXNlX2FkZHIsIGxvX3ZhbCwgaGlfdmFsOw0KLQl1aW50NjRfdCBjb25maWc7DQotDQotCWNvbmZp
ZyA9IEdFVF9JTlNUQU5DRV9DT05GSUcoaW5zdGFuY2UpOw0KLQ0KLQlkZl92M182X3BtY19nZXRf
cmVhZF9zZXR0aW5ncyhhZGV2LCBjb25maWcsICZsb19iYXNlX2FkZHIsDQotCQkJCSAgICAgICZo
aV9iYXNlX2FkZHIpOw0KLQ0KLQlpZiAoKGxvX2Jhc2VfYWRkciA9PSAwKSB8fCAoaGlfYmFzZV9h
ZGRyID09IDApKQ0KLQkJcmV0dXJuOw0KLQ0KLQlsb192YWwgPSBSUkVHMzJfUENJRShsb19iYXNl
X2FkZHIpOw0KLQloaV92YWwgPSBSUkVHMzJfUENJRShoaV9iYXNlX2FkZHIpOw0KIA0KLQkqY291
bnQgID0gKChoaV92YWwgfCAwVUxMKSA8PCAzMikgfCAobG9fdmFsIHwgMFVMTCk7DQotfQ0KLQ0K
LS8qDQotICogcmVzZXQgeGdtaSBsaW5rIGNvdW50ZXJzDQotICoNCi0gKiBAYWRldiAtPiBhbWRn
cHUgZGV2aWNlDQotICogQGluc3RhbmNlLT4gY3VycmVudGx5IGNha2UgaGFzIDIgbGlua3MgdG8g
cG9sbCBvbiB2ZWdhMjANCi0gKg0KLSAqLw0KLXN0YXRpYyB2b2lkIGRmX3YzXzZfcmVzZXRfeGdt
aV9saW5rX2NudHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQotCQkJCQkgaW50IGluc3Rh
bmNlKQ0KK3N0YXRpYyB2b2lkIGRmX3YzXzZfcmVzZXRfcGVyZm1vbl9jbnRyKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KKwkJCQkJIHVpbnQ2NF90IGNvbmZpZykNCiB7DQogCXVpbnQzMl90
IGxvX2Jhc2VfYWRkciwgaGlfYmFzZV9hZGRyOw0KLQl1aW50NjRfdCBjb25maWc7DQotDQotCWNv
bmZpZyA9IDBVTEwgfCAoMHg3VUxMKSB8ICgoMHg0NlVMTCArIGluc3RhbmNlKSA8PCA4KSB8ICgw
eDIgPDwgMTYpOw0KIA0KIAlkZl92M182X3BtY19nZXRfcmVhZF9zZXR0aW5ncyhhZGV2LCBjb25m
aWcsICZsb19iYXNlX2FkZHIsDQogCQkJCSAgICAgICZoaV9iYXNlX2FkZHIpOw0KQEAgLTMyMCwx
ODUgKzM0OCwxMDYgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9yZXNldF94Z21pX2xpbmtfY250cihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJV1JFRzMyX1BDSUUoaGlfYmFzZV9hZGRyLCAw
VUwpOw0KIH0NCiANCi0vKg0KLSAqIGFkZCB4Z21pIGxpbmsgY291bnRlcnMNCi0gKg0KLSAqIEBh
ZGV2IC0+IGFtZGdwdSBkZXZpY2UNCi0gKiBAaW5zdGFuY2UtPiBjdXJyZW50bHkgY2FrZSBoYXMg
MiBsaW5rcyB0byBwb2xsIG9uIHZlZ2EyMA0KLSAqDQotICovDQogDQotc3RhdGljIGludCBkZl92
M182X2FkZF94Z21pX2xpbmtfY250cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCi0JCQkJ
ICAgICAgaW50IGluc3RhbmNlKQ0KK3N0YXRpYyBpbnQgZGZfdjNfNl9hZGRfcGVyZm1vbl9jbnRy
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KKwkJCQkgICAgICB1aW50NjRfdCBjb25maWcp
DQogew0KIAl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsLCBoaV92
YWw7DQotCXVpbnQ2NF90IGNvbmZpZzsNCiAJaW50IHJldCwgaXNfYXNzaWduZWQ7DQogDQotCWlm
IChpbnN0YW5jZSA8IDAgfHwgaW5zdGFuY2UgPiAxKQ0KLQkJcmV0dXJuIC1FSU5WQUw7DQotDQot
CWNvbmZpZyA9IEdFVF9JTlNUQU5DRV9DT05GSUcoaW5zdGFuY2UpOw0KLQ0KIAlyZXQgPSBkZl92
M182X3BtY19hc3NpZ25fY250cihhZGV2LCBjb25maWcsICZpc19hc3NpZ25lZCk7DQogDQogCWlm
IChyZXQgfHwgaXNfYXNzaWduZWQpDQogCQlyZXR1cm4gcmV0Ow0KIA0KLQlkZl92M182X3BtY19n
ZXRfY3RybF9zZXR0aW5ncyhhZGV2LA0KKwlyZXQgPSBkZl92M182X3BtY19nZXRfY3RybF9zZXR0
aW5ncyhhZGV2LA0KIAkJCWNvbmZpZywNCiAJCQkmbG9fYmFzZV9hZGRyLA0KIAkJCSZoaV9iYXNl
X2FkZHIsDQogCQkJJmxvX3ZhbCwNCiAJCQkmaGlfdmFsKTsNCiANCisJaWYgKHJldCkNCisJCXJl
dHVybiByZXQ7DQorDQorCURSTV9ERUJVR19EUklWRVIoImNvbmZpZz0lbGx4IGFkZHI9JTA4eDol
MDh4IHZhbD0lMDh4OiUwOHgiLA0KKwkJCWNvbmZpZywgbG9fYmFzZV9hZGRyLCBoaV9iYXNlX2Fk
ZHIsIGxvX3ZhbCwgaGlfdmFsKTsNCisNCiAJV1JFRzMyX1BDSUUobG9fYmFzZV9hZGRyLCBsb192
YWwpOw0KIAlXUkVHMzJfUENJRShoaV9iYXNlX2FkZHIsIGhpX3ZhbCk7DQogDQogCXJldHVybiBy
ZXQ7DQogfQ0KIA0KLQ0KLS8qDQotICogc3RhcnQgeGdtaSBsaW5rIGNvdW50ZXJzDQotICoNCi0g
KiBAYWRldiAtPiBhbWRncHUgZGV2aWNlDQotICogQGluc3RhbmNlLT4gY3VycmVudGx5IGNha2Ug
aGFzIDIgbGlua3MgdG8gcG9sbCBvbiB2ZWdhMjANCi0gKiBAaXNfZW5hYmxlIC0+IGVpdGhlciBy
ZXN1bWUgb3IgYXNzaWduIGV2ZW50IHZpYSBkZiBwZXJmbW9uDQotICoNCi0gKi8NCi0NCi1zdGF0
aWMgaW50IGRmX3YzXzZfc3RhcnRfeGdtaV9saW5rX2NudHIoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsDQotCQkJCQlpbnQgaW5zdGFuY2UsDQotCQkJCQlpbnQgaXNfZW5hYmxlKQ0KK3N0YXRp
YyBpbnQgZGZfdjNfNl9wbWNfc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQ2
NF90IGNvbmZpZywNCisJCQkgICAgIGludCBpc19lbmFibGUpDQogew0KIAl1aW50MzJfdCBsb19i
YXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsOw0KLQl1aW50NjRfdCBjb25maWc7DQotCWlu
dCByZXQ7DQotDQotCWlmIChpbnN0YW5jZSA8IDAgfHwgaW5zdGFuY2UgPiAxKQ0KLQkJcmV0dXJu
IC1FSU5WQUw7DQotDQotCWlmIChpc19lbmFibGUpIHsNCisJaW50IHJldCA9IDA7DQogDQotCQly
ZXQgPSBkZl92M182X2FkZF94Z21pX2xpbmtfY250cihhZGV2LCBpbnN0YW5jZSk7DQotDQotCQlp
ZiAocmV0KQ0KLQkJCXJldHVybiByZXQ7DQorCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQor
CWNhc2UgQ0hJUF9WRUdBMjA6DQogDQotCX0gZWxzZSB7DQorCQlkZl92M182X3Jlc2V0X3BlcmZt
b25fY250cihhZGV2LCBjb25maWcpOw0KIA0KLQkJY29uZmlnID0gR0VUX0lOU1RBTkNFX0NPTkZJ
RyhpbnN0YW5jZSk7DQorCQlpZiAoaXNfZW5hYmxlKSB7DQorCQkJcmV0ID0gZGZfdjNfNl9hZGRf
cGVyZm1vbl9jbnRyKGFkZXYsIGNvbmZpZyk7DQorCQl9IGVsc2Ugew0KKwkJCXJldCA9IGRmX3Yz
XzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKGFkZXYsDQorCQkJCQljb25maWcsDQorCQkJCQkmbG9f
YmFzZV9hZGRyLA0KKwkJCQkJJmhpX2Jhc2VfYWRkciwNCisJCQkJCU5VTEwsDQorCQkJCQlOVUxM
KTsNCiANCi0JCWRmX3YzXzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKGFkZXYsDQotCQkJCWNvbmZp
ZywNCi0JCQkJJmxvX2Jhc2VfYWRkciwNCi0JCQkJJmhpX2Jhc2VfYWRkciwNCi0JCQkJTlVMTCwN
Ci0JCQkJTlVMTCk7DQorCQkJaWYgKHJldCkNCisJCQkJcmV0dXJuIHJldDsNCiANCi0JCWlmIChs
b19iYXNlX2FkZHIgPT0gMCkNCi0JCQlyZXR1cm4gLUVJTlZBTDsNCisJCQlsb192YWwgPSBSUkVH
MzJfUENJRShsb19iYXNlX2FkZHIpOw0KIA0KLQkJbG9fdmFsID0gUlJFRzMyX1BDSUUobG9fYmFz
ZV9hZGRyKTsNCisJCQlEUk1fREVCVUdfRFJJVkVSKCJjb25maWc9JWxseCBhZGRyPSUwOHg6JTA4
eCB2YWw9JTA4eCIsDQorCQkJCWNvbmZpZywgbG9fYmFzZV9hZGRyLCBoaV9iYXNlX2FkZHIsIGxv
X3ZhbCk7DQogDQotCQlXUkVHMzJfUENJRShsb19iYXNlX2FkZHIsIGxvX3ZhbCB8ICgxVUxMIDw8
IDIyKSk7DQorCQkJV1JFRzMyX1BDSUUobG9fYmFzZV9hZGRyLCBsb192YWwgfCAoMVVMTCA8PCAy
MikpOw0KKwkJfQ0KIA0KLQkJcmV0ID0gMDsNCisJCWJyZWFrOw0KKwlkZWZhdWx0Og0KKwkJYnJl
YWs7DQogCX0NCiANCiAJcmV0dXJuIHJldDsNCi0NCiB9DQogDQotLyoNCi0gKiBzdGFydCB4Z21p
IGxpbmsgY291bnRlcnMNCi0gKg0KLSAqIEBhZGV2IC0+IGFtZGdwdSBkZXZpY2UNCi0gKiBAaW5z
dGFuY2UtPiBjdXJyZW50bHkgY2FrZSBoYXMgMiBsaW5rcyB0byBwb2xsIG9uIHZlZ2EyMA0KLSAq
IEBpc19lbmFibGUgLT4gZWl0aGVyIHBhdXNlIG9yIHVuYXNzaWduIGV2ZW50IHZpYSBkZiBwZXJm
bW9uDQotICoNCi0gKi8NCi0NCi1zdGF0aWMgaW50IGRmX3YzXzZfc3RvcF94Z21pX2xpbmtfY250
cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCi0JCQkJICAgICAgIGludCBpbnN0YW5jZSwN
Ci0JCQkJICAgICAgIGludCBpc19kaXNhYmxlKQ0KK3N0YXRpYyBpbnQgZGZfdjNfNl9wbWNfc3Rv
cChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgY29uZmlnLA0KKwkJCSAgICBp
bnQgaXNfZGlzYWJsZSkNCiB7DQotDQogCXVpbnQzMl90IGxvX2Jhc2VfYWRkciwgaGlfYmFzZV9h
ZGRyLCBsb192YWw7DQotCXVpbnQ2NF90IGNvbmZpZzsNCi0NCi0JY29uZmlnID0gR0VUX0lOU1RB
TkNFX0NPTkZJRyhpbnN0YW5jZSk7DQotDQotCWlmIChpc19kaXNhYmxlKSB7DQotCQlkZl92M182
X3Jlc2V0X3hnbWlfbGlua19jbnRyKGFkZXYsIGluc3RhbmNlKTsNCi0JCWRmX3YzXzZfcG1jX3Jl
bGVhc2VfY250cihhZGV2LCBjb25maWcpOw0KLQl9IGVsc2Ugew0KLQ0KLQkJZGZfdjNfNl9wbWNf
Z2V0X2N0cmxfc2V0dGluZ3MoYWRldiwNCi0JCQkJY29uZmlnLA0KLQkJCQkmbG9fYmFzZV9hZGRy
LA0KLQkJCQkmaGlfYmFzZV9hZGRyLA0KLQkJCQlOVUxMLA0KLQkJCQlOVUxMKTsNCi0NCi0JCWlm
ICgobG9fYmFzZV9hZGRyID09IDApIHx8IChoaV9iYXNlX2FkZHIgPT0gMCkpDQotCQkJcmV0dXJu
IC1FSU5WQUw7DQotDQotCQlsb192YWwgPSBSUkVHMzJfUENJRShsb19iYXNlX2FkZHIpOw0KLQ0K
LQkJV1JFRzMyX1BDSUUobG9fYmFzZV9hZGRyLCBsb192YWwgJiB+KDFVTEwgPDwgMjIpKTsNCi0J
fQ0KLQ0KLQlyZXR1cm4gMDsNCi19DQotDQotc3RhdGljIGludCBkZl92M182X3BtY19zdGFydChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgY29uZmlnLA0KLQkJCSAgICAgaW50
IGlzX2VuYWJsZSkNCi17DQotCWludCB4Z21pX3R4X2xpbmssIHJldCA9IDA7DQorCWludCByZXQg
PSAwOw0KIA0KIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KIAljYXNlIENISVBfVkVHQTIw
Og0KLQkJeGdtaV90eF9saW5rID0gSVNfREZfWEdNSV8wX1RYKGNvbmZpZykgPyAwDQotCQkJCQk6
IChJU19ERl9YR01JXzFfVFgoY29uZmlnKSA/IDEgOiAtMSk7DQotDQotCQlpZiAoeGdtaV90eF9s
aW5rID49IDApDQotCQkJcmV0ID0gZGZfdjNfNl9zdGFydF94Z21pX2xpbmtfY250cihhZGV2LCB4
Z21pX3R4X2xpbmssDQotCQkJCQkJICAgICAgaXNfZW5hYmxlKTsNCisJCXJldCA9IGRmX3YzXzZf
cG1jX2dldF9jdHJsX3NldHRpbmdzKGFkZXYsDQorCQkJY29uZmlnLA0KKwkJCSZsb19iYXNlX2Fk
ZHIsDQorCQkJJmhpX2Jhc2VfYWRkciwNCisJCQlOVUxMLA0KKwkJCU5VTEwpOw0KIA0KIAkJaWYg
KHJldCkNCiAJCQlyZXR1cm4gcmV0Ow0KIA0KLQkJcmV0ID0gMDsNCi0JCWJyZWFrOw0KLQlkZWZh
dWx0Og0KLQkJYnJlYWs7DQotCX0NCisJCWxvX3ZhbCA9IFJSRUczMl9QQ0lFKGxvX2Jhc2VfYWRk
cik7DQogDQotCXJldHVybiByZXQ7DQotfQ0KKwkJRFJNX0RFQlVHX0RSSVZFUigiY29uZmlnPSVs
bHggYWRkcj0lMDh4OiUwOHggdmFsPSUwOHgiLA0KKwkJCQljb25maWcsIGxvX2Jhc2VfYWRkciwg
aGlfYmFzZV9hZGRyLCBsb192YWwpOw0KIA0KLXN0YXRpYyBpbnQgZGZfdjNfNl9wbWNfc3RvcChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgY29uZmlnLA0KLQkJCSAgICBpbnQg
aXNfZGlzYWJsZSkNCi17DQotCWludCB4Z21pX3R4X2xpbmssIHJldCA9IDA7DQorCQlXUkVHMzJf
UENJRShsb19iYXNlX2FkZHIsIGxvX3ZhbCAmIH4oMVVMTCA8PCAyMikpOw0KIA0KLQlzd2l0Y2gg
KGFkZXYtPmFzaWNfdHlwZSkgew0KLQljYXNlIENISVBfVkVHQTIwOg0KLQkJCXhnbWlfdHhfbGlu
ayA9IElTX0RGX1hHTUlfMF9UWChjb25maWcpID8gMA0KLQkJCQk6IChJU19ERl9YR01JXzFfVFgo
Y29uZmlnKSA/IDEgOiAtMSk7DQotDQotCQkJaWYgKHhnbWlfdHhfbGluayA+PSAwKSB7DQotCQkJ
CXJldCA9IGRmX3YzXzZfc3RvcF94Z21pX2xpbmtfY250cihhZGV2LA0KLQkJCQkJCQkJICB4Z21p
X3R4X2xpbmssDQotCQkJCQkJCQkgIGlzX2Rpc2FibGUpOw0KLQkJCQlpZiAocmV0KQ0KLQkJCQkJ
cmV0dXJuIHJldDsNCi0JCQl9DQotDQotCQkJcmV0ID0gMDsNCi0JCQlicmVhazsNCisJCWlmIChp
c19kaXNhYmxlKQ0KKwkJCWRmX3YzXzZfcG1jX3JlbGVhc2VfY250cihhZGV2LCBjb25maWcpOw0K
Kw0KKwkJYnJlYWs7DQogCWRlZmF1bHQ6DQogCQlicmVhazsNCiAJfQ0KQEAgLTUxMCwyNCArNDU5
LDM0IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcG1jX2dldF9jb3VudChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCiAJCQkJICB1aW50NjRfdCBjb25maWcsDQogCQkJCSAgdWludDY0X3QgKmNv
dW50KQ0KIHsNCi0NCi0JaW50IHhnbWlfdHhfbGluazsNCisJdWludDMyX3QgbG9fYmFzZV9hZGRy
LCBoaV9iYXNlX2FkZHIsIGxvX3ZhbCwgaGlfdmFsOw0KKwkqY291bnQgPSAwOw0KIA0KIAlzd2l0
Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KIAljYXNlIENISVBfVkVHQTIwOg0KLQkJeGdtaV90eF9s
aW5rID0gSVNfREZfWEdNSV8wX1RYKGNvbmZpZykgPyAwDQotCQkJCQk6IChJU19ERl9YR01JXzFf
VFgoY29uZmlnKSA/IDEgOiAtMSk7DQogDQotCQlpZiAoeGdtaV90eF9saW5rID49IDApIHsNCi0J
CQlkZl92M182X3Jlc2V0X3hnbWlfbGlua19jbnRyKGFkZXYsIHhnbWlfdHhfbGluayk7DQotCQkJ
ZGZfdjNfNl9nZXRfeGdtaV9saW5rX2NudHIoYWRldiwgeGdtaV90eF9saW5rLCBjb3VudCk7DQot
CQl9DQorCQlkZl92M182X3BtY19nZXRfcmVhZF9zZXR0aW5ncyhhZGV2LCBjb25maWcsICZsb19i
YXNlX2FkZHIsDQorCQkJCSAgICAgICZoaV9iYXNlX2FkZHIpOw0KKw0KKwkJaWYgKChsb19iYXNl
X2FkZHIgPT0gMCkgfHwgKGhpX2Jhc2VfYWRkciA9PSAwKSkNCisJCQlyZXR1cm47DQorDQorCQls
b192YWwgPSBSUkVHMzJfUENJRShsb19iYXNlX2FkZHIpOw0KKwkJaGlfdmFsID0gUlJFRzMyX1BD
SUUoaGlfYmFzZV9hZGRyKTsNCisNCisJCSpjb3VudCAgPSAoKGhpX3ZhbCB8IDBVTEwpIDw8IDMy
KSB8IChsb192YWwgfCAwVUxMKTsNCisNCisJCWlmICgqY291bnQgPj0gREZfVjNfNl9QRVJGTU9O
X09WRVJGTE9XKQ0KKwkJCSpjb3VudCA9IDA7DQorDQorCQlEUk1fREVCVUdfRFJJVkVSKCJjb25m
aWc9JWxseCBhZGRyPSUwOHg6JTA4eCB2YWw9JTA4eDolMDh4IiwNCisJCQljb25maWcsIGxvX2Jh
c2VfYWRkciwgaGlfYmFzZV9hZGRyLCBsb192YWwsIGhpX3ZhbCk7DQogDQogCQlicmVhazsNCisN
CiAJZGVmYXVsdDoNCiAJCWJyZWFrOw0KIAl9DQotDQogfQ0KIA0KIGNvbnN0IHN0cnVjdCBhbWRn
cHVfZGZfZnVuY3MgZGZfdjNfNl9mdW5jcyA9IHsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RmX3YzXzYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3Yz
XzYuaA0KaW5kZXggZmNmZmQ4MDc3NjRkLi43Njk5ODU0MWJjMzAgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2RmX3YzXzYuaA0KQEAgLTM2LDIyICszNiwxNSBAQCBlbnVtIERGX1YzXzZfTUdD
RyB7DQogfTsNCiANCiAvKiBEZWZpbmVkIGluIGdsb2JhbF9mZWF0dXJlcy5oIGFzIEZUSV9QRVJG
TU9OX1ZJU0lCTEUgKi8NCi0jZGVmaW5lIEFNREdQVV9ERl9NQVhfQ09VTlRFUlMJCTQNCisjZGVm
aW5lIERGX1YzXzZfTUFYX0NPVU5URVJTCQk0DQogDQogLyogZ2V0IGZsYWdzIGZyb20gZGYgcGVy
Zm1vbiBjb25maWcgKi8NCi0jZGVmaW5lIEdFVF9FVkVOVCh4KQkJCSh4ICYgMHhGRlVMKQ0KLSNk
ZWZpbmUgR0VUX0lOU1RBTkNFKHgpCQkJKCh4ID4+IDgpICYgMHhGRlVMKQ0KLSNkZWZpbmUgR0VU
X1VOSVRNQVNLKHgpCQkJKCh4ID4+IDE2KSAmIDB4RkZVTCkNCi0jZGVmaW5lIEdFVF9JTlNUQU5D
RV9DT05GSUcoeCkJCSgwVUxMIHwgKDB4MDdVTEwpIFwNCi0JCQkJCXwgKCgweDA0NlVMTCArIHgp
IDw8IDgpIFwNCi0JCQkJCXwgKDB4MDIgPDwgMTYpKQ0KLQ0KLS8qIGRmIGV2ZW50IGNvbmYgbWFj
cm9zICovDQotI2RlZmluZSBJU19ERl9YR01JXzBfVFgoeCkgKEdFVF9FVkVOVCh4KSA9PSAweDcg
XA0KLQkJJiYgR0VUX0lOU1RBTkNFKHgpID09IDB4NDYgJiYgR0VUX1VOSVRNQVNLKHgpID09IDB4
MikNCi0jZGVmaW5lIElTX0RGX1hHTUlfMV9UWCh4KSAoR0VUX0VWRU5UKHgpID09IDB4NyBcDQot
CQkmJiBHRVRfSU5TVEFOQ0UoeCkgPT0gMHg0NyAmJiBHRVRfVU5JVE1BU0soeCkgPT0gMHgyKQ0K
KyNkZWZpbmUgREZfVjNfNl9HRVRfRVZFTlQoeCkJCSh4ICYgMHhGRlVMKQ0KKyNkZWZpbmUgREZf
VjNfNl9HRVRfSU5TVEFOQ0UoeCkJCSgoeCA+PiA4KSAmIDB4RkZVTCkNCisjZGVmaW5lIERGX1Yz
XzZfR0VUX1VOSVRNQVNLKHgpCQkoKHggPj4gMTYpICYgMHhGRlVMKQ0KKyNkZWZpbmUgREZfVjNf
Nl9QRVJGTU9OX09WRVJGTE9XCTB4RkZGRkZGRkZGRkZGVUxMDQogDQorZXh0ZXJuIGNvbnN0IHN0
cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKmRmX3YzXzZfYXR0cl9ncm91cHNbXTsNCiBleHRlcm4gY29u
c3Qgc3RydWN0IGFtZGdwdV9kZl9mdW5jcyBkZl92M182X2Z1bmNzOw0KIA0KICNlbmRpZg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQppbmRleCA3OGJkNGZjMDdiYWIuLjdmZWUyNGVhNzg2
MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCkBAIC0xMDY2LDYgKzEwNjYsNyBA
QCBzdGF0aWMgdm9pZCBzb2MxNV9kb29yYmVsbF9yYW5nZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KSAgc3RhdGljIGludCBzb2MxNV9jb21tb25faHdfaW5pdCh2b2lkICpoYW5kbGUp
ICB7DQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOw0KKwlpbnQgcmV0Ow0KIA0KIAkvKiBlbmFibGUgcGNpZSBnZW4yLzMgbGluayAq
Lw0KIAlzb2MxNV9wY2llX2dlbjNfZW5hYmxlKGFkZXYpOw0KQEAgLTEwNzksNiArMTA4MCw5IEBA
IHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KIAkgKi8NCiAJ
aWYgKGFkZXYtPm5iaW9fZnVuY3MtPnJlbWFwX2hkcF9yZWdpc3RlcnMpDQogCQlhZGV2LT5uYmlv
X2Z1bmNzLT5yZW1hcF9oZHBfcmVnaXN0ZXJzKGFkZXYpOw0KKw0KKwlhZGV2LT5kZl9mdW5jcy0+
aW5pdChhZGV2KTsNCisNCiAJLyogZW5hYmxlIHRoZSBkb29yYmVsbCBhcGVydHVyZSAqLw0KIAlz
b2MxNV9lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUoYWRldiwgdHJ1ZSk7DQogCS8qIEhXIGRvb3Ji
ZWxsIHJvdXRpbmcgcG9saWN5OiBkb29yYmVsbCB3cml0aW5nIG5vdA0KLS0NCjIuMTcuMQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
