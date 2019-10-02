Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83AC896E
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 15:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AF96E02E;
	Wed,  2 Oct 2019 13:17:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D2D6E02E
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 13:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhpmQviekO5ZldpHtotlQffDZV+NcH68XIlsTkL+SSyaY4unsZxUuGW/6DWvVW06Blw8jBFOeIzwYL6wXyPXO0bkUSVCT/26F0UPFIBv5MFAsfktBYAUIUBeU+cs1mieFs1i2KDU2Ky5WjF98YjR5QuGD6llglLQc6p6HEHrEwaspCLUlomx7TPOJdwnxkf7YS2ZUQneIOWeJJkhTKfv3KxsuhQmYcu/XyFA+Mc9ZgxHIw64i6runX9FgK/e/FqoqBEmM/poMu2nSqBZxYjZwVQsJcEsG++MJ1Xws/DCzDGM2E/LkkcS3NyQ1zE9+jsCiTEEwhqOoVGDkTEmdIDrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofQlqjv9QLal9pD6eLVFwVhMrudZ6MX5+Ov+8rNTatc=;
 b=BNVMbe62bARj0gG6EEYtEORQ7DeIFjsfdm2Uagg4nAe+yTRVJLZcAJeDTJ8dWl3NXouqBmLxOkHZuA5L/zhdCSTzjqrgOoHkFbg32VoSFFgvHy723uESECtjZsOzSr1JJ8yIDyfIo07d1EFUs0S/bRR07zmY6YJNuRnbstH8OYo+73IUEL6vvM17jVLGYWtXxUgbeQDyfoyQtIAFHVwLLnI0eqGQELkDU2/Ke+1nJYd/MpGoDc/a1/iw0AeIUXWAuypm54UIzLlv0kc/1M5UlddWtBl9rAE8iDmBmWNeOi9lF+Id1bRDPwYOA1dC6OFd8xoezItCCDKSlesgYXEmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0199.namprd12.prod.outlook.com (10.172.78.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 13:17:00 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::e112:e36a:1840:caa4]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::e112:e36a:1840:caa4%8]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 13:17:00 +0000
From: James Zhu <jamesz@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/vcn: use amdgpu_ring_test_helper instead of
Thread-Topic: [PATCH 1/2] drm/amdgpu/vcn: use amdgpu_ring_test_helper instead
 of
