Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF34449F2
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2019 19:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7489349;
	Thu, 13 Jun 2019 17:51:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780077.outbound.protection.outlook.com [40.107.78.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514FA89349
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:51:47 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2534.namprd12.prod.outlook.com (52.132.141.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 17:51:45 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1965.018; Thu, 13 Jun 2019
 17:51:45 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Yang, Philip"
 <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYZ8eAgAAdTACAAMOkAIAAdsyAgAAKsgCAABS0AA==
Date: Thu, 13 Jun 2019 17:51:45 +0000
Message-ID: <c7283b04-7b2b-bc44-c38d-c2030410c9fb@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
 <8af5593f-10aa-5654-76d3-7be9622dae4e@amd.com>
 <21c5935a-513f-be45-8513-de45fa0fed4d@amd.com>
 <9841bd53-6cfd-acef-c786-2d46df903598@amd.com>
 <e2242be6-0ec4-e5b9-6efc-cad958b666a4@amd.com>
In-Reply-To: <e2242be6-0ec4-e5b9-6efc-cad958b666a4@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::23) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ae69e74-6191-482f-3b13-08d6f027cce2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2534; 
x-ms-traffictypediagnostic: DM5PR12MB2534:
x-microsoft-antispam-prvs: <DM5PR12MB25349C829E5A11E549C3FB9683EF0@DM5PR12MB2534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(366004)(39860400002)(136003)(199004)(51914003)(189003)(81156014)(305945005)(6506007)(386003)(53936002)(8936002)(65806001)(7736002)(68736007)(99286004)(81166006)(6116002)(65956001)(102836004)(8676002)(186003)(64126003)(66946007)(6512007)(229853002)(6436002)(52116002)(65826007)(36756003)(2906002)(64756008)(25786009)(110136005)(66446008)(66476007)(2501003)(476003)(11346002)(446003)(58126008)(256004)(66556008)(46003)(486006)(6486002)(73956011)(31686004)(71200400001)(2616005)(72206003)(14454004)(316002)(5660300002)(14444005)(478600001)(31696002)(86362001)(6246003)(76176011)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2534;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YQ/82aisGmN2yBpmsQ55vjK9J2cexNgLjud3rCQaXxYgU9CseXwjBNfjuwsBFlnX8pMlxM3/8ollo9HXn/k3L6ixYtkpnPKO2wxzqXu6JUiAnOy7SpRXRYhuw7YsjRi1zUQLExHvUGn7fmN3SzmuATzCxvBXLUUfDyxYfIpgSyf8gCh9ijRAfV0QBJL7pNFu+j7H96Kujv2PgPGphzbMl+EvfwNCf3dQ8D6C0Y3vGJfDJs18pErxxSnTWFnumYFk4GBRPqkx6sm5whOJdSd3IAyYK0ypFv+jewis1xbdzKZzNdYMj5zEOaieWOYFUngQ1xFrtOP2QwxtcG9FNaEjlku0YEYhebHSupi6fX+j5MLrilU27SO7f5yuuLJo00Z2Yj0PKTN/zyRHN7eT4cYXvfa8/svQCh2MdStCj1g242Q=
Content-ID: <E62DA8CEB957884593B326ADECC15A9F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae69e74-6191-482f-3b13-08d6f027cce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 17:51:45.4155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Brx9pgmTtkabQpUJOEwK0hI7Y5va42DGq7XNY519hcE=;
 b=Kf+7cpU2N9gNHi7fQxUgoMRsdaYKtgDK8yZdg1hyrShwnZ5WaAakQFPYdi5sJlYF0FQz89TBT4c4SoK4N8l1BiwKYEQNs9QKOewU7xRiW2lXtCtJIZTmnXugU4+dBtHzIV60+YLP0ra7cFRZD5vpuX8TnsfJmYQvZwfFQkIx2q4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMTMuMDYuMTkgdW0gMTg6Mzcgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IFtTTklQXQ0K
Pj4+PiBUaGVyZSBpcw0KPj4+PiBhbiBpc3N1ZSBmb3VuZCBieSBLRkRUZXN0LkJpZ0J1ZlN0cmVz
c1Rlc3QsIGl0IGFsbG9jYXRlcyBidWZmZXJzIHVwIHRvDQo+Pj4+IDMvOCBvZiB0b3RhbCAyNTZH
QiBzeXN0ZW0gbWVtb3J5LCBlYWNoIGJ1ZmZlciBzaXplIGlzIDEyOE1CLCB0aGVuIHVzZQ0KPj4+
PiBxdWV1ZSB0byB3cml0ZSB0byB0aGUgYnVmZmVycy4gSWYgdHRtX21lbV9nbG9iYWxfYWxsb2Nf
cGFnZSBnZXQgcGFnZSBwZm4NCj4+Pj4gaXMgYmVsb3cgNEdCLCBpdCBhY2NvdW50IHRvIGRtYTMy
IHpvbmUgYW5kIHdpbGwgZXhoYXVzdCAyR0IgbGltaXQsIHRoZW4NCj4+Pj4gdHRtX2NoZWNrX3N3
YXBwaW5nIHdpbGwgc2NoZWR1bGUgdHRtX3Nocmlua193b3JrIHRvIHN0YXJ0IGV2aWN0aW9uLiBJ
dA0KPj4+PiB0YWtlcyBtaW51dGVzIHRvIGZpbmlzaCByZXN0b3JlIChyZXRyeSBtYW55IHRpbWVz
IGlmIGJ1c3kpLCB0aGUgdGVzdA0KPj4+PiBmYWlsZWQgYmVjYXVzZSBxdWV1ZSB0aW1lb3V0LiBU
aGlzIGV2aWN0aW9uIGlzIHVubmVjZXNzYXJ5IGJlY2F1c2Ugd2UNCj4+Pj4gc3RpbGwgaGF2ZSBl
bm91Z2ggZnJlZSBzeXN0ZW0gbWVtb3J5Lg0KPj4+IE5vIHRoYXQgaXMgZGVmaW5pdGVseSBuZWNl
c3NhcnkuIEZvciBleGFtcGxlIG9uIG15IExhcHRvcCBpdCdzIHRoZSBzb3VuZA0KPj4+IHN5c3Rl
bSB3aGljaCBuZWVkcyBETUEzMi4NCj4+Pg0KPj4+IFdpdGhvdXQgdGhpcyB3aGVuIGFuIGFwcGxp
Y2F0aW9uIHVzZXMgYSBsb3Qgb2YgbWVtb3J5IHdlIHJ1biBpbnRvIHRoZQ0KPj4+IE9PTSBraWxs
ZXIgYXMgc29vbiBhcyBzb21lIGF1ZGlvIHN0YXJ0cyBwbGF5aW5nLg0KPj4+DQo+PiBJIGRpZCBu
b3QgcmVhbGl6ZSBUVE0gaXMgdXNlZCBieSBvdGhlciBkcml2ZXJzLiBJIGFncmVlIHdlIGNhbm5v
dCByZW1vdmUNCj4+IGRtYTMyIHpvbmUsIHRoaXMgd2lsbCBicmVhayBvdGhlciBkZXZpY2UgZHJp
dmVycyB3aGljaCBkZXBlbmRzIG9uIGRtYTMyDQo+PiB6b25lLg0KPiBJZiBJIHVuZGVyc3RhbmQg
Q2hyaXN0aWFuIGNvcnJlY3RseSwgdGhlIHBvaW50IGlzIG5vdCB0aGF0IG90aGVyIGRyaXZlcnMN
Cj4gdXNlIFRUTSwgYnV0IG90aGVyIGRyaXZlcnMgbmVlZCBkbWEzMiBtZW1vcnkgKG1lbW9yeSB3
aXRoIDMyLWJpdA0KPiBwaHlzaWNhbCBhZGRyZXNzZXMpLiBJZiBUVE0gdXNlZCB1cCBhbGwgdGhh
dCBtZW1vcnksIGl0IHdvdWxkIGJyZWFrDQo+IHRob3NlIG90aGVyIGRyaXZlcnMuIEFzIGEgZ29v
ZCBzdGV3YXJkIG9mIG1lbW9yeSwgVFRNIGxpbWl0cyBpdHMgdXNhZ2UNCj4gb2YgZG1hMzIgbWVt
b3J5IGluIG9yZGVyIHRvIGFsbG93IG90aGVyIGRyaXZlcnMgdG8gaGF2ZSBhY2Nlc3MgdG8gaXQu
DQoNClllcywgZXhhY3RseS4NCg0KPg0KPiBSZWdhcmRzLA0KPiAgIMKgIEZlbGl4DQo+DQo+DQo+
Pj4+IEl0J3MgcmFuZG9tIGNhc2UsIGhhcHBlbnMgYWJvdXQgMS81LiBJIGNhbiBjaGFuZ2UgdGVz
dCB0byBpbmNyZWFzZSB0aGUNCj4+Pj4gdGltZW91dCB2YWx1ZSB0byB3b3JrYXJvdW5kIHRoaXMs
IGJ1dCB0aGlzIHNlZW1zIFRUTSBidWcuIFRoaXMgd2lsbCBzbG93DQo+Pj4+IGFwcGxpY2F0aW9u
IHBlcmZvcm1hbmNlIGEgbG90IGlmIHRoaXMgcmFuZG9tIGlzc3VlIGhhcHBlbnMuDQo+Pj4gT25l
IHRoaW5nIHdlIGNvdWxkIHRyeSBpcyB0byBkaWcgaW50byB3aHkgdGhlIGtlcm5lbCBnaXZlcyB1
cyBETUEzMg0KPj4+IHBhZ2VzIHdoZW4gdGhlcmUgYXJlIHN0aWxsIG90aGVyIHBhZ2VzIGF2YWls
YWJsZS4gUGxlYXNlIHRha2UgYSBsb29rIGF0DQo+Pj4gL3Byb2MvYnVkZHlpbmZvIG9uIHRoYXQg
Ym94IGZvciB0aGlzLg0KPj4+DQo+PiBUaGFua3MgZm9yIHRoZSBhZHZpc2UsIGZyb20gYnVkZHlp
bmZvLCB0aGUgbWFjaGluZSBoYXMgNCBub2RlcywgZWFjaA0KPj4gbm9kZSBoYXMgNjRHQiBtZW1v
cnksIGFuZCBkbWEzMiB6b25lIGlzIG9uIG5vZGUgMC4gQmlnQnVmU3RyZXNzVGVzdA0KPj4gYWxs
b2NhdGUgOTZHQi4gSWYgSSBmb3JjZSB0aGUgdGVzdCBvbiBub2RlIDEsICJudW1hY3RsIC0tY3B1
bm9kZWJpbmQ9MQ0KPj4gLi9rZmR0ZXN0Iiwgbm8gZXZpY3Rpb24gYXQgYWxsLiBJZiBJIGZvcmNl
IHRoZSB0ZXN0IG9uIG5vZGUgMCwgaXQgYWx3YXlzDQo+PiBoYXMgZXZpY3Rpb24gYW5kIHJlc3Rv
cmUgYmVjYXVzZSBpdCB1c2VkIHVwIGFsbCBtZW1vcnkgaW5jbHVkaW5nIGRtYTMyDQo+PiB6b25l
IGZyb20gbm9kZSAwLiBJIHdpbGwgY2hhbmdlIHRlc3QgYXBwIHRvIGF2b2lkIHJ1bm5pbmcgb24g
bm9kZSAwIHRvDQo+PiB3b3JrYXJvdW5kIHRoaXMuDQoNClRoYXQgaXMgYSByZWFsbHkgaW50ZXJl
c3RpbmcgdGVzdCBjYXNlIHlvdSBnb3QgaGVyZS4NCg0KSSBhY3R1YWxseSB0aGluayB0aGF0IGV4
aGF1c3RpbmcgRE1BMzIgYmVmb3JlIGxvb2tpbmcgaW50byBhbm90aGVyIG51bWEgDQpub2RlIGlz
IGEgYnVnIGluIHRoZSBjb3JlIE1NLg0KDQpBbnl3YXkgSSB3aWxsIHB1dCBpdCBvbiBteSBUT0RP
IGxpc3QgdG8gaW1wcm92ZSB0aGUgaGFuZGxpbmcgaW4gVFRNLCANCnNob3VsZG4ndCBiZSBtb3Jl
IHRoYW4gYSBkYXkgb3IgdHdvIG9mIHdvcmsuDQoNClRpbGwgdGhhdCdzIGRvbmUgdGhlIHdvcmth
cm91bmQgb2Ygbm90IHVzaW5nIG5vZGUgMCBzaG91bGQgZG8gaXQuDQoNCkNocmlzdGlhbi4NCg0K
Pj4NCj4+IFRoYW5rcywNCj4+IFBoaWxpcA0KPj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
