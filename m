Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8498A35
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 06:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB026E41A;
	Thu, 22 Aug 2019 04:13:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690046.outbound.protection.outlook.com [40.107.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05F6E41A
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 04:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVCebBTBPJFF98oZW8ftznTL/Kaa0l6zu9RSDIj6RRuEkG+y1UMAiWP/RIacs7xn48hTzIVxZ1sehSsxq9VpOQfiLYugiPglXHlvq9drZia/uAEcxcwEhT332KrULcpwkxtPAdV6BJXLxSa0/Enzq1B9xamPRyfGfPS57q6oXq4Ms/J75Ma7DLOTEPdg/m7T1lNPHlBCfm+JxA2IpFoP5ss2CJuBRARrjwALU6FxAone7nEsQof19q7adcFiZBS/53stcurmZukAxag23UvYppdxdjTdDzRayGX7VdRoY8mnil4DSPJGvco3mP39vlgYvQwYrY+ZwFmfmMFXMQDXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhM++U0dn4MTJetB3lvEyxyS34C1TebVTGHPZ0fPVUQ=;
 b=aMQKKOkfKl4xL6LwG0hpkS4NqVKUllGF+5kA7TZBzAI5wwVyBASXpUy4zlf215H0XcPcBmgbgp3T63g61jc8/eTOJoIACwsRMdynV/y4R0IVn/Mro+rr+FLikn+Gf/Q6A3TW2p6r8jvxk4RTLhtd4EB7UHrtyt2k2Mf1xB/M35bfnhdnzz7t+sM3TY+hLOPw3liem2u8IewiKAprjMN5fGCNSeoAiYzbVD8KF+jgUI28W9jB6ifeNaxG+zIU+TfhMLg5smCARwovhxy7aCs+9aYNaEO9AMbed9IXooog71RxTrhQY6RAzXV4wKAiyoQA+PeHOdbEHvVDBMriO7GBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3037.namprd12.prod.outlook.com (20.178.240.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 22 Aug 2019 04:13:01 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 04:13:01 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/4] drm/amdgpu: Add RAS EEPROM table.
Thread-Topic: [PATCH v4 1/4] drm/amdgpu: Add RAS EEPROM table.
Thread-Index: AQHVWFtfk9XNdJTaO0iRi1uReYMRJ6cGhsbg
Date: Thu, 22 Aug 2019 04:13:00 +0000
Message-ID: <MN2PR12MB3054832C9FC9C73A7F9AD539B0A50@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566417719-1528-1-git-send-email-andrey.grodzovsky@amd.com>
 <1566417719-1528-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1566417719-1528-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8b71073-da42-4330-16ba-08d726b705c8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3037; 
x-ms-traffictypediagnostic: MN2PR12MB3037:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30373929FDB64F3802E0C19DB0A50@MN2PR12MB3037.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(13464003)(189003)(199004)(229853002)(256004)(316002)(33656002)(76116006)(66946007)(53546011)(14444005)(102836004)(3846002)(76176011)(66476007)(26005)(2501003)(5660300002)(186003)(30864003)(81166006)(99286004)(81156014)(8676002)(86362001)(7736002)(7696005)(55016002)(74316002)(110136005)(6506007)(8936002)(6436002)(54906003)(305945005)(25786009)(14454004)(6246003)(476003)(966005)(53946003)(2906002)(6306002)(66556008)(486006)(9686003)(64756008)(71190400001)(6116002)(446003)(478600001)(66066001)(71200400001)(53936002)(66446008)(52536014)(11346002)(4326008)(461764006)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3037;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Kn//4mq/vLZ+U3XuBrTJxBBIDXVxaDF64d7J1lCSauFL4WPZBCKRGuaWCbhbSgZJ1211T5MAsF9yT7gDFXLETX9MJOZ+NOIr6sZv0Cum5RKcx8hzUq3q1IUpjkrxg+c5L6HPNDX2OYE4yIdVaPgiAu/6iaGa/xVLWS0yzVh1IZdiuaq5PvOVBCPMN8Smq7n6DaKLIzie1V6hYAHU5HF9aAgkZ2teHZx9PrGIGwa25hDMxt4YVKEhnCW8I35UiNulT6ziA9HvJbH/3UKXJB6vRUodZGm6r1YGGF8aWyQ25lW+SI4pnZglgWgd65BkVXyqu0qUvoO1S2ZUqmI7WyKDepDQYSuBoL5Lsh3ZLsnq1R+/JEOIYGLw5xJKYFjTboSIBLO/rrX1vtvkgvGOBJAU7AzIwnBfntg3SqIToIvv3bA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b71073-da42-4330-16ba-08d726b705c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 04:13:01.2785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztUVKNO8GriMMzeXGBsdcxd6SeEKNENIRtWV4KLMruXdD85HuhZx/cpcJlsMi5dK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhM++U0dn4MTJetB3lvEyxyS34C1TebVTGHPZ0fPVUQ=;
 b=3kdhelfg1zRcoUzlEno0fKi+It7p4FdsHDRyL5NLIp7FpHIjQxLAS+HKQz9Sc2d4JMa9bmCE5YVKBn7VOVg/hRfON5EuGITBhE9pA/IlTpYFIudRfeMa4KBmYT5veEBRmFqpz+GrUlGoXTWsHN5bQHpJsnLKUSD8nxKfFhe9vQE=
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
Cc: "Panariti, David" <David.Panariti@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Tuikov, 
 Luben" <Luben.Tuikov@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ45pyIMjLml6Ug
NDowMg0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFBhbiwgWGluaHVpDQo+IDxY
aW5odWkuUGFuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsNCj4gVHVpa292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+OyBMYXphciwgTGlqbyA8
TGlqby5MYXphckBhbWQuY29tPjsNCj4gUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBQ
YW5hcml0aSwgRGF2aWQNCj4gPERhdmlkLlBhbmFyaXRpQGFtZC5jb20+OyBSdXNzZWxsLCBLZW50
IDxLZW50LlJ1c3NlbGxAYW1kLmNvbT47IFpob3UxLA0KPiBUYW8gPFRhby5aaG91MUBhbWQuY29t
PjsgR3JvZHpvdnNreSwgQW5kcmV5DQo+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjQgMS80XSBkcm0vYW1kZ3B1OiBBZGQgUkFTIEVFUFJPTSB0YWJsZS4N
Cj4gDQo+IEFkZCBSQVMgRUVQUk9NIHRhYmxlIG1hbmFnZXIgdG8gZWFuYmxlIFJBUyBlcnJvcnMg
dG8gYmUgc3RvcmVkIHVwb24NCj4gYXBwZWFyYW5jZSBhbmQgcmV0cml2ZWQgb24gZHJpdmVyIGxv
YWQuDQo+IA0KPiB2MjogRml4IHNvbWUgcHJpbnRzLg0KPiANCj4gdjM6DQo+IEZpeCBjaGVja3N1
bSBjYWxjdWxhdGlvbi4NCj4gTWFrZSB0YWJsZSByZWNvcmQgYW5kIGhlYWRlciBzdHJ1Y3RzIHBh
Y2tlZCB0byBkbyBjb3JyZWN0IGJ5dGUgdmFsdWUgc3VtLg0KPiBGaXggcmVjb3JkIGNyb3NzaW5n
IEVFUFJPTSBwYWdlIGJvdW5kcnkuDQo+IA0KPiB2NDoNCj4gRml4IGJ5dGUgc3VtIHZhbCBjYWxj
dWxhdGlvbiBmb3IgcmVjb3JkIC0gbG9vayBhdCBzaXplb2YocmVjb3JkKS4NCj4gRml4IHNvbWUg
c3R5bGUgY29tbWVudHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8
YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmggICAgICAgIHwgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgfCA0ODINCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJv
bS5oIHwgIDkwICsrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDU3NiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQ0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQo+IGluZGV4IDI4ZDc2YmQuLmYwMTZjZjEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlDQo+IEBAIC01NCw3ICs1NCw3IEBAIGFt
ZGdwdS15ICs9IGFtZGdwdV9kZXZpY2UubyBhbWRncHVfa21zLm8gXA0KPiAgCWFtZGdwdV9ndHRf
bWdyLm8gYW1kZ3B1X3ZyYW1fbWdyLm8gYW1kZ3B1X3ZpcnQubw0KPiBhbWRncHVfYXRvbWZpcm13
YXJlLm8gXA0KPiAgCWFtZGdwdV92Zl9lcnJvci5vIGFtZGdwdV9zY2hlZC5vIGFtZGdwdV9kZWJ1
Z2ZzLm8NCj4gYW1kZ3B1X2lkcy5vIFwNCj4gIAlhbWRncHVfZ21jLm8gYW1kZ3B1X3hnbWkubyBh
bWRncHVfY3NhLm8gYW1kZ3B1X3Jhcy5vDQo+IGFtZGdwdV92bV9jcHUubyBcDQo+IC0JYW1kZ3B1
X3ZtX3NkbWEubyBhbWRncHVfZGlzY292ZXJ5Lm8NCj4gKwlhbWRncHVfdm1fc2RtYS5vIGFtZGdw
dV9wbXUubyBhbWRncHVfZGlzY292ZXJ5Lm8NCj4gYW1kZ3B1X3Jhc19lZXByb20ubw0KPiANCj4g
IGFtZGdwdS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3BtdS5vDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+IGluZGV4IDI3NjVmMmQuLjhk
NWJjZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4g
QEAgLTI5LDYgKzI5LDcgQEANCj4gICNpbmNsdWRlICJhbWRncHUuaCINCj4gICNpbmNsdWRlICJh
bWRncHVfcHNwLmgiDQo+ICAjaW5jbHVkZSAidGFfcmFzX2lmLmgiDQo+ICsjaW5jbHVkZSAiYW1k
Z3B1X3Jhc19lZXByb20uaCINCj4gDQo+ICBlbnVtIGFtZGdwdV9yYXNfYmxvY2sgew0KPiAgCUFN
REdQVV9SQVNfQkxPQ0tfX1VNQyA9IDAsDQo+IEBAIC0zMzMsNiArMzM0LDggQEAgc3RydWN0IGFt
ZGdwdV9yYXMgew0KPiAgCXN0cnVjdCBtdXRleCByZWNvdmVyeV9sb2NrOw0KPiANCj4gIAl1aW50
MzJfdCBmbGFnczsNCj4gKw0KPiArCXN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sIGVl
cHJvbV9jb250cm9sOw0KPiAgfTsNCj4gDQo+ICBzdHJ1Y3QgcmFzX2ZzX2RhdGEgew0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uYmYwNzUxNQ0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9t
LmMNCj4gQEAgLTAsMCArMSw0ODIgQEANCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAxOSBBZHZh
bmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuDQo+ICsgKg0KPiArICogUGVybWlzc2lvbiBpcyBoZXJl
YnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24NCj4gK29idGFpbmluZyBh
DQo+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlv
biBmaWxlcyAodGhlDQo+ICsiU29mdHdhcmUiKSwNCj4gKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3
YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0DQo+ICtsaW1pdGF0aW9u
DQo+ICsgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwg
ZGlzdHJpYnV0ZSwNCj4gK3N1YmxpY2Vuc2UsDQo+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2Yg
dGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbQ0KPiArdGhlDQo+ICsg
KiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2lu
ZyBjb25kaXRpb25zOg0KPiArICoNCj4gKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFu
ZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlDQo+ICtpbmNsdWRlZCBpbg0KPiArICog
YWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuDQo+ICsg
Kg0KPiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFO
VFkgT0YgQU5ZIEtJTkQsDQo+ICtFWFBSRVNTIE9SDQo+ICsgKiBJTVBMSUVELCBJTkNMVURJTkcg
QlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GDQo+ICtNRVJDSEFOVEFCSUxJVFks
DQo+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VN
RU5ULiAgSU4gTk8NCj4gRVZFTlQNCj4gK1NIQUxMDQo+ICsgKiBUSEUgQ09QWVJJR0hUIEhPTERF
UihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sDQo+ICtEQU1BR0VTIE9S
DQo+ICsgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNU
LCBUT1JUIE9SDQo+ICtPVEhFUldJU0UsDQo+ICsgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJ
TiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SDQo+IFRIRSBVU0UNCj4gK09SDQo+ICsg
KiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuDQo+ICsgKg0KPiArICovDQo+ICsNCj4g
KyNpbmNsdWRlICJhbWRncHVfcmFzX2VlcHJvbS5oIg0KPiArI2luY2x1ZGUgImFtZGdwdS5oIg0K
PiArI2luY2x1ZGUgImFtZGdwdV9yYXMuaCINCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQo+
ICsNCj4gKyNkZWZpbmUgRUVQUk9NX0kyQ19UQVJHRVRfQUREUiAweEEwDQo+ICsNCj4gKyNkZWZp
bmUgRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFIDIwDQo+ICsjZGVmaW5lIEVFUFJPTV9UQUJMRV9S
RUNPUkRfU0laRSAyNA0KW1Rhb10gc2hvdWxkIHdlIHJlcGxhY2UgZml4ZWQgdmFsdWUgd2l0aCBz
aXplb2YgZm9yIHRoZSB0d28gbWFjcm9zPw0KDQo+ICsjZGVmaW5lIEVFUFJPTV9BRERSRVNTX1NJ
WkUgMHgyDQo+ICsNCj4gKy8qIFRhYmxlIGhkciBpcyAnQU1EUicgKi8NCj4gKyNkZWZpbmUgRUVQ
Uk9NX1RBQkxFX0hEUl9WQUwgMHg0MTRkNDQ1MiAjZGVmaW5lDQo+IEVFUFJPTV9UQUJMRV9WRVIN
Cj4gKzB4MDAwMTAwMDANCj4gKw0KPiArLyogQXNzdW1lIDIgTWJpdCBzaXplICovDQo+ICsjZGVm
aW5lIEVFUFJPTV9TSVpFX0JZVEVTIDI1NjAwMA0KPiArI2RlZmluZSBFRVBST01fUEFHRV9fU0la
RV9CWVRFUyAyNTYNCj4gKyNkZWZpbmUgRUVQUk9NX0hEUl9TVEFSVCAwDQo+ICsjZGVmaW5lIEVF
UFJPTV9SRUNPUkRfU1RBUlQgKEVFUFJPTV9IRFJfU1RBUlQgKw0KPiArRUVQUk9NX1RBQkxFX0hF
QURFUl9TSVpFKSAjZGVmaW5lIEVFUFJPTV9NQVhfUkVDT1JEX05VTQ0KPiArKChFRVBST01fU0la
RV9CWVRFUyAtIEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRSkgLw0KPiArRUVQUk9NX1RBQkxFX1JF
Q09SRF9TSVpFKSAjZGVmaW5lIEVFUFJPTV9BRERSX01TQl9NQVNLDQo+IEdFTk1BU0soMTcsIDgp
DQo+ICsNCj4gKyNkZWZpbmUgdG9fYW1kZ3B1X2RldmljZSh4KSAoY29udGFpbmVyX29mKHgsIHN0
cnVjdCBhbWRncHVfcmFzLA0KPiArZWVwcm9tX2NvbnRyb2wpKS0+YWRldg0KPiArDQo+ICtzdGF0
aWMgdm9pZCBfX2VuY29kZV90YWJsZV9oZWFkZXJfdG9fYnVmZihzdHJ1Y3QNCj4gYW1kZ3B1X3Jh
c19lZXByb21fdGFibGVfaGVhZGVyICpoZHIsDQo+ICsJCQkJCSAgdW5zaWduZWQgY2hhciAqYnVm
ZikNCj4gK3sNCj4gKwl1aW50MzJfdCAqcHAgPSAodWludDMyX3QgKikgYnVmZjsNCj4gKw0KPiAr
CXBwWzBdID0gY3B1X3RvX2xlMzIoaGRyLT5oZWFkZXIpOw0KPiArCXBwWzFdID0gY3B1X3RvX2xl
MzIoaGRyLT52ZXJzaW9uKTsNCj4gKwlwcFsyXSA9IGNwdV90b19sZTMyKGhkci0+Zmlyc3RfcmVj
X29mZnNldCk7DQo+ICsJcHBbM10gPSBjcHVfdG9fbGUzMihoZHItPnRibF9zaXplKTsNCj4gKwlw
cFs0XSA9IGNwdV90b19sZTMyKGhkci0+Y2hlY2tzdW0pOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMg
dm9pZCBfX2RlY29kZV90YWJsZV9oZWFkZXJfZnJvbV9idWZmKHN0cnVjdA0KPiBhbWRncHVfcmFz
X2VlcHJvbV90YWJsZV9oZWFkZXIgKmhkciwNCj4gKwkJCQkJICB1bnNpZ25lZCBjaGFyICpidWZm
KQ0KPiArew0KPiArCXVpbnQzMl90ICpwcCA9ICh1aW50MzJfdCAqKWJ1ZmY7DQo+ICsNCj4gKwlo
ZHItPmhlYWRlciAJICAgICAgPSBsZTMyX3RvX2NwdShwcFswXSk7DQo+ICsJaGRyLT52ZXJzaW9u
IAkgICAgICA9IGxlMzJfdG9fY3B1KHBwWzFdKTsNCj4gKwloZHItPmZpcnN0X3JlY19vZmZzZXQg
PSBsZTMyX3RvX2NwdShwcFsyXSk7DQo+ICsJaGRyLT50Ymxfc2l6ZSAJICAgICAgPSBsZTMyX3Rv
X2NwdShwcFszXSk7DQo+ICsJaGRyLT5jaGVja3N1bSAJICAgICAgPSBsZTMyX3RvX2NwdShwcFs0
XSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgX191cGRhdGVfdGFibGVfaGVhZGVyKHN0cnVj
dCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sDQo+ICpjb250cm9sLA0KPiArCQkJCSB1bnNpZ25l
ZCBjaGFyICpidWZmKQ0KPiArew0KPiArCWludCByZXQgPSAwOw0KPiArCXN0cnVjdCBpMmNfbXNn
IG1zZyA9IHsNCj4gKwkJCS5hZGRyCT0gRUVQUk9NX0kyQ19UQVJHRVRfQUREUiwNCj4gKwkJCS5m
bGFncwk9IDAsDQo+ICsJCQkubGVuCT0gRUVQUk9NX0FERFJFU1NfU0laRSArDQo+IEVFUFJPTV9U
QUJMRV9IRUFERVJfU0laRSwNCj4gKwkJCS5idWYJPSBidWZmLA0KPiArCX07DQo+ICsNCj4gKw0K
PiArCSoodWludDE2X3QgKilidWZmID0gRUVQUk9NX0hEUl9TVEFSVDsNCj4gKwlfX2VuY29kZV90
YWJsZV9oZWFkZXJfdG9fYnVmZigmY29udHJvbC0+dGJsX2hkciwgYnVmZiArDQo+ICtFRVBST01f
QUREUkVTU19TSVpFKTsNCj4gKw0KPiArCXJldCA9IGkyY190cmFuc2ZlcigmY29udHJvbC0+ZWVw
cm9tX2FjY2Vzc29yLCAmbXNnLCAxKTsNCj4gKwlpZiAocmV0IDwgMSkNCj4gKwkJRFJNX0VSUk9S
KCJGYWlsZWQgdG8gd3JpdGUgRUVQUk9NIHRhYmxlIGhlYWRlciwgcmV0OiVkIiwNCj4gcmV0KTsN
Cj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB1aW50MzJfdCAgX19j
YWxjX2hkcl9ieXRlX3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbA0KPiArKmNv
bnRyb2wpOw0KPiArDQo+ICtpbnQgYW1kZ3B1X3Jhc19lZXByb21faW5pdChzdHJ1Y3QgYW1kZ3B1
X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkNCj4gew0KPiArCWludCByZXQgPSAwOw0KPiAr
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsN
Cj4gKwl1bnNpZ25lZCBjaGFyIGJ1ZmZbRUVQUk9NX0FERFJFU1NfU0laRSArDQo+IEVFUFJPTV9U
QUJMRV9IRUFERVJfU0laRV0gPSB7IDAgfTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21f
dGFibGVfaGVhZGVyICpoZHIgPSAmY29udHJvbC0+dGJsX2hkcjsNCj4gKwlzdHJ1Y3QgaTJjX21z
ZyBtc2cgPSB7DQo+ICsJCQkuYWRkcgk9IEVFUFJPTV9JMkNfVEFSR0VUX0FERFIsDQo+ICsJCQku
ZmxhZ3MJPSBJMkNfTV9SRCwNCj4gKwkJCS5sZW4JPSBFRVBST01fQUREUkVTU19TSVpFICsNCj4g
RUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFLA0KPiArCQkJLmJ1Zgk9IGJ1ZmYsDQo+ICsJfTsNCj4g
Kw0KPiArCW11dGV4X2luaXQoJmNvbnRyb2wtPnRibF9tdXRleCk7DQo+ICsNCj4gKwlzd2l0Y2gg
KGFkZXYtPmFzaWNfdHlwZSkgew0KPiArCWNhc2UgQ0hJUF9WRUdBMjA6DQo+ICsJLypUT0RPIEFk
ZCBNSS02MCAqLw0KPiArCQlicmVhazsNCj4gKw0KPiArCWRlZmF1bHQ6DQo+ICsJCXJldHVybiAw
Ow0KPiArCX0NCj4gKw0KPiArCWlmIChyZXQpIHsNCj4gKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8g
aW5pdCBJMkMgY29udHJvbGxlciwgcmV0OiVkIiwgcmV0KTsNCj4gKwkJcmV0dXJuIHJldDsNCj4g
Kwl9DQo+ICsNCj4gKwkvKiBSZWFkL0NyZWF0ZSB0YWJsZSBoZWFkZXIgZnJvbSBFRVBST00gYWRk
cmVzcyAwICovDQo+ICsJcmV0ID0gaTJjX3RyYW5zZmVyKCZjb250cm9sLT5lZXByb21fYWNjZXNz
b3IsICZtc2csIDEpOw0KPiArCWlmIChyZXQgPCAxKSB7DQo+ICsJCURSTV9FUlJPUigiRmFpbGVk
IHRvIHJlYWQgRUVQUk9NIHRhYmxlIGhlYWRlciwgcmV0OiVkIiwNCj4gcmV0KTsNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwlfX2RlY29kZV90YWJsZV9oZWFkZXJfZnJvbV9idWZm
KGhkciwgJmJ1ZmZbMl0pOw0KPiArDQo+ICsJaWYgKGhkci0+aGVhZGVyID09IEVFUFJPTV9UQUJM
RV9IRFJfVkFMKSB7DQo+ICsJCWNvbnRyb2wtPm51bV9yZWNzID0gKGhkci0+dGJsX3NpemUgLQ0K
PiBFRVBST01fVEFCTEVfSEVBREVSX1NJWkUpIC8NCj4gKwkJCQkgICAgRUVQUk9NX1RBQkxFX1JF
Q09SRF9TSVpFOw0KPiArCQlEUk1fREVCVUdfRFJJVkVSKCJGb3VuZCBleGlzdGluZyBFRVBST00g
dGFibGUgd2l0aCAlZA0KPiByZWNvcmRzIiwNCj4gKwkJCQkgY29udHJvbC0+bnVtX3JlY3MpOw0K
PiArDQo+ICsJfSBlbHNlIHsNCj4gKwkJRFJNX0lORk8oIkNyZWF0aW5nIG5ldyBFRVBST00gdGFi
bGUiKTsNCj4gKw0KPiArCQloZHItPmhlYWRlciA9IEVFUFJPTV9UQUJMRV9IRFJfVkFMOw0KPiAr
CQloZHItPnZlcnNpb24gPSBFRVBST01fVEFCTEVfVkVSOw0KPiArCQloZHItPmZpcnN0X3JlY19v
ZmZzZXQgPSBFRVBST01fUkVDT1JEX1NUQVJUOw0KPiArCQloZHItPnRibF9zaXplID0gRUVQUk9N
X1RBQkxFX0hFQURFUl9TSVpFOw0KPiArDQo+ICsJCWFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21f
Y29udHJvbC50YmxfYnl0ZV9zdW0gPQ0KPiArCQkJCV9fY2FsY19oZHJfYnl0ZV9zdW0oJmFkZXYt
PnBzcC5yYXMucmFzLQ0KPiA+ZWVwcm9tX2NvbnRyb2wpOw0KPiArCQlyZXQgPSBfX3VwZGF0ZV90
YWJsZV9oZWFkZXIoY29udHJvbCwgYnVmZik7DQo+ICsJfQ0KPiArDQo+ICsJLyogU3RhcnQgaW5z
ZXJ0aW5nIHJlY29yZHMgZnJvbSBoZXJlICovDQo+ICsJYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJv
bV9jb250cm9sLm5leHRfYWRkciA9DQo+IEVFUFJPTV9SRUNPUkRfU1RBUlQ7DQo+ICsNCj4gKwly
ZXR1cm4gcmV0ID09IDEgPyAwIDogLUVJTzsNCj4gK30NCj4gKw0KPiArdm9pZCBhbWRncHVfcmFz
X2VlcHJvbV9maW5pKHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sDQo+ICpjb250cm9s
KQ0KPiArew0KPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2Rldmlj
ZShjb250cm9sKTsNCj4gKw0KPiArCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQo+ICsJY2Fz
ZSBDSElQX1ZFR0EyMDoNCj4gKwkJLypUT0RPIEFkZCBNSS02MCAqLw0KPiArCQlicmVhazsNCj4g
Kw0KPiArCWRlZmF1bHQ6DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIF9fZW5jb2RlX3RhYmxlX3JlY29yZF90b19idWZmKHN0cnVjdA0KPiBhbWRncHVfcmFz
X2VlcHJvbV9jb250cm9sICpjb250cm9sLA0KPiArCQkJCQkgIHN0cnVjdCBlZXByb21fdGFibGVf
cmVjb3JkICpyZWNvcmQsDQo+ICsJCQkJCSAgdW5zaWduZWQgY2hhciAqYnVmZikNCj4gK3sNCj4g
KwlfX2xlNjQgdG1wID0gMDsNCj4gKwlpbnQgaSA9IDA7DQo+ICsNCj4gKwkvKiBOZXh0IGFyZSBh
bGwgcmVjb3JkIGZpZWxkcyBhY2NvcmRpbmcgdG8gRUVQUk9NIHBhZ2Ugc3BlYyBpbiBMRQ0KPiBm
b3JhbXQgKi8NCj4gKwlidWZmW2krK10gPSByZWNvcmQtPmVycl90eXBlOw0KPiArDQo+ICsJYnVm
ZltpKytdID0gcmVjb3JkLT5iYW5rOw0KPiArDQo+ICsJdG1wID0gY3B1X3RvX2xlNjQocmVjb3Jk
LT50cyk7DQo+ICsJbWVtY3B5KGJ1ZmYgKyBpLCAmdG1wLCA4KTsNCj4gKwlpICs9IDg7DQpbVGFv
XSBJIHRoaW5rIHNpemVvZihyZWNvcmQtPnRzKSBpcyBiZXR0ZXINCg0KPiArDQo+ICsJdG1wID0g
Y3B1X3RvX2xlNjQoKHJlY29yZC0+b2Zmc2V0ICYgMHhmZmZmZmZmZmZmZmYpKTsNCltUYW9dICgw
eDFVTEwgPDwgNDkgLSAxKSBpcyBtb3JlIHJlYWRhYmxlIHRoYW4gJiAweGZmZmZmZmZmZmZmZiwg
b3IgYSBtYWNybyBjYW4gYmUgZGVmaW5lZCwgYnV0IGVpdGhlciB3YXkgaXMgT0suDQoNCj4gKwlt
ZW1jcHkoYnVmZiArIGksICZ0bXAsIDYpOw0KPiArCWkgKz0gNjsNCj4gKw0KPiArCWJ1ZmZbaSsr
XSA9IHJlY29yZC0+bWVtX2NoYW5uZWw7DQo+ICsJYnVmZltpKytdID0gcmVjb3JkLT5tY3VtY19p
ZDsNCj4gKw0KPiArCXRtcCA9IGNwdV90b19sZTY0KChyZWNvcmQtPnJldGlyZWRfcGFnZSAmIDB4
ZmZmZmZmZmZmZmZmKSk7DQo+ICsJbWVtY3B5KGJ1ZmYgKyBpLCAmdG1wLCA2KTsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIHZvaWQgX19kZWNvZGVfdGFibGVfcmVjb3JkX2Zyb21fYnVmZihzdHJ1Y3QN
Cj4gYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gKwkJCQkJICAgIHN0cnVj
dCBlZXByb21fdGFibGVfcmVjb3JkDQo+ICpyZWNvcmQsDQo+ICsJCQkJCSAgICB1bnNpZ25lZCBj
aGFyICpidWZmKQ0KPiArew0KPiArCV9fbGU2NCB0bXAgPSAwOw0KPiArCWludCBpID0gIDA7DQo+
ICsNCj4gKwkvKiBOZXh0IGFyZSBhbGwgcmVjb3JkIGZpZWxkcyBhY2NvcmRpbmcgdG8gRUVQUk9N
IHBhZ2Ugc3BlYyBpbiBMRQ0KPiBmb3JhbXQgKi8NCj4gKwlyZWNvcmQtPmVycl90eXBlID0gYnVm
ZltpKytdOw0KPiArDQo+ICsJcmVjb3JkLT5iYW5rID0gYnVmZltpKytdOw0KPiArDQo+ICsJbWVt
Y3B5KCZ0bXAsIGJ1ZmYgKyBpLCA4KTsNCj4gKwlyZWNvcmQtPnRzID0gbGU2NF90b19jcHUodG1w
KTsNCj4gKwlpICs9IDg7DQo+ICsNCj4gKwltZW1jcHkoJnRtcCwgYnVmZiArIGksIDYpOw0KPiAr
CXJlY29yZC0+b2Zmc2V0ID0gKGxlNjRfdG9fY3B1KHRtcCkgJiAweGZmZmZmZmZmZmZmZik7DQo+
ICsJaSArPSA2Ow0KPiArDQo+ICsJYnVmZltpKytdID0gcmVjb3JkLT5tZW1fY2hhbm5lbDsNCj4g
KwlidWZmW2krK10gPSByZWNvcmQtPm1jdW1jX2lkOw0KPiArDQo+ICsJbWVtY3B5KCZ0bXAsIGJ1
ZmYgKyBpLCAgNik7DQo+ICsJcmVjb3JkLT5yZXRpcmVkX3BhZ2UgPSAobGU2NF90b19jcHUodG1w
KSAmIDB4ZmZmZmZmZmZmZmZmKTsgfQ0KPiArDQo+ICsvKg0KPiArICogV2hlbiByZWFjaGluZyBl
bmQgb2YgRUVQUk9NIG1lbW9yeSBqdW1wIGJhY2sgdG8gMCByZWNvcmQgYWRkcmVzcw0KPiArICog
V2hlbiBuZXh0IHJlY29yZCBhY2Nlc3Mgd2lsbCBnbyBiZXlvbmQgRUVQUk9NIHBhZ2UgYm91bmRh
cnkgbW9kaWZ5DQo+ICtiaXRzIEExNy9BOA0KPiArICogaW4gSTJDIHNlbGVjdG9yIHRvIGdvIHRv
IG5leHQgcGFnZQ0KPiArICovDQo+ICtzdGF0aWMgdWludDMyX3QgX19jb3JyZWN0X2VlcHJvbV9k
ZXN0X2FkZHJlc3ModWludDMyX3QgY3Vycl9hZGRyZXNzKSB7DQo+ICsJdWludDMyX3QgbmV4dF9h
ZGRyZXNzID0gY3Vycl9hZGRyZXNzICsNCj4gRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFOw0KPiAr
DQo+ICsJLyogV2hlbiBhbGwgRUVQUk9NIG1lbW9yeSB1c2VkIGp1bXAgYmFjayB0byAwIGFkZHJl
c3MgKi8NCj4gKwlpZiAobmV4dF9hZGRyZXNzID4gRUVQUk9NX1NJWkVfQllURVMpIHsNCj4gKwkJ
RFJNX0lORk8oIlJlYWNoZWQgZW5kIG9mIEVFUFJPTSBtZW1vcnksIGp1bXBpbmcgdG8gMA0KPiAi
DQo+ICsJCQkgImFuZCBvdmVycmlkaW5nIG9sZCByZWNvcmQiKTsNCj4gKwkJcmV0dXJuIEVFUFJP
TV9SRUNPUkRfU1RBUlQ7DQo+ICsJfQ0KPiArDQo+ICsJLyoNCj4gKwkgKiBUbyBjaGVjayBpZiB3
ZSBvdmVyZmxvdyBwYWdlIGJvdW5kYXJ5ICBjb21wYXJlIG5leHQgYWRkcmVzcw0KPiB3aXRoDQo+
ICsJICogY3VycmVudCBhbmQgc2VlIGlmIGJpdHMgMTcvOCBvZiB0aGUgRUVQUk9NIGFkZHJlc3Mg
d2lsbCBjaGFuZ2UNCj4gKwkgKiBJZiB0aGV5IGRvIHN0YXJ0IGZyb20gdGhlIG5leHQgMjU2YiBw
YWdlDQo+ICsJICoNCj4gKwkgKiBodHRwczovL3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vZGF0YXNo
ZWV0L20yNG0wMi1kci5wZGYgc2VjLg0KPiA1LjEuMg0KPiArCSAqLw0KPiArCWlmICgoY3Vycl9h
ZGRyZXNzICYgRUVQUk9NX0FERFJfTVNCX01BU0spICE9IChuZXh0X2FkZHJlc3MgJg0KPiBFRVBS
T01fQUREUl9NU0JfTUFTSykpIHsNCj4gKwkJRFJNX0RFQlVHX0RSSVZFUigiUmVhY2hlZCBlbmQg
b2YgRUVQUk9NIG1lbW9yeQ0KPiBwYWdlLCBqdW1waW1uZyB0byBuZXh0OiAlbHgiLA0KPiArCQkJ
CShuZXh0X2FkZHJlc3MgJg0KPiBFRVBST01fQUREUl9NU0JfTUFTSykpOw0KPiArDQo+ICsJCXJl
dHVybiAgKG5leHRfYWRkcmVzcyAmIEVFUFJPTV9BRERSX01TQl9NQVNLKTsNCj4gKwl9DQo+ICsN
Cj4gKwlyZXR1cm4gY3Vycl9hZGRyZXNzOw0KPiArfQ0KPiArDQo+ICsNCj4gK3N0YXRpYyB1aW50
MzJfdCAgX19jYWxjX2hkcl9ieXRlX3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJv
bA0KPiArKmNvbnRyb2wpIHsNCj4gKwlpbnQgaTsNCj4gKwl1aW50MzJfdCB0Ymxfc3VtID0gMDsN
Cj4gKw0KPiArCS8qIEhlYWRlciBjaGVja3N1bSwgc2tpcCBjaGVja3N1bSBmaWVsZCBpbiB0aGUg
Y2FsY3VsYXRpb24gKi8NCj4gKwlmb3IgKGkgPSAwOyBpIDwgc2l6ZW9mKGNvbnRyb2wtPnRibF9o
ZHIpIC0gc2l6ZW9mKGNvbnRyb2wtDQo+ID50YmxfaGRyLmNoZWNrc3VtKTsgaSsrKQ0KPiArCQl0
Ymxfc3VtICs9ICooKCh1bnNpZ25lZCBjaGFyICopJmNvbnRyb2wtPnRibF9oZHIpICsgaSk7DQo+
ICsNCj4gKwlyZXR1cm4gdGJsX3N1bTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHVpbnQzMl90ICBf
X2NhbGNfcmVjc19ieXRlX3N1bShzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywN
Cj4gKwkJCQkgICAgICBpbnQgbnVtKQ0KPiArew0KPiArCWludCBpLCBqOw0KPiArCXVpbnQzMl90
IHRibF9zdW0gPSAwOw0KPiArDQo+ICsJLyogUmVjb3JkcyBjaGVja3N1bSAqLw0KPiArCWZvciAo
aSA9IDA7IGkgPCBudW07IGkrKykgew0KPiArCQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAq
cmVjb3JkID0gJnJlY29yZHNbaV07DQo+ICsNCj4gKwkJZm9yIChqID0gMDsgaiA8IHNpemVvZigq
cmVjb3JkKTsgaisrKSB7DQo+ICsJCQl0Ymxfc3VtICs9ICooKCh1bnNpZ25lZCBjaGFyICopcmVj
b3JkKSArIGopOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHRibF9zdW07DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgIF9fY2FsY190YmxfYnl0ZV9zdW0oc3Ry
dWN0DQo+IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wsDQo+ICsJCQkJICBzdHJ1
Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywgaW50DQo+IG51bSkgew0KPiArCXJldHVy
biBfX2NhbGNfaGRyX2J5dGVfc3VtKGNvbnRyb2wpICsNCj4gX19jYWxjX3JlY3NfYnl0ZV9zdW0o
cmVjb3JkcywNCj4gK251bSk7IH0NCj4gKw0KPiArLyogQ2hlY2tzdW0gPSAyNTYgLSgoc3VtIG9m
IGFsbCB0YWJsZSBlbnRyaWVzKSBtb2QgMjU2KcKgKi8gc3RhdGljIHZvaWQNCj4gK19fdXBkYXRl
X3RibF9jaGVja3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwN
Cj4gKwkJCQkgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmRzLCBpbnQNCj4gbnVt
LA0KPiArCQkJCSAgdWludDMyX3Qgb2xkX2hkcl9ieXRlX3N1bSkNCj4gK3sNCj4gKwkvKg0KPiAr
CSAqIFRoaXMgd2lsbCB1cGRhdGUgdGhlIHRhYmxlIHN1bSB3aXRoIG5ldyByZWNvcmRzLg0KPiAr
CSAqDQo+ICsJICogVE9ETzogV2hhdCBoYXBwZW5zIHdoZW4gdGhlIEVFUFJPTSB0YWJsZSBpcyB0
byBiZSB3cmFwcGVkDQo+IGFyb3VuZA0KPiArCSAqIGFuZCBvbGQgcmVjb3JkcyBmcm9tIHN0YXJ0
IHdpbGwgZ2V0IG92ZXJyaWRkZW4uDQo+ICsJICovDQo+ICsNCj4gKwkvKiBuZWVkIHRvIHJlY2Fs
Y3VsYXRlIHVwZGF0ZWQgaGVhZGVyIGJ5dGUgc3VtICovDQo+ICsJY29udHJvbC0+dGJsX2J5dGVf
c3VtIC09IG9sZF9oZHJfYnl0ZV9zdW07DQo+ICsJY29udHJvbC0+dGJsX2J5dGVfc3VtICs9IF9f
Y2FsY190YmxfYnl0ZV9zdW0oY29udHJvbCwgcmVjb3JkcywNCj4gbnVtKTsNCj4gKw0KPiArCWNv
bnRyb2wtPnRibF9oZHIuY2hlY2tzdW0gPSAyNTYgLSAoY29udHJvbC0+dGJsX2J5dGVfc3VtICUg
MjU2KTsgfQ0KW1Rhb10gd2UgY2FuIGNoYW5nZSAyNTYgdG8gRUVQUk9NX1BBR0VfX1NJWkVfQllU
RVMNCg0KPiArDQo+ICsvKiB0YWJsZSBzdW0gbW9kIDI1NiArIGNoZWNrc3VtIG11c3QgZXF1YWxz
IDI1NiAqLyBzdGF0aWMgYm9vbA0KPiArX192YWxpZGF0ZV90YmxfY2hlY2tzdW0oc3RydWN0IGFt
ZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wsDQo+ICsJCQkgICAgc3RydWN0IGVlcHJv
bV90YWJsZV9yZWNvcmQgKnJlY29yZHMsIGludCBudW0pIHsNCj4gKwljb250cm9sLT50YmxfYnl0
ZV9zdW0gPSBfX2NhbGNfdGJsX2J5dGVfc3VtKGNvbnRyb2wsIHJlY29yZHMsIG51bSk7DQo+ICsN
Cj4gKwlpZiAoY29udHJvbC0+dGJsX2hkci5jaGVja3N1bSArIChjb250cm9sLT50YmxfYnl0ZV9z
dW0gJSAyNTYpICE9IDI1NikNCj4gew0KPiArCQlEUk1fV0FSTigiQ2hlY2tzdW0gbWlzbWF0Y2gs
IGNoZWNrc3VtOiAldSAiLCBjb250cm9sLQ0KPiA+dGJsX2hkci5jaGVja3N1bSk7DQo+ICsJCXJl
dHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiAr
aW50IGFtZGdwdV9yYXNfZWVwcm9tX3Byb2Nlc3NfcmVjb2RzKHN0cnVjdA0KPiBhbWRncHVfcmFz
X2VlcHJvbV9jb250cm9sICpjb250cm9sLA0KPiArCQkJCQkgICAgc3RydWN0IGVlcHJvbV90YWJs
ZV9yZWNvcmQNCj4gKnJlY29yZHMsDQo+ICsJCQkJCSAgICBib29sIHdyaXRlLA0KPiArCQkJCQkg
ICAgaW50IG51bSkNCj4gK3sNCj4gKwlpbnQgaSwgcmV0ID0gMDsNCj4gKwlzdHJ1Y3QgaTJjX21z
ZyAqbXNnczsNCj4gKwl1bnNpZ25lZCBjaGFyICpidWZmczsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IHRvX2FtZGdwdV9kZXZpY2UoY29udHJvbCk7DQo+ICsNCj4gKwlpZiAoYWRl
di0+YXNpY190eXBlICE9IENISVBfVkVHQTIwKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiArCWJ1
ZmZzID0ga2NhbGxvYyhudW0sIEVFUFJPTV9BRERSRVNTX1NJWkUgKw0KPiBFRVBST01fVEFCTEVf
UkVDT1JEX1NJWkUsDQo+ICsJCQkgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFidWZmcykNCj4gKwkJ
cmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwltdXRleF9sb2NrKCZjb250cm9sLT50YmxfbXV0ZXgp
Ow0KPiArDQo+ICsJbXNncyA9IGtjYWxsb2MobnVtLCBzaXplb2YoKm1zZ3MpLCBHRlBfS0VSTkVM
KTsNCj4gKwlpZiAoIW1zZ3MpIHsNCj4gKwkJcmV0ID0gLUVOT01FTTsNCj4gKwkJZ290byBmcmVl
X2J1ZmY7DQo+ICsJfQ0KPiArDQo+ICsJLyogSW4gY2FzZSBvZiBvdmVyZmxvdyBqdXN0IHN0YXJ0
IGZyb20gYmVnaW5uaW5nIHRvIG5vdCBsb3NlIG5ld2VzdA0KPiByZWNvcmRzICovDQo+ICsJaWYg
KHdyaXRlICYmIChjb250cm9sLT5uZXh0X2FkZHIgKyBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkUg
Kg0KPiBudW0gPiBFRVBST01fU0laRV9CWVRFUykpDQo+ICsJCWNvbnRyb2wtPm5leHRfYWRkciA9
IEVFUFJPTV9SRUNPUkRfU1RBUlQ7DQo+ICsNCj4gKw0KPiArCS8qDQo+ICsJICogVE9ETyBDdXJy
ZW50bHkgbWFrZXMgRUVQUk9NIHdyaXRlcyBmb3IgZWFjaCByZWNvcmQsIHRoaXMNCj4gY3JlYXRl
cw0KPiArCSAqIGludGVybmFsIGZyYWdtZW50YXRpb24uIE9wdGltaXplZCB0aGUgY29kZSB0byBk
byBmdWxsIHBhZ2Ugd3JpdGUgb2YNCj4gKwkgKiAyNTZiDQo+ICsJICovDQo+ICsJZm9yIChpID0g
MDsgaSA8IG51bTsgaSsrKSB7DQo+ICsJCXVuc2lnbmVkIGNoYXIgKmJ1ZmYgPSAmYnVmZnNbaSoo
RUVQUk9NX0FERFJFU1NfU0laRSArDQo+IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSldOw0KPiAr
CQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkID0gJnJlY29yZHNbaV07DQo+ICsJ
CXN0cnVjdCBpMmNfbXNnICptc2cgPSAmbXNnc1tpXTsNCj4gKw0KPiArCQljb250cm9sLT5uZXh0
X2FkZHIgPQ0KPiArX19jb3JyZWN0X2VlcHJvbV9kZXN0X2FkZHJlc3MoY29udHJvbC0+bmV4dF9h
ZGRyKTsNCj4gKw0KPiArCQkvKg0KPiArCQkgKiBVcGRhdGUgYml0cyAxNiwxNyBvZiBFRVBST00g
YWRkcmVzcyBpbiBJMkMgYWRkcmVzcyBieQ0KPiBzZXR0aW5nIHRoZW0NCj4gKwkJICogdG8gYml0
cyAxLDIgb2YgRGV2aWNlIGFkZHJlc3MgYnl0ZQ0KPiArCQkgKi8NCj4gKwkJbXNnLT5hZGRyID0g
RUVQUk9NX0kyQ19UQVJHRVRfQUREUiB8DQo+ICsJCQkgICAgICAgKChjb250cm9sLT5uZXh0X2Fk
ZHIgJg0KPiBFRVBST01fQUREUl9NU0JfTUFTSykgPj4gMTUpOw0KPiArCQltc2ctPmZsYWdzCT0g
d3JpdGUgPyAwIDogSTJDX01fUkQ7DQo+ICsJCW1zZy0+bGVuCT0gRUVQUk9NX0FERFJFU1NfU0la
RSArDQo+IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRTsNCj4gKwkJbXNnLT5idWYJPSBidWZmOw0K
PiArDQo+ICsJCS8qIEluc2VydCB0aGUgRUVQUk9NIGRlc3QgYWRkZXNzLCBiaXRzIDAtMTUgKi8N
Cj4gKwkJYnVmZlswXSA9ICgoY29udHJvbC0+bmV4dF9hZGRyID4+IDgpICYgMHhmZik7DQo+ICsJ
CWJ1ZmZbMV0gPSAoY29udHJvbC0+bmV4dF9hZGRyICYgMHhmZik7DQo+ICsNCj4gKwkJLyogRUVQ
Uk9NIHRhYmxlIGNvbnRlbnQgaXMgc3RvcmVkIGluIExFIGZvcm1hdCAqLw0KPiArCQlpZiAod3Jp
dGUpDQo+ICsJCQlfX2VuY29kZV90YWJsZV9yZWNvcmRfdG9fYnVmZihjb250cm9sLCByZWNvcmQs
IGJ1ZmYNCj4gKw0KPiArRUVQUk9NX0FERFJFU1NfU0laRSk7DQo+ICsNCj4gKwkJLyoNCj4gKwkJ
ICogVGhlIGRlc3RpbmF0aW9uIEVFUFJPTSBhZGRyZXNzIG1pZ2h0IG5lZWQgdG8gYmUNCj4gY29y
cmVjdGVkIHRvIGFjY291bnQNCj4gKwkJICogZm9yIHBhZ2Ugb3IgZW50aXJlIG1lbW9yeSB3cmFw
cGluZw0KPiArCQkgKi8NCj4gKwkJY29udHJvbC0+bmV4dF9hZGRyICs9IEVFUFJPTV9UQUJMRV9S
RUNPUkRfU0laRTsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSBpMmNfdHJhbnNmZXIoJmNvbnRyb2wt
PmVlcHJvbV9hY2Nlc3NvciwgbXNncywgbnVtKTsNCj4gKwlpZiAocmV0IDwgMSkgew0KPiArCQlE
Uk1fRVJST1IoIkZhaWxlZCB0byBwcm9jZXNzIEVFUFJPTSB0YWJsZSByZWNvcmRzLA0KPiByZXQ6
JWQiLCByZXQpOw0KPiArDQo+ICsJCS8qIFRPRE8gUmVzdG9yZSBwcmV2IG5leHQgRUVQUk9NIGFk
ZHJlc3MgPyAqLw0KPiArCQlnb3RvIGZyZWVfbXNnczsNCj4gKwl9DQo+ICsNCj4gKw0KPiArCWlm
ICghd3JpdGUpIHsNCj4gKwkJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7DQo+ICsJCQl1bnNp
Z25lZCBjaGFyICpidWZmID0NCj4gJmJ1ZmZzW2kqKEVFUFJPTV9BRERSRVNTX1NJWkUgKyBFRVBS
T01fVEFCTEVfUkVDT1JEX1NJWkUpXTsNCltUYW9dIHNwYWNlIGlzIG5lZWRlZCBiZWZvcmUgYW5k
IGFmdGVyICIqIg0KDQo+ICsJCQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkID0g
JnJlY29yZHNbaV07DQpbVGFvXSBhZGQgYSBzcGFjZSBhZnRlciAiKiINCg0KPiArDQo+ICsJCQlf
X2RlY29kZV90YWJsZV9yZWNvcmRfZnJvbV9idWZmKGNvbnRyb2wsIHJlY29yZCwNCj4gYnVmZiAr
IEVFUFJPTV9BRERSRVNTX1NJWkUpOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHdyaXRl
KSB7DQo+ICsJCXVpbnQzMl90IG9sZF9oZHJfYnl0ZV9zdW0gPSBfX2NhbGNfaGRyX2J5dGVfc3Vt
KGNvbnRyb2wpOw0KPiArDQo+ICsJCS8qDQo+ICsJCSAqIFVwZGF0ZSB0YWJsZSBoZWFkZXIgd2l0
aCBzaXplIGFuZCBDUkMgYW5kIGFjY291bnQgZm9yDQo+IHRhYmxlDQo+ICsJCSAqIHdyYXAgYXJv
dW5kIHdoZXJlIHRoZSBhc3N1bXB0aW9uIGlzIHRoYXQgd2UgdHJlYXQgaXQgYXMNCj4gZW1wdHkN
Cj4gKwkJICogdGFibGUNCj4gKwkJICoNCj4gKwkJICogVE9ETyAtIENoZWNrIHRoZSBhc3N1bXB0
aW9uIGlzIGNvcnJlY3QNCj4gKwkJICovDQo+ICsJCWNvbnRyb2wtPm51bV9yZWNzICs9IG51bTsN
Cj4gKwkJY29udHJvbC0+bnVtX3JlY3MgJT0gRUVQUk9NX01BWF9SRUNPUkRfTlVNOw0KPiArCQlj
b250cm9sLT50YmxfaGRyLnRibF9zaXplICs9IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSAqDQo+
IG51bTsNCj4gKwkJaWYgKGNvbnRyb2wtPnRibF9oZHIudGJsX3NpemUgPiBFRVBST01fU0laRV9C
WVRFUykNCj4gKwkJCWNvbnRyb2wtPnRibF9oZHIudGJsX3NpemUgPQ0KPiBFRVBST01fVEFCTEVf
SEVBREVSX1NJWkUgKw0KPiArCQkJY29udHJvbC0+bnVtX3JlY3MgKiBFRVBST01fVEFCTEVfUkVD
T1JEX1NJWkU7DQo+ICsNCj4gKwkJX191cGRhdGVfdGJsX2NoZWNrc3VtKGNvbnRyb2wsIHJlY29y
ZHMsIG51bSwNCj4gb2xkX2hkcl9ieXRlX3N1bSk7DQo+ICsNCj4gKwkJX191cGRhdGVfdGFibGVf
aGVhZGVyKGNvbnRyb2wsIGJ1ZmZzKTsNCj4gKwl9IGVsc2UgaWYgKCFfX3ZhbGlkYXRlX3RibF9j
aGVja3N1bShjb250cm9sLCByZWNvcmRzLCBudW0pKSB7DQo+ICsJCURSTV9XQVJOKCJFRVBST00g
VGFibGUgY2hlY2tzdW0gbWlzbWF0Y2ghIik7DQo+ICsJCS8qIFRPRE8gVW5jb21tZW50IHdoZW4g
RUVQUk9NIHJlYWQvd3JpdGUgaXMgcmVsbGlhYmxlDQo+ICovDQo+ICsJCS8qIHJldCA9IC1FSU87
ICovDQo+ICsJfQ0KPiArDQo+ICtmcmVlX21zZ3M6DQo+ICsJa2ZyZWUobXNncyk7DQo+ICsNCj4g
K2ZyZWVfYnVmZjoNCj4gKwlrZnJlZShidWZmcyk7DQo+ICsNCj4gKwltdXRleF91bmxvY2soJmNv
bnRyb2wtPnRibF9tdXRleCk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0ID09IG51bSA/IDAgOiAtRUlP
Ow0KPiArfQ0KPiArDQo+ICt2b2lkIGFtZGdwdV9yYXNfZWVwcm9tX3Rlc3Qoc3RydWN0IGFtZGdw
dV9yYXNfZWVwcm9tX2NvbnRyb2wNCj4gKmNvbnRyb2wpDQo+ICt7DQo+ICsJaW50IGk7DQo+ICsJ
c3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQgKnJlY3MgPSBrY2FsbG9jKDEsIHNpemVvZigqcmVj
cyksDQo+ICtHRlBfS0VSTkVMKTsNCj4gKw0KPiArCWlmICghcmVjcykNCj4gKwkJcmV0dXJuOw0K
PiArDQo+ICsJZm9yIChpID0gMDsgaSA8IDEgOyBpKyspIHsNCj4gKwkJcmVjc1tpXS5hZGRyZXNz
ID0gMHhkZWFkYmVlZjsNCj4gKwkJcmVjc1tpXS5yZXRpcmVkX3BhZ2UgPSBpOw0KPiArCX0NCj4g
Kw0KPiArCWlmICghYW1kZ3B1X3Jhc19lZXByb21fcHJvY2Vzc19yZWNvZHMoY29udHJvbCwgcmVj
cywgdHJ1ZSwgMSkpIHsNCj4gKw0KPiArCQltZW1zZXQocmVjcywgMCwgc2l6ZW9mKCpyZWNzKSAq
IDEpOw0KPiArDQo+ICsJCWNvbnRyb2wtPm5leHRfYWRkciA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7
DQo+ICsNCj4gKwkJaWYgKCFhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3JlY29kcyhjb250cm9s
LCByZWNzLCBmYWxzZSwNCj4gMSkpIHsNCj4gKwkJCWZvciAoaSA9IDA7IGkgPCAxOyBpKyspDQo+
ICsJCQkJRFJNX0lORk8oInJlYy5hZGRyZXNzIDoweCVsbHgsDQo+IHJlYy5yZXRpcmVkX3BhZ2Ug
OiVsbHUiLA0KPiArCQkJCQkgcmVjc1tpXS5hZGRyZXNzLCByZWNzW2ldLnJldGlyZWRfcGFnZSk7
DQo+ICsJCX0gZWxzZQ0KPiArCQkJRFJNX0VSUk9SKCJGYWlsZWQgaW4gcmVhZGluZyBmcm9tIHRh
YmxlIik7DQo+ICsNCj4gKwl9IGVsc2UNCj4gKwkJRFJNX0VSUk9SKCJGYWlsZWQgaW4gd3JpdGlu
ZyB0byB0YWJsZSIpOyB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzX2VlcHJvbS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhc19lZXByb20uaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
Li40MWYzZmNiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaA0KPiBAQCAtMCwwICsxLDkwIEBADQo+ICsvKg0KPiAr
ICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLg0KPiArICoNCj4g
KyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkg
cGVyc29uDQo+ICtvYnRhaW5pbmcgYQ0KPiArICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBh
c3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZQ0KPiArIlNvZnR3YXJlIiksDQo+ICsg
KiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcg
d2l0aG91dA0KPiArbGltaXRhdGlvbg0KPiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1v
ZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsDQo+ICtzdWJsaWNlbnNlLA0KPiArICog
YW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25z
IHRvIHdob20NCj4gK3RoZQ0KPiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBz
dWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoNCj4gKyAqDQo+ICsgKiBUaGUgYWJv
dmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZQ0K
PiAraW5jbHVkZWQgaW4NCj4gKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMg
b2YgdGhlIFNvZnR3YXJlLg0KPiArICoNCj4gKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAi
QVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELA0KPiArRVhQUkVTUyBPUg0KPiAr
ICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBP
Rg0KPiArTUVSQ0hBTlRBQklMSVRZLA0KPiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PDQo+IEVWRU5UDQo+ICtTSEFMTA0KPiAr
ICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5Z
IENMQUlNLA0KPiArREFNQUdFUyBPUg0KPiArICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElO
IEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUg0KPiArT1RIRVJXSVNFLA0KPiArICogQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUg0K
PiBUSEUgVVNFDQo+ICtPUg0KPiArICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0K
PiArICoNCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9BTURHUFVfUkFTX0VFUFJPTV9IDQo+ICsj
ZGVmaW5lIF9BTURHUFVfUkFTX0VFUFJPTV9IDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9pMmMu
aD4NCj4gKw0KPiArc3RydWN0IGFtZGdwdV9kZXZpY2U7DQo+ICsNCj4gK2VudW0gYW1kZ3B1X3Jh
c19lZXByb21fZXJyX3R5cGV7DQo+ICsJQU1ER1BVX1JBU19FRVBST01fRVJSX1BMQUNFX0hPTERF
UiwNCj4gKwlBTURHUFVfUkFTX0VFUFJPTV9FUlJfUkVDT1ZFUkFCTEUsDQo+ICsJQU1ER1BVX1JB
U19FRVBST01fRVJSX05PTl9SRUNPVkVSQUJMRQ0KPiArfTsNCj4gKw0KPiArc3RydWN0IGFtZGdw
dV9yYXNfZWVwcm9tX3RhYmxlX2hlYWRlciB7DQo+ICsJdWludDMyX3QgaGVhZGVyOw0KPiArCXVp
bnQzMl90IHZlcnNpb247DQo+ICsJdWludDMyX3QgZmlyc3RfcmVjX29mZnNldDsNCj4gKwl1aW50
MzJfdCB0Ymxfc2l6ZTsNCj4gKwl1aW50MzJfdCBjaGVja3N1bTsNCj4gK31fX2F0dHJpYnV0ZV9f
KChfX3BhY2tlZF9fKSk7DQo+ICsNCj4gK3N0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9s
IHsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fdGFibGVfaGVhZGVyIHRibF9oZHI7DQo+
ICsJc3RydWN0IGkyY19hZGFwdGVyIGVlcHJvbV9hY2Nlc3NvcjsNCj4gKwl1aW50MzJfdCBuZXh0
X2FkZHI7DQo+ICsJdW5zaWduZWQgaW50IG51bV9yZWNzOw0KPiArCXN0cnVjdCBtdXRleCB0Ymxf
bXV0ZXg7DQo+ICsJYm9vbCBidXNfbG9ja2VkOw0KPiArCXVpbnQzMl90IHRibF9ieXRlX3N1bTsN
Cj4gK307DQo+ICsNCj4gKy8qDQo+ICsgKiBSZXByZXNlbnRzIHNpbmdsZSB0YWJsZSByZWNvcmQu
IFBhY2tlZCB0byBiZSBlYXNpbHkgc2VyaWFsaXplZCBpbnRvDQo+ICtieXRlDQo+ICsgKiBzdHJl
YW0uDQo+ICsgKi8NCj4gK3N0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkIHsNCj4gKw0KPiArCXVu
aW9uIHsNCj4gKwkJdWludDY0X3QgYWRkcmVzczsNCj4gKwkJdWludDY0X3Qgb2Zmc2V0Ow0KPiAr
CX07DQo+ICsNCj4gKwl1aW50NjRfdCByZXRpcmVkX3BhZ2U7DQo+ICsJdWludDY0X3QgdHM7DQo+
ICsNCj4gKwllbnVtIGFtZGdwdV9yYXNfZWVwcm9tX2Vycl90eXBlIGVycl90eXBlOw0KPiArDQo+
ICsJdW5pb24gew0KPiArCQl1bnNpZ25lZCBjaGFyIGJhbms7DQo+ICsJCXVuc2lnbmVkIGNoYXIg
Y3U7DQo+ICsJfTsNCj4gKw0KPiArCXVuc2lnbmVkIGNoYXIgbWVtX2NoYW5uZWw7DQo+ICsJdW5z
aWduZWQgY2hhciBtY3VtY19pZDsNCj4gK31fX2F0dHJpYnV0ZV9fKChfX3BhY2tlZF9fKSk7DQo+
ICsNCj4gK2ludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJv
bV9jb250cm9sICpjb250cm9sKTsNCj4gK3ZvaWQgYW1kZ3B1X3Jhc19lZXByb21fZmluaShzdHJ1
Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbA0KPiAqY29udHJvbCk7DQo+ICsNCj4gK2ludCBh
bWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3JlY29kcyhzdHJ1Y3QNCj4gYW1kZ3B1X3Jhc19lZXBy
b21fY29udHJvbCAqY29udHJvbCwNCj4gKwkJCQkJICAgIHN0cnVjdCBlZXByb21fdGFibGVfcmVj
b3JkDQo+ICpyZWNvcmRzLA0KPiArCQkJCQkgICAgYm9vbCB3cml0ZSwNCj4gKwkJCQkJICAgIGlu
dCBudW0pOw0KPiArDQo+ICt2b2lkIGFtZGdwdV9yYXNfZWVwcm9tX3Rlc3Qoc3RydWN0IGFtZGdw
dV9yYXNfZWVwcm9tX2NvbnRyb2wNCj4gKmNvbnRyb2wpOw0KPiArDQo+ICsjZW5kaWYgLy8gX0FN
REdQVV9SQVNfRUVQUk9NX0gNCj4gLS0NCj4gMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
