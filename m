Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9ED6CAA
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 02:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964316E5D1;
	Tue, 15 Oct 2019 00:54:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780077.outbound.protection.outlook.com [40.107.78.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B846E5D1
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 00:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBknc0eUMnmcTK/ZyrPmev453Kuxam6DhY5kgZbMg7gdPJnNIxySX9Qr5sP2MuNzVD2AgwdunwqSGBUDFeXGETOsrnr/jyt/sjMO/ZyqE0jg+gWHK3oxNHSWbtBWTeRZPRMVBJDkA3OnKlODk2Jt9Mj8r2QKpAtANVtzp3dV+Ka0rYLdCrz+FT+QVRYhQkz0yhOdbD1qNwPMm1HhCur9bbXGr9pnYHDSz5e2nnzT7661CopOHSXm6CBgRAfocsL9VT0vw7cAeYLN8FJYnH2xYxla0kknqSU+C7oRCxjOPIKXx4jT9Noo058aFFgun/FLqMc7rg9ncc307c3hxgNuSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExFcEsg9r8Y7vl9cFrktevedecAb/I6fKkpHqnuzQdE=;
 b=bqE9R3GF3NbavQuXIUk39YOLY2YuUF3/Muh6nClT/ndm57Tel5VMddQdzPxdI92YaN/dlEnj0l70ZLEjFLGJRqVxmo3mPc+4NBOmamHTpdhDzggr62vlTwWMG9U/k7ifWs8mWXtL9FqogG5qR/4qni/VcRB/PJIkGJN3dzRxul0SB5OkLe+4w1k4obiVjzrTfwqmR+OLUwoey3I+PHDFtfTxrpXS8/UJOV/1Lt/uqm6gi/pWYkDasijxSvNglyJ9u1uZyvqRRYMqCaJRPVhGFtStcazU0ptO8MQiyM+pO+2SkIEUDyzkNWmjcV/mfwrkVUk57hSd+vquKRaxvHLE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 00:54:34 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2347.021; Tue, 15 Oct 2019
 00:54:34 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: No need to check gfxoff status after enable
 gfxoff feature
Thread-Topic: [PATCH] drm/amdgpu: No need to check gfxoff status after enable
 gfxoff feature
Thread-Index: AQHVgjso755PUHxefEqZxdSEj1MNI6da4aqQ
Date: Tue, 15 Oct 2019 00:54:34 +0000
Message-ID: <MN2PR12MB3344D347B1BBC093BAE5BBD3E4930@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1571021854-25722-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1571021854-25722-1-git-send-email-curry.gong@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e71fc07a-6aa0-4eb6-23b4-08d7510a3eea
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3598:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3598586EDDDA6C9ECFE502DFE4930@MN2PR12MB3598.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(13464003)(229853002)(11346002)(446003)(9686003)(55016002)(6306002)(966005)(3846002)(14454004)(6116002)(5660300002)(71200400001)(71190400001)(52536014)(478600001)(8936002)(66946007)(186003)(26005)(6436002)(2906002)(33656002)(81156014)(4326008)(64756008)(81166006)(8676002)(14444005)(256004)(25786009)(74316002)(476003)(86362001)(66066001)(66476007)(6246003)(7736002)(305945005)(486006)(316002)(102836004)(53546011)(7696005)(2501003)(6506007)(110136005)(99286004)(66556008)(76176011)(76116006)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3598;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y5pLmXy7reY1EC/F4YzMJZFomGMYTfw2ccSkaPaaN2VCnrvRhmhcwqbIkJk24WujTnFjQIDPuwJvd+yckzidOvppxwb0FNs0HERspmqQEWLTrvVGKaxrSByCSg7NmGAA4Qf6pZndHA/snUOmwr6VfuAs6Cs7j5JUPOjL0ZU6ir15Aztuyn43W//T7/Ng+W3IJX1Urerjv7UnXPGv/2qp8CYhOZq+xzwGZ+M3mqd77dfPmGCO/gXR3Ud6UBtl1PINCR03ZSQ7GeGHJnXxi3TO+x7vJGqQTrXfGXmQrrYOPL9cdTVGIFr6efLlvTnCJi1sKpXv1oKYlT7e/PcCULPjPIEjZK9nm1pHnOUxyT2xC0JuEuVJBVXjslzUXRHKLu+qaz+RFVKsG1qSV5gqjDNGB6/dQpB8hGnxG+DUB/xUzhiMzt7250MqoVwZ8VTiGNnA64vwrALjNmgGHibJYeE5LA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71fc07a-6aa0-4eb6-23b4-08d7510a3eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 00:54:34.2559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30Yx+mS0OmuiIZ1PbXcB9xkhZtBr5YvxTKXb5Q6M+sKP3M/nAJuvpC1Eydmz0SLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3598
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExFcEsg9r8Y7vl9cFrktevedecAb/I6fKkpHqnuzQdE=;
 b=AIDyOL4Ub0kulJSwkThKIdvoMTIvTJpCnhrMOy3k/7v9Lc8PXA50GVBxgdku0jmjJ82MHUfT/Do6lhPQhZE/Sd0dG738udG7gKP+d44zGHg0tWFfkZMP0bIGMKXlP7NZuO9qBX8m8UcFfv1Q4qKkc2W7BUFBmG2BpDLPytpcfWQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Gong, Curry" <Curry.Gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgY2hlbiBnb25nDQpTZW50OiBNb25kYXksIE9jdG9iZXIg
MTQsIDIwMTkgMTA6NTggQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6
IEdvbmcsIEN1cnJ5IDxDdXJyeS5Hb25nQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IE5vIG5lZWQgdG8gY2hlY2sgZ2Z4b2ZmIHN0YXR1cyBhZnRlciBlbmFibGUgZ2Z4b2Zm
IGZlYXR1cmUNCg0Kc211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfQWxsb3dHZnhPZmYpIEp1
c3QgdHVybiBvbiBhIHN3aXRjaC4NCg0KQXMgdG8gd2hlbiBHUFUgZ2V0IGludG8gIkdGWG9mZiIg
d2lsbCBiZSB1cCB0byBkcmF3aW5nIGxvYWQuDQoNClNvIHdlIGNhbiBub3Qgc3VyZSB3aGljaCBz
dGF0ZSBHUFUgc2hvdWxkIGJlIGluIGFmdGVyIGVuYWJsZSBnZnhvZmYgZmVhdHVyZS4NCg0KU2ln
bmVkLW9mZi1ieTogY2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYyB8IDkgLS0tLS0tLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTJfMC5jDQppbmRleCBjOTY5MWQwLi5jYWM0MjY5IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMl8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdV92MTJfMC5jDQpAQCAtMjQ0LDE1ICsyNDQsNiBAQCBzdGF0aWMg
aW50IHNtdV92MTJfMF9nZnhfb2ZmX2NvbnRyb2woc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJv
b2wgZW5hYmxlKQ0KIAlpZiAoZW5hYmxlKSB7DQogCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNt
dSwgU01VX01TR19BbGxvd0dmeE9mZik7DQogDQotCQkvKiBjb25maXJtIGdmeCBpcyBiYWNrIHRv
ICJvZmYiIHN0YXRlLCB0aW1lb3V0IGlzIDUgc2Vjb25kcyAqLw0KLQkJd2hpbGUgKCEoc211X3Yx
Ml8wX2dldF9nZnhvZmZfc3RhdHVzKHNtdSkgPT0gMCkpIHsNCi0JCQltc2xlZXAoMTApOw0KLQkJ
CXRpbWVvdXQtLTsNCi0JCQlpZiAodGltZW91dCA9PSAwKSB7DQotCQkJCURSTV9FUlJPUigiZW5h
YmxlIGdmeG9mZiB0aW1lb3V0IGFuZCBmYWlsZWQhXG4iKTsNCi0JCQkJYnJlYWs7DQotCQkJfQ0K
LQkJfQ0KIAl9IGVsc2Ugew0KIAkJcmV0ID0gc211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0df
RGlzYWxsb3dHZnhPZmYpOw0KIA0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
