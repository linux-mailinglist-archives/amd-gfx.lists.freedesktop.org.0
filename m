Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385E9D55D
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 20:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4016E283;
	Mon, 26 Aug 2019 18:03:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888006E283
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 18:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBO3RH14J18K45dGbJnIzLwLyOAOZ7EOIVXOetFGapEzIGI4TB7oUZPmWeaN/zu3lAQ9CmBNeCrxisHMOzR0ZP0ESvaix/EVlpHwKPfwXPS3FuvAg+LnGmlrebc86/SfA1k6Xik3M0dCepIRR5zqCjuNInTzsqbTzyHORJLwWXMqmMP4CPiqvgVa4+8bcPNMfGs4nHZ7YqMr/HgBh0yP0K4mckIkv+0XrgoeZPtqkqKw0+a4FQHkXxZi56mQaP0lQLfyTrx+272YFbBTxw5j/zG4VV6/LJZU5+qOREGvheoTOX85pFCNuV3iEZt9UAM68O4E/JtBzkWwHuXK/z3Agg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBNKsL01E4w2Kyta6pTpqO25TIRHRrd6PgrC6F0EbDg=;
 b=gq8mIFBs/roAac7qKAAg1jJHOl6+LjzX/t/X7Xg1F/8HV0rnuWwAkx32hG4GPaPSF/Mip6qb8DVN8s4bugzkTp8HY3FOjRw1QY/ApF+P984SHX7j8wXBVBq0Lj4hKZzXjfuurDQyRzGqtnhgwfBPjP2O77+yhTzW9+0nR9CUYMAq43JkcSJnKWjcUscTycz0brYReN7QXWCMPN/PPhVeQTb24Od2TceoEcH7XE7U7Z5AYi6DMGOzHe/wOyHaWoYZqCVugaiUxpav70rpu1c03bXP0YCXJe4Nb3CLkOlVDyEsL2QP5CFMStuzOY11LfkbP1F53RQaWiFMmEc0FNHyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4204.namprd12.prod.outlook.com (10.141.184.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 18:03:34 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 18:03:34 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpyCsVjPVucSk2VZpnIFr9zeacKJd+AgABW24CAACt4AIAC7oOAgAAZWoCAAA0gAA==
Date: Mon, 26 Aug 2019 18:03:34 +0000
Message-ID: <216f63db-78c5-1098-bea5-2f379b0bf051@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
 <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
 <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
 <4b48fc1a-6ee2-bb60-0518-ea9c6346b8d6@amd.com>
 <89bf5baa-4b63-e40a-7995-fa35bad988b7@amd.com>
In-Reply-To: <89bf5baa-4b63-e40a-7995-fa35bad988b7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::19) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dfcbae4-d1cb-46bb-eb26-08d72a4fb5f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4204; 
x-ms-traffictypediagnostic: DM6PR12MB4204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42042CA903E655C724D176A492A10@DM6PR12MB4204.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(65956001)(66066001)(65806001)(8936002)(186003)(305945005)(102836004)(99286004)(26005)(7736002)(36756003)(229853002)(2616005)(52116002)(81166006)(386003)(3846002)(6116002)(6246003)(76176011)(110136005)(53546011)(8676002)(2501003)(256004)(58126008)(6436002)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(11346002)(476003)(2906002)(71190400001)(14444005)(86362001)(31696002)(31686004)(25786009)(14454004)(6512007)(4326008)(478600001)(6486002)(53936002)(71200400001)(66574012)(6506007)(486006)(81156014)(316002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4204;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fNU12yYJWRY8/4WJt09c0Om0+/3vaQESXrZF/6T09cmCEmXTSCVByHY0FwlIjjO/2rCDYPouH0Ez1f5EVK4yWFzPMpgjnF1XzqSUYo4Af8WIGpyNFb4u1lHtbZw+LRte5FBpW62mhwnEFRVNW077BQHK2sctVjPXkK5CHII9XjJVBLTVvKd28LsKi6oETYkDPNH4xnNlCYXHVk2VLHkVvSLzI2HUwQNB8ekvOWGxO6b4vC6nAXwXGevBHUCUyhJwPhsqtzQuiaAMbojsmnXi7HMRu8DJ3GVk5dlESD8WQWweShlmplALc68UU3w+gjK3g9mwYmB7pDofJeifXsMuGZ+kSOjQnSoDzMWkIH6+7LHMjFjOQI5Nggs5ftI72wRspcqebQAQLR17hpY2wgtJmoBx/HjQ0JwFmHyU5qK6RCs=
Content-ID: <C0BE5D151FC8F24795D9EDDF900C8136@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfcbae4-d1cb-46bb-eb26-08d72a4fb5f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:03:34.1676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8gXTqiQDvF9UB0zZvuKQkaSJsirGikwWwl9VQMwhBLRa98wyKNYGzqTkzGrd+hM7pd68LtUxoJUEzFWOepOdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBNKsL01E4w2Kyta6pTpqO25TIRHRrd6PgrC6F0EbDg=;
 b=ifVk6kQ24XPgTVuKTsnQRvCy1abW0Zs2tsRVh75MZUX8NIBFyKaJ2oa3+xqmzSuPkzbTiYe3eZ6Ed9QPi+zqPfGWjUtvX2QULoxfGVESz0xSyV91tv69niZ5h6aELR4XtmSMw3eUZ7zNiIFQGBVeyr4HBgHSmyPMWx1S7sulrRM=
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

T24gMjAxOS0wOC0yNiAxOjE2IHAubS4sIHdyb3RlOg0KPiBBbSAyNi4wOC4xOSB1bSAxNzo0NSBz
Y2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoNCj4+IE9uIDIwMTktMDgtMjQgMjo1OSBwLm0uLCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4+IEFtIDI0LjA4LjE5IHVtIDE4OjI0IHNjaHJpZWIgS3Vl
aGxpbmcsIEZlbGl4Og0KPj4+PiBPbiAyMDE5LTA4LTI0IDc6MTMsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6DQo+Pj4+PiBBbSAyMy4wOC4xOSB1bSAyMzozMyBzY2hyaWViIEt1ZWhsaW5nLCBGZWxp
eDoNCj4+Pj4+PiBGcm9tOiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4+Pj4+Pg0KPj4+
Pj4+IFNldCBzbm9vcGVkIFBURSBmbGFnIGFjY29yZGluZyB0byBtYXBwaW5nIGZsYWcuIFdyaXRl
IHJlcXVlc3QgdG8gYQ0KPj4+Pj4+IHBhZ2Ugd2l0aCBzbm9vcGVkIGJpdCBzZXQsIHdpbGwgc2Vu
ZCBvdXQgaW52YWxpZGF0ZSBwcm9iZSByZXF1ZXN0DQo+Pj4+Pj4gdG8gVENDIG9mIHRoZSByZW1v
dGUgR1BVIHdoZXJlIHRoZSB2cmFtIHBhZ2UgcmVzaWRlcy4NCj4+Pj4+Pg0KPj4+Pj4+IENoYW5n
ZS1JZDogSTc5OWY2OGVjN2E1YTFhYmYzMjA3NWY1ZWYzMTA1MTY0MWEwYjM3MzYNCj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4+Pj4+PiAtLS0NCj4+
Pj4+PiAgIMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDMgKysr
DQo+Pj4+Pj4gICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+Pj4+Pg0K
Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
DQo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+Pj4+Pj4g
aW5kZXggOWFhZmNkYTZjNDg4Li44YTdjNGVjNjlhZTggMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+Pj4+PiBAQCAtNjA0LDYgKzYwNCw5IEBA
IHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRlX2ZsYWdzKHN0cnVjdA0KPj4+Pj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+Pj4gICDCoMKgwqDCoMKgwqAgaWYgKGZsYWdzICYg
QU1ER1BVX1ZNX1BBR0VfUFJUKQ0KPj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlX2Zs
YWcgfD0gQU1ER1BVX1BURV9QUlQ7DQo+Pj4+Pj4gICDCoMKgICvCoMKgwqAgaWYgKGZsYWdzICYg
QU1ER1BVX1ZNX1BBR0VfSU5WQUxJREFURV9QUk9CRSkNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
cHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9TTk9PUEVEOw0KPj4+Pj4+ICsNCj4+Pj4+IFRoYXQgaXMg
c3RpbGwgYSBOQUsgd2l0aG91dCBmdXJ0aGVyIGNoZWNrcy4gV2UgbmVlZCB0byBtYWtlIGFic29s
dXRlbHkNCj4+Pj4+IHN1cmUgdGhhdCB3ZSBkb24ndCBzZXQgdGhpcyB3aGVuIFBDSWUgcm91dGlu
ZyBpcyBpbiB1c2UuDQo+Pj4+IFRoZSBvbmx5IHBsYWNlIHdoZXJlIEFNREdQVV9WTV8uLi4gZmxh
Z3MgYXJlIGFjY2VwdGVkIGZyb20gdXNlciBtb2RlDQo+Pj4+IHNlZW1zIHRvIGJlIGFtZGdwdV9n
ZW1fdmFfaW9jdGwuIEl0IGhhcyBhbiBleHBsaWNpdCBzZXQgb2YgdmFsaWRfZmxhZ3MNCj4+Pj4g
aXQgYWNjZXB0cy4gVGhlIG5ldyBJTlZBTElEQVRFX1BST0JFIGZsYWcgaXMgbm90IHBhcnQgb2Yg
aXQuIFRoYXQgbWVhbnMNCj4+Pj4gdXNlciBtb2RlIHdpbGzCoCBub3QgYmUgYWJsZSB0byBzZXQg
aXQgZGlyZWN0bHkuIElmIHdlIGFkZGVkIGl0IHRvIHRoZQ0KPj4+PiBzZXQgb2YgdmFsaWRfZmxh
Z3MgaW4gYW1kZ3B1X2dlbV92YV9pb2N0bCwgd2UnZCBuZWVkIHRvIGFkZCBhcHByb3ByaWF0ZQ0K
Pj4+PiBjaGVja3MgYXQgdGhlIHNhbWUgdGltZS4NCj4+Pj4NCj4+Pj4gS0ZEIGRvZXMgbm90IGV4
cG9zZSBBTURHUFVfVk1fLi4uIGZsYWdzIGRpcmVjdGx5IHRvIHVzZXIgbW9kZS4gSXQgb25seQ0K
Pj4+PiBzZXRzIHRoZSBJTlZBTElEQVRFX1BST0JFIGZsYWcgaW4ga2VybmVsIG1vZGUgZm9yIG1h
cHBpbmdzIGluIHRoZSBzYW1lDQo+Pj4+IFhHTUkgaGl2ZSBvbiBBcnR1cnVzIChpbiBwYXRjaCA0
KS4NCj4+Pj4NCj4+Pj4gSWYgdGhlcmUgaXMgc29tZXRoaW5nIEknbSBtaXNzaW5nLCBwbGVhc2Ug
cG9pbnQgaXQgb3V0LiBCdXQgQUZBSUNUIHRoZQ0KPj4+PiBjaGVja2luZyB0aGF0IGlzIGN1cnJl
bnRseSBkb25lIHNob3VsZCBzYXRpc2Z5IHlvdXIgcmVxdWlyZW1lbnRzLg0KPj4+IFRoZSBoYXJk
d2FyZSBiZWhhdmlvciBkZXBlbmRzIG9uIHRoZSBwbGFjZW1lbnQgb2YgdGhlIGJ1ZmZlciwgc28g
YXQNCj4+PiBiYXJlIG1pbmltdW0gd2UgbmVlZCB0byBjaGVjayBpZiBpdCdzIHBvaW50aW5nIHRv
IFBDSWUgb3IgbG9jYWwgKGNoZWNrDQo+Pj4gdGhlIHN5c3RlbSBiaXQpLg0KPj4+DQo+Pj4gQnV0
IGV2ZW4gaWYgaXQncyBsb2NhbCB3aGF0IGlzIHRoZSBiZWhhdmlvciBmb3IgbG9jYWwgbWVtb3J5
PyBFLmcuIG5vdA0KPj4+IGFjY2Vzc2VkIHRocm91Z2ggWEdNST8NCj4+Pg0KPj4+IEFzIGZhciBh
cyBJIGNhbiBzZWUgd2hhdCB3ZSBuZWVkIHRvIGNoZWNrIGhlcmUgaXMgdGhhdCB0aGlzIGlzIGEN
Cj4+PiByZW1vdGUgYWNjZXNzIG92ZXIgWEdNSSBhbmQgdGhlbiAoYW5kIG9ubHkgdGhlbiEpIHdl
IGFyZSBhbGxvd2VkIHRvDQo+Pj4gc2V0IHRoZSBzbm9vcCBiaXQgb24gdGhlIFBURS4NCj4+IE15
IHBvaW50IGlzLCB0aGUgb25seSBwbGFjZSB3aGVyZSB0aGlzIGJpdCBjYW4gZ2V0IHNldCByaWdo
dCBub3cgaXMgaW4NCj4+IGtlcm5lbCBtb2RlIGluIGFtZGdwdV9hbWRrZmRfZ3B1dm0uYy4gU2Vl
IHBhdGNoIDQgb2YgbXkgc2VyaWVzLiBUaGF0DQo+PiBjb2RlIGFscmVhZHkgaGFzIGFsbCB0aGUg
cmlnaHQgY29uZGl0aW9ucyB0byBtYWtlIHN1cmUgdGhlDQo+PiBJTlZBTElEQVRFX1BST0JFIGJp
dCBpcyBvbmx5IHNldCBpbiB0aGUgY29ycmVjdCBjaXJjdW1zdGFuY2VzIChyZW1vdGUNCj4+IFhH
TUkgbWFwcGluZ3MgaW4gdGhlIHNhbWUgaGl2ZSk6DQo+Pg0KPj4+ICsJc3dpdGNoIChhZGV2LT5h
c2ljX3R5cGUpIHsNCj4+PiArCWNhc2UgQ0hJUF9BUkNUVVJVUzoNCj4+PiArCQlpZiAobWVtLT5h
bGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19WUkFNKSB7DQo+Pj4gKwkJCWlmIChib19hZGV2
ID09IGFkZXYpIHsNCj4+PiArCQkJCS4uLg0KPj4+ICsJCQl9IGVsc2Ugew0KPj4+ICsJCQkJLi4u
DQo+Pj4gKwkJCQlpZiAoYW1kZ3B1X3hnbWlfc2FtZV9oaXZlKGFkZXYsIGJvX2FkZXYpKQ0KPj4+
ICsJCQkJCW1hcHBpbmdfZmxhZ3MgfD0NCj4+PiArCQkJCQkJQU1ER1BVX1ZNX1BBR0VfSU5WQUxJ
REFURV9QUk9CRTsNCj4+PiArCQkJfQ0KPj4+ICsJCX0gZWxzZSB7DQo+PiBJIHRoaW5rIHlvdSdy
ZSBhc2tpbmcgbWUgdG8gYWRkIGFuIGV4dHJhIGNoZWNrIGZvciB0aGUgc2FtZSBjb25kaXRpb25z
DQo+PiBpbiB0aGUgR01DIGNvZGU/IExpa2UgR01DIGRvZXNuJ3QgdHJ1c3QgYW1kZ3B1X2FtZGtm
ZC4gSXQgc2VlbXMNCj4+IGNvbXBsZXRlbHkgcmVkdW5kYW50IGFuZCBhIGJpdCBwYXJhbm9pZCB0
byBtZS4NCj4gV2VsbCB0aGUgam9iIG9mIHRoZSBWTSBjb2RlIGlzIHRvIGZpZ3VyZSBvdXQgdGhl
IGZsYWdzIGFuZCBsb2NhdGlvbiBmb3INCj4gdGhlIFBURSBiYXNlZCBvbiB0aGUgY3VycmVudCBw
bGFjZW1lbnQgQk8gYW5kIHRoZSBmbGFncyBnaXZlbiBmb3IgdGhlDQo+IG1hcHBpbmcuDQo+DQo+
IEFuZCB5ZXMgdGhhdCBpbXBsaWVzIHRoYXQgd2UgZG9uJ3QgdHJ1c3QgdXBwZXIgbGF5ZXJzIHRv
IGRvIHRoaXMgaW5zdGVhZC4NCg0KSSBjb25zaWRlciBhbWRncHVfYW1ka2ZkX2dwdXZtIGFzIHBh
cnQgb2YgdGhlIGxvd2VyIGxheWVyLiBJdCBoYXMgDQpjb250cm9sIG92ZXIgdGhlIHBsYWNlbWVu
dCBvZiB0aGUgYnVmZmVycy4NCg0KVGhhdCBzYWlkLCBpZiB0aGUgR01DIGNvZGUgaGFzIHRvIGZp
Z3VyZSBvdXQgdGhlIFBURSBtYXBwaW5nIGZsYWdzIGJhc2VkIA0Kb24gdGhlIGxvY2F0aW9uIG9m
IHRoZSBidWZmZXIgYW5kIHRoZSBpbnRlbmRlZCB1c2FnZSwgaXQnbGwgYmUgaGFyZCB0byANCmF2
b2lkIHNvbWUgb2YgdGhlIGFic3RyYWN0aW9ucyB5b3UgY3JpdGljaXplZCBpbiBPYWsncyBwYXRj
aCBzZXJpZXMuIFlvdSANCmNhbid0IGhhdmUgaXQgYm90aCB3YXlzLiBFaXRoZXIgeW91IGdpdmUg
dXNlciBtb2RlIHRoZSByZXNwb25zaWJpbGl0eSB0byANCmtub3cgYWxsIHRoZSBIVyBkZXRhaWxz
IGFuZCBsZXQgdXNlciBtb2RlIGRldGVybWluZSB0aGUgbXR5cGUgYW5kIGZsYWdzIA0KKHdoaWNo
IGlzIHdoYXQgeW91IGN1cnJlbnRseSBkbyBpbiB0aGUgR0VNIGludGVyZmFjZSksIG9yIHlvdSBs
ZXQgdGhlIFZNIA0KY29kZSBkZXRlcm1pbmUgdGhlIGZsYWdzIGJhc2VkIG9uIG1vcmUgYWJzdHJh
Y3QgaW5mb3JtYXRpb24gZnJvbSB1c2VyIG1vZGUuDQoNCkkgc2VlIHRoaXMgZGlzY3Vzc2lvbiBt
b3ZpbmcgdG93YXJkcyBhIG1vcmUgYWJzdHJhY3QgaW50ZXJmYWNlLiBJJ2xsIHNlZSANCmlmIEkg
Y2FuIGFkZCB0aGF0IGludG8gdGhlIEdNQyBJUCB3aXRob3V0IGJyZWFraW5nIHRoZSBleGlzdGlu
ZyBBTURHUFUgDQpHRU0gQVBJcy4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4NCj4+IGdt
Y192OV8wX2dldF92bV9wdGVfZmxhZ3MgZG9lc24ndCBldmVuIGhhdmUgYWxsIHRoZSBpbmZvcm1h
dGlvbiBpdCBuZWVkcyB0byBtYWtlIHRoYXQgZGV0ZXJtaW5hdGlvbi4NCj4gV2VsbCB0aGVuIHdl
IHByb2JhYmx5IG5lZWQgdG8gY2hhbmdlIHRoYXQuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzdGlh
bi4NCj4NCj4+IFJlZ2FyZHMsDQo+PiAgICDCoCBGZWxpeA0KPj4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