Thread-Index: AQHVeKYDqfZVSv+wQ0e09mHWIEz3mqdHVgmA
Date: Wed, 2 Oct 2019 13:16:59 +0000
Message-ID: <c0dd973a-f80e-382a-02e7-af2849718f1d@amd.com>
References: <20191001221708.20185-1-leo.liu@amd.com>
In-Reply-To: <20191001221708.20185-1-leo.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 022d1420-1c69-416e-9fc0-08d7473ace91
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0199:
x-microsoft-antispam-prvs: <CY4PR1201MB0199B8F73A0E2406844F6A1AE49C0@CY4PR1201MB0199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(81156014)(2501003)(31696002)(316002)(6246003)(2351001)(3846002)(6116002)(71200400001)(71190400001)(256004)(5640700003)(66066001)(6512007)(7736002)(229853002)(305945005)(6436002)(53546011)(76176011)(2906002)(31686004)(6506007)(476003)(99286004)(486006)(6486002)(8936002)(386003)(5660300002)(52116002)(2616005)(66946007)(478600001)(26005)(81166006)(186003)(66476007)(8676002)(102836004)(66556008)(64756008)(14454004)(6916009)(66446008)(446003)(11346002)(36756003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0199;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5FTQ9kc/6K/7+2OwIf13JLeLKD+97CkwhuDPKoZiDM9hsBiwrIbd3QWsSKm0gWAX1om71ra+2c2ZDrQdnFs68jJ2XJZzIsoVuw3KsywxbuoZY09hqnwstVSYBVK37b3hVVbl5znilJUuxEHPBlaMQtn+hnF35qErlpbzNkZFSb1/gEoj9321Z1rBVbPCyq84u/2yvKIk0TloPU7JB0l2yzbXRqXCZbLWnt0DlPHvw5U+JEwyCUipYsZDbAF7sfDL5lYvC5ySU8B0CWtwW+mULmS07lqDDKs1arSJvkvQ/AkuZmKUfZ9qiJBQ26XixjEDzbiflA4/j/Y65TTLjsIUblBoi/Qqo6Ag+32WzXXOlYO8dU/hjQImTXJMtBs+tDrwGfXYIzqTvvrgDKqDykKtLu91gd9y930236ke/NWLkw=
x-ms-exchange-transport-forked: True
Content-ID: <765570945D1AB54B8D70E7F9B2AE855B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022d1420-1c69-416e-9fc0-08d7473ace91
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 13:16:59.9638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2fQ0Ws25E1kq19SnHl4BhaqH5zOS3QGg/7fe5AhdJAkCEnJLFuZjfMpfmZAqEjPx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofQlqjv9QLal9pD6eLVFwVhMrudZ6MX5+Ov+8rNTatc=;
 b=rW6+6+YxNSVPovZD79coGTijZF6AtGC+AuLV67Pjotvfmy+Wkwr1FC26m6c5KQxnRUxP0Q9uRuNcDEWm55fGrUb5zf1np0NHAnvCfVtO6BzL15YPTn/bSeJC1sGElRsGyuLiCkzxD+fwVLwriHc0sS/O2oAJgWlRLUKPxXYZaNY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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

UmV2aWV3ZWQtYnk6IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+IGZvciB0aGlzIHNlcmll
cw0KDQpPbiAyMDE5LTEwLTAxIDY6MTcgcC5tLiwgTGl1LCBMZW8gd3JvdGU6DQo+IGFtZGdwdV9y
aW5nX3Rlc3RfcmluZywgc28gaXQgd2lsbCBkZXRlcm1pbmUgd2hldGhlciB0aGUgcmluZyBpcyBy
ZWFkeQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+DQo+IENj
OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jIHwgIDEgLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgfCAyMSArKysrKystLS0tLS0tLS0tLS0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgMTggKysrKysr
LS0tLS0tLS0tLS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyOCBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jDQo+IGlu
ZGV4IDkzYjM1MDBlNTIyYi4uYjRmODRhODIwYTQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92MV8wLmMNCj4gQEAgLTIwMiw3ICsyMDIsNiBAQCBzdGF0aWMgaW50IHZjbl92
MV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRl
di0+dmNuLm51bV9lbmNfcmluZ3M7ICsraSkgew0KPiAgIAkJcmluZyA9ICZhZGV2LT52Y24uaW5z
dC0+cmluZ19lbmNbaV07DQo+IC0JCXJpbmctPnNjaGVkLnJlYWR5ID0gdHJ1ZTsNCj4gICAJCXIg
PSBhbWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsNCj4gICAJCWlmIChyKQ0KPiAgIAkJCWdv
dG8gZG9uZTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jDQo+IGluZGV4IDQ2
MjhmZDEwYTllYy4uMzhmNzg3YTU2MGNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml8wLmMNCj4gQEAgLTI0NywzMCArMjQ3LDIxIEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBf
aHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCWFkZXYtPm5iaW8uZnVuY3MtPnZjbl9kb29yYmVs
bF9yYW5nZShhZGV2LCByaW5nLT51c2VfZG9vcmJlbGwsDQo+ICAgCQkJCQkgICAgIHJpbmctPmRv
b3JiZWxsX2luZGV4LCAwKTsNCj4gICANCj4gLQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7DQo+
IC0JciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsNCj4gLQlpZiAocikgew0KPiAtCQly
aW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOw0KPiArCXIgPSBhbWRncHVfcmluZ190ZXN0X2hlbHBl
cihyaW5nKTsNCj4gKwlpZiAocikNCj4gICAJCWdvdG8gZG9uZTsNCj4gLQl9DQo+ICAgDQo+ICAg
CWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7DQo+ICAgCQly
aW5nID0gJmFkZXYtPnZjbi5pbnN0LT5yaW5nX2VuY1tpXTsNCj4gLQkJcmluZy0+c2NoZWQucmVh
ZHkgPSB0cnVlOw0KPiAtCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOw0KPiAtCQlp
ZiAocikgew0KPiAtCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsNCj4gKwkJciA9IGFtZGdw
dV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOw0KPiArCQlpZiAocikNCj4gICAJCQlnb3RvIGRvbmU7
DQo+IC0JCX0NCj4gICAJfQ0KPiAgIA0KPiAgIAlyaW5nID0gJmFkZXYtPnZjbi5pbnN0LT5yaW5n
X2pwZWc7DQo+IC0JcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOw0KPiAtCXIgPSBhbWRncHVfcmlu
Z190ZXN0X3JpbmcocmluZyk7DQo+IC0JaWYgKHIpIHsNCj4gLQkJcmluZy0+c2NoZWQucmVhZHkg
PSBmYWxzZTsNCj4gKwlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7DQo+ICsJaWYg
KHIpDQo+ICAgCQlnb3RvIGRvbmU7DQo+IC0JfQ0KPiAgIA0KPiAgIGRvbmU6DQo+ICAgCWlmICgh
cikNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+IGluZGV4IGJmODYyNmUx
NWIwOS4uY2MxOTQ0NDQzNjNmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92Y25fdjJfNS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
Ml81LmMNCj4gQEAgLTI1OCwyOSArMjU4LDIzIEBAIHN0YXRpYyBpbnQgdmNuX3YyXzVfaHdfaW5p
dCh2b2lkICpoYW5kbGUpDQo+ICAgCQlhZGV2LT5uYmlvLmZ1bmNzLT52Y25fZG9vcmJlbGxfcmFu
Z2UoYWRldiwgcmluZy0+dXNlX2Rvb3JiZWxsLA0KPiAgIAkJCQkJCSAgICAgcmluZy0+ZG9vcmJl
bGxfaW5kZXgsIGopOw0KPiAgIA0KPiAtCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcp
Ow0KPiAtCQlpZiAocikgew0KPiAtCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsNCj4gKwkJ
ciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOw0KPiArCQlpZiAocikNCj4gICAJCQln
b3RvIGRvbmU7DQo+IC0JCX0NCj4gICANCj4gICAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24u
bnVtX2VuY19yaW5nczsgKytpKSB7DQo+ICAgCQkJcmluZyA9ICZhZGV2LT52Y24uaW5zdFtqXS5y
aW5nX2VuY1tpXTsNCj4gICAJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOw0KPiAgIAkJCWNv
bnRpbnVlOw0KPiAtCQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsNCj4gLQkJCWlm
IChyKSB7DQo+IC0JCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsNCj4gKwkJCXIgPSBhbWRn
cHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsNCj4gKwkJCWlmIChyKQ0KPiAgIAkJCQlnb3RvIGRv
bmU7DQo+IC0JCQl9DQo+ICAgCQl9DQo+ICAgDQo+ICAgCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0
W2pdLnJpbmdfanBlZzsNCj4gLQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsNCj4g
LQkJaWYgKHIpIHsNCj4gLQkJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7DQo+ICsJCXIgPSBh
bWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsNCj4gKwkJaWYgKHIpDQo+ICAgCQkJZ290byBk
b25lOw0KPiAtCQl9DQo+ICAgCX0NCj4gICBkb25lOg0KPiAgIAlpZiAoIXIpDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
