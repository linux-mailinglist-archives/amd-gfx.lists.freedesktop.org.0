Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7941048CA
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Nov 2019 04:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9062B6E15E;
	Thu, 21 Nov 2019 03:02:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742326E15E
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2019 03:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbqkLUOCtq3Su9PftIr404x2/BW26wnO71BVFrue07AG48eEl75xSIb5+MvxNgtocsUNTfwHXhlogvZVv4i9hRfzI9H05adTymo+BlIY2n2tT1caGJg/9tuz1eN+dXTb8wq9F2dzbbYt99t/rVptd1fac2IitqN2zJSN3QHRouRIlUaYPbkKG65wGTxn3WXPdrWOzxI15HiRTxqMhurQ9KnyBUZDAmdTlWQi9ne74dyU9oT/dglEd++/doI6hAnvrlRohvoE3ZatdUzzWFMyjoIMbp+0LE+lHYYjBhOfq/ql4q2T/rKx6ccXRkLtpjQK8E4behQihAFes1UtJ9E/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja96YeH5V2IDiX+H6tYmgllXAJOXCMXArls6zEafYP8=;
 b=AeF5cCLZKfMppUIP1OyiG1B2SZ+a0jwLSniertu/l9/HUu6TFt0GtNCpMAtxRzMKB4MccPSCNwM2t9nOorU5oo0BLbU53ByE9cVGGk5/ARYsM2+ABsPHHLgd8b6s+t5vA6q4O1ySPY55ubZxeDNLmuvNfit1eSkqRYdukhORELehxi6Gl78qHMIevO2p/4XVuo5Vznu7JHNDxijLXLpV1oghw7rU6HYF4Y/J4GJe5b3rP57M3t2S4jN9pVwFWGpHOjjvrDJ1HdhdTEhkEjKtARzZxeqioqrxjwOEIVwyAhW99/RbBApxWZ0IoWTZBNHXwRlDoIR4kmVkgghxDK63sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.238.203) by
 MN2PR12MB3920.namprd12.prod.outlook.com (10.255.237.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.24; Thu, 21 Nov 2019 03:02:48 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::c98f:c517:b396:1bd4]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::c98f:c517:b396:1bd4%7]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 03:02:48 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: implement TMZ accessor (v2)
Thread-Topic: [PATCH] drm/amdgpu: implement TMZ accessor (v2)
Thread-Index: AQHVoAu+cS/wkCCwykaxbmmAsgH8uaeU7Vjw
Date: Thu, 21 Nov 2019 03:02:48 +0000
Message-ID: <MN2PR12MB3838AAD51A07CB1016AE6B3CF04E0@MN2PR12MB3838.namprd12.prod.outlook.com>
References: <b64da3b9-9f20-549d-27f2-18da3ce10ea4@gmail.com>
 <20191121013308.50489-1-luben.tuikov@amd.com>
