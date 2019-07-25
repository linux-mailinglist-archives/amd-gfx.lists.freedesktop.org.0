Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F575691
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 20:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788AE6E802;
	Thu, 25 Jul 2019 18:08:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198D86E7FD
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 18:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwspqAMe2mvSg5TESyPzOQvBmiZ4gHid3ahwvSWVvz3bFKBPREhdMQHxIlVcwM9rm8pNdLRzELN+RS6sBGeKHoEU+txLDRpfucSG+DES7JgBEOC5evUi9O8C/0uP41UGE0Y06NkmqaiN0kCYgBsmLHUf6KKMLzaGuSLCHJTGRHRW48ZlQ5r8XnTfCCRB1iSna+sph0c50QPS41i8SGNHPz6dHHYQFzZ4qLRzdy21QdaFls+YGgZv2JMhZl2ltKnU+AmltW/kqScPahuGUwnryj3Jz23aMVKUaq6GB5o7gyYj37WAvsccdSYxJ7Zk93XvF4SwiK8CRq287wmEFcoDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJE13nTpePWdi91wT96DiKGiVD2KXgmdrjaPBzlFFYE=;
 b=iwTzoMM6ooXeKuk2g85x8X6C5WY0JMHAXrtDkFHSQDxPnLFRk0t1lbmp7rKc2jT7jNoIL2AmOz0qaWX2xjhdscm363QOQEHHUxREHzwK2Yc8Xa/Mac6JMClGaVdOz267GkgPbubC8D/1eXJl8QW+lR3XliXQmQfVKcKFeENYx1Hk2EKzsuy7Ta4A0E96rmHclgwAZep5bwPdKjGNtStcQ2C13ypWGocQ1IS7aaM5NrIPuAOFeV/GhuhE8eB0w3+fvRh+wJFjSJoY4WRbwoq4dpMbrUs3DDJXw1wdJA6XfL9/kdatCImLAhEPtoh9WYCff1bfZV2vkmkI4dehMdiOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2600.namprd12.prod.outlook.com (20.176.255.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 18:08:24 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 18:08:24 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: Use switch table for
 dc_to_smu_clock_type
Thread-Topic: [PATCH v2] drm/amd/display: Use switch table for
 dc_to_smu_clock_type
Thread-Index: AQHVQxKDdDnCXK+YoUuS637ySiWcJ6bbob4A
Date: Thu, 25 Jul 2019 18:08:24 +0000
Message-ID: <c028e4c0-95d2-4d74-2214-f4fa9327279c@amd.com>
References: <20190725174029.27009-1-sunpeng.li@amd.com>
 <20190725175745.27466-1-sunpeng.li@amd.com>
In-Reply-To: <20190725175745.27466-1-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b16652ce-9396-4854-e6db-08d7112b15ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2600; 
x-ms-traffictypediagnostic: BYAPR12MB2600:
x-microsoft-antispam-prvs: <BYAPR12MB2600FFE37543CFBD254DEF0DECC10@BYAPR12MB2600.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(189003)(199004)(110136005)(305945005)(186003)(53546011)(31686004)(6506007)(102836004)(36756003)(386003)(7736002)(25786009)(8676002)(99286004)(52116002)(71190400001)(26005)(478600001)(71200400001)(6246003)(229853002)(446003)(6636002)(68736007)(53936002)(2501003)(4326008)(76176011)(6512007)(66476007)(2906002)(66066001)(14454004)(6486002)(66556008)(66446008)(64756008)(8936002)(486006)(2616005)(6436002)(11346002)(86362001)(5660300002)(81156014)(66946007)(256004)(81166006)(316002)(3846002)(31696002)(476003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2600;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ja7xGQ9eY6DfJtHYWreJsVRCDs+1tdp4Xo7pZcc5s0gci2JWt+m1oi8gN3eCJQDqrDH++hcBo4JwRO1BnV1T0Sop2jPhHbvCxiyCr8qHTUgWVNlOFc9AYuszAEvr6XMo3+H1l40ioV8UtrYIjfsccYbdkyH95Yp56+zuqa6tgK4rEGU26p60LY55JeMCMSUVzUlmyzT764pv4Wdw/GlLO/pF577K8V/0zoRiLN3RcjwtGbI5342l5DwC7Bdk8s/rJ+dWhmleJY2kKEPV3X9BJ5lwhp+zR9H0z9UEdYfiTXlH8ub3UYpLUMXPp+gSlps5yM9E7ayqi1XUSm/flGMWW0kt/qE5qmcmK8Ane0H8NnpLou2UsyM23pYiZHBOJSgqypWGmCb3thqPsQDwU45hxPu+tcfDFz0h30Q4j/++ATI=
Content-ID: <D2AF1D61BF450A41B065A34D893CA274@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16652ce-9396-4854-e6db-08d7112b15ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 18:08:24.7523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJE13nTpePWdi91wT96DiKGiVD2KXgmdrjaPBzlFFYE=;
 b=QNrevSDwRgcXovFH85/w/FIVHaPXUedtXf7kXlWQMUNJGicDVJSE2U2OAhfU4uVqiniRMtpo3Lbd8wTTj2Nnc+HkfXBTTKyqgVR+4dH9czJACA/QpQdhBf9192i6IB5D57PD5l37oHGF6+bXVJJH0/QITCjMSdj2NTyg46uMp04=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "natechancellor@gmail.com" <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSAxOjU3IFBNLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6DQo+IEZyb206IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPiANCj4gVXNpbmcgYSBzdGF0aWMgaW50IGFycmF5
IHdpbGwgY2F1c2UgZXJyb3JzIGlmIHRoZSBnaXZlbiBkbV9wcF9jbGtfdHlwZQ0KPiBpcyBvdXQt
b2YtYm91bmRzLiBGb3Igcm9idXN0bmVzcywgdXNlIGEgc3dpdGNoIHRhYmxlLCB3aXRoIGEgZGVm
YXVsdA0KPiBjYXNlIHRvIGhhbmRsZSBhbGwgaW52YWxpZCB2YWx1ZXMuDQo+IA0KPiB2MjogMCBp
cyBhIHZhbGlkIGNsb2NrIHR5cGUgZm9yIHNtdV9jbGtfdHlwZS4gUmV0dXJuIFNNVV9DTEtfQ09V
TlQNCj4gICAgICBpbnN0ZWFkIG9uIGludmFsaWQgbWFwcGluZy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIC4u
Li9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jICB8IDM3ICsrKysrKysr
KysrKystLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYw0KPiBpbmRleCAyMGU4MmM5ZjZkNjcuLmU1
MmRkZTIxNjEwZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMNCj4gQEAgLTE1MiwxOCArMTUyLDMx
IEBAIHN0YXRpYyB2b2lkIGdldF9kZWZhdWx0X2Nsb2NrX2xldmVscygNCj4gICBzdGF0aWMgZW51
bSBzbXVfY2xrX3R5cGUgZGNfdG9fc211X2Nsb2NrX3R5cGUoDQo+ICAgCQllbnVtIGRtX3BwX2Ns
b2NrX3R5cGUgZG1fcHBfY2xrX3R5cGUpDQo+ICAgew0KPiAtI2RlZmluZSBEQ0NMS19NQVBfU01V
Q0xLKGRjY2xrLCBzbXVjbGspIFwNCj4gLQlbZGNjbGtdID0gc211Y2xrDQo+IC0NCj4gLQlzdGF0
aWMgaW50IGRjX2Nsa190eXBlX21hcFtdID0gew0KPiAtCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQ
X0NMT0NLX1RZUEVfRElTUExBWV9DTEssCVNNVV9ESVNQQ0xLKSwNCj4gLQkJRENDTEtfTUFQX1NN
VUNMSyhETV9QUF9DTE9DS19UWVBFX0VOR0lORV9DTEssCVNNVV9HRlhDTEspLA0KPiAtCQlEQ0NM
S19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVfTUVNT1JZX0NMSywJU01VX01DTEspLA0KPiAt
CQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVfRENFRkNMSywJU01VX0RDRUZDTEsp
LA0KPiAtCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVfU09DQ0xLLAlTTVVfU09D
Q0xLKSwNCj4gLQl9Ow0KPiAtDQo+IC0JcmV0dXJuIGRjX2Nsa190eXBlX21hcFtkbV9wcF9jbGtf
dHlwZV07DQo+ICsJZW51bSBzbXVfY2xrX3R5cGUgc211X2Nsa190eXBlID0gU01VX0NMS19DT1VO
VDsNCj4gKw0KPiArCXN3aXRjaCAoZG1fcHBfY2xrX3R5cGUpIHsNCj4gKwljYXNlIERNX1BQX0NM
T0NLX1RZUEVfRElTUExBWV9DTEs6DQo+ICsJCXNtdV9jbGtfdHlwZSA9IFNNVV9ESVNQQ0xLOw0K
PiArCQlicmVhazsNCj4gKwljYXNlIERNX1BQX0NMT0NLX1RZUEVfRU5HSU5FX0NMSzoNCj4gKwkJ
c211X2Nsa190eXBlID0gU01VX0dGWENMSzsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBETV9QUF9D
TE9DS19UWVBFX01FTU9SWV9DTEs6DQo+ICsJCXNtdV9jbGtfdHlwZSA9IFNNVV9NQ0xLOw0KPiAr
CQlicmVhazsNCj4gKwljYXNlIERNX1BQX0NMT0NLX1RZUEVfRENFRkNMSzoNCj4gKwkJc211X2Ns
a190eXBlID0gU01VX0RDRUZDTEs7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgRE1fUFBfQ0xPQ0tf
VFlQRV9TT0NDTEs6DQo+ICsJCXNtdV9jbGtfdHlwZSA9IFNNVV9TT0NDTEs7DQo+ICsJCWJyZWFr
Ow0KPiArCWRlZmF1bHQ6DQo+ICsJCURSTV9FUlJPUigiRE1fUFBMSUI6IGludmFsaWQgY2xvY2sg
dHlwZTogJWQhXG4iLA0KPiArCQkJICBkbV9wcF9jbGtfdHlwZSk7DQo+ICsJCWJyZWFrOw0KPiAr
CX0NCj4gKw0KPiArCXJldHVybiBzbXVfY2xrX3R5cGU7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRp
YyBlbnVtIGFtZF9wcF9jbG9ja190eXBlIGRjX3RvX3BwX2Nsb2NrX3R5cGUoDQo+IA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
