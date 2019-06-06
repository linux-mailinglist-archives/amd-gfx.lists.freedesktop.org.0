Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF613720D
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 12:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63242892B2;
	Thu,  6 Jun 2019 10:50:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790043.outbound.protection.outlook.com [40.107.79.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF46892B2
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 10:50:42 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1487.namprd12.prod.outlook.com (10.172.49.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 10:50:37 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 10:50:37 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v3)
Thread-Topic: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v3)
Thread-Index: AQHVHFWsfSb+jvhuv0eUfam2CbI+qQ==
Date: Thu, 6 Jun 2019 10:50:37 +0000
Message-ID: <20190606105023.13750-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0133.namprd02.prod.outlook.com
 (2603:10b6:208:35::38) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 901ba682-127e-414e-d870-08d6ea6cceb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1487; 
x-ms-traffictypediagnostic: MWHPR12MB1487:
x-microsoft-antispam-prvs: <MWHPR12MB1487D091EEE69A30E2043A9DF7170@MWHPR12MB1487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(14454004)(25786009)(476003)(66066001)(316002)(2501003)(26005)(186003)(6916009)(486006)(2616005)(73956011)(66476007)(66556008)(66946007)(64756008)(66446008)(2351001)(36756003)(305945005)(386003)(6506007)(102836004)(6436002)(7736002)(1076003)(5660300002)(8936002)(52116002)(99286004)(81166006)(81156014)(8676002)(50226002)(4326008)(3846002)(6486002)(256004)(2906002)(68736007)(53936002)(72206003)(6512007)(71200400001)(6116002)(71190400001)(478600001)(86362001)(5640700003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1487;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KeMJxJQgP+bY1wJIA4K6AcNGV68/ZN6m/spjYNN4kRDJU1brG5YoX9wank0LCq0ElBy3LgMIlmkHThV9gm8IOpvXrQ0PzbnWHqbEazINwUbg1WgXVp0DsdpYMkhmqYkb8+hqNraqfS+jPxxrz+dF5R6G+LmiBj+BNhjbeawzqkSa47LEAWPkHKocJhiaEduECQxDgfdZ//zJlgXNrfjktc2NthjyklEo44yrpHM3NhJG1C0d3AeCraDUMnSLFzaY9lUO8+6Q0ovK2b9qjlrKpbesvVfPXde9tQenC34byhopPxylopxGaDafBaOLjHs2ZE2/92X566gGW3DRcuI15CkdThKdVxd4ZpI4j4oDyugXGOjeeM7rGwQRLlJzTn+W0kVhyvHlis/LEkYuYxv/lozhylzNBgwvQpzsEY9n07U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901ba682-127e-414e-d870-08d6ea6cceb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 10:50:37.0321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9k8+dVbTx+hcf/IrQfwGG+1HFYhIKyvdxsJPLDgDdU=;
 b=MB4VDN6UBNhhOu9QOSUVXFw1hs0Fv+Ag9y2PtDABdL307jwAgjpqpQBIVqixrBvfjuM0KujblifScHeJ23RE1ww/UxXwOASMHa0ABIqVWcAfLD8r7cDOAVGu/Z5L3kNdk/+s0Kqeyq+9Yq4ktxxIjLvwz8wgmk9ymcXAvL9p3rI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBvcHRpb24gaXMgbm8gbG9uZ2VyIG5lZWRlZC4gIFRoZSBkZWZhdWx0IGNvZGUgcGF0aHMN
CmFyZSBub3cgdGhlIG9ubHkgb3B0aW9uLg0KDQp2MjogQWRkIEhQQUdFIHN1cHBvcnQgYW5kIGEg
ZGVmYXVsdCBmb3Igbm9uIGNvbnRpZ3VvdXMgbWFwcw0KdjM6IE1pc3JlYWQgNTEyIHBhZ2VzIGFz
IE1pQiAuLi4NCg0KU2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgICAg
fCAgMSAtDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgfCAg
NyAtLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAg
fCAgOCAtLS0tLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21n
ci5jIHwgMTQgKysrKysrKysrLS0tLS0NCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQppbmRl
eCAxOWEwMDI4MmUzNGMuLmU1NGYzMTg2NWY2MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaA0KQEAgLTE0Miw3ICsxNDIsNiBAQCBleHRlcm4gdWludCBhbWRncHVfc2RtYV9waGFz
ZV9xdWFudHVtOw0KIGV4dGVybiBjaGFyICphbWRncHVfZGlzYWJsZV9jdTsNCiBleHRlcm4gY2hh
ciAqYW1kZ3B1X3ZpcnR1YWxfZGlzcGxheTsNCiBleHRlcm4gdWludCBhbWRncHVfcHBfZmVhdHVy
ZV9tYXNrOw0KLWV4dGVybiBpbnQgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdDsNCiBleHRlcm4gaW50
IGFtZGdwdV9uZ2c7DQogZXh0ZXJuIGludCBhbWRncHVfcHJpbV9idWZfcGVyX3NlOw0KIGV4dGVy
biBpbnQgYW1kZ3B1X3Bvc19idWZfcGVyX3NlOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYw0KaW5kZXggMDIxMmM5ZWUzMTdjLi4yZTEzYjhlZjY2ODEgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KQEAgLTk3MywxMyAr
OTczLDYgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2NoZWNrX2FyZ3VtZW50cyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCiANCiAJYW1kZ3B1X2RldmljZV9jaGVja19ibG9ja19zaXpl
KGFkZXYpOw0KIA0KLQlpZiAoYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCAhPSAtMSAmJiAoYW1kZ3B1
X3ZyYW1fcGFnZV9zcGxpdCA8IDE2IHx8DQotCSAgICAhaXNfcG93ZXJfb2ZfMihhbWRncHVfdnJh
bV9wYWdlX3NwbGl0KSkpIHsNCi0JCWRldl93YXJuKGFkZXYtPmRldiwgImludmFsaWQgVlJBTSBw
YWdlIHNwbGl0ICglZClcbiIsDQotCQkJIGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQpOw0KLQkJYW1k
Z3B1X3ZyYW1fcGFnZV9zcGxpdCA9IDEwMjQ7DQotCX0NCi0NCiAJcmV0ID0gYW1kZ3B1X2Rldmlj
ZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MoYWRldik7DQogCWlmIChyZXQpIHsNCiAJCWRldl9l
cnIoYWRldi0+ZGV2LCAiaW52YWxpZCBsb2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4XG4i
KTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCmluZGV4IDFmMzhkNmZj
MWZlMy4uZWYyMmEyYTI1NDQ4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMNCkBAIC0xMDgsNyArMTA4LDYgQEAgaW50IGFtZGdwdV92bV9mcmFnbWVudF9zaXplID0g
LTE7DQogaW50IGFtZGdwdV92bV9ibG9ja19zaXplID0gLTE7DQogaW50IGFtZGdwdV92bV9mYXVs
dF9zdG9wID0gMDsNCiBpbnQgYW1kZ3B1X3ZtX2RlYnVnID0gMDsNCi1pbnQgYW1kZ3B1X3ZyYW1f
cGFnZV9zcGxpdCA9IDUxMjsNCiBpbnQgYW1kZ3B1X3ZtX3VwZGF0ZV9tb2RlID0gLTE7DQogaW50
IGFtZGdwdV9leHBfaHdfc3VwcG9ydCA9IDA7DQogaW50IGFtZGdwdV9kYyA9IC0xOw0KQEAgLTM0
MiwxMyArMzQxLDYgQEAgbW9kdWxlX3BhcmFtX25hbWVkKHZtX2RlYnVnLCBhbWRncHVfdm1fZGVi
dWcsIGludCwgMDY0NCk7DQogTU9EVUxFX1BBUk1fREVTQyh2bV91cGRhdGVfbW9kZSwgIlZNIHVw
ZGF0ZSB1c2luZyBDUFUgKDAgPSBuZXZlciAoZGVmYXVsdCBleGNlcHQgZm9yIGxhcmdlIEJBUihM
QikpLCAxID0gR3JhcGhpY3Mgb25seSwgMiA9IENvbXB1dGUgb25seSAoZGVmYXVsdCBmb3IgTEIp
LCAzID0gQm90aCIpOw0KIG1vZHVsZV9wYXJhbV9uYW1lZCh2bV91cGRhdGVfbW9kZSwgYW1kZ3B1
X3ZtX3VwZGF0ZV9tb2RlLCBpbnQsIDA0NDQpOw0KIA0KLS8qKg0KLSAqIERPQzogdnJhbV9wYWdl
X3NwbGl0IChpbnQpDQotICogT3ZlcnJpZGUgdGhlIG51bWJlciBvZiBwYWdlcyBhZnRlciB3ZSBz
cGxpdCBWUkFNIGFsbG9jYXRpb25zIChkZWZhdWx0IDUxMiwgLTEgPSBkaXNhYmxlKS4gVGhlIGRl
ZmF1bHQgaXMgNTEyLg0KLSAqLw0KLU1PRFVMRV9QQVJNX0RFU0ModnJhbV9wYWdlX3NwbGl0LCAi
TnVtYmVyIG9mIHBhZ2VzIGFmdGVyIHdlIHNwbGl0IFZSQU0gYWxsb2NhdGlvbnMgKGRlZmF1bHQg
NTEyLCAtMSA9IGRpc2FibGUpIik7DQotbW9kdWxlX3BhcmFtX25hbWVkKHZyYW1fcGFnZV9zcGxp
dCwgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCwgaW50LCAwNDQ0KTsNCi0NCiAvKioNCiAgKiBET0M6
IGV4cF9od19zdXBwb3J0IChpbnQpDQogICogRW5hYmxlIGV4cGVyaW1lbnRhbCBodyBzdXBwb3J0
ICgxID0gZW5hYmxlKS4gVGhlIGRlZmF1bHQgaXMgMCAoZGlzYWJsZWQpLg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCmluZGV4IGVjOWVhM2ZkYmI0YS4u
OGFlYTJmMjFiMjAyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
cmFtX21nci5jDQpAQCAtMjg0LDE3ICsyODQsMjEgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9t
Z3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIAlpZiAoIWxwZm4pDQog
CQlscGZuID0gbWFuLT5zaXplOw0KIA0KLQlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdf
Q09OVElHVU9VUyB8fA0KLQkgICAgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCA9PSAtMSkgew0KKwlp
ZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfQ09OVElHVU9VUykgew0KIAkJcGFnZXNfcGVy
X25vZGUgPSB+MHVsOw0KIAkJbnVtX25vZGVzID0gMTsNCiAJfSBlbHNlIHsNCi0JCXBhZ2VzX3Bl
cl9ub2RlID0gbWF4KCh1aW50MzJfdClhbWRncHVfdnJhbV9wYWdlX3NwbGl0LA0KLQkJCQkgICAg
IG1lbS0+cGFnZV9hbGlnbm1lbnQpOw0KKyNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBB
R0UNCisJCXBhZ2VzX3Blcl9ub2RlID0gSFBBR0VfUE1EX05SOw0KKyNlbHNlDQorCQkvKiBkZWZh
dWx0IHRvIDJNQiAqLw0KKwkJcGFnZXNfcGVyX25vZGUgPSAoMlVMIDw8ICgyMFVMIC0gUEFHRV9T
SElGVCkpOw0KKyNlbmRpZg0KKwkJcGFnZXNfcGVyX25vZGUgPSBtYXgoKHVpbnQzMl90KXBhZ2Vz
X3Blcl9ub2RlLCBtZW0tPnBhZ2VfYWxpZ25tZW50KTsNCiAJCW51bV9ub2RlcyA9IERJVl9ST1VO
RF9VUChtZW0tPm51bV9wYWdlcywgcGFnZXNfcGVyX25vZGUpOw0KIAl9DQogDQotCW5vZGVzID0g
a3ZtYWxsb2NfYXJyYXkobnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwNCisJbm9kZXMgPSBrdm1h
bGxvY19hcnJheSgodWludDMyX3QpbnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwNCiAJCQkgICAg
ICAgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOw0KIAlpZiAoIW5vZGVzKQ0KIAkJcmV0dXJuIC1F
Tk9NRU07DQotLSANCjIuMjEuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