In-Reply-To: <20191121013308.50489-1-luben.tuikov@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b367516d-92ec-468f-cd6b-08d76e2f4a6f
x-ms-traffictypediagnostic: MN2PR12MB3920:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39207E3B2987096BE5462349F04E0@MN2PR12MB3920.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(366004)(346002)(396003)(136003)(13464003)(199004)(189003)(446003)(478600001)(2906002)(66476007)(99286004)(64756008)(66556008)(6506007)(7696005)(14454004)(76176011)(53546011)(66446008)(102836004)(256004)(25786009)(186003)(74316002)(71190400001)(26005)(52536014)(7736002)(8676002)(486006)(476003)(81156014)(8936002)(71200400001)(81166006)(966005)(305945005)(11346002)(229853002)(54906003)(5660300002)(33656002)(110136005)(14444005)(86362001)(2501003)(66946007)(76116006)(6246003)(4326008)(316002)(6436002)(66066001)(6116002)(55016002)(3846002)(6306002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3920;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g07Jqnu911oKBB7My1rPDlcrXKikgUPkK/af2dTSPqAX/mdAJjykXTvt/rEs6LAIEwn+K1vp9YjizZWKte2V6ODxuYW3bHkT/haszP8BHV4oTEVftEHnvBStmmOpLrinm1cC1jYV6bpy4csiQSC/Fj+xmncktvf3z2ej9hRDvvJ4++6RWq8vfq4Yf0EgqSiAxYsClyHuFdnkPC4Iuey8XeDAZ9jV3MzDLlCPDy/qHbw31ugL8dy2BYTkYGKMgffQLPttdU6FUSN60rvfkv+Oped7VqdqFZZK5WxBkfCp8kK4MRGF+qGPNQkuyA3zHtq2ng4QhMfexhZSwRRmPG3QgZvw52ajnpdJBTJWrD05gev1n0E36BHalEiOxk1hn0crnKcSBD6H8tdcElDO1mG8DrZwEOzwBI8qFvurDF1I/uNN4FMt58rbp6uoFLPNAylIVOLL98xxFfM2nAl1HwX54fM/fzjbMb9ywkDrNsqQinw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b367516d-92ec-468f-cd6b-08d76e2f4a6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 03:02:48.4595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPmabU9UVb+6/sr2AU4+6jE6STWqi3d0bR+P9OAhLVGql577JnB06sr6wFkJK+MV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3920
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja96YeH5V2IDiX+H6tYmgllXAJOXCMXArls6zEafYP8=;
 b=a6d5+644vQsIpKDRlmYCTizUwoXdNrkFFe0TmIUw7edAu9jr/k1Ofs55T5PyU6EsAsqOIl8eav76C3R9l+7HyOFo2xTHQ+zhDuE8QNFKi2NzlAitUTiZ1WE2WMgYW40mDNRbdbHUDkKtpUs9mIbBMkyUd+jhh1M12aAXce/JYYo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gTHViZW4gVHVpa292
DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMSwgMjAxOSA5OjMzIEFNDQo+IFRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgVHVpa292LCBMdWJlbg0KPiA8THViZW4uVHVpa292QGFt
ZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGltcGxlbWVudCBUTVogYWNjZXNzb3IgKHYyKQ0K
PiANCj4gSW1wbGVtZW50IGFuIGFjY2Vzc29yIG9mIGFkZXYtPnRtei5lbmFibGVkLiBMZXQgbm90
IGNvZGUgYXJvdW5kIGFjY2VzcyBpdA0KPiBhcyAiaWYgKGFkZXYtPnRtei5lbmFibGVkKSINCj4g
YXMgdGhlIG9yZ2FuaXphdGlvbiBtYXkgY2hhbmdlLiBJbnN0ZWFkLi4uDQo+IA0KPiBSZWNydWl0
ICJib29sIGFtZGdwdV9pc190bXooYWRldikiIHRvIHJldHVybiBleGFjdGx5IHRoaXMgQm9vbGVh
biB2YWx1ZS4NCj4gVGhhdCBpcywgdGhpcyBmdW5jdGlvbiBpcyBub3cgYW4gYWNjZXNzb3Igb2Yg
YW4gYWxyZWFkeSBpbml0aWFsaXplZCBhbmQgc2V0IGFkZXYNCj4gYW5kIGFkZXYtPnRtei4NCj4g
DQo+IEFkZCAidm9pZCBhbWRncHVfdG16X3NldChhZGV2KSIgdG8gY2hlY2sgYW5kIHNldA0KPiBh
ZGV2LT50bXouKiBhdCBpbml0aWFsaXphdGlvbiB0aW1lLiBBZnRlciB3aGljaA0KPiBvbmUgdXNl
cyAiYm9vbCBhbWRncHVfaXNfdG16KGFkZXYpIiB0byBxdWVyeSB3aGV0aGVyIGFkZXYgc3VwcG9y
dHMgVE1aLg0KPiANCj4gQWxzbywgcmVtb3ZlIGNpcmN1bGFyIGhlYWRlciBmaWxlIGluY2x1ZGUu
DQo+IA0KPiB2MjogUmVtb3ZlIGFtZGdwdV90bXouW2NoXSBhcyByZXF1ZXN0ZWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICAgICB8ICAyICstDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgfCAgNiArKy0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAzICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgICAgfCAyMyArKysrKysrKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggICAgfCAgOSArKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMgICAgfCA1MiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dG16LmggICAgfCAzOSAtLS0tLS0tLS0tLS0tLS0tDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDM5IGlu
c2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKSAgZGVsZXRlIG1vZGUgMTAwNjQ0DQo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYw0KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaA0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUNCj4gaW5kZXggODNlZTFjNjc2ZTNhLi43YWUzYjIyYzU2
MjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQo+IEBAIC01NSw3ICs1
NSw3IEBAIGFtZGdwdS15ICs9IGFtZGdwdV9kZXZpY2UubyBhbWRncHVfa21zLm8gXA0KPiAgCWFt
ZGdwdV92Zl9lcnJvci5vIGFtZGdwdV9zY2hlZC5vIGFtZGdwdV9kZWJ1Z2ZzLm8NCj4gYW1kZ3B1
X2lkcy5vIFwNCj4gIAlhbWRncHVfZ21jLm8gYW1kZ3B1X21taHViLm8gYW1kZ3B1X3hnbWkubyBh
bWRncHVfY3NhLm8NCj4gYW1kZ3B1X3Jhcy5vIGFtZGdwdV92bV9jcHUubyBcDQo+ICAJYW1kZ3B1
X3ZtX3NkbWEubyBhbWRncHVfZGlzY292ZXJ5Lm8gYW1kZ3B1X3Jhc19lZXByb20ubw0KPiBhbWRn
cHVfbmJpby5vIFwNCj4gLQlhbWRncHVfdW1jLm8gc211X3YxMV8wX2kyYy5vIGFtZGdwdV90bXou
bw0KPiArCWFtZGdwdV91bWMubyBzbXVfdjExXzBfaTJjLm8NCj4gDQo+ICBhbWRncHUtJChDT05G
SUdfUEVSRl9FVkVOVFMpICs9IGFtZGdwdV9wbXUubw0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgNCj4gaW5kZXggZDEyMGZlNThlYmVhLi44MDVlMTJlZjEzZWEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+IEBAIC05MCw3ICs5MCw2IEBADQo+
ICAjaW5jbHVkZSAiYW1kZ3B1X21lcy5oIg0KPiAgI2luY2x1ZGUgImFtZGdwdV91bWMuaCINCj4g
ICNpbmNsdWRlICJhbWRncHVfbW1odWIuaCINCj4gLSNpbmNsdWRlICJhbWRncHVfdG16LmgiDQo+
IA0KPiAgI2RlZmluZSBNQVhfR1BVX0lOU1RBTkNFCQkxNg0KPiANCj4gQEAgLTEyNjYsNSArMTI2
NSwxMCBAQCBfbmFtZSMjX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiAJCQlcDQo+ICAJCQkJ
CQkJCQlcDQo+ICBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgcG11X2F0dHJfIyNfbmFt
ZSA9IF9fQVRUUl9STyhfbmFtZSkNCj4gDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgYW1kZ3B1X2lz
X3RteihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KPiArICAgICAgIHJldHVybiBhZGV2
LT50bXouZW5hYmxlZDsNCj4gK30NCj4gKw0KPiAgI2VuZGlmDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGluZGV4IGIxNDA4YzVlNDY0MC4u
NTY4MzYwNTRlNmE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jDQo+IEBAIC02NCw3ICs2NCw2IEBADQo+ICAjaW5jbHVkZSAiYW1kZ3B1X3hnbWku
aCINCj4gICNpbmNsdWRlICJhbWRncHVfcmFzLmgiDQo+ICAjaW5jbHVkZSAiYW1kZ3B1X3BtdS5o
Ig0KPiAtI2luY2x1ZGUgImFtZGdwdV90bXouaCINCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvc3Vz
cGVuZC5oPg0KPiANCj4gQEAgLTEwNzMsNyArMTA3Miw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rl
dmljZV9jaGVja19hcmd1bWVudHMoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+IA0K
PiAgCWFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9IGFtZGdwdV91Y29kZV9nZXRfbG9hZF90eXBl
KGFkZXYsDQo+IGFtZGdwdV9md19sb2FkX3R5cGUpOw0KPiANCj4gLQlhZGV2LT50bXouZW5hYmxl
ZCA9IGFtZGdwdV9pc190bXooYWRldik7DQo+ICsJYW1kZ3B1X3Rtel9zZXQoYWRldik7DQo+IA0K
PiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ21jLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ21jLmMNCj4gaW5kZXggYTEyZjMzYzBmNWRmLi5hMDI0NWQ4YjJmMzcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMNCj4gQEAgLTMzMywzICszMzMsMjYg
QEAgdm9pZCBhbWRncHVfZ21jX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2
KQ0KPiAgCWFtZGdwdV9tbWh1Yl9yYXNfZmluaShhZGV2KTsNCj4gIAlhbWRncHVfeGdtaV9yYXNf
ZmluaShhZGV2KTsNCj4gIH0NCj4gKw0KPiArLyoqDQo+ICsgKiBhbWRncHVfdG16X3NldCAtLSBj
aGVjayBhbmQgc2V0IGlmIGEgZGV2aWNlIHN1cHBvcnRzIFRNWg0KPiArICogQGFkZXY6IGFtZGdw
dV9kZXZpY2UgcG9pbnRlcg0KPiArICoNCj4gKyAqIENoZWNrIGFuZCBzZXQgaWYgYW4gdGhlIGRl
dmljZSBAYWRldiBzdXBwb3J0cyBUcnVzdGVkIE1lbW9yeQ0KPiArICogWm9uZXMgKFRNWikuDQo+
ICsgKi8NCj4gK3ZvaWQgYW1kZ3B1X3Rtel9zZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
IHsNCj4gKwlpZiAoIWFtZGdwdV90bXopDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWlmIChhZGV2
LT5hc2ljX3R5cGUgPCBDSElQX1JBVkVOIHx8DQo+ICsJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX0FSQ1RVUlVTKSB7DQo+ICsJCWRldl93YXJuKGFkZXYtPmRldiwgIlRydXN0ZWQgTWVtb3J5
IFpvbmUgKFRNWikgZmVhdHVyZQ0KPiBub3Qgc3VwcG9ydGVkXG4iKTsNCj4gKwkJcmV0dXJuOw0K
PiArCX0NCj4gKw0KPiArCWFkZXYtPnRtei5lbmFibGVkID0gdHJ1ZTsNCj4gKw0KPiArCWRldl9p
bmZvKGFkZXYtPmRldiwgIlRydXN0ZWQgTWVtb3J5IFpvbmUgKFRNWikgZmVhdHVyZQ0KPiBzdXBw
b3J0ZWQgYW5kDQo+ICtlbmFibGVkXG4iKTsgfQ0KDQpIaSBMdWJlbiwNClRNWiBpcyBqdXN0IGEg
c3BlY2lmaWMgZmVhdHVyZSBhbmQgSSB0aGluayB0aGlzIGlzIGEgbmljZSBjaGFuZ2UgdGhhdCBt
b3ZpbmcgYW1kZ3B1X3RteiB0byBhbWRncHVfZ21jLmguDQpBbm90aGVyIHRoaW5nLCB5b3UgY2Fu
IHJlbmFtZSBhbWRncHVfdG16X3NldCB0byBhbWRncHVfZ21jX3Rtel9zZXQgaW4gYW1kZ3B1X2dt
Yy5oLyBhbWRncHVfZ21jLmMNCkluIGFtZGdwdV9nbWMuYywgYWxsIGZ1bmN0aW9ucyBhcmUgcHJl
Zml4ZWQgd2l0aCBhbWRncHVfZ21jXyouDQpXaXRoIHRoaXMgZml4ZWQsIFJldmlld2VkLWJ5OiBB
YXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPg0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ21jLmgNCj4gaW5kZXggNDA2NzM2YTFiZDNkLi4xYWJkOTM1YTA3M2UgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgNCj4gQEAgLTI2Nyw0
ICsyNjcsMTMgQEAgYm9vbCBhbWRncHVfZ21jX2ZpbHRlcl9mYXVsdHMoc3RydWN0DQo+IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHVpbnQ2NF90IGFkZHIsICBpbnQgYW1kZ3B1X2dtY19yYXNfbGF0ZV9p
bml0KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KTsgIHZvaWQgYW1kZ3B1X2dtY19yYXNf
ZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldik7DQo+IA0KPiArLyoNCj4gKyAqIFRy
dXN0ZWQgTWVtb3J5IFpvbmUgcGFydGljdWxhcnMNCj4gKyAqLw0KPiArc3RydWN0IGFtZGdwdV90
bXogew0KPiArCWJvb2wJZW5hYmxlZDsNCj4gK307DQo+ICsNCj4gK2V4dGVybiB2b2lkIGFtZGdw
dV90bXpfc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gKw0KPiAgI2VuZGlmDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMNCj4gZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDgyMzUyN2EwZmE0Ny4uMDAwMDAwMDAwMDAwDQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYw0KPiArKysgL2Rldi9udWxs
DQo+IEBAIC0xLDUyICswLDAgQEANCj4gLS8qDQo+IC0gKiBDb3B5cmlnaHQgMjAxOSBBZHZhbmNl
ZCBNaWNybyBEZXZpY2VzLCBJbmMuDQo+IC0gKg0KPiAtICogUGVybWlzc2lvbiBpcyBoZXJlYnkg
Z3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGENCj4gLSAq
IGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVz
ICh0aGUgIlNvZnR3YXJlIiksDQo+IC0gKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0
IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uDQo+IC0gKiB0aGUgcmln
aHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3Vi
bGljZW5zZSwNCj4gLSAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0
byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQ0KPiAtICogU29mdHdhcmUgaXMgZnVybmlzaGVk
IHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoNCj4gLSAqDQo+
IC0gKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGlj
ZSBzaGFsbCBiZSBpbmNsdWRlZCBpbg0KPiAtICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBw
b3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuDQo+IC0gKg0KPiAtICogVEhFIFNPRlRXQVJFIElTIFBS
T1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsDQo+IEVYUFJFU1Mg
T1INCj4gLSAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJB
TlRJRVMgT0YNCj4gTUVSQ0hBTlRBQklMSVRZLA0KPiAtICogRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PDQo+IEVWRU5UIFNIQUxMDQo+
IC0gKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBB
TlkgQ0xBSU0sDQo+IERBTUFHRVMgT1INCj4gLSAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1INCj4gT1RIRVJXSVNFLA0KPiAtICogQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUg0K
PiBUSEUgVVNFIE9SDQo+IC0gKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuDQo+IC0g
Ki8NCj4gLQ0KPiAtI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KPiAtDQo+IC0jaW5jbHVkZSA8
ZHJtL2FtZF9hc2ljX3R5cGUuaD4NCj4gLQ0KPiAtI2luY2x1ZGUgImFtZGdwdS5oIg0KPiAtI2lu
Y2x1ZGUgImFtZGdwdV90bXouaCINCj4gLQ0KPiAtDQo+IC0vKioNCj4gLSAqIGFtZGdwdV9pc190
bXogLSB2YWxpZGF0ZSB0cnVzdCBtZW1vcnkgem9uZQ0KPiAtICoNCj4gLSAqIEBhZGV2OiBhbWRn
cHVfZGV2aWNlIHBvaW50ZXINCj4gLSAqDQo+IC0gKiBSZXR1cm4gdHJ1ZSBpZiBAZGV2IHN1cHBv
cnRzIHRydXN0ZWQgbWVtb3J5IHpvbmVzIChUTVopLCBhbmQgcmV0dXJuDQo+IGZhbHNlIGlmDQo+
IC0gKiBAZGV2IGRvZXMgbm90IHN1cHBvcnQgVE1aLg0KPiAtICovDQo+IC1ib29sIGFtZGdwdV9p
c190bXooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIC17DQo+IC0JaWYgKCFhbWRncHVfdG16
KQ0KPiAtCQlyZXR1cm4gZmFsc2U7DQo+IC0NCj4gLQlpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJ
UF9SQVZFTiB8fCBhZGV2LT5hc2ljX3R5cGUgPT0NCj4gQ0hJUF9BUkNUVVJVUykgew0KPiAtCQlk
ZXZfd2FybihhZGV2LT5kZXYsICJkb2Vzbid0IHN1cHBvcnQgdHJ1c3RlZCBtZW1vcnkNCj4gem9u
ZXMgKFRNWilcbiIpOw0KPiAtCQlyZXR1cm4gZmFsc2U7DQo+IC0JfQ0KPiAtDQo+IC0JZGV2X2lu
Zm8oYWRldi0+ZGV2LCAiVE1aIGZlYXR1cmUgaXMgZW5hYmxlZFxuIik7DQo+IC0NCj4gLQlyZXR1
cm4gdHJ1ZTsNCj4gLX0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90bXouaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXou
aA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMjhlMDUxNzdmYjg5Li4wMDAw
MDAwMDAwMDANCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5o
DQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEsMzkgKzAsMCBAQA0KPiAtLyoNCj4gLSAqIENvcHly
aWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4NCj4gLSAqDQo+IC0gKiBQZXJt
aXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBv
YnRhaW5pbmcgYQ0KPiAtICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRv
Y3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwNCj4gLSAqIHRvIGRlYWwgaW4gdGhl
IFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRp
b24NCj4gLSAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNo
LCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLA0KPiAtICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRo
ZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlDQo+IC0gKiBTb2Z0
d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25k
aXRpb25zOg0KPiAtICoNCj4gLSAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlz
IHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluDQo+IC0gKiBhbGwgY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4NCj4gLSAqDQo+IC0gKiBU
SEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkg
S0lORCwNCj4gRVhQUkVTUyBPUg0KPiAtICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElN
SVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRg0KPiBNRVJDSEFOVEFCSUxJVFksDQo+IC0gKiBGSVRO
RVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8N
Cj4gRVZFTlQgU0hBTEwNCj4gLSAqIFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhPUihT
KSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwNCj4gREFNQUdFUyBPUg0KPiAtICogT1RIRVIgTElB
QklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUg0KPiBPVEhF
UldJU0UsDQo+IC0gKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEgg
VEhFIFNPRlRXQVJFIE9SDQo+IFRIRSBVU0UgT1INCj4gLSAqIE9USEVSIERFQUxJTkdTIElOIFRI
RSBTT0ZUV0FSRS4NCj4gLSAqDQo+IC0gKi8NCj4gLQ0KPiAtI2lmbmRlZiBfX0FNREdQVV9UTVpf
SF9fDQo+IC0jZGVmaW5lIF9fQU1ER1BVX1RNWl9IX18NCj4gLQ0KPiAtI2luY2x1ZGUgImFtZGdw
dS5oIg0KPiAtDQo+IC0vKg0KPiAtICogVHJ1c3QgbWVtb3J5IHpvbmUgc3R1ZmYNCj4gLSAqLw0K
PiAtc3RydWN0IGFtZGdwdV90bXogew0KPiAtCWJvb2wJZW5hYmxlZDsNCj4gLX07DQo+IC0NCj4g
LQ0KPiAtZXh0ZXJuIGJvb2wgYW1kZ3B1X2lzX3RteihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7DQo+IC0NCj4gLSNlbmRpZg0KPiAtLQ0KPiAyLjI0LjAuMTU1LmdkOWY2ZjNiNjE5DQo+IA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
