Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B49D34E
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 17:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDDB6E262;
	Mon, 26 Aug 2019 15:45:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71156E262
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 15:45:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbD3HeLVGtNmE+BjNx9YiCvkfvJS1tNaRsiBl7h91rrEFYnF+k/vhg20yskd658evIRvhpj+AhNxahHznjP6Hx1n91i9UKYPfk0PiJDiQ1rBrtFMG+5gAr3J+kz4qP+v2XHCvqdGVQQI69rbbTqHos4l6/RglHU0pFjg4AjhHePlDnVEtnjMQLI5yyYh3s4TvpKzccsRUhBnDP4VzB5WZ2Z1p/5RQmmU6kwKikuXlGbiFD5YFe3vRlfMvSriI3q8uPW2RmSU81PAe7TG0EU6YYwxIqPOmmpOGoNYXD0X169dLD81oXyDqM6tsMiz58zGoysDCkw3UBtm0KLE1yKOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj1pcPgjwqo+GmItLY36SKLllcqpFSNfNBL0gYDd8PI=;
 b=nwzvlI6oHyP/qeslRRynvsInK/Rw1JxtB4UQ2Pi5biOyx0LMGDW+lo5HmdkqmYWJoKahxYSnr7dOcGW/V3pJDHpWAYuxwJBzH/OE2VxmPlNHOIP1heXJmnkWFVlRHKZCFSx6bCecRwqADBNCwZ4DkWQ3O6IjJ0IIVwUNhowNWsEbQOvt0e7nUQNfcdKOGq+lhpQpvL0EVyASmj7eh1EqHnXzxUKqp7J0DvHu99XehjvXObRiBBUuw0y2H6D0Wm5/f05IiwJ0fg+IAG1+JThQrnrWOr272u6vKJ0UORxS1XoWqe+79C8/+HToQKdKCmaxfFKTnuhnbBg8pVrzPGkBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3274.namprd12.prod.outlook.com (20.179.106.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 15:45:50 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 15:45:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpyCsVjPVucSk2VZpnIFr9zeacKJd+AgABW24CAACt4AIAC7oOA
Date: Mon, 26 Aug 2019 15:45:50 +0000
Message-ID: <4b48fc1a-6ee2-bb60-0518-ea9c6346b8d6@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
 <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
 <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
In-Reply-To: <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::31) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04f40050-8630-413b-a0fc-08d72a3c7859
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3274; 
x-ms-traffictypediagnostic: DM6PR12MB3274:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB327432C2B9567F3D9DE87EDD92A10@DM6PR12MB3274.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(6486002)(5660300002)(14454004)(66574012)(186003)(71190400001)(71200400001)(2906002)(478600001)(966005)(36756003)(53936002)(6512007)(66556008)(66946007)(66476007)(66446008)(64756008)(6116002)(6436002)(3846002)(6246003)(76176011)(446003)(81156014)(81166006)(6306002)(316002)(86362001)(65956001)(229853002)(256004)(25786009)(8676002)(14444005)(8936002)(31696002)(7736002)(486006)(2501003)(102836004)(305945005)(52116002)(386003)(6506007)(110136005)(53546011)(58126008)(66066001)(65806001)(99286004)(26005)(31686004)(476003)(11346002)(4326008)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3274;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7Z0wGCxPY0z3M0YO10MDwFMxpmGjjbsiUSxFHxNRNoFOEwjZg62HKuZj0B7ugX55KEN7OaQEYgbf1x73A57x21XNlcGaVGskl/ndujYfI3/vLto4npdhciEvW/HKXlKIPg0qb9Yyd4GQocZbGkMrN4qXaL+9Q9STyLSLYBlXC0Pv1UaLI+qCWg0ggoHJBjBN9WtSXD8Po0aRpMU8LQShYnQd1wRyyhmcDNwTrthmc/k8J/DVMA5PBysQLQ3bRoEy0zzMTybve1wTl/9Tyf0lopGGEhOTBtCDg1uXbYR+vhnS5hPS4GgTa1LeSvDfEbILkx+aHmQIxxqeThFC5KIlkTHOAtzXoSTFlY3SX5q9JJ2A4gLKJBOh9Q0l5PhnosSqHzvy+y9cmErzhXUJ7cKOT0kFEeVO1Z2Bue6L1bt4384=
Content-ID: <9CFCA08910A0C04F98116407392F7F0C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f40050-8630-413b-a0fc-08d72a3c7859
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 15:45:50.3597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8awf46ln3DnPJkmeCiIyBHV/t3bGeaJKmZV8Ld4oliU1llqpHXy/goEg3FVzwIu9HPw8UENHJEoil6UykvNfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj1pcPgjwqo+GmItLY36SKLllcqpFSNfNBL0gYDd8PI=;
 b=mZmUrpB4qyfmJuX+s6GYY3VjnIDgL0qtctbpt6TjTHs0z+PodGM/3OWDmhbCdqmWDu3N03XVIxKhier7ougV8Y0Tc4VZALDfr5ycCYU8oB+SpXIeIKNmzUqg+tHl5auRagZX2WUVkoIglZR1HOi8JB9d4pKZvbq8lgcvmkF8X4w=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNCAyOjU5IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDI0
