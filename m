Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F33DE7E2
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 11:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2374689D60;
	Mon, 21 Oct 2019 09:19:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A9389D60
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 09:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCCBGMdL9TLAgyOTb9CGIHgHPrusHQ6tgOqvpRUHA1Us76fJSsI4Djc4V6sooxXMWXP+iD1AsPpTFX5GBfJptP3yDCY05ElzmlO7RGZe9eCqFM29iLhkTsDDqAK5f7xOpw20Rs0MTVl2z5J+nd6/02o1xfFR7p30aIPl/I8OOQD5BT21kyqVnWNX0DitjSg2iERZMfU1BbqOAJ9syAEPYCQFSsyeZeC2vGpaBWKBULvDMTS30NQ0cK2pJb/JRSptfaATFN58rg59F9g/gH+DvkWy+BaQTssjcqJudpJCFdX4eFzI/U3sTJaSqF5apJYGFBx2h/wEQZoPg8Rq8xH3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slEhxwbwVS+PZR5d52eCrkw9ayvx1c1gCbx6Ues8ZoA=;
 b=aKp6nJlmJXN1JYyy02raIu+GpndmC98p2GDA5GTNV+7MF9YlTPlz7f3M3SEbsNLez32cHaRY4GEBwd/zkXDuLqueciDkikO8vz35yudeg2uepGOo7XsfihaO5l87R8+0wDtPrwIy2yWYuR7ZKudfNADemWMG30gS2XRH0EykNqGwMb2qUF7rpzTd0nQ+KNxWf7Jx2a5jDBCo0qiyOy8wtWsx4ihfDXYIodQc4MEgxAImbZTWL8IFww+ONNAOPXL5kSMntII74F57GaRooEUek5LWWnPBuOrRryKfAaLBgGgjItLYsahMC8oY8X5/6liTC2I17RcVf17+cQbw0KWiyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYASPR01MB0034.namprd12.prod.outlook.com (20.178.1.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Mon, 21 Oct 2019 09:19:01 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 09:19:01 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>
Subject: RE: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Index: AQHVh+8N5mrw8nPdiEumnSvGbahk/Kdkzy+AgAAB2fA=
Date: Mon, 21 Oct 2019 09:19:01 +0000
Message-ID: <BYAPR12MB2806EE3F3259900551957426F1690@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20191021090735.19696-1-guchun.chen@amd.com>
 <d1558d15-a1dc-e370-1410-ebfcafd01618@gmail.com>
In-Reply-To: <d1558d15-a1dc-e370-1410-ebfcafd01618@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc80ee3c-5c48-4e4d-d586-08d75607b628
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYASPR01MB0034:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYASPR01MB0034C613E7AFA7F52F3261A9F1690@BYASPR01MB0034.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(13464003)(199004)(189003)(110136005)(6506007)(6636002)(305945005)(186003)(476003)(446003)(5660300002)(486006)(316002)(86362001)(11346002)(53546011)(74316002)(478600001)(66574012)(102836004)(52536014)(14454004)(7696005)(76176011)(71190400001)(71200400001)(66066001)(26005)(7736002)(14444005)(3846002)(8936002)(99286004)(6116002)(81166006)(81156014)(229853002)(2906002)(25786009)(6246003)(2501003)(256004)(8676002)(66556008)(66476007)(64756008)(4326008)(66946007)(66446008)(9686003)(76116006)(55016002)(33656002)(6436002)(921003)(1121003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB0034;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oe/MGMmiD43+MoBVg097ksnTrwubLOjkT1/Ky1cPXGpFKPR16HdOfoyZfNf3uH0y2ggq9K7DlZOVZ3vng5prxZGDMWFeGkRoDOjpr+K3zKl58sVvT2KZSFNtQlnkvB+VmSbkgyBImsN9x/UkJ0wbyYmZQS6ZOz5bT3Oy408wX5rI4o+YZBkCQbD4iexj8hFJ73K6VanqWjpIr90i1IALChlN3/9rjurjJHz8iHdVZSvhbDIUNH1JEp+bCzbcHYSXvbaSI0PhepTayJpWub+8VVWRhAlUs87Do3IV75rT0zEBSwGX3srkYTyKZK73j5Wr6IwCzbgSbEgVp0VdynVeQIm7KsE1vnZSdPy3avMiIPhqNFNJMqe1t/xsmphVT6OCunJGyuWoHOpcGxlKN5M+shW2JkXWi+AoEWnTA8BkjgygHiwQHIUVD4QWPEsrItAq
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc80ee3c-5c48-4e4d-d586-08d75607b628
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 09:19:01.5424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8FGGE7MC4uV8Fk8VGoejLfuY2O7Hs64LwrjAWK7YjXOy4WI3B0AjN5FzG7GPyAURYN3p0mNWC+0S752jB5eTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0034
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slEhxwbwVS+PZR5d52eCrkw9ayvx1c1gCbx6Ues8ZoA=;
 b=fRb0TjuCfWFJnZJnSfYyujmvqfEs3Bt+xWTdZp3IsqYTmIlUo7SGipEZWSdLCxvklkp92tNlDF+hVPNGg2THoEaK5AorznNRZoP0wrvEUApkEnek9+Ar2IE5ydNoCLHKbJKwTZLj5Oes2WOo/5BBPeQetfo97gA2vJzkA53+cqw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIENocmlzdGlhbi4NCg0KTGV0IG1lIHVwZGF0ZSBjb21taXQgYm9keSBpbiB2Mi4NCg0K
UmVnYXJkcywNCkd1Y2h1bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDog
TW9uZGF5LCBPY3RvYmVyIDIxLCAyMDE5IDU6MTIgUE0NClRvOiBDaGVuLCBHdWNodW4gPEd1Y2h1
bi5DaGVuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQu
Y29tPjsgR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjsgWmhv
dTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQpDYzogTGksIENhbmRpY2UgPENhbmRpY2UuTGlA
YW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IHJlZmluZSByZWJvb3Qg
ZGVidWdmcyBvcGVyYXRpb24gaW4gcmFzIGNhc2UNCg0KQW0gMjEuMTAuMTkgdW0gMTE6MDggc2No
cmllYiBDaGVuLCBHdWNodW46DQo+IFJlYm9vdCBvcGVyYXRpb24gZm9yIHJhcyByZWNvdmVyeSBp
cyBvbmUgY29tbW9uIGRlYnVnZnMgZW50cnksIHdoaWNoIA0KPiBzaG91bGQgZ2V0IHJpZCBvZiBy
YXNfY3RybCBub2RlIGFuZCByZW1vdmUgaXAgZGVwZW5kZW5jZSB3aGVuIA0KPiBpbnB1dHRpbmcg
YnkgdXNlci4gU28gYWRkIG9uZSBuZXcgYXV0b19yZWJvb3Qgbm9kZSBpbiByYXMgZGVidWdmcyBk
aXIgDQo+IHRvIGFjaGlldmUgdGhpcy4NCg0KV2UgbmVlZCBzb21lIGp1c3RpZmljYXRpb24gd2h5
IHRoaXMgY2FuJ3QgYmUgYSBtb2R1bGUgcGFyYW1ldGVyIGluc3RlYWQuDQoNCkZvciBleGFtcGxl
IHdyaXRlIHNvbWV0aGluZyBsaWtlIHdlIHdhbnQgdG8gY29udHJvbCByZWJvb3QgYmVoYXZpb3Ig
b24gYSBwZXIgZGV2aWNlIGJhc2lzLg0KDQpBcGFydCBmcm9tIHRoYXQgbG9va3MgbGlrZSBhIG5p
Y2UgY2xlYW51cCB0byBtZS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNTUgKysrKysrKysrKysrKysr
KysrKysrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0K
PiBpbmRleCA2MjIwMzk0NTIxZTQuLjNhZGNkMjlmZWI1ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBAQCAtMTUzLDggKzE1Myw2IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShzdHJ1Y3QgZmlsZSAqZiwNCj4g
ICAJCW9wID0gMTsNCj4gICAJZWxzZSBpZiAoc3NjYW5mKHN0ciwgImluamVjdCAlMzJzICU4cyIs
IGJsb2NrX25hbWUsIGVycikgPT0gMikNCj4gICAJCW9wID0gMjsNCj4gLQllbHNlIGlmIChzc2Nh
bmYoc3RyLCAicmVib290ICUzMnMiLCBibG9ja19uYW1lKSA9PSAxKQ0KPiAtCQlvcCA9IDM7DQo+
ICAgCWVsc2UgaWYgKHN0clswXSAmJiBzdHJbMV0gJiYgc3RyWzJdICYmIHN0clszXSkNCj4gICAJ
CS8qIGFzY2lpIHN0cmluZywgYnV0IGNvbW1hbmRzIGFyZSBub3QgbWF0Y2hlZC4gKi8NCj4gICAJ
CXJldHVybiAtRUlOVkFMOw0KPiBAQCAtMjIzLDcgKzIyMSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcmFz
X21hbmFnZXIgKmFtZGdwdV9yYXNfZmluZF9vYmooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
DQo+ICAgICogLSAwOiBkaXNhYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRha2UgOjpoZWFkIGFzIGl0
cyBkYXRhLg0KPiAgICAqIC0gMTogZW5hYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRha2UgOjpoZWFk
IGFzIGl0cyBkYXRhLg0KPiAgICAqIC0gMjogaW5qZWN0IGVycm9ycyBvbiB0aGUgYmxvY2suIFRh
a2UgOjppbmplY3QgYXMgaXRzIGRhdGEuDQo+IC0gKiAtIDM6IHJlYm9vdCBvbiB1bnJlY292ZXJh
YmxlIGVycm9yDQo+ICAgICoNCj4gICAgKiBIb3cgdG8gdXNlIHRoZSBpbnRlcmZhY2U/DQo+ICAg
ICogcHJvZ3JhbXM6DQo+IEBAIC0zMDUsOSArMzAyLDYgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1
X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2Vy
ICoNCj4gICAJCS8qIGRhdGEuaW5qZWN0LmFkZHJlc3MgaXMgb2Zmc2V0IGluc3RlYWQgb2YgYWJz
b2x1dGUgZ3B1IGFkZHJlc3MgKi8NCj4gICAJCXJldCA9IGFtZGdwdV9yYXNfZXJyb3JfaW5qZWN0
KGFkZXYsICZkYXRhLmluamVjdCk7DQo+ICAgCQlicmVhazsNCj4gLQljYXNlIDM6DQo+IC0JCWFt
ZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7DQo+IC0JCWJyZWFrOw0K
PiAgIAlkZWZhdWx0Og0KPiAgIAkJcmV0ID0gLUVJTlZBTDsNCj4gICAJCWJyZWFrOw0KPiBAQCAt
MzQ2LDYgKzM0MCw0NiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9t
X3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNlcg0KPiAgIAlyZXR1cm4gcmV0
ID09IDEgPyBzaXplIDogLUVJTzsNCj4gICB9DQo+ICAgDQo+ICsvKioNCj4gKyAqIERPQzogQU1E
R1BVIFJBUyBkZWJ1Z2ZzIGF1dG8gcmVib290IGludGVyZmFjZQ0KPiArICoNCj4gKyAqIEFmdGVy
IG9uZSB1bmNvcnJlY3RhYmxlIGVycm9yIGhhcHBlbnMsIEdQVSByZWNvdmVyeSB3aWxsIGJlIHNj
aGVkdWxlZC4NCj4gKyAqIER1ZSB0byB0aGUga25vd24gcHJvYmxlbSBpbiBHUFUgcmVjb3Zlcnkg
ZmFpbGluZyB0byBicmluZyBHUFUgDQo+ICtiYWNrLCB0aGlzDQo+ICsgKiBpbnRlcmZhY2UgcHJv
dmlkZXMgb25lIGRpcmVjdCB3YXkgdG8gdXNlciB0byByZWJvb3Qgc3lzdGVtIA0KPiArYXV0b21h
dGljYWxseQ0KPiArICogaW4gc3VjaCBjYXNlIHdpdGhpbiBFUlJFVkVOVF9BVEhVQl9JTlRFUlJV
UFQgZ2VuZXJhdGVkLiBOb3JtYWwgR1BVIA0KPiArcmVjb3ZlcnkNCj4gKyAqIHJvdXRpbmUgd2ls
bCBuZXZlciBiZSBjYWxsZWQuDQo+ICsgKg0KPiArICogRW5hYmxlIGF1dG9fcmVib290Og0KPiAr
ICoNCj4gKyAqCWVjaG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS94L3Jhcy9hdXRvX3JlYm9v
dA0KPiArICoNCj4gKyAqIFJldmVydCBhdXRvX3JlYm9vdDoNCj4gKyAqDQo+ICsgKiAJZWNobyAw
ID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpL3gvcmFzL2F1dG9fcmVib290DQo+ICsgKg0KPiArICov
DQo+ICtzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX2RlYnVnZnNfcmVib290X3dyaXRlKHN0cnVj
dCBmaWxlICpmLA0KPiArCWNvbnN0IGNoYXIgX191c2VyICpidWYsIHNpemVfdCBzaXplLCBsb2Zm
X3QgKnBvcykgew0KPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0NCj4gKwkJKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopZmlsZV9pbm9kZShmKS0+aV9wcml2YXRlOw0KPiArCWNoYXIgdG1w
WzhdID0gezB9Ow0KPiArCWludCB2YWx1ZSA9IC0xOw0KPiArDQo+ICsJaWYgKHNpemUgIT0gc2lt
cGxlX3dyaXRlX3RvX2J1ZmZlcih0bXAsIHNpemVvZih0bXApLCBwb3MsIGJ1Ziwgc2l6ZSkpDQo+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKGtzdHJ0b2ludCh0bXAsIDEwLCAmdmFs
dWUpKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWlmICh2YWx1ZSA9PSAxKQ0KPiAr
CQlhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpLT5yZWJvb3QgPSB0cnVlOw0KPiArCWVsc2Ug
aWYgKHZhbHVlID09IDApDQo+ICsJCWFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9v
dCA9IGZhbHNlOw0KPiArDQo+ICsJcmV0dXJuIHNpemU7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9vcHMg
PSB7DQo+ICAgCS5vd25lciA9IFRISVNfTU9EVUxFLA0KPiAgIAkucmVhZCA9IE5VTEwsDQo+IEBA
IC0zNjAsNiArMzk0LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGFt
ZGdwdV9yYXNfZGVidWdmc19lZXByb21fb3BzID0gew0KPiAgIAkubGxzZWVrID0gZGVmYXVsdF9s
bHNlZWsNCj4gICB9Ow0KPiAgIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlv
bnMgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlYm9vdF9vcHMgPSB7DQo+ICsJLm93bmVyID0gVEhJU19N
T0RVTEUsDQo+ICsJLnJlYWQgPSBOVUxMLA0KPiArCS53cml0ZSA9IGFtZGdwdV9yYXNfZGVidWdm
c19yZWJvb3Rfd3JpdGUsDQo+ICsJLmxsc2VlayA9IGRlZmF1bHRfbGxzZWVrDQo+ICt9Ow0KPiAr
DQo+ICAgLyoqDQo+ICAgICogRE9DOiBBTURHUFUgUkFTIHN5c2ZzIEVycm9yIENvdW50IEludGVy
ZmFjZQ0KPiAgICAqDQo+IEBAIC0xMDM3LDYgKzEwNzgsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
cmFzX2RlYnVnZnNfY3JlYXRlX2N0cmxfbm9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4gICAJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19jdHJsX29wcyk7DQo+ICAgCWRlYnVn
ZnNfY3JlYXRlX2ZpbGUoInJhc19lZXByb21fcmVzZXQiLCBTX0lXVUdPIHwgU19JUlVHTywgY29u
LT5kaXIsDQo+ICAgCQkJCWFkZXYsICZhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX29wcyk7DQo+
ICsJZGVidWdmc19jcmVhdGVfZmlsZSgiYXV0b19yZWJvb3QiLCBTX0lXVUdPIHwgU19JUlVHTywg
Y29uLT5kaXIsDQo+ICsJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rfb3BzKTsN
Cj4gICB9DQo+ICAgDQo+ICAgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
