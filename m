Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065A3514A
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 22:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3B89BD2;
	Tue,  4 Jun 2019 20:44:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C31489BD2
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 20:44:53 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2796.namprd12.prod.outlook.com (20.176.118.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Tue, 4 Jun 2019 20:44:51 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 4 Jun 2019
 20:44:51 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/3] KFD upstreaming
Thread-Topic: [PATCH 0/3] KFD upstreaming
Thread-Index: AQHVFaYW50z+q2Kp5UWxtAs9xJtre6aL+FeAgAAA3wCAAAgxgA==
Date: Tue, 4 Jun 2019 20:44:51 +0000
Message-ID: <aeeb6a83-266b-d333-6e64-af2696693870@amd.com>
References: <20190528223811.13947-1-Felix.Kuehling@amd.com>
 <a16cf042-fcb9-21a7-20e4-20c61174f3ff@amd.com>
 <CADnq5_NKKykmkKp8arYpnim3EEmXWcBHkP9PX0RV4h_waKzSDw@mail.gmail.com>
In-Reply-To: <CADnq5_NKKykmkKp8arYpnim3EEmXWcBHkP9PX0RV4h_waKzSDw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ec3c7a9-5ba1-4b7e-07c0-08d6e92d7dac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2796; 
x-ms-traffictypediagnostic: DM6PR12MB2796:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB279626F0A5735BB73C80718992150@DM6PR12MB2796.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(54094003)(71200400001)(102836004)(26005)(6512007)(6306002)(476003)(14444005)(316002)(8676002)(81156014)(81166006)(6916009)(68736007)(2906002)(1411001)(11346002)(2616005)(486006)(256004)(3846002)(6436002)(446003)(6116002)(4326008)(25786009)(8936002)(99286004)(66066001)(64126003)(65806001)(65956001)(53546011)(6506007)(52116002)(186003)(65826007)(14454004)(58126008)(229853002)(53936002)(6486002)(76176011)(66946007)(36756003)(66476007)(86362001)(71190400001)(5660300002)(66446008)(66556008)(64756008)(31696002)(966005)(305945005)(72206003)(478600001)(7736002)(386003)(31686004)(6246003)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2796;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yyxljrUueCbrtdqgoMlm+RoU4NIRifz2mnwvVPQmnxDORmt6HsGLbf7rcRPq0OgWa8UDLzzjkKx+LRvAMxnlznzQmhL/k8WtG1YHvkbg9NP8zbx6dPaEkSU4XzLmaShLbPL+c72vX0EpTkF350oz2P4Oop4um99NjHi5VoQXqWccVYforTGsycK8BeJa+oXk9uJgxQknIFA8UdXzboVARBu/3F0n9vswMlBc6EsJrZKLsmwuWbnQi+BLcDFG8PCqVAsXocTTOpF0LeYRk5KzOSNEcLx9JrOObh8iPsxNbxERvIP1ygtF2D6Yd3W0jgA9D3s0eHOQAYBO/Fvar9FWk9te8aKyaYELZvMlk3REJ1YQEINkW3bJVL1ZTgG8ztbE0Xvu8bxdBkbYnAXEgrH7GhArLegZ37Hb4wIsbcAwBUI=
Content-ID: <FAC9A443337E05499BE79D76EE93068E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec3c7a9-5ba1-4b7e-07c0-08d6e92d7dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 20:44:51.4358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2796
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwdPtTMqs0EguNKBXSkdKeKCx3HZgW7oE5nYwKiQHBE=;
 b=DoYrOInRef/r919yNaTSPtpH6fwIGIg01Oz1Tgj+x7nKySo2ppNNV/JSl96rEBMw43YgIo18iF0YEaOAqhdUsjd/SjIzn6jBDwaDoqjvyr6+AhYzoT6z5MilxR7lRbGSitoesGKVgwFjaaEf7uyEzYNynsRydUo7vjvqd8VWD0k=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0wNCAxNjoxNSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBPbiBUdWUsIEp1biA0
