Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE7CD46AA
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 19:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12DC6EC73;
	Fri, 11 Oct 2019 17:33:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680078.outbound.protection.outlook.com [40.107.68.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E836EC73
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 17:33:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQUjcIfVKLRewWbahB9fAFyvnEsVlIe4HUESm6y35dbmuIfl8KM5RkdMkmhykjW+211Hbsy9ACT3pakqADDH2nRGUkUAe4r6nbOUJgqa1jWDKt0WeQEMvoVhvFo72VTAdcOsJ7eIkJvcweEjKcD6aCrwbE003+s0lGAEfWtGVQwqCeNMg4fshA9WKgya27FSTeSjPpf3XHTYDwaSsGnxNCrBHqrZuPG9U2NDSEvSWHa3UBRI9/FoL4uNyNc9ARSlKzLqiseU78MOkRstCYhcXlKxXAMgGqFyO1vHb/8LMhEX3fV1pJY93YnK+Bx0453DGTf+u0yy0cX8mE74mdH04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOGIjAYBOguV0ZpcPCb4ZfQwzdL5/z7XM50Bgac1JaI=;
 b=OmboZrzXxMuXFVKmgLWGzuGAaxRbWIjiHoipqpwW2FW6Hid6zmDu8HZ8bYNAjQo7EPMqhwij/kJqcFWOTUzO/Ebopq0emDdEBGb3w4z3gtrrANzRMmjQdnSiAgppZLJQx4RZQwS1tiUth8COIwEafFc41FMU/q5Es16OktBU5yz9i9SRQL5A4QbWmjQuU/adNCjNsk61t1yTLlK5mFvgDRvDL5wtPDxY8q0zaz5iuZHX/cfETHQv93G+rcebRZnluYYMdFthx3ZshvWaJU6RiTpk0WIL67PMpAqfQAoxYKI7Dur92yIOTZHzk1owzKBgIimMk+bYyrrgxTBkPhdBJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2794.namprd12.prod.outlook.com (20.176.117.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 17:33:38 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 17:33:38 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "thejoe@gmail.com" <thejoe@gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH v3] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVgEFTkdALhneXtEiXdTXz5Xf4Y6dVs4IA
Date: Fri, 11 Oct 2019 17:33:38 +0000
Message-ID: <9abf4c92-a30c-ae3d-5544-6428c3aec2ce@amd.com>
References: <20191011143620.8785-1-Philip.Yang@amd.com>
In-Reply-To: <20191011143620.8785-1-Philip.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::44) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 327a120a-b797-462d-ecb2-08d74e712683
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2794:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2794C60E82C319A4BAFEB6FC92970@DM6PR12MB2794.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(189003)(199004)(76176011)(14454004)(386003)(26005)(229853002)(25786009)(99286004)(52116002)(186003)(53546011)(6506007)(6246003)(66066001)(65806001)(65956001)(102836004)(966005)(6486002)(6512007)(6306002)(6436002)(478600001)(14444005)(256004)(36756003)(7736002)(8936002)(305945005)(8676002)(66574012)(64756008)(2501003)(66946007)(66556008)(66476007)(81166006)(81156014)(66446008)(71190400001)(476003)(71200400001)(110136005)(58126008)(31686004)(2906002)(4001150100001)(86362001)(31696002)(5660300002)(316002)(446003)(486006)(6116002)(3846002)(2616005)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2794;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sEz0Ku6YpGIrN2X1VtvO8W7oXnk6xwOQJPaqOOOnqKFGXDaOub15T2SyJdWHfSyRjRHbI/R4CMDj+xi4EGlAvW5fVVapJYIIjz0pdU7i9zwfgc43Btxb2AYjvKbucxNdBt0eQScAxspuRIcl9gZYySdND6KPtfRSryBJDqNaCGLI+wP40zcyzp1HQUXHbZ2wDPcB/X+xdtA53VfezR29jLHUVQ6zHUurHK72kccgtX/AgRiHaXf8sz4GS00A55ZYFfGD8VTwAWs08gPzE7YOjSdLZlEeCyLjJUzdRqJkEOZBCeF9Po9hKGh29v+LkIO06oh9gecNCcHQEkHAaS+eH4D/FcdoL0N5fGjAFfRk+EH2vNcyjJDGPW+cPtl80Xc8oE9UjjLwOJCmilamVcbrJxmcmul4f/ei2CITP9MzKay2xx9IgdDKptJuDO/UPOJCAYbcG2KlzDe1BalT+Ypa2g==
Content-ID: <ACE3CB8AB4CB9748BC9ECFE2A47B532F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327a120a-b797-462d-ecb2-08d74e712683
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 17:33:38.2644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHbM4pXdMhmlGJjzU0s0KVv4hqMXDqdNIKUI9GfoyQeOIMcP2L5c5VjYYWLjAOsiOuIw9OFFRmfE9lCEJgYu9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOGIjAYBOguV0ZpcPCb4ZfQwzdL5/z7XM50Bgac1JaI=;
 b=qpAH7rXmF3jraKos3WEqlWjgky8v3zHyegrHqehQuQQ/ikGdn3XZXlM9gy/EAI77Sqv0kMr4/7jPqwYg2t4mB9ePeOFk6Qz26KAUy1/3RCX/pl3/PV63TzHnZ6uNQPh0v5ctWkZD+xPN9SJY09bZ339xN1iWBGptXewwkjxWpI0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0xMC0xMSAxMDozNiBhLm0uLCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+IHVzZXJfcGFn
