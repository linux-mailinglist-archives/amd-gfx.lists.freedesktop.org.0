Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7613ED49
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 01:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE39892CD;
	Mon, 29 Apr 2019 23:23:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710063.outbound.protection.outlook.com [40.107.71.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC5D892CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 23:23:29 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2952.namprd12.prod.outlook.com (20.179.91.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 23:23:28 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 23:23:28 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 00/27] KFD upstreaming
Thread-Topic: [PATCH 00/27] KFD upstreaming
Thread-Index: AQHU/ZYltw7MLQgAS0iiLSdfkkf+qKZTyemA
Date: Mon, 29 Apr 2019 23:23:28 +0000
Message-ID: <3d9a0f75-bb7c-fe27-f265-4ff48de399b7@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::48) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9297e2a-8f92-40d4-8e33-08d6ccf9af18
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2952; 
x-ms-traffictypediagnostic: BYAPR12MB2952:
x-microsoft-antispam-prvs: <BYAPR12MB2952721121C5D9FA159493E192390@BYAPR12MB2952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(366004)(396003)(136003)(376002)(199004)(189003)(71200400001)(8676002)(26005)(478600001)(8936002)(71190400001)(81156014)(65956001)(65806001)(66066001)(25786009)(14454004)(229853002)(68736007)(72206003)(6636002)(6506007)(14444005)(52116002)(6486002)(256004)(305945005)(5660300002)(7736002)(6436002)(81166006)(66556008)(66446008)(386003)(66476007)(53546011)(31686004)(73956011)(102836004)(66946007)(64756008)(76176011)(31696002)(86362001)(53936002)(6512007)(110136005)(186003)(58126008)(64126003)(316002)(3846002)(36756003)(6116002)(2501003)(99286004)(65826007)(486006)(11346002)(446003)(6246003)(476003)(97736004)(2616005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2952;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yHwBjLKeIJARW6RbZ0WdjTFHa7AY4lRrBZZXJGbB3nTChVG8CTJ0slWp45g8tx21wKcjqIi6swX//urfooGLaQipGxjUZboNT/wAVbQk3UwAWkN3EkPMPP3mVcdhJXbjZ1pXjEk3iaUxfjiLoaideJY5F+abvXMqdS4JoNcSoYKhU70vM7WhDB8mc+Bq5vQoX+HO/BItm1U4I12BaqyulG89po4f5pILRC+LL0n6canB60cKsZRGiTvK993gy6VCm6QO/m4O7wjo4a7POKyjQjrOQzi36vLDzLgJbwX3vLr8kLYrhgxwXzVj4KGm81tvKde5w+BVyUdZjq4gD3nDht5WSuOS1mn7IvYHj3M2Go7KBQgTpRZhBFbTkbk/4vlz0qTx/LFZdmy+P2Rgfib/zRO4NYjv2Dvv28i1WV+9b5c=
Content-ID: <16F307DA4BF5094CA128D9BF84570104@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9297e2a-8f92-40d4-8e33-08d6ccf9af18
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 23:23:28.2983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5yL50mERzfMKPdiHhTqIVibPPDggZBzxbgeRaJr7uk=;
 b=owK13L8Rnlrf4Af1OMhtp0poVTzoKQD/TRzNi+BL2JKBV5klmvBsDfmLtuBPmdrIrUNsepne4qIZAzDw07hdmbxtAJTHu8rQMhsYGy+OHUuis8pAwf19hxHlASjDFrbe17GSoGRcRIWn9YAWrUwktTcfo1kSc9BZCQ6z/HdPYB4=
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

SSdsbCBkcm9wIHBhdGNoIDI3IGZyb20gdGhpcyBzZXJpZXMgdW50aWwgdGhlIHBvdGVudGlhbCBP
T00gaXNzdWVzIGNhbiANCmJlIHNvcnRlZCBvdXQuDQoNClRoZSByZW1haW5pbmcgcGF0Y2hlcyBh
cmUgYWxsIEtGRCBzcGVjaWZpYyBhbmQgc2hvdWxkbid0IGNhdXNlIGFueSANCnRyb3VibGUgZm9y
IGdyYXBoaWNzIGFwcHMuIElmIHRoZXJlIGFyZSBubyBvdGhlciBvYmplY3Rpb25zIEknbSBwbGFu
bmluZyANCnRvIHB1c2ggcGF0Y2hlcyAxLTI2IHRvIGFtZC1zdGFnaW5nLWRybS1uZXh0IHRvbW9y
cm93Lg0KDQpUaGFua3MsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNC0yOCAzOjQ0IGEubS4sIEt1
ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4gQXNzb3J0ZWQgS0ZEIGNoYW5nZXMgdGhhdCBoYXZlIGJl
ZW4gYWNjdW11bGF0aW5nIG9uIGFtZC1rZmQtc3RhZ2luZy4gTmV3DQo+IGZlYXR1cmVzIGFuZCBm
aXhlcyBpbmNsdWRlZDoNCj4gKiBTdXBwb3J0IGZvciBWZWdhTQ0KPiAqIFN1cHBvcnQgZm9yIHN5
c3RlbXMgd2l0aCBtdWx0aXBsZSBQQ0kgZG9tYWlucw0KPiAqIE5ldyBTRE1BIHF1ZXVlIHR5cGUg
dGhhdCdzIG9wdGltaXplZCBmb3IgWEdNSSBsaW5rcw0KPiAqIFNETUEgTVFEIGFsbG9jYXRpb24g
Y2hhbmdlcyB0byBzdXBwb3J0IGZ1dHVyZSBBU0lDcyB3aXRoIG1vcmUgU0RNQSBxdWV1ZXMNCj4g
KiBGaXggZm9yIGNvbXB1dGUgcHJvZmlsZSBzd2l0Y2hpbmcgYXQgcHJvY2VzcyB0ZXJtaW5hdGlv
bg0KPiAqIEZpeCBmb3IgYSBjaXJjdWxhciBsb2NrIGRlcGVuZGVuY3kgaW4gTU1VIG5vdGlmaWVy
cw0KPiAqIEZpeCBmb3IgVExCIGZsdXNoaW5nIGJ1ZyB3aXRoIFhHTUkgZW5hYmxlZA0KPiAqIEZp
eCBmb3IgYXJ0aWZpY2lhbCBHVFQgc3lzdGVtIG1lbW9yeSBsaW1pdGF0aW9uDQo+ICogVHJhcCBo
YW5kbGVyIHVwZGF0ZXMNCj4NCj4gQW1iZXIgTGluICgxKToNCj4gICAgZHJtL2FtZGtmZDogQWRk
IGRvbWFpbiBudW1iZXIgaW50byBncHVfaWQNCj4NCj4gRmVsaXggS3VlaGxpbmcgKDEpOg0KPiAg
ICBkcm0vYW1ka2ZkOiBGaXggYSBjaXJjdWxhciBsb2NrIGRlcGVuZGVuY3kNCj4NCj4gSGFyaXNo
IEthc2l2aXN3YW5hdGhhbiAoMSk6DQo+ICAgIGRybS9hbWRrZmQ6IEZpeCBjb21wdXRlIHByb2Zp
bGUgc3dpdGNoaW5nDQo+DQo+IEpheSBDb3Jud2FsbCAoNCk6DQo+ICAgIGRybS9hbWRrZmQ6IEZp
eCBnZng4IE1FTV9WSU9MIGV4Y2VwdGlvbiBoYW5kbGVyDQo+ICAgIGRybS9hbWRrZmQ6IFByZXNl
cnZlIHdhdmUgc3RhdGUgYWZ0ZXIgaW5zdHJ1Y3Rpb24gZmV0Y2ggTUVNX1ZJT0wNCj4gICAgZHJt
L2FtZGtmZDogRml4IGdmeDkgWE5BQ0sgc3RhdGUgc2F2ZS9yZXN0b3JlDQo+ICAgIGRybS9hbWRr
ZmQ6IFByZXNlcnZlIHR0bXBbNDo1XSBpbnN0ZWFkIG9mIHR0bXBbMTQ6MTVdDQo+DQo+IEtlbnQg
UnVzc2VsbCAoMik6DQo+ICAgIGRybS9hbWRrZmQ6IEFkZCBWZWdhTSBzdXBwb3J0DQo+ICAgIGRy
bS9hbWRncHU6IEZpeCBHVFQgc2l6ZSBjYWxjdWxhdGlvbg0KPg0KPiBPYWsgWmVuZyAoMTYpOg0K
PiAgICBkcm0vYW1ka2ZkOiBVc2UgNjQgYml0IHNkbWFfYml0bWFwDQo+ICAgIGRybS9hbWRrZmQ6
IEFkZCBzZG1hIGFsbG9jYXRpb24gZGVidWcgbWVzc2FnZQ0KPiAgICBkcm0vYW1ka2ZkOiBEaWZm
ZXJlbnRpYXRlIGIvdCBzZG1hX2lkIGFuZCBzZG1hX3F1ZXVlX2lkDQo+ICAgIGRybS9hbWRrZmQ6
IFNoaWZ0IHNkbWFfZW5naW5lX2lkIGFuZCBzZG1hX3F1ZXVlX2lkIGluIG1xZA0KPiAgICBkcm0v
YW1ka2ZkOiBGaXggYSBwb3RlbnRpYWwgbWVtb3J5IGxlYWsNCj4gICAgZHJtL2FtZGtmZDogSW50
cm9kdWNlIGFzaWMtc3BlY2lmaWMgbXFkX21hbmFnZXJfaW5pdCBmdW5jdGlvbg0KPiAgICBkcm0v
YW1ka2ZkOiBJbnRyb2R1Y2UgRElRIHR5cGUgbXFkIG1hbmFnZXINCj4gICAgZHJtL2FtZGtmZDog
SW5pdCBtcWQgbWFuYWdlcnMgaW4gZGV2aWNlIHF1ZXVlIG1hbmFnZXIgaW5pdA0KPiAgICBkcm0v
YW1ka2ZkOiBBZGQgbXFkIHNpemUgaW4gbXFkIG1hbmFnZXIgc3RydWN0DQo+ICAgIGRybS9hbWRr
ZmQ6IEFsbG9jYXRlIE1RRCB0cnVuayBmb3IgSElRIGFuZCBTRE1BDQo+ICAgIGRybS9hbWRrZmQ6
IE1vdmUgbm9uLXNkbWEgbXFkIGFsbG9jYXRpb24gb3V0IG9mIGluaXRfbXFkDQo+ICAgIGRybS9h
bWRrZmQ6IEFsbG9jYXRlIGhpcSBhbmQgc2RtYSBtcWQgZnJvbSBtcWQgdHJ1bmsNCj4gICAgZHJt
L2FtZGtmZDogRml4IHNkbWEgcXVldWUgbWFwIGlzc3VlDQo+ICAgIGRybS9hbWRrZmQ6IEludHJv
ZHVjZSBYR01JIFNETUEgcXVldWUgdHlwZQ0KPiAgICBkcm0vYW1ka2ZkOiBFeHBvc2Ugc2RtYSBl
bmdpbmUgbnVtYmVycyB0byB0b3BvbG9neQ0KPiAgICBkcm0vYW1ka2ZkOiBEZWxldGUgYWxsb2Nf
Zm9ybWF0IGZpZWxkIGZyb20gbWFwX3F1ZXVlIHN0cnVjdA0KPg0KPiBZb25nIFpoYW8gKDEpOg0K
PiAgICBkcm0vYW1ka2ZkOiBNb3ZlIHNkbWFfcXVldWVfaWQgY2FsY3VsYXRpb24gaW50byBhbGxv
Y2F0ZV9zZG1hX3F1ZXVlKCkNCj4NCj4gc2hhb3l1bmwgKDEpOg0KPiAgICBkcm0vYW1kZ3B1OiBV
c2UgaGVhdnkgd2VpZ2h0IGZvciB0bGIgaW52YWxpZGF0aW9uIG9uIHhnbWkNCj4gICAgICBjb25m
aWd1cmF0aW9uDQo+DQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dm
eF92OS5jIHwgIDUzICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jICAgICAgIHwgICA5ICstDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBf
aGFuZGxlci5oICAgIHwgNDgzICsrKysrKysrKy0tLS0tLS0tLQ0KPiAgIC4uLi9kcm0vYW1kL2Ft
ZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9nZng4LmFzbSB8ICAxMyAtDQo+ICAgLi4uL2RybS9hbWQv
YW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDkuYXNtIHwgIDYzICstLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8ICAgMiArDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYyAgICAgICAgIHwgICA1ICsNCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgICAgICAgfCAgNTEgKysNCj4gICAu
Li4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzNTQgKysrKysr
KystLS0tLQ0KPiAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
aCB8ICAxNCArLQ0KPiAgIC4uLi9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlcl9j
aWsuYyB8ICAgMiArDQo+ICAgLi4uL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
X3Y5LmMgIHwgICAxICsNCj4gICAuLi4vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXJfdmkuYyAgfCAgIDIgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0
X21lbW9yeS5jICB8ICAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tl
cm5lbF9xdWV1ZS5jIHwgICA2ICstDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2Vy
bmVsX3F1ZXVlX3Y5LmMgIHwgICA0ICstDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
a2VybmVsX3F1ZXVlX3ZpLmMgIHwgICA0ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX21xZF9tYW5hZ2VyLmMgIHwgIDcwICsrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9tcWRfbWFuYWdlci5oICB8ICAgOCArDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfbXFkX21hbmFnZXJfY2lrLmMgIHwgIDUzICstDQo+ICAgLi4uL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYyAgIHwgIDg1ICstLQ0KPiAgIC4uLi9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3ZpLmMgICB8ICA1MyArLQ0KPiAgIC4uLi9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMgICB8ICAgNCArLQ0KPiAgIC4uLi9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmggICB8ICAgNyArLQ0KPiAgIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX3ZpLmggICB8ICAgNyArLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICB8ICAxNCArLQ0K
PiAgIC4uLi9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyAgICB8ICAxNCAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jICAgICB8ICAx
MyArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5oICAgICB8
ICAgMiArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Npa19zdHJ1Y3RzLmggICAg
IHwgICAzICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Y5X3N0cnVjdHMuaCAg
ICAgIHwgICAzICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZpX3N0cnVjdHMu
aCAgICAgIHwgICAzICstDQo+ICAgaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oICAgICAg
ICAgICAgICAgIHwgICA3ICstDQo+ICAgMzMgZmlsZXMgY2hhbmdlZCwgODI2IGluc2VydGlvbnMo
KyksIDU4NyBkZWxldGlvbnMoLSkNCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