LCAyMDE5IGF0IDQ6MTIgUE0gS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PiB3cm90ZToNCj4+IFRoZXJlIGhhdmVuJ3QgYmVlbiBhbnkgb2JqZWN0aW9ucyB0byB0aGVzZSBj
aGFuZ2VzLiBEb2VzIGFueW9uZSB3YW50IHRvDQo+PiBhZGQgdGhlaXIgQWNrZWQtYnkgYmVmb3Jl
IEkgc3VibWl0Pw0KPiBTZXJpZXMgaXM6DQo+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+DQo+DQo+IEkgd29uZGVyIGlmIHRoZXJlIGlzIGEgY2hhbmNl
IHRvIHNoYXJlIGFueSBjb2RlIGRvd24gdGhlIHJvYWQgd2l0aCB0aGUNCj4gY29udGV4dCBwcmlv
cml0eSBzdHVmZiBpbiBhbWRncHUuDQoNCktGRCBzZXRzIHF1ZXVlIGFuZCBwaXBlIHByaW9yaXRp
ZXMgaW4gTVFEcy4gVGhlIHJlZ2lzdGVyIGFjY2VzcyBoYXMgdG8gDQpiZSBkb25lIGJ5IEhXUyBv
ciBNRUMgZmlybXdhcmUgYmVjYXVzZSBpdCBtYXBzIG91ciBxdWV1ZXMgZHluYW1pY2FsbHkuIA0K
VGhlIHByaW9yaXRpZXMgaW4gdGhlIEtGRCBBUEkgbWFwIDE6MSB0byBxdWV1ZSBwcmlvcml0aWVz
ICgxNiBsZXZlbHMpIA0KYnV0IG5lZWQgc29tZSB0cmFuc2xhdGlvbiBmb3IgcGlwZSBwcmlvcml0
aWVzICgzIGxldmVscykuDQoNCkFNREdQVSBzZXRzIHRoZSBxdWV1ZSBhbmQgcGlwZSBwcmlvcml0
aWVzIGRpcmVjdGx5IHRvIHJlZ2lzdGVycyByYXRoZXIgDQp0aGFuIHVwZGF0aW5nIHRoZSBNUUQg
YW5kIHJlbWFwcGluZyB0aGUgcXVldWUgdXNpbmcgS0lRLiBBbmQgc2VlbXMgdG8gDQpoYXZlIG9u
bHkgYSBiaW5hcnkgY2hvaWNlIGJldHdlZW4gaGlnaCBhbmQgbG93IHByaW9yaXR5LiBJdCBhbHNv
IGRvZXMgDQpzb21lIHBlci1waXBlIHJlc291cmNlIHJlc2VydmF0aW9uIHRoYXQgd2UgZG9uJ3Qg
aGF2ZSBhbiBlcXVpdmFsZW50IGZvciANCmluIEtGRC4NCg0KSnVzdCBsb29raW5nIGF0IHRoZSBj
b2RlIG5vdywgdGhlIGNvbXB1dGUgcGlwZSBwcmlvcml0eSBoYW5kbGluZyBpbiANCmFtZGdwdSBz
ZWVtcyB3cm9uZy4gVGhlIHBpcGUgcHJpb3JpdHkgaXMgcGVyIHBpcGUuIEFJVUkgaXQgZ2V0cyBh
cHBsaWVkIA0KdG8gdGhlIHBpcGUgd2hlbiB0aGUgQ1Agc3dpdGNoZXMgdGhlIGFjdGl2ZSBxdWV1
ZS4gUHJvZ3JhbW1pbmcgdGhpcyANCnJlZ2lzdGVyIGZyb20gdGhlIGRyaXZlciBpcyBwcm9iYWJs
eSBwb2ludGxlc3MuIFlvdSBzaG91bGQgc2V0IHRoaXMgaW4gDQp0aGUgTVFELiBCdXQgY2hhbmdp
bmcgdGhlIE1RRCBvZiBhIG1hcHBlZCBxdWV1ZSBpcyBub3QgYSBnb29kIGlkZWEgaW4gbXkgDQpl
eHBlcmllbmNlLiBTbyB5b3UnZCBoYXZlIHRvIHVubWFwIHRoZSBxdWV1ZSwgdXBkYXRlIHRoZSBw
cmlvcml0aWVzIGFuZCANCnRoZW4gcmVtYXAgaXQgKHVzaW5nIEtJUSkuDQoNCkkgZG9uJ3Qgc2Vl
IGEgbG90IG9mIHBvdGVudGlhbCBmb3IgY29kZSBzaGFyaW5nIG9uIGN1cnJlbnQgaGFyZHdhcmUg
DQpiZWNhdXNlIHdlIGhhdmUgc3VjaCBkaWZmZXJlbnQgd2F5cyBvZiBzY2hlZHVsaW5nIHF1ZXVl
cy4gSWYgeW91IGNoYW5nZSANCmFtZGdwdSB0byB1c2UgTVFEcyBhbmQgS0lRIHRvIHVwZGF0ZSBw
cmlvcml0aWVzLCB3ZSBjb3VsZCBtYXliZSBzaGFyZSANCnRoZSBjb2RlIHRoYXQgaW5pdGlhbGl6
ZXMgYW5kIHVwZGF0ZXMgTVFEcy4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQo+DQo+IEFsZXgN
Cj4NCj4+IFRoYW5rcywNCj4+ICAgICBGZWxpeA0KPj4NCj4+IE9uIDIwMTktMDUtMjggMTg6Mzgs
IEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+PiBOZXcgZmVhdHVyZTogcXVldWUgcHJpb3JpdGll
cw0KPj4+DQo+Pj4gVGhlIGV2aWN0aW9uIHN0YXRlIGxvZ2ljIGNoYW5nZSBpcyBwcmVwYXJhdGlv
biBmb3Igc29tZSBkZWJ1Z2dlciBzdXBwb3J0DQo+Pj4gd2UncmUgd29ya2luZyBvbiBidXQgaGF2
ZW4ndCBzZXR0bGVkIG9uIHRoZSBmaW5hbCBBQkkgeWV0Lg0KPj4+DQo+Pj4gRmVsaXggS3VlaGxp
bmcgKDEpOg0KPj4+ICAgICBkcm0vYW1ka2ZkOiBTaW1wbGlmeSBldmljdGlvbiBzdGF0ZSBsb2dp
Yw0KPj4+DQo+Pj4gSmF5IENvcm53YWxsICgxKToNCj4+PiAgICAgZHJtL2FtZGtmZDogSW1wbGVt
ZW50IHF1ZXVlIHByaW9yaXR5IGNvbnRyb2xzIGZvciBnZng5DQo+Pj4NCj4+PiBvemVuZyAoMSk6
DQo+Pj4gICAgIGRybS9hbWRrZmQ6IENQIHF1ZXVlIHByaW9yaXR5IGNvbnRyb2xzDQo+Pj4NCj4+
PiAgICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCA4NCAr
KysrKysrKysrLS0tLS0tLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X21xZF9tYW5hZ2VyLmMgIHwgMjAgKysrKysNCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfbXFkX21hbmFnZXIuaCAgfCAgMiArLQ0KPj4+ICAgIC4uLi9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX21xZF9tYW5hZ2VyX2Npay5jICB8IDI3ICsrKy0tLQ0KPj4+ICAgIC4uLi9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3Y5LmMgICB8IDIwICsrLS0tDQo+Pj4gICAg
Li4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdmkuYyAgIHwgMjIgKystLS0N
Cj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgICAgICAgfCAx
NiArKysrDQo+Pj4gICAgNyBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKSwgNzggZGVs
ZXRpb25zKC0pDQo+Pj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
