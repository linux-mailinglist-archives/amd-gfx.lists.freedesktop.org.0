Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7CD683AA
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 08:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554F88E41;
	Mon, 15 Jul 2019 06:49:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1134188FDA
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 06:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awqtyXLwXRliCn/H5fvWhXRSrRsktsK4Gb489MmUNEuuSF2IuZcbKVPewyKoLEK8CnKEkPVlmaexIwdnqwdNYwVuy9GQ42V8PoD+RlLbsTT8Y+jk3VkYHO+tMFZ2IapHdRp3dfjGwlpvoLjjoH4RFux+jRDiT/2jysHJMwiWFIqORdZTS+STz0cGY8R09bG0KIeWNmUe9cGNkqxURXeL9aih6MctrczTHg5eHyQ42smcIPxUThkgk5H3iTUKEfjrEz/6pqX2XHbNqSGMfpzzIT4FmVDYKIplFBCHzuEkDjbV1GXeOOeZfJYxbr9XVE+8dwpkeDYRf264OKYNnLPsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRll7nBnAfPWTHzGsvGi/JbM6XtUN8azvqgFj9HiYBQ=;
 b=OHdlgD/OfmIrGMdVVbXhXPhL421kSt9wp3sluDMKiIVhLiVXXzATQTfl4MTztqVu8XN9MsYXxP/MsSVh9KyufcyI3eUMTLooVGkeTXT9W5nxE/FoDbVn39cTTSHwZSnaxJzpVB5LydEdkF980s4ienJr7Q6QCHo/uLhaXUZ7gUxzqst4volVpgA2LINabTogBj5ltbJ4yVsFpyZSK/c+8hP/YvaexRw3fW0tGxM2/yanRLjbWlzf0uFiSCYrIdM1N66LUcXOd/3LjdLTTGWULoXEGO/nXQvoEgVOd9Ng89lNyVJpne+wII/r1wpxOE21LRMPgE7hh9f6eD+78pfmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4176.namprd12.prod.outlook.com (52.135.49.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 06:49:17 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::78b4:3df5:c92a:e02a]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::78b4:3df5:c92a:e02a%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 06:49:17 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwIC8YI0Xjw0H02CS/7Sp4MSRKbD2JCAgAdrA7A=
Date: Mon, 15 Jul 2019 06:49:17 +0000
Message-ID: <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
 <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