ZXMgYXJyYXkgc2hvdWxkIGFsd2F5cyBiZSBmcmVlZCBhZnRlciB2YWxpZGF0aW9uIHJlZ2FyZGxl
c3MgaWYNCj4gdXNlciBwYWdlcyBhcmUgY2hhbmdlZCBhZnRlciBibyBpcyBjcmVhdGVkIGJlY2F1
c2Ugd2l0aCBITU0gY2hhbmdlIHBhcnNlDQo+IGJvIGFsd2F5cyBhbGxvY2F0ZSB1c2VyIHBhZ2Vz
IGFycmF5IHRvIGdldCB1c2VyIHBhZ2VzIGZvciB1c2VycHRyIGJvLg0KPg0KPiB2MjogcmVtb3Zl
IHVudXNlZCBsb2NhbCB2YXJpYWJsZSBhbmQgYW1lbmQgY29tbWl0DQo+DQo+IHYzOiBhZGQgYmFj
ayBnZXQgdXNlciBwYWdlcyBpbiBnZW1fdXNlcnB0cl9pb2N0bCwgdG8gZGV0ZWN0IGFwcGxpY2F0
aW9uDQo+IGJ1ZyB3aGVyZSBhbiB1c2VycHRyIFZNQSBpcyBub3QgYW5hbnltb3VzIG1lbW9yeSBh
bmQgcmVqZWN0IGl0Lg0KPg0KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQv
dWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xODQ0OTYyDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPiBUZXN0ZWQtYnk6IEpvZSBCYXJuZXR0
IDx0aGVqb2VAZ21haWwuY29tPg0KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYyB8IDQgKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzLmMNCj4gaW5kZXggYzE4YTE1M2IzZDJhLi5lN2IzOWRhYTIyZjYgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+IEBAIC00NzYsNyArNDc2LDYgQEAgc3Rh
dGljIGludCBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAq
cCwNCj4gICANCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeShsb2JqLCB2YWxpZGF0ZWQsIHR2Lmhl
YWQpIHsNCj4gICAJCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gdHRtX3RvX2FtZGdwdV9ibyhsb2Jq
LT50di5ibyk7DQo+IC0JCWJvb2wgYmluZGluZ191c2VycHRyID0gZmFsc2U7DQo+ICAgCQlzdHJ1
Y3QgbW1fc3RydWN0ICp1c2VybW07DQo+ICAgDQo+ICAgCQl1c2VybW0gPSBhbWRncHVfdHRtX3R0
X2dldF91c2VybW0oYm8tPnRiby50dG0pOw0KPiBAQCAtNDkzLDE0ICs0OTIsMTMgQEAgc3RhdGlj
IGludCBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwN
Cj4gICANCj4gICAJCQlhbWRncHVfdHRtX3R0X3NldF91c2VyX3BhZ2VzKGJvLT50Ym8udHRtLA0K
PiAgIAkJCQkJCSAgICAgbG9iai0+dXNlcl9wYWdlcyk7DQo+IC0JCQliaW5kaW5nX3VzZXJwdHIg
PSB0cnVlOw0KPiAgIAkJfQ0KPiAgIA0KPiAgIAkJciA9IGFtZGdwdV9jc192YWxpZGF0ZShwLCBi
byk7DQo+ICAgCQlpZiAocikNCj4gICAJCQlyZXR1cm4gcjsNCj4gICANCj4gLQkJaWYgKGJpbmRp
bmdfdXNlcnB0cikgew0KPiArCQlpZiAobG9iai0+dXNlcl9wYWdlcykgew0KDQpUaGlzIGlmIGlz
IG5vdCBuZWVkZWQuIGt2ZnJlZSBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgTlVMTCBwb2ludGVy
cywgDQphbmQgdW5jb25kaXRpb25hbGx5IHNldHRpbmcgdGhlIHBvaW50ZXIgdG8gTlVMTCBhZnRl
cndhcmRzIGlzIG5vdCBhIA0KcHJvYmxlbSBlaXRoZXIuIFdpdGggdGhhdCBmaXhlZCwgdGhpcyBj
b21taXQgaXMNCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0KDQpIb3dldmVyLCBJIGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGJlIHRoZSBmaW5h
bCBzb2x1dGlvbi4gTXkgY29uY2VybiANCndpdGggdGhpcyBzb2x1dGlvbiBpcywgdGhhdCB5b3Ug
ZW5kIHVwIGZyZWVpbmcgYW5kIHJlZ2VuZXJhdGluZyB0aGUgDQp1c2VyX3BhZ2VzIGFycmF5cyBt
b3JlIGZyZXF1ZW50bHkgdGhhbiBuZWNlc3Nhcnk6IE9uIGV2ZXJ5IGNvbW1hbmQgDQpzdWJtaXNz
aW9uLCBldmVuIGlmIHRoZXJlIHdhcyBubyBNTVUgbm90aWZpZXIgc2luY2UgdGhlIGxhc3QgY29t
bWFuZCANCnN1Ym1pc3Npb24uIEkgd2FzIGhvcGluZyB3ZSBjb3VsZCBnZXQgYmFjayB0byBhIHNv
bHV0aW9uIHdoZXJlIHdlIGNhbiANCm1haW50YWluIHRoZSBzYW1lIHVzZXJfcGFnZXMgYXJyYXkg
YWNyb3NzIGNvbW1hbmQgc3VibWlzc2lvbnMsIHNpbmNlIE1NVSANCm5vdGlmaWVycyBhcmUgcmFy
ZS4gVGhhdCBzaG91bGQgcmVkdWNlIG92ZXJoZWFkIGZyb20gZG9pbmcgYWxsIHRob3MgcGFnZSAN
CnRhYmxlIHdhbGtzIGluIEhNTSBvbiBldmVyeSBjb21tYW5kIHN1Ym1pc3Npb25zIHdoZW4gdXNp
bmcgdXNlcnB0cnMuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+ICAgCQkJa3ZmcmVlKGxv
YmotPnVzZXJfcGFnZXMpOw0KPiAgIAkJCWxvYmotPnVzZXJfcGFnZXMgPSBOVUxMOw0KPiAgIAkJ
fQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