LjA4LjE5IHVtIDE4OjI0IHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Og0KPj4gT24gMjAxOS0wOC0y
NCA3OjEzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4+IEFtIDIzLjA4LjE5IHVtIDIzOjMz
IHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Og0KPj4+PiBGcm9tOiBPYWsgWmVuZyA8T2FrLlplbmdA
YW1kLmNvbT4NCj4+Pj4NCj4+Pj4gU2V0IHNub29wZWQgUFRFIGZsYWcgYWNjb3JkaW5nIHRvIG1h
cHBpbmcgZmxhZy4gV3JpdGUgcmVxdWVzdCB0byBhDQo+Pj4+IHBhZ2Ugd2l0aCBzbm9vcGVkIGJp
dCBzZXQsIHdpbGwgc2VuZCBvdXQgaW52YWxpZGF0ZSBwcm9iZSByZXF1ZXN0DQo+Pj4+IHRvIFRD
QyBvZiB0aGUgcmVtb3RlIEdQVSB3aGVyZSB0aGUgdnJhbSBwYWdlIHJlc2lkZXMuDQo+Pj4+DQo+
Pj4+IENoYW5nZS1JZDogSTc5OWY2OGVjN2E1YTFhYmYzMjA3NWY1ZWYzMTA1MTY0MWEwYjM3MzYN
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+Pj4+IC0t
LQ0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAzICsr
Kw0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+Pj4+IGluZGV4IDlhYWZj
ZGE2YzQ4OC4uOGE3YzRlYzY5YWU4IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMNCj4+Pj4gQEAgLTYwNCw2ICs2MDQsOSBAQCBzdGF0aWMgdWludDY0X3Qg
Z21jX3Y5XzBfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1Y3QNCj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1BSVCkNCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9QUlQ7DQo+Pj4+
IMKgwqAgK8KgwqDCoCBpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRFX1BST0JF
KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9TTk9PUEVEOw0K
Pj4+PiArDQo+Pj4gVGhhdCBpcyBzdGlsbCBhIE5BSyB3aXRob3V0IGZ1cnRoZXIgY2hlY2tzLiBX
ZSBuZWVkIHRvIG1ha2UgYWJzb2x1dGVseQ0KPj4+IHN1cmUgdGhhdCB3ZSBkb24ndCBzZXQgdGhp
cyB3aGVuIFBDSWUgcm91dGluZyBpcyBpbiB1c2UuDQo+PiBUaGUgb25seSBwbGFjZSB3aGVyZSBB
TURHUFVfVk1fLi4uIGZsYWdzIGFyZSBhY2NlcHRlZCBmcm9tIHVzZXIgbW9kZQ0KPj4gc2VlbXMg
dG8gYmUgYW1kZ3B1X2dlbV92YV9pb2N0bC4gSXQgaGFzIGFuIGV4cGxpY2l0IHNldCBvZiB2YWxp
ZF9mbGFncw0KPj4gaXQgYWNjZXB0cy4gVGhlIG5ldyBJTlZBTElEQVRFX1BST0JFIGZsYWcgaXMg
bm90IHBhcnQgb2YgaXQuIFRoYXQgbWVhbnMNCj4+IHVzZXIgbW9kZSB3aWxswqAgbm90IGJlIGFi
bGUgdG8gc2V0IGl0IGRpcmVjdGx5LiBJZiB3ZSBhZGRlZCBpdCB0byB0aGUNCj4+IHNldCBvZiB2
YWxpZF9mbGFncyBpbiBhbWRncHVfZ2VtX3ZhX2lvY3RsLCB3ZSdkIG5lZWQgdG8gYWRkIGFwcHJv
cHJpYXRlDQo+PiBjaGVja3MgYXQgdGhlIHNhbWUgdGltZS4NCj4+DQo+PiBLRkQgZG9lcyBub3Qg
ZXhwb3NlIEFNREdQVV9WTV8uLi4gZmxhZ3MgZGlyZWN0bHkgdG8gdXNlciBtb2RlLiBJdCBvbmx5
DQo+PiBzZXRzIHRoZSBJTlZBTElEQVRFX1BST0JFIGZsYWcgaW4ga2VybmVsIG1vZGUgZm9yIG1h
cHBpbmdzIGluIHRoZSBzYW1lDQo+PiBYR01JIGhpdmUgb24gQXJ0dXJ1cyAoaW4gcGF0Y2ggNCku
DQo+Pg0KPj4gSWYgdGhlcmUgaXMgc29tZXRoaW5nIEknbSBtaXNzaW5nLCBwbGVhc2UgcG9pbnQg
aXQgb3V0LiBCdXQgQUZBSUNUIHRoZQ0KPj4gY2hlY2tpbmcgdGhhdCBpcyBjdXJyZW50bHkgZG9u
ZSBzaG91bGQgc2F0aXNmeSB5b3VyIHJlcXVpcmVtZW50cy4NCj4NCj4gVGhlIGhhcmR3YXJlIGJl
aGF2aW9yIGRlcGVuZHMgb24gdGhlIHBsYWNlbWVudCBvZiB0aGUgYnVmZmVyLCBzbyBhdCANCj4g
YmFyZSBtaW5pbXVtIHdlIG5lZWQgdG8gY2hlY2sgaWYgaXQncyBwb2ludGluZyB0byBQQ0llIG9y
IGxvY2FsIChjaGVjayANCj4gdGhlIHN5c3RlbSBiaXQpLg0KPg0KPiBCdXQgZXZlbiBpZiBpdCdz
IGxvY2FsIHdoYXQgaXMgdGhlIGJlaGF2aW9yIGZvciBsb2NhbCBtZW1vcnk/IEUuZy4gbm90IA0K
PiBhY2Nlc3NlZCB0aHJvdWdoIFhHTUk/DQo+DQo+IEFzIGZhciBhcyBJIGNhbiBzZWUgd2hhdCB3
ZSBuZWVkIHRvIGNoZWNrIGhlcmUgaXMgdGhhdCB0aGlzIGlzIGEgDQo+IHJlbW90ZSBhY2Nlc3Mg
b3ZlciBYR01JIGFuZCB0aGVuIChhbmQgb25seSB0aGVuISkgd2UgYXJlIGFsbG93ZWQgdG8gDQo+
IHNldCB0aGUgc25vb3AgYml0IG9uIHRoZSBQVEUuDQoNCk15IHBvaW50IGlzLCB0aGUgb25seSBw
bGFjZSB3aGVyZSB0aGlzIGJpdCBjYW4gZ2V0IHNldCByaWdodCBub3cgaXMgaW4gDQprZXJuZWwg
bW9kZSBpbiBhbWRncHVfYW1ka2ZkX2dwdXZtLmMuIFNlZSBwYXRjaCA0IG9mIG15IHNlcmllcy4g
VGhhdCANCmNvZGUgYWxyZWFkeSBoYXMgYWxsIHRoZSByaWdodCBjb25kaXRpb25zIHRvIG1ha2Ug
c3VyZSB0aGUgDQpJTlZBTElEQVRFX1BST0JFIGJpdCBpcyBvbmx5IHNldCBpbiB0aGUgY29ycmVj
dCBjaXJjdW1zdGFuY2VzIChyZW1vdGUgDQpYR01JIG1hcHBpbmdzIGluIHRoZSBzYW1lIGhpdmUp
Og0KDQo+ICsJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCj4gKwljYXNlIENISVBfQVJDVFVS
VVM6DQo+ICsJCWlmIChtZW0tPmFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1ZSQU0pIHsN
Cj4gKwkJCWlmIChib19hZGV2ID09IGFkZXYpIHsNCj4gKwkJCQkuLi4NCj4gKwkJCX0gZWxzZSB7
DQo+ICsJCQkJLi4uDQo+ICsJCQkJaWYgKGFtZGdwdV94Z21pX3NhbWVfaGl2ZShhZGV2LCBib19h
ZGV2KSkNCj4gKwkJCQkJbWFwcGluZ19mbGFncyB8PQ0KPiArCQkJCQkJQU1ER1BVX1ZNX1BBR0Vf
SU5WQUxJREFURV9QUk9CRTsNCj4gKwkJCX0NCj4gKwkJfSBlbHNlIHsNCkkgdGhpbmsgeW91J3Jl
IGFza2luZyBtZSB0byBhZGQgYW4gZXh0cmEgY2hlY2sgZm9yIHRoZSBzYW1lIGNvbmRpdGlvbnMg
DQppbiB0aGUgR01DIGNvZGU/IExpa2UgR01DIGRvZXNuJ3QgdHJ1c3QgYW1kZ3B1X2FtZGtmZC4g
SXQgc2VlbXMgDQpjb21wbGV0ZWx5IHJlZHVuZGFudCBhbmQgYSBiaXQgcGFyYW5vaWQgdG8gbWUu
IGdtY192OV8wX2dldF92bV9wdGVfZmxhZ3MgDQpkb2Vzbid0IGV2ZW4gaGF2ZSBhbGwgdGhlIGlu
Zm9ybWF0aW9uIGl0IG5lZWRzIHRvIG1ha2UgdGhhdCBkZXRlcm1pbmF0aW9uLg0KDQpSZWdhcmRz
LA0KIMKgIEZlbGl4DQoNCg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+Pg0KPj4g
UmVnYXJkcywNCj4+IMKgIMKgIEZlbGl4DQo+Pg0KPj4+IENocmlzdGlhbi4NCj4+Pg0KPj4+PiDC
oMKgwqDCoMKgwqAgcmV0dXJuIHB0ZV9mbGFnOw0KPj4+PiDCoMKgIH0NCj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
