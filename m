Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62B97534
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 10:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8676E13C;
	Wed, 21 Aug 2019 08:43:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88B66E941
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 08:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqE3f2DI4LzxTkc/rCis9Ysog7a+14sP8q1NanmRtWOKqoOOeZxEMn3sBjOI9Ap41Rk8K5Epa3jMYWUMj3f+0Gax/zjbVxyvkjEr1Qs3sbE+3Mat6IRqBkY4/KUQZpAufp5r/pGPKR516IAix2BJkW5Qc5vq0ttwvFZfcKVBIZUpvqCJWnFczJHKKVI/A/MZV6IgOVNUYJ3IukUD550bA8cn239cMRJDoRvfDsMsU14028IfxzC5oXtUXaWBSo2qnP1We53HgPWNqxmJ64oIuNM9PJh/9IciQm8usBqFFEJtQu4f9WxKiMqiaLQ5y0KT+q91mhZJSeRyII/nG750WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BINBj9QNi30f62+DBmaIdoTeDNoa7E3XLrdhhY7Fz+c=;
 b=lEkmvzsvLDdLPQ4g8iGJOQpYvaNdWWsbq+9Y/2vSktD86RFDP4G2odV4e4/6d3RFNpK0vfV7idF6UwHhqRDuAPPKTw4pik7v1+qipDObTQuE5NhEI2AZPEfxdEfcu3SxQePHeT6ZDdtMG0NswyuGBtXGgX9oGSCNqqFqwfQ05KsvqV8oElMuppW5NnsZZ24Y9ocODEPgsTp+rzma67MAAqfxeI4w1i9mwNKQHlczTbZ6mWz8B7t6AO/HlO2xsTXOEVtEhswYbUjQaXeHKAlLsYfvF756g7P7lr8L8rP01CyHzS5MTZdyp6U9LCyYhpU3wiZwQSu95IgzG0oCnGfcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3101.namprd12.prod.outlook.com (20.178.241.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 08:43:29 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 08:43:29 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerpaly: fix navi series custom peak level
 value error
Thread-Topic: [PATCH] drm/amd/powerpaly: fix navi series custom peak level
 value error
Thread-Index: AQHVV+P9Cvd8YDBXgkGiVZcdEhFYjacFSSQA
Date: Wed, 21 Aug 2019 08:43:28 +0000
Message-ID: <MN2PR12MB3344E01167CB7BDAEAAA1127E4AA0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190821054739.27092-1-kevin1.wang@amd.com>
In-Reply-To: <20190821054739.27092-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 140f9587-eb19-42bb-8fa3-08d72613a3d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3101; 
x-ms-traffictypediagnostic: MN2PR12MB3101:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3101FD3B4D591E18E96AD993E4AA0@MN2PR12MB3101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(13464003)(66556008)(7696005)(9686003)(2906002)(25786009)(55016002)(66446008)(66476007)(66946007)(52536014)(76116006)(229853002)(486006)(53936002)(6306002)(5660300002)(446003)(66066001)(6246003)(6116002)(4326008)(3846002)(6436002)(14454004)(2501003)(476003)(8676002)(53546011)(6506007)(64756008)(966005)(81156014)(316002)(11346002)(110136005)(76176011)(99286004)(33656002)(81166006)(7736002)(102836004)(74316002)(8936002)(71190400001)(54906003)(256004)(186003)(71200400001)(26005)(86362001)(478600001)(305945005)(219204002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3101;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JKisaSC6lhHMZ2oFVAUqFNVo4nS4y3mwkzg7BWL2IVRcJUFsQhf8cMKXYfCopt/jKJvhZNc0jsiNr+WalCWvunn4lA/E1zEUGrvdXAzLyS3BBGdVnyS0UPIpy0sYK7ysQx1aISHKdNSWptDznAUpUJ5VPD9UH6qzDah3EoS0G+7YhSL5Kc8vSzg3jS87n45m5uB9EWOu5OcAc9SPorEio5N79Tjepj6/TblkRuj3ShG86GElQlBxo2o1VPV3LPVsV19twJ1uHZVLCU8dUBpUFarU4QmbXOiqpJ4AgsIAsKwgZzKsdDQms4p6kHw0z5t4zkWiRJSEKUzN2IXuybujZ0NOy9IeOU6s5vYYFZLTuADTngS7RTHKd9J7Yhn5Sjs+ptV9TF3YZR3K17JFQIbTJ7CbeXi28Ui5gqIK2lLJzEs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140f9587-eb19-42bb-8fa3-08d72613a3d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:43:29.0185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYNH+UKx1D6rNvljrBlLJZ1iLQ0faAnXMhxofAKuAxZZMEGyMCsWX99C2yCqVGR5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BINBj9QNi30f62+DBmaIdoTeDNoa7E3XLrdhhY7Fz+c=;
 b=NRhXxcN8g382J2qOk+deq1DrAYx8CUpL2pN5k1nPXDWscfxYj47VgrGk56klL2sfPkZB0Zu6nCZkhuSCadZ4SiLEBoMGgHLKURJ0aQdkGhRM2PJLyfyMBTvKuFqbBr0C5+Xb5RVYM0bMt2lfOrN/AH5lAuQ90xs5vDDmWUVtopE=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFdhbmcsIEtldmluKFlhbmcpDQo+IFNl
bnQ6IFdlZG5lc2RheSwgQXVndXN0IDIxLCAyMDE5IDE6NDggUE0NCj4gVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBYdSwgRmVpZmVpIDxGZWlmZWkuWHVAYW1kLmNvbT47
IFdhbmcsIEtldmluKFlhbmcpDQo+IDxLZXZpbjEuV2FuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBb
UEFUQ0hdIGRybS9hbWQvcG93ZXJwYWx5OiBmaXggbmF2aSBzZXJpZXMgY3VzdG9tIHBlYWsgbGV2
ZWwNCj4gdmFsdWUgZXJyb3INCj4gDQo+IGZpeCBvdGhlciBuYXZpIGFzaWMgc2V0IHBlYWsgcGVy
Zm9ybWFuY2UgbGV2ZWwgZXJyb3IuDQo+IGJlY2F1c2UgdGhlIG5hdmkxMF9wcHQuYyB3aWxsIGhh
bmRsZSBuYXZpMTIgMTQgYXNpYywgaXQgd2lsbCB1c2UgbmF2aTEwIHBlYWsNCj4gdmFsdWUgdG8g
c2V0IG90aGVyIGFzaWMsIGl0IGlzIG5vdCBjb3JyZWN0Lg0KPiANCj4gYWZ0ZXIgcGF0Y2g6DQo+
IG9ubHkgbmF2aTEwIHVzZSBjdXN0b20gcGVhayB2YWx1ZSwgb3RoZXIgYXNpYyB3aWxsIHVzZWQg
ZGVmYXVsdCB2YWx1ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53
YW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+IGlu
ZGV4IDA5NTVmZTgxNDViOS4uZWI4YWRmM2IwYTVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+IEBAIC0xNDIyLDYgKzE0MjIsMTAgQEAgc3Rh
dGljIGludCBuYXZpMTBfc2V0X3BlYWtfY2xvY2tfYnlfZGV2aWNlKHN0cnVjdA0KPiBzbXVfY29u
dGV4dCAqc211KSAgc3RhdGljIGludCBuYXZpMTBfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHN0cnVj
dA0KPiBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIGxldmVsKSAg
ew0KPiAgCWludCByZXQgPSAwOw0KPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211
LT5hZGV2Ow0KPiArDQo+ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxMCkNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAgCXN3aXRjaCAobGV2ZWwpIHsNCj4gIAljYXNlIEFN
RF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfUEVBSzoNCj4gLS0NCj4gMi4yMi4wDQo+IA0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
