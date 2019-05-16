Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2420F06
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 21:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73C68947A;
	Thu, 16 May 2019 19:03:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77CC8947A
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 19:03:36 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3945.namprd12.prod.outlook.com (10.255.174.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 19:03:35 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 19:03:34 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Daniel
 Kasak <d.j.kasak.dk@gmail.com>
Subject: Re: Hard lockups with ROCM
Thread-Topic: Hard lockups with ROCM
Thread-Index: AQHVCS1/ueMoAUBsFUie3PM++IlcIqZuIcAA
Date: Thu, 16 May 2019 19:03:34 +0000
Message-ID: <03ca98c6-aef5-b7d2-976b-c736cb874fef@amd.com>
References: <CAF73Y=QuYq3ALtP6xiPyqS+jm_TJCQQDyQ+WA5ZJG8EhWSKiTw@mail.gmail.com>
In-Reply-To: <CAF73Y=QuYq3ALtP6xiPyqS+jm_TJCQQDyQ+WA5ZJG8EhWSKiTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c151dd29-6834-4b92-97e2-08d6da3131b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3945; 
x-ms-traffictypediagnostic: DM6PR12MB3945:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3945F03AA1D5773F5DE484B5920A0@DM6PR12MB3945.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(53754006)(189003)(26005)(386003)(6506007)(53546011)(186003)(68736007)(6116002)(3846002)(76176011)(486006)(229853002)(316002)(14444005)(6436002)(2501003)(6486002)(305945005)(7736002)(11346002)(446003)(256004)(102836004)(110136005)(58126008)(71200400001)(71190400001)(476003)(2616005)(31686004)(5660300002)(36756003)(52116002)(31696002)(73956011)(66476007)(66946007)(65806001)(66556008)(99286004)(66066001)(65956001)(66446008)(64756008)(65826007)(72206003)(64126003)(8936002)(478600001)(53936002)(3480700005)(86362001)(2906002)(25786009)(6246003)(81156014)(14454004)(81166006)(6512007)(6306002)(8676002)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3945;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7lriCHQhLDNZXfPur1AlFG5T5CrebrDbuILZYcZSXnrzyzP3oILamwJMB/C9WecB/w5f/GIIVm6FzYLQT48a4bohtNGoWonly3yykYFIlKNPQfSo5bVqkPKu1lSG/Y4Q/Tdgbdv5OZcI3n942qkSAWnAYLd8X440NQdwcW+3qwx/wwnH6ZJ5h8lNUd0FmDsWDjwGX0AEqUDV3MOdnp5rYIKYneJin0dWA5PYxPhq56SkWkYYBOIOut8TMhddNXoxwC826Gdqs4O/QNSMkbeP9KOPy5P7RS6PQxWhW6kYpzfKLFU7+EzcH+VDm8bXI06cJM1g3MQz1chjAIe/uKQ4cGrsGpIafmAj/GAgUDUchKi/3g5s395fpWlzEp6OmyvNlcpgUiQH46nVUjno6rauo0zcFt7EM/O020azTQxTXhU=
Content-ID: <9939797C7D4D6C44A5217E1BD34EDF8C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c151dd29-6834-4b92-97e2-08d6da3131b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 19:03:34.5366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3945
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ColnKhsWqzz6tLjgJlgqPBsh9eYPzv2axKgfI/HEokk=;
 b=sqBQ8aFXRELMBaovSMzbdyV3vAANBHZA+9x+sCl5bzCg9v1xFLscpKd5fCXTy4om4yybJdNdkQSN0IsbSbSF9bvGC9yH92Zwp8nvojV1HYqo/uGgMOHr098Im8m9vxhvso/sjQ9DPmuxznNTlzkN1IQRbm3fK6xwGNqcrqi7GaQ=
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

SGkgRGFuaWVsLA0KDQpPbiAyMDE5LTA1LTEyIDk6NDQgcC5tLiwgRGFuaWVsIEthc2FrIHdyb3Rl
Og0KPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+IEhpIGFsbC4gSSBoYWQgdmVyc2lvbiAy
LjIuMCBvZiB0aGUgUk9DTSBzdGFjayBydW5uaW5nIG9uIGEgNS4wLnggYW5kIA0KPiA1LjEuMCBr
ZXJuZWwuIFRoaW5ncyB3ZXJlIGdvaW5nIGdyZWF0IHdpdGggdmFyaW91cyBib2luYyBHUFUgdGFz
a3MuIA0KPiBCdXQgdGhlcmUgaXMgYSBzZXRpYXRob21lIEdQVSB0YXNrIHdoaWNoIHJlbGlhYmx5
IGdpdmVzIG1lIGEgaGFyZCANCj4gbG9ja3VwIHdpdGhpbiBhYm91dCAzMCBtaW51dGVzIG9mIHJ1
bm5pbmcuIEkgYWN0dWFsbHkgaGFkIHRvIGRvICp0d28qIA0KPiBlbWVyZ2VuY3kgcmUtaW5zdGFs
bHMgb3ZlciB0aGUgcGFzdCB3ZWVrLg0KDQpTb3JyeSB0byBoZWFyIGFib3V0IHlvdXIgdHJvdWJs
ZS4gRG8geW91IGhhdmUgYSBzZWNvbmQgY29tcHV0ZXIgeW91IGNhbiANCnVzZSB0byByZW1vdGUg
bG9naW4gaW50byB5b3VyIHN5c3RlbT8gQ2hhbmNlcyBhcmUgdGhhdCBpdCdzIHN0aWxsIA0KcmVz
cG9uc2l2ZSBhbmQgb25seSB0aGUgc2NyZWVuIGlzIGZyb3plbi4NCg0KQWxzbywgeW91IGNvdWxk
IHRyeSBib290aW5nIGluIGNvbnNvbGUgbW9kZSAod2l0aG91dCBhbiB4c2VydmVyKS4gVGhlIA0K
Y29uc29sZSB1c3VhbGx5IHN0aWxsIHdvcmtzIGV2ZW4gd2hlbiB0aGUgR1BVIGNvbXB1dGUgdW5p
dHMgb3IgU0RNQSANCmVuZ2luZXMgYXJlIGhhbmdpbmcuDQoNCklmIHlvdSBtYW5hZ2UgdG8gZG8g
YW4gZW1lcmdlbmN5IHJlYm9vdCB3aXRoIHN5c3JxIChyZW1vdW50LVJPIGFuZCANCnJlYm9vdCks
IHlvdSBzaG91bGQgc2VlIHRoZSBrZXJuZWwgbG9nIG9mIHlvdXIgcHJldmlvdXMgc2Vzc2lvbiBp
biANCi92YXIvbG9nLiBPbiBVYnVudHUgaXQncyBpbiAvdmFyL2xvZy9rZXJuLmxvZy4gTm90IHN1
cmUgd2hlcmUgaXQgaXMgb24gDQpHZW50b28uIFRoZXJlIGlzIGEgZ29vZCBjaGFuY2UgdGhlIGxv
ZyBjb250YWlucyBoZWxwZnVsIGluZm9ybWF0aW9uIA0KKGUuZy4gaWYgdGhlIGRyaXZlciBkZXRl
Y3RlZCBhIGhhbmcgYnV0IGZhaWxlZCB0byByZXNldCB0aGUgR1BVLCBvciANCm1heWJlIGEgZHJp
dmVyIGJ1ZyB0aGF0IGxlYWRzIHRvIGEgZGVhZGxvY2sgb3Iga2VybmVsIHBhbmljKS4NCg0KPiBQ
ZXJoYXBzIHBhcnQgb2YgdGhpcyB3YXMgbXkgZmF1bHQgKCBydW5uaW5nIGJ0cmZzIHdpdGggbHpv
IGNvbXByZXNzaW9uIA0KPiBvbiBteSByb290IHBhcnRpdGlvbiAuLi4gKS4gQnV0IGFic29sdXRl
bHkgcGFydCBvZiB0aGlzIHdhcyB0aGUgaGFyZCANCj4gbG9ja3Vwcy4gSSd2ZSB0ZXN0ZWQgYWxs
IGtpbmRzIG9mIG90aGVyIHRoaW5ncyAoIGVnIHJlYnVpbGRpbmcgbG90cyBvZiANCj4gc3R1ZmYg
dW5kZXIgR2VudG9vICkgLi4uIEkgZG9uJ3QgaGF2ZSBhIGdlbmVyYWwgc3RhYmlsaXR5IGlzc3Vl
IGV2ZW4gDQo+IHVuZGVyIGhvdXJzIG9mIGhpZ2ggbG9hZC4gQnV0IGFmdGVyIHJlc3RhcnRpbmcg
Ym9pbmMgd2l0aCB0aGF0IHNhbWUgDQo+IHNldGlhdGhvbWUgdGFzayAuLi4gPGJhbmc+IQ0KPg0K
PiBJZiBzb21lb25lIHdhbnRzIG1lIHRvIHNhY3JpZmljZSBhbm90aGVyIGluc3RhbGxhdGlvbiwg
dGhleSBjYW4gcG9pbnQgDQo+IG1lIHRvIGluc3RydWN0aW9ucyBmb3IgdHJ5aW5nIHRvIGdhdGhl
ciBtb3JlIGluZm9ybWF0aW9uLg0KDQpJZiB5b3Ugd2FudCB0byByaXNrIGFub3RoZXIgaW5zdGFs
bGF0aW9uLCBpdCBtYXkgYmUgYSBnb29kIGlkZWEgdG8gZG8gaXQgDQpvbiBhIHNwYXJlIGhhcmQg
ZHJpdmUsIG9yIGEgc3BhcmUgcGFydGl0aW9uIG9uIHlvdXIgZXhpc3RpbmcgaGFyZCBkcml2ZS4g
DQpBbHNvLCB1c2UgYSBtb3JlIGNvbnZlbnRpb25hbCBjaG9pY2Ugb2YgZmlsZSBzeXN0ZW0uIEEg
c2ltcGxlIGV4dDQgaXMgDQpwcmV0dHkgcm9idXN0IGluIG15IGV4cGVyaWVuY2UuIFdlIGdldCBo
YXJkIGxvY2t1cHMgYWxsIHRoZSB0aW1lLiBJIA0KdXN1YWxseSBvbmx5IHJlaW5zdGFsbCBteSBz
eXN0ZW0gZm9yIGJpZyBPUyB1cGdyYWRlcyBvciBpZiBJJ20gc3R1cGlkIA0KYW5kIG1lc3Mgc29t
ZXRoaW5nIHVwIG15c2VsZi4NCg0KV2hpY2ggR1BVIGFyZSB5b3UgdXNpbmc/DQoNClRoZXJlIGFy
ZSBzb21lIHRoaW5ncyB5b3UgY291bGQgdHJ5IHRvIG5hcnJvdyBkb3duIHRoZSBjYXVzZSBvZiB5
b3VyIA0KcHJvYmxlbS4NCg0KIDEuIE1vbml0b3IgR1BVIHRlbXBlcmF0dXJlIHdoaWxlIHJ1bm5p
bmcgc2V0aWF0aG9tZQ0KIDIuIElmIHlvdSdyZSBidWlsZGluZyB5b3VyIG93biBrZXJuZWwsIGVu
YWJsZSBzb21lIGhlbHBmdWwga2VybmVsIGRlYnVnDQogICAgb3B0aW9ucyB0aGF0IGNhbiBwcm92
aWRlIHZlcnkgaGVscGZ1bCBkaWFnbm9zdGljIGluZm86IGxvY2sNCiAgICBkZWJ1Z2dpbmcsIG1l
bW9yeSBkZWJ1Z2dpbmcsIGxvY2t1cC9oYW5nIGRlYnVnZ2luZw0KIDMuIFRyeSBydW5uaW5nIHdp
dGggbG93ZXIgR1BVIGNsb2NrcyAocm9jbS1zbWkgLS1zZXRwZXJmbGV2ZWwgbG93KS4gSWYNCiAg
ICB0aGF0IGZpeGVzIGl0LCB5b3UgbWF5IGhhdmUgaW5hZGVxdWF0ZSBjb29saW5nIG9yIHBvd2Vy
IHN1cHBseQ0KIDQuIFRyeSBydW5uaW5nIGluIGNvbnNvbGUgbW9kZSAod2l0aG91dCBYc2VydmVy
IG9yIG90aGVyIGdyYXBoaWNhbCBVSQ0KICAgIHJ1bm5pbmcpLiBJZiB0aGF0IGZpeGVzIGl0LCB0
aGVyZSBtYXkgYmUgYSBiYWQgaW50ZXJhY3Rpb24gYmV0d2Vlbg0KICAgIGdyYXBoaWNzIGFuZCBj
b21wdXRlDQogNS4gVHJ5IHVwZGF0aW5nIHlvdXIgZmlybXdhcmUuIFRoZSBES01TIHBhY2thZ2Ug
aW5jbHVkZWQgaW4gb3VyIFJPQ20NCiAgICByZWxlYXNlcyBpbmNsdWRlcyB0aGUgbGF0ZXN0IGZp
cm13YXJlLiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gZXh0cmFjdA0KICAgIGl0IGZyb20gdGhlcmUg
YW5kIGRyb3AgaXQgaW50byAvbGliL2Zpcm13YXJlL2FtZGdwdQ0KIDYuIFRyeSB0byBmaW5kIGEg
cmVncmVzc2lvbiBwb2ludC4gSXMgdGhlcmUgYW55IGtub3duIHZlcnNpb24gb2YgUk9DbQ0KICAg
IG9yIHRoZSBrZXJuZWwgd2hlcmUgaXQgd29ya2VkIGNvcnJlY3RseT8NCg0KUmVnYXJkcywNCiDC
oCBGZWxpeA0KDQoNCj4NCj4gQW55d2F5IC4uLiBwZXJoYXBzIG1vcmUgd29yayBhcm91bmQgZGV0
ZWN0aW5nIGFuZCByZWNvdmVyaW5nIGZyb20gR1BVIA0KPiBsb2NrdXBzIGlzIGluIG9yZGVyPw0K
Pg0KPiBEYW4NCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
