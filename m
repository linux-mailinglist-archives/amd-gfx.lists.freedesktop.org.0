Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E1271EA
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 23:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0289C84;
	Wed, 22 May 2019 21:49:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A3289C84
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 21:49:52 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2908.namprd12.prod.outlook.com (20.179.71.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 21:49:51 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Wed, 22 May 2019
 21:49:51 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/amdgpu: Add function to add/remove gws to kfd
 process
Thread-Topic: [PATCH 4/7] drm/amdgpu: Add function to add/remove gws to kfd
 process
Thread-Index: AQHVELY+cX1sKpHUJEKWOcQ4TGoxKKZ3ryGA
Date: Wed, 22 May 2019 21:49:51 +0000
Message-ID: <83c7aeac-2974-0b58-8c5b-a03309cebeca@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
 <1558540278-23734-4-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-4-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83ca4589-e743-4b95-be9c-08d6deff6aed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2908; 
x-ms-traffictypediagnostic: DM6PR12MB2908:
x-microsoft-antispam-prvs: <DM6PR12MB29083BEE71F237AB7244305C92000@DM6PR12MB2908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(396003)(136003)(376002)(189003)(199004)(71200400001)(99286004)(186003)(76176011)(71190400001)(316002)(36756003)(52116002)(14444005)(486006)(256004)(31686004)(26005)(72206003)(14454004)(102836004)(2616005)(11346002)(446003)(65956001)(65806001)(6512007)(66066001)(386003)(53546011)(6506007)(476003)(86362001)(31696002)(68736007)(478600001)(7736002)(305945005)(25786009)(6436002)(66946007)(73956011)(6486002)(4326008)(3846002)(6116002)(229853002)(6246003)(53936002)(65826007)(2501003)(110136005)(66476007)(2906002)(66556008)(64756008)(5660300002)(58126008)(8936002)(81166006)(81156014)(66446008)(64126003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2908;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yS5PQM6RRpb+aFsFgmFWwMpmqTtJ2ImSvRjv8lMC7rVuhBlHistkGtVQ7Bc9gmKLdUlE/FU9AuEiLVQmiWvxSPAgYMeHDTrv4xjWQOzSJ3rT714rTYX9xR096yYMOHjejcapl8swK2Ke5pKY2PdfpL4ERxO93c+NhiMP+EyvDn8km2Yvx2PjPXxufiRFEEc6Ck06Dq+NM8Qbdc3yv+8ndHdI7ysfjvdgho7mz8cWYxA0AlLCbRSAUNYgO0hPz2dx/BlI4ZwdOfmWdfDXbxT4kyBR4Z7ppYsXfR6gypc7Hstyb8zYzQaGtI+O3JXoLGIQzLaxCzy8MbzO5t9Qm2Cl6WdwbLjuZZBrvjh+fPT+OIHjtRqMRfRpDGFqf/Xx0E02qG4zTonIXJd8nhD2HAuPgGqH1WpUpSmxwMRJoVCF50U=
Content-ID: <CB00674A15757D4CB0F2837F994A0C9D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ca4589-e743-4b95-be9c-08d6deff6aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 21:49:51.4008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcCT/gvOz1r6g2ns6YQkkGndWiO0gKX296Qi/YHsXYA=;
 b=UrZDom4NMHc7Vq9fZWby2S9SHs5hvSGVuYuxjLqGoS6gokMljRV9gcnurPPSgsXevVRVb5ST9228Qs92QvYkaZuWsiISsKEdBrOuEbB9GcazB3DedWdK4Hd1Yf2pwbANb1k3FzcFxCiNtuaf7HfBN1kuk0dpxz4Xi3+lU+E+nPE=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMiAxMTo1MSBhLm0uLCBaZW5nLCBPYWsgd3JvdGU6DQo+IEdXUyBibyBpcyBz
aGFyZWQgYmV0d2VlbiBhbGwga2ZkIHByb2Nlc3Nlcy4gQWRkIGZ1bmN0aW9uIHRvIGFkZCBnd3MN
Cj4gdG8ga2ZkIHByb2Nlc3MncyBibyBsaXN0IHNvIGd3cyBjYW4gYmUgZXZpY3RlZCBmcm9tIGFu
ZCByZXN0b3JlZA0KPiBmb3IgcHJvY2Vzcy4NCj4NCj4gQ2hhbmdlLUlkOiBJNzVkNzRjZmRhZGI3
MDc1ZmY4YjJiNjg2MzRlMjA1ZGViNzNkYzFlYQ0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8
T2FrLlplbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5oICAgICAgIHwgICAyICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCAxMDMgKysrKysrKysrKysrKysrKysrKysrLS0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+IGluZGV4IGMw
MGM5NzQuLmY5NjhiZjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmQuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmgNCj4gQEAgLTE1NSw2ICsxNTUsOCBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9hbGxv
Y19ndHRfbWVtKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHNpemVfdCBzaXplLA0KPiAgIHZvaWQgYW1k
Z3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0oc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbWVtX29i
aik7DQo+ICAgaW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3dzKHN0cnVjdCBrZ2RfZGV2ICprZ2Qs
IHNpemVfdCBzaXplLCB2b2lkICoqbWVtX29iaik7DQo+ICAgdm9pZCBhbWRncHVfYW1ka2ZkX2Zy
ZWVfZ3dzKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1lbV9vYmopOw0KPiAraW50IGFtZGdw
dV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHZvaWQgKmluZm8sIHZvaWQgKmd3cywgc3RydWN0
IGtnZF9tZW0gKiptZW0pOw0KPiAraW50IGFtZGdwdV9hbWRrZmRfcmVtb3ZlX2d3c19mcm9tX3By
b2Nlc3Modm9pZCAqaW5mbywgdm9pZCAqbWVtKTsNCj4gICB1aW50MzJfdCBhbWRncHVfYW1ka2Zk
X2dldF9md192ZXJzaW9uKHN0cnVjdCBrZ2RfZGV2ICprZ2QsDQo+ICAgCQkJCSAgICAgIGVudW0g
a2dkX2VuZ2luZV90eXBlIHR5cGUpOw0KPiAgIHZvaWQgYW1kZ3B1X2FtZGtmZF9nZXRfbG9jYWxf
bWVtX2luZm8oc3RydWN0IGtnZF9kZXYgKmtnZCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCBlMWNhZTRhLi44NzE3N2Vk
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jDQo+IEBAIC00NTcsNiArNDU3LDE3IEBAIHN0YXRpYyB2b2lkIGFkZF9rZ2RfbWVt
X3RvX2tmZF9ib19saXN0KHN0cnVjdCBrZ2RfbWVtICptZW0sDQo+ICAgCW11dGV4X3VubG9jaygm
cHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCByZW1vdmVf
a2dkX21lbV9mcm9tX2tmZF9ib19saXN0KHN0cnVjdCBrZ2RfbWVtICptZW0sDQo+ICsJCXN0cnVj
dCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8pDQo+ICt7DQo+ICsJc3RydWN0IHR0
bV92YWxpZGF0ZV9idWZmZXIgKmJvX2xpc3RfZW50cnk7DQo+ICsNCj4gKwlib19saXN0X2VudHJ5
ID0gJm1lbS0+dmFsaWRhdGVfbGlzdDsNCj4gKwltdXRleF9sb2NrKCZwcm9jZXNzX2luZm8tPmxv
Y2spOw0KPiArCWxpc3RfZGVsKCZib19saXN0X2VudHJ5LT5oZWFkKTsNCj4gKwltdXRleF91bmxv
Y2soJnByb2Nlc3NfaW5mby0+bG9jayk7DQo+ICt9DQo+ICsNCj4gICAvKiBJbml0aWFsaXplcyB1
c2VyIHBhZ2VzLiBJdCByZWdpc3RlcnMgdGhlIE1NVSBub3RpZmllciBhbmQgdmFsaWRhdGVzDQo+
ICAgICogdGhlIHVzZXJwdHIgQk8gaW4gdGhlIEdUVCBkb21haW4uDQo+ICAgICoNCj4gQEAgLTEx
ODMsMTIgKzExOTQsOCBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2Zf
Z3B1KA0KPiAgIA0KPiAgIAlpZiAodXNlcl9hZGRyKSB7DQo+ICAgCQlyZXQgPSBpbml0X3VzZXJf
cGFnZXMoKm1lbSwgY3VycmVudC0+bW0sIHVzZXJfYWRkcik7DQo+IC0JCWlmIChyZXQpIHsNCj4g
LQkJCW11dGV4X2xvY2soJmF2bS0+cHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gLQkJCWxpc3RfZGVs
KCYoKm1lbSktPnZhbGlkYXRlX2xpc3QuaGVhZCk7DQo+IC0JCQltdXRleF91bmxvY2soJmF2bS0+
cHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gKwkJaWYgKHJldCkNCj4gICAJCQlnb3RvIGFsbG9jYXRl
X2luaXRfdXNlcl9wYWdlc19mYWlsZWQ7DQo+IC0JCX0NCj4gICAJfQ0KPiAgIA0KPiAgIAlpZiAo
b2Zmc2V0KQ0KPiBAQCAtMTE5Nyw2ICsxMjA0LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1f
YWxsb2NfbWVtb3J5X29mX2dwdSgNCj4gICAJcmV0dXJuIDA7DQo+ICAgDQo+ICAgYWxsb2NhdGVf
aW5pdF91c2VyX3BhZ2VzX2ZhaWxlZDoNCj4gKwlyZW1vdmVfa2dkX21lbV9mcm9tX2tmZF9ib19s
aXN0KCptZW0sIGF2bS0+cHJvY2Vzc19pbmZvKTsNCj4gICAJYW1kZ3B1X2JvX3VucmVmKCZibyk7
DQo+ICAgCS8qIERvbid0IHVucmVzZXJ2ZSBzeXN0ZW0gbWVtIGxpbWl0IHR3aWNlICovDQo+ICAg
CWdvdG8gZXJyX3Jlc2VydmVfbGltaXQ7DQo+IEBAIC0yMTA0LDMgKzIxMTIsODggQEAgaW50IGFt
ZGdwdV9hbWRrZmRfZ3B1dm1fcmVzdG9yZV9wcm9jZXNzX2Jvcyh2b2lkICppbmZvLCBzdHJ1Y3Qg
ZG1hX2ZlbmNlICoqZWYpDQo+ICAgCWtmcmVlKHBkX2JvX2xpc3QpOw0KPiAgIAlyZXR1cm4gcmV0
Ow0KPiAgIH0NCj4gKw0KPiAraW50IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHZv
aWQgKmluZm8sIHZvaWQgKmd3cywgc3RydWN0IGtnZF9tZW0gKiptZW0pDQo+ICt7DQo+ICsJc3Ry
dWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbyA9IChzdHJ1Y3QgYW1ka2ZkX3By
b2Nlc3NfaW5mbyAqKWluZm87DQo+ICsJc3RydWN0IGFtZGdwdV9ibyAqZ3dzX2JvID0gKHN0cnVj
dCBhbWRncHVfYm8gKilnd3M7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWlmICghaW5mbyB8fCAh
Z3dzKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCSptZW0gPSBremFsbG9jKHNpemVv
ZihzdHJ1Y3Qga2dkX21lbSksIEdGUF9LRVJORUwpOw0KPiArCWlmICghKm1lbSkNCj4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwltdXRleF9pbml0KCYoKm1lbSktPmxvY2spOw0KPiArCSgq
bWVtKS0+Ym8gPSBhbWRncHVfYm9fcmVmKGd3c19ibyk7DQo+ICsJKCptZW0pLT5kb21haW4gPSBB
TURHUFVfR0VNX0RPTUFJTl9HV1M7DQo+ICsJKCptZW0pLT5wcm9jZXNzX2luZm8gPSBwcm9jZXNz
X2luZm87DQo+ICsJYWRkX2tnZF9tZW1fdG9fa2ZkX2JvX2xpc3QoKm1lbSwgcHJvY2Vzc19pbmZv
LCBmYWxzZSk7DQo+ICsJYW1kZ3B1X3N5bmNfY3JlYXRlKCYoKm1lbSktPnN5bmMpOw0KPiArDQo+
ICsNCj4gKwkvKiBWYWxpZGF0ZSBnd3MgYm8gdGhlIGZpcnN0IHRpbWUgaXQgaXMgYWRkZWQgdG8g
cHJvY2VzcyAqLw0KPiArCW11dGV4X2xvY2soJigqbWVtKS0+cHJvY2Vzc19pbmZvLT5sb2NrKTsN
Cj4gKwlyZXQgPSBhbWRncHVfYm9fcmVzZXJ2ZShnd3NfYm8sIGZhbHNlKTsNCj4gKwlpZiAodW5s
aWtlbHkocmV0KSkgew0KPiArCQlwcl9lcnIoIlJlc2VydmUgZ3dzIGJvIGZhaWxlZCAlZFxuIiwg
cmV0KTsNCj4gKwkJZ290byBib19yZXNlcnZhdGlvbl9mYWlsdXJlOw0KPiArCX0NCj4gKw0KPiAr
CXJldCA9IGFtZGdwdV9hbWRrZmRfYm9fdmFsaWRhdGUoZ3dzX2JvLCBBTURHUFVfR0VNX0RPTUFJ
Tl9HV1MsIHRydWUpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJcHJfZXJyKCJHV1MgQk8gdmFsaWRh
dGUgZmFpbGVkICVkXG4iLCByZXQpOw0KPiArCQlnb3RvIGJvX3ZhbGlkYXRpb25fZmFpbHVyZTsN
Cj4gKwl9DQo+ICsJLyogR1dTIHJlc291cmNlIGlzIHNoYXJlZCBiL3QgYW1kZ3B1IGFuZCBhbWRr
ZmQNCj4gKwkgKiBBZGQgcHJvY2VzcyBldmljdGlvbiBmZW5jZSB0byBibyBzbyB0aGV5IGNhbg0K
PiArCSAqIGV2aWN0IGVhY2ggb3RoZXIuDQo+ICsJICovDQo+ICsJYW1kZ3B1X2JvX2ZlbmNlKGd3
c19ibywgJnByb2Nlc3NfaW5mby0+ZXZpY3Rpb25fZmVuY2UtPmJhc2UsIHRydWUpOw0KPiArCWFt
ZGdwdV9ib191bnJlc2VydmUoZ3dzX2JvKTsNCj4gKwltdXRleF91bmxvY2soJigqbWVtKS0+cHJv
Y2Vzc19pbmZvLT5sb2NrKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICsNCj4gK2JvX3ZhbGlk
YXRpb25fZmFpbHVyZToNCj4gKwlhbWRncHVfYm9fdW5yZXNlcnZlKGd3c19ibyk7DQo+ICtib19y
ZXNlcnZhdGlvbl9mYWlsdXJlOg0KPiArCW11dGV4X3VubG9jaygmKCptZW0pLT5wcm9jZXNzX2lu
Zm8tPmxvY2spOw0KPiArCWFtZGdwdV9zeW5jX2ZyZWUoJigqbWVtKS0+c3luYyk7DQo+ICsJcmVt
b3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlzdCgqbWVtLCBwcm9jZXNzX2luZm8pOw0KPiArCWFt
ZGdwdV9ib191bnJlZigmZ3dzX2JvKTsNCj4gKwltdXRleF9kZXN0cm95KCYoKm1lbSktPmxvY2sp
Ow0KPiArCWtmcmVlKCptZW0pOw0KPiArCSptZW0gPSBOVUxMOw0KPiArCXJldHVybiByZXQ7DQo+
ICt9DQo+ICsNCj4gK2ludCBhbWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHZv
aWQgKmluZm8sIHZvaWQgKm1lbSkNCj4gK3sNCj4gKwlpbnQgcmV0Ow0KPiArCXN0cnVjdCBhbWRr
ZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPSAoc3RydWN0IGFtZGtmZF9wcm9jZXNzX2lu
Zm8gKilpbmZvOw0KPiArCXN0cnVjdCBrZ2RfbWVtICprZ2RfbWVtID0gKHN0cnVjdCBrZ2RfbWVt
ICopbWVtOw0KPiArCXN0cnVjdCBhbWRncHVfYm8gKmd3c19ibyA9IGtnZF9tZW0tPmJvOw0KPiAr
DQo+ICsJLyogUmVtb3ZlIEJPIGZyb20gcHJvY2VzcydzIHZhbGlkYXRlIGxpc3Qgc28gcmVzdG9y
ZSB3b3JrZXIgd29uJ3QgdG91Y2gNCj4gKwkgKiBpdCBhbnltb3JlDQo+ICsJICovDQo+ICsJcmVt
b3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlzdChrZ2RfbWVtLCBwcm9jZXNzX2luZm8pOw0KPiAr
DQo+ICsJcmV0ID0gYW1kZ3B1X2JvX3Jlc2VydmUoZ3dzX2JvLCBmYWxzZSk7DQo+ICsJaWYgKHVu
bGlrZWx5KHJldCkpIHsNCj4gKwkJcHJfZXJyKCJSZXNlcnZlIGd3cyBibyBmYWlsZWQgJWRcbiIs
IHJldCk7DQo+ICsJCS8vVE9ETyBhZGQgQk8gYmFjayB0byB2YWxpZGF0ZV9saXN0Pw0KPiArCQly
ZXR1cm4gcmV0Ow0KPiArCX0NCj4gKwlhbWRncHVfYW1ka2ZkX3JlbW92ZV9ldmljdGlvbl9mZW5j
ZShnd3NfYm8sDQo+ICsJCQlwcm9jZXNzX2luZm8tPmV2aWN0aW9uX2ZlbmNlKTsNCj4gKwlhbWRn
cHVfYm9fdW5yZXNlcnZlKGd3c19ibyk7DQo+ICsJYW1kZ3B1X3N5bmNfZnJlZSgma2dkX21lbS0+
c3luYyk7DQo+ICsJYW1kZ3B1X2JvX3VucmVmKCZnd3NfYm8pOw0KPiArCW11dGV4X2Rlc3Ryb3ko
JmtnZF9tZW0tPmxvY2spOw0KPiArCWtmcmVlKG1lbSk7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
