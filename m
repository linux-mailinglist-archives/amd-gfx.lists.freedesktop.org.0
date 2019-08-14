Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240818C9C0
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 04:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497DE6E22C;
	Wed, 14 Aug 2019 02:58:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810083.outbound.protection.outlook.com [40.107.81.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EE26E22C
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 02:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtB4EAWio/2EvRw8WT0WdEyM7jy/dmpirmS0Kcu0u3b7O9eReKNoIOAizXfbR01GCYbaMU3DLnW8nEjwX92ry1blDkiU0wjtOYpqDwmNWNKVTZAjmjNUQQj+tZoQv8ASFqL9uGNXjLcmR1k36aUuS1lCOsal1SIfYv41jC2ggiVBAbZ6lImW7RL9LNddJgmjLa/Uf5jK/2Fr0ov/r5O7sP+jvmr3kFvWdF2CTcK6kliQ8rhmKksqEy6gSDLEaPFITHyDTwcocYu3Q+41EJvqT7MjAqL8/tLARz5LjmXMggkGKkyCLVrA9gRF1PiVq5uIX/gqUvoVB+ktf7tmJ0zxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5v1nVCcxa3ktY+MmpCdF2+9PX6nHya4vjXzbLUAUa4=;
 b=oOyk4Cl80XwwhnKuDYsRonGtM9Uj8VNnF3Mz8o2NCu5R0NUurfditAVS+kdl5u1ASo0sUO/aod14TI9C3omWCgFuhwj5EdMDr9oKWlJfNMiR8q880bIx/rb0X8WZL3tk01GbO4F5EfVdcubr+n/u9gVe9fuALPPUgxj+5GI7rN7nYdYNlFgucAhj7ne7BXUOSZzlZI87u9fZHJT+fkkul7wu9ecyfVOMXoVLH51ftRk4ylFWwZExMy32gI45hhOJyber7XyG2DWQqQ9KMHbQxgcQtMU/maGuWtHXlM/D2H2F/J4a781FFYal6WGAblBvzylT0JIbSDok3sMmIRcIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3166.namprd12.prod.outlook.com (20.179.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 14 Aug 2019 02:58:22 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 02:58:22 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Thread-Topic: [PATCH 1/2] drm/amdgpu: Fix null ptr when calling
 query_ras_error_count
Thread-Index: AQHVUf+rBKdu1Cc2XUOu8rZVm9MRx6b56SuAgAAGbwCAAARnsA==
Date: Wed, 14 Aug 2019 02:58:22 +0000
Message-ID: <MN2PR12MB3054DDD1E130CF3F8E44F7E9B0AD0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1565718642-18107-1-git-send-email-andrey.grodzovsky@amd.com>,
 <MN2PR12MB30542C37DA293DFADD11EE3EB0AD0@MN2PR12MB3054.namprd12.prod.outlook.com>
 <MWHPR12MB1453F67B997561E00180AE67EAAD0@MWHPR12MB1453.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1453F67B997561E00180AE67EAAD0@MWHPR12MB1453.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4129a27c-0299-4a80-fdad-08d72063450a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3166; 
x-ms-traffictypediagnostic: MN2PR12MB3166:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31668251DA9604BA304F74EDB0AD0@MN2PR12MB3166.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(13464003)(189003)(199004)(446003)(4326008)(53936002)(9686003)(476003)(486006)(6306002)(11346002)(6116002)(3846002)(316002)(2501003)(110136005)(99286004)(52536014)(2906002)(6436002)(229853002)(5660300002)(54906003)(55016002)(25786009)(478600001)(66066001)(33656002)(305945005)(76116006)(66946007)(64756008)(6246003)(66446008)(66476007)(66556008)(8936002)(102836004)(7696005)(966005)(76176011)(81166006)(256004)(81156014)(71190400001)(74316002)(8676002)(71200400001)(86362001)(53546011)(6506007)(14454004)(26005)(7736002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3166;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eoMcR8cW/Qfh4JG5ZNWDevntrXsxky/XE9P8Uz3HZiVCaaSC8Fne7X+rlOTYjITI9stAVEp2Q3jD89mIzb3diyJW4EqmEG1D31PkcqRAL8SNj1ijJHI3m7i7udJTF5kTFISjIVKXq/GdooaDkDANGHlvsTKpB6L41G+OoZmAlmMNJD0Cz2tsQCTyuHbG9HgdgPlzWYc8rYC9m8EDEZPTnTnuthrnrKZb6walt8CovH6rCTuEJzozWnO8C+cx9l18Dih5miA8G5Gjf3xuEqvxqFh/ULM/OE0NV9XzT3bAUVkwtON0M2DX+ZHf/vu/2Wfcr96QWaTVeCO3kheElQWLpzblJaUHIdHYbn7gVqBLBW0k1ACGyPLxmHaJMweXf3s4azX3zDxleBxHFvLmUCrv5Ip0rozZbvyybKvzTYPU9aA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4129a27c-0299-4a80-fdad-08d72063450a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 02:58:22.6993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BE8lTZvhkVi06B9hoTGQvy8FJqCBVwJCldIWY+Ddycj13DiLW+cB/Z4TaLlyLgdX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5v1nVCcxa3ktY+MmpCdF2+9PX6nHya4vjXzbLUAUa4=;
 b=CiHoe9WDy2Id+5zBkB0dxtTwTU8DeyOhGkEgKYRL7uyBLn59/m0hJvkTmOh83DNtUMr1l336oXRr5+QihLvaLWFgpBFcbaoTWCtIIjvrzoHoIHsVH/7FCcZuFANccrG83tPGwVUFlBGB1d8Q/8sU0uLOVcaiEX9vhsHoLUtn1PQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVmZXJyaW5nIHRvIHRoZSBzZXJpZXMsIHBhdGNoICMxIGFuZCAjMi4NCg0KUmVnYXJkcywNClRh
bw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdyb2R6b3Zza3ksIEFu
ZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gU2VudDogMjAxOeW5tDjmnIgxNOaX
pSAxMDo0Mg0KPiBUbzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIu
RGV1Y2hlckBhbWQuY29tPjsgUGFuLCBYaW5odWkNCj4gPFhpbmh1aS5QYW5AYW1kLmNvbT47IFpo
YW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMS8yXSBkcm0vYW1kZ3B1OiBGaXggbnVsbCBwdHIgd2hlbiBjYWxsaW5nDQo+IHF1ZXJ5X3Jh
c19lcnJvcl9jb3VudA0KPiANCj4gQXJlIHlvdSByZWZlcnJpbmcgdG8gdGhpcyBwYXRjaCB3aGlj
aCBmaXhlcyBhIGNyYXNoIG9yIHRvIHRoZSBzZWNvbmQgcGF0Y2ggaW4NCj4gdGhlIHNlcnJpZXMg
Pw0KPiANCj4gQW5kcmV5DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+IEZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTZW50OiAx
MyBBdWd1c3QgMjAxOSAyMjoyNDowMA0KPiBUbzogR3JvZHpvdnNreSwgQW5kcmV5OyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyOyBHcm9kem92
c2t5LCBBbmRyZXk7IFBhbiwgWGluaHVpOyBaaGFuZywgSGF3a2luZw0KPiBTdWJqZWN0OiBSRTog
W1BBVENIIDEvMl0gZHJtL2FtZGdwdTogRml4IG51bGwgcHRyIHdoZW4gY2FsbGluZw0KPiBxdWVy
eV9yYXNfZXJyb3JfY291bnQNCj4gDQo+IEhpIEFuZHJleToNCj4gDQo+IEknbSBhbHNvIHdvcmtp
bmcgb24gcmFzIGVycm9yIGFkZHJlc3Mgc2F2aW5nIGJhc2VkIG9uIHlvdXIgZWVwcm9tIHBhdGNo
ZXMsDQo+IGFuZCB0aGUgaW1wbGVtZW50YXRpb24gaXMgZGlmZmVyZW50IGZyb20geW91Lg0KPiBJ
J2xsIHNlbmQgb3V0IG15IHBhdGNoZXMgdGhpcyB3ZWVrIGFuZCB3ZSBjYW4gZGlzY3VzcyBpdC4N
Cj4gDQo+IFJlZ2FyZHMsDQo+IFRhbw0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc+IE9uIEJlaGFsZiBPZg0KPiA+IEFuZHJleSBHcm9kem92c2t5DQo+ID4gU2VudDogMjAxOeW5
tDjmnIgxNOaXpSAxOjUxDQo+ID4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
ID4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEdy
b2R6b3Zza3ksDQo+IEFuZHJleQ0KPiA+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjsgUGFu
LCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47DQo+IFpoYW5nLA0KPiA+IEhhd2tpbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1
OiBGaXggbnVsbCBwdHIgd2hlbiBjYWxsaW5nDQo+ID4gcXVlcnlfcmFzX2Vycm9yX2NvdW50DQo+
ID4NCj4gPiByYXNfZXJyX2RhdGEuZXJyX2FkZHIgd2FzIG5ldmVyIGFsbG9jYXRlZA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFt
ZC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYyB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMNCj4gPiBpbmRleCA1MGMxM2IwLi5kOWZiODYwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+IEBAIC0xMDExLDYgKzEwMTEsMjEgQEAg
c3RhdGljIHZvaWQNCj4gYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3QNCj4gPiBy
YXNfbWFuYWdlciAqb2JqKQ0KPiA+ICAgICAgIGludCByZXQ7DQo+ID4gICAgICAgc3RydWN0IHJh
c19lcnJfZGF0YSBlcnJfZGF0YSA9IHswLCAwLCAwLCBOVUxMfTsNCj4gPg0KPiA+ICsgICAgIC8q
IEFsbG9jYXRlIGVub3VnaCB0byBzZXJ2ZSBtYXggIG51bWJlciBvZiByZXF1ZXN0cyovDQo+ID4g
KyAgICAgaW50IGVycl9hZGRyX3NpemUgPSBkYXRhLT5yaW5nX3NpemUgLyBkYXRhLT5hbGlnbmVk
X2VsZW1lbnRfc2l6ZSAqDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9iai0+YWRldi0+
dW1jLnVtY19pbnN0X251bSAqDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9iai0+YWRl
di0+dW1jLmNoYW5uZWxfaW5zdF9udW07DQo+ID4gKw0KPiA+ICsgICAgIGVycl9kYXRhLmVycl9h
ZGRyID0ga2NhbGxvYyhlcnJfYWRkcl9zaXplLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoKmVycl9kYXRhLmVycl9hZGRyKSwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+ID4gKw0KPiA+ICsgICAgIGlmICgh
ZXJyX2RhdGEuZXJyX2FkZHIpIHsNCj4gPiArICAgICAgICAgICAgIERSTV9FUlJPUigiTm90IGVu
b3VnaCBtZW1vcnkhIik7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgfQ0K
PiA+ICsNCj4gPiArDQo+ID4gICAgICAgd2hpbGUgKGRhdGEtPnJwdHIgIT0gZGF0YS0+d3B0cikg
ew0KPiA+ICAgICAgICAgICAgICAgcm1iKCk7DQo+ID4gICAgICAgICAgICAgICBtZW1jcHkoJmVu
dHJ5LCAmZGF0YS0+cmluZ1tkYXRhLT5ycHRyXSwgQEAgLTEwMzksNg0KPiA+ICsxMDU0LDggQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfaGFuZGxlcihzdHJ1Y3QNCj4gcmFzX21h
bmFnZXINCj4gPiAqb2JqKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gICAgICAg
ICAgICAgICB9DQo+ID4gICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAga2ZyZWUoZXJyX2RhdGEu
ZXJyX2FkZHIpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgYW1kZ3B1X3Jhc19pbnRl
cnJ1cHRfcHJvY2Vzc19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0cnVjdA0KPiA+ICp3b3JrKQ0KPiA+
IC0tDQo+ID4gMi43LjQNCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