In-Reply-To: <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e195a52-ecca-452d-6832-08d708f08ea6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4176; 
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-microsoft-antispam-prvs: <MN2PR12MB41760E8D9830224FA48906E28FCF0@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(13464003)(199004)(14444005)(25786009)(305945005)(86362001)(6636002)(52536014)(229853002)(33656002)(7696005)(81166006)(4326008)(99286004)(316002)(6116002)(74316002)(81156014)(71190400001)(71200400001)(8676002)(14454004)(6506007)(6436002)(478600001)(110136005)(256004)(102836004)(26005)(6246003)(11346002)(9686003)(476003)(55016002)(486006)(68736007)(64756008)(66556008)(66446008)(66946007)(66476007)(3846002)(76176011)(7736002)(8936002)(446003)(186003)(5660300002)(53936002)(76116006)(2906002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4176;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fsCAN0RkABttwG9EAZNc8Pxe4s3IZbe/lXDF5l4mHMciU9a1K+UhBH8YbDYeBci7FgaqAXDe2+tW83x/sIdC8iLbig2mjTkz+DWsgShAs/z9no65VOyLySwjHMjjRR8+yLiZzcQC/pQjnHxoQ1Ms75N3fujpqvRFGnz+39aZ/+wkSboJj1JwIPvV9quOWb+Wc9fkn52ATGc/a+Er06m4vtaRYvxchZ7IvG4Qp9rRGTh/S2Cbppg7hALgHz7o4ohioAVghIDWBomL1OERlWpdQbhaKvKSQNwFxUByqXBjez2uPwiaCByYiaafhO8YJJRaOdiNHvtuuPsbp4BOMPRGsKZXOKdf4KizF2FnWzog5hX61q/KPC/SLJH2fbD78YvrGoMJGRFhqtqTpBDQmVYjATW76WFvHxnPr7BFyqEselk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e195a52-ecca-452d-6832-08d708f08ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 06:49:17.3628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRll7nBnAfPWTHzGsvGi/JbM6XtUN8azvqgFj9HiYBQ=;
 b=o2caYuhLSVnbTpbLumu0RxhXEfZNHVxKGgbzP44R+13KBIQpvrSFhHHT6FomLp5/UqHgcwvQ+kooRNzt08Up0kiDgBEgtPFmp+F5pMWq9kkJLGwDK4BxVsyQDmIlheu0YNzFBhf/rL+i9xfhLZd3B5WHwTjG5UgeLj29+iLDu1Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQogICAgIFlvdSBhcmUgcmlnaHQsIGl0IHdpbGwgY29weSBwZXItdm0gcmVzdi4N
CiAgICAgQnV0IGN1cnJlbnRseSwgaXQgc3RpbGwgaGFzIHRoZSBkZWxheSBmcmVlIGlzc3VlIHdo
aWNoIG5vbiBwZXIgdm0gYm8gZG9lc24ndCBoYXMuIE1heWJlIGl0IGFscmVhZHkgaGFzIG5ldyBm
ZW5jZXMgYXBwZW5kIHRvIHRoaXMgcmVzdiBvYmplY3QgYmVmb3JlIGNvcHkuDQoNCkhpIENocmlz
dGlhbiwNCiAgICBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCB0aGlzPyBGb3IgcGVy
IHZtIGJvLCBpdCBzZWVtcyBhbHdheXMgZGVsYXkgdG8gZnJlZSB0aGUgdHRtIGJvLg0KDQpCZXN0
IHdpc2hlcw0KRW1pbHkgRGVuZw0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTog
WmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxEYXZpZDEuWmhvdUBhbWQuY29tPg0KPlNlbnQ6IFdlZG5l
c2RheSwgSnVseSAxMCwgMjAxOSA5OjI4IFBNDQo+VG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5n
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybS90dG06IEZpeCB0aGUgbWVtb3J5IGRlbGF5IGZyZWUgaXNzdWUNCj4NCj5JdCBk
b2Vzbid0IG1ha2Ugc2Vuc2UgdGhhdCBmcmVlaW5nIEJPIHN0aWxsIHVzZXMgcGVyLXZtIHJlc3Yu
DQo+DQo+SSByZW1lbWJlciB3aGVuIEJPIGlzIGluIHJlbGVhc2UgbGlzdCwgaXRzIHJlc3Ygd2ls
bCBiZSBmcm9tIHBlci12bSByZXN2IGNvcHkuDQo+Q291bGQgeW91IGNoZWNrIGl0Pw0KPg0KPi1E
YXZpZA0KPg0KPuWcqCAyMDE5LzcvMTAgMTc6MjksIEVtaWx5IERlbmcg5YaZ6YGTOg0KPj4gRm9y
IHZ1bGthbiBjdHMgYWxsb2NhdGlvbiB0ZXN0IGNhc2VzLCB0aGV5IHdpbGwgY3JlYXRlIGEgc2Vy
aWVzIG9mDQo+PiBib3MsIGFuZCB0aGVuIGZyZWUgdGhlbS4gQXMgaXQgaGFzIGxvdHMgb2YgYWxs
b2N0aW9uIHRlc3QgY2FzZXMgd2l0aA0KPj4gdGhlIHNhbWUgdm0sIGFzIHBlciB2bSBibyBmZWF0
dXJlIGVuYWJsZSwgYWxsIG9mIHRob3NlIGJvcycgcmVzdiBhcmUNCj4+IHRoZSBzYW1lLiBCdXQg
dGhlIGJvIGZyZWUgaXMgcXVpdGUgc2xvdywgYXMgdGhleSB1c2UgdGhlIHNhbWUgcmVzdg0KPj4g
b2JqZWN0LCBmb3IgZXZlcnkgdGltZSwgZnJlZSBhIGJvLCBpdCB3aWxsIGNoZWNrIHRoZSByZXN2
IHdoZXRoZXINCj4+IHNpZ25hbCwgaWYgaXQgc2lnbmFsLCB0aGVuIHdpbGwgZnJlZSBpdC4gQnV0
IGFzIHRoZSB0ZXN0IGNhc2VzIHdpbGwNCj4+IGNvbnRpbnVlIHRvIGNyZWF0ZSBibywgYW5kIHRo
ZSByZXN2IGZlbmNlIGlzIGluY3JlYXNpbmcuIFNvIHRoZSBmcmVlIGlzIG1vcmUNCj5zbG93ZXIg
dGhhbiBjcmVhdGluZy4gSXQgd2lsbCBjYXVzZSBtZW1vcnkgZXhoYXVzdGluZy4NCj4+DQo+PiBN
ZXRob2Q6DQo+PiBXaGVuIHRoZSByZXN2IHNpZ25hbCwgcmVsZWFzZSBhbGwgdGhlIGJvcyB3aGlj
aCBhcmUgdXNlIHRoZSBzYW1lIHJlc3YNCj4+IG9iamVjdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+PiBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgaW5kZXggZjlhM2Q0Yy4uNTdlYzU5YiAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMNCj4+IEBAIC01NDMsNiArNTQzLDcgQEAgc3RhdGljIGludCB0dG1f
Ym9fY2xlYW51cF9yZWZzKHN0cnVjdA0KPnR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4+ICAgew0K
Pj4gICAJc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IgPSBiby0+YmRldi0+Z2xvYjsNCj4+ICAg
CXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJlc3Y7DQo+PiArCXN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqcmVzdl9ibywgKnJlc3ZfYm9fbmV4dDsNCj4+ICAgCWludCByZXQ7DQo+Pg0KPj4g
ICAJaWYgKHVubGlrZWx5KGxpc3RfZW1wdHkoJmJvLT5kZGVzdHJveSkpKQ0KPj4gQEAgLTU2Niwx
MCArNTY3LDE0IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QNCj50dG1f
YnVmZmVyX29iamVjdCAqYm8sDQo+PiAgIAkJCQkJCQkgICBpbnRlcnJ1cHRpYmxlLA0KPj4gICAJ
CQkJCQkJICAgMzAgKiBIWik7DQo+Pg0KPj4gLQkJaWYgKGxyZXQgPCAwKQ0KPj4gKwkJaWYgKGxy
ZXQgPCAwKSB7DQo+PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNl
X2xpc3QpOw0KPj4gICAJCQlyZXR1cm4gbHJldDsNCj4+IC0JCWVsc2UgaWYgKGxyZXQgPT0gMCkN
Cj4+ICsJCX0NCj4+ICsJCWVsc2UgaWYgKGxyZXQgPT0gMCkgew0KPj4gKwkJCWtyZWZfcHV0KCZi
by0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+ICAgCQkJcmV0dXJuIC1FQlVT
WTsNCj4+ICsJCX0NCj4+DQo+PiAgIAkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+PiAg
IAkJaWYgKHVubG9ja19yZXN2ICYmICFrY2xfcmVzZXJ2YXRpb25fb2JqZWN0X3RyeWxvY2soYm8t
PnJlc3YpKQ0KPnsgQEANCj4+IC01ODIsNiArNTg3LDcgQEAgc3RhdGljIGludCB0dG1fYm9fY2xl
YW51cF9yZWZzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdA0KPipibywNCj4+ICAgCQkJICogaGVy
ZS4NCj4+ICAgCQkJICovDQo+PiAgIAkJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+
PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4g
ICAJCQlyZXR1cm4gMDsNCj4+ICAgCQl9DQo+PiAgIAkJcmV0ID0gMDsNCj4+IEBAIC01OTEsMTUg
KzU5NywyOSBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0DQo+dHRtX2J1
ZmZlcl9vYmplY3QgKmJvLA0KPj4gICAJCWlmICh1bmxvY2tfcmVzdikNCj4+ICAgCQkJa2NsX3Jl
c2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOw0KPj4gICAJCXNwaW5fdW5sb2NrKCZn
bG9iLT5scnVfbG9jayk7DQo+PiArCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3Jl
bGVhc2VfbGlzdCk7DQo+PiAgIAkJcmV0dXJuIHJldDsNCj4+ICAgCX0NCj4+DQo+PiAgIAl0dG1f
Ym9fZGVsX2Zyb21fbHJ1KGJvKTsNCj4+ICAgCWxpc3RfZGVsX2luaXQoJmJvLT5kZGVzdHJveSk7
DQo+PiAgIAlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlZl9idWcpOw0KPj4gLQ0K
Pj4gICAJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+ICAgCXR0bV9ib19jbGVhbnVw
X21lbXR5cGVfdXNlKGJvKTsNCj4+ICsJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19y
ZWxlYXNlX2xpc3QpOw0KPj4gKw0KPj4gKwlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+
ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJlc3ZfYm8sIHJlc3ZfYm9fbmV4dCwgJmJvLT5i
ZGV2LQ0KPj5kZGVzdHJveSwgZGRlc3Ryb3kpIHsNCj4+ICsJCWlmIChyZXN2X2JvLT5yZXN2ID09
IGJvLT5yZXN2KSB7DQo+PiArCQkJdHRtX2JvX2RlbF9mcm9tX2xydShyZXN2X2JvKTsNCj4+ICsJ
CQlsaXN0X2RlbF9pbml0KCZyZXN2X2JvLT5kZGVzdHJveSk7DQo+PiArCQkJc3Bpbl91bmxvY2so
Jmdsb2ItPmxydV9sb2NrKTsNCj4+ICsJCQl0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZShyZXN2
X2JvKTsNCj4+ICsJCQlrcmVmX3B1dCgmcmVzdl9iby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFz
ZV9saXN0KTsNCj4+ICsJCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+ICsJCX0NCj4+
ICsJfQ0KPj4gKwlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4NCj4+ICAgCWlmICh1
bmxvY2tfcmVzdikNCj4+ICAgCQlrY2xfcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhiby0+cmVz
dik7DQo+PiBAQCAtNjM5LDkgKzY1OSw4IEBAIHN0YXRpYyBib29sIHR0bV9ib19kZWxheWVkX2Rl
bGV0ZShzdHJ1Y3QNCj50dG1fYm9fZGV2aWNlICpiZGV2LCBib29sIHJlbW92ZV9hbGwpDQo+PiAg
IAkJCXR0bV9ib19jbGVhbnVwX3JlZnMoYm8sIGZhbHNlLCAhcmVtb3ZlX2FsbCwgdHJ1ZSk7DQo+
PiAgIAkJfSBlbHNlIHsNCj4+ICAgCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+
ICsJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+PiAg
IAkJfQ0KPj4gLQ0KPj4gLQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNl
X2xpc3QpOw0KPj4gICAJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4gICAJfQ0KPj4g
ICAJbGlzdF9zcGxpY2VfdGFpbCgmcmVtb3ZlZCwgJmJkZXYtPmRkZXN0cm95KTsNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
