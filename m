Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E742E4C
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 20:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C74089805;
	Wed, 12 Jun 2019 18:06:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BCE89805
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 18:06:17 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB0266.namprd12.prod.outlook.com (10.174.107.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 12 Jun 2019 18:06:15 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.012; Wed, 12 Jun 2019
 18:06:15 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYRMIAgAAL5YA=
Date: Wed, 12 Jun 2019 18:06:15 +0000
Message-ID: <bdbcb7d9-4783-d6dd-e448-c311cd695517@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <30020639-13d8-05dc-a6e4-bef8a8618f87@amd.com>
In-Reply-To: <30020639-13d8-05dc-a6e4-bef8a8618f87@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c3f99c0-1d7d-4202-6d34-08d6ef60a8f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0266; 
x-ms-traffictypediagnostic: DM5PR1201MB0266:
x-microsoft-antispam-prvs: <DM5PR1201MB0266A6476A57EDA82430FD3AE6EC0@DM5PR1201MB0266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(102836004)(86362001)(99286004)(72206003)(68736007)(25786009)(36756003)(81156014)(31686004)(81166006)(8676002)(8936002)(53936002)(6246003)(66066001)(31696002)(110136005)(76176011)(386003)(53546011)(478600001)(5660300002)(6506007)(14454004)(256004)(52116002)(316002)(14444005)(229853002)(6486002)(476003)(66446008)(66556008)(66946007)(73956011)(66476007)(71190400001)(71200400001)(6512007)(305945005)(7736002)(6436002)(486006)(11346002)(446003)(64756008)(26005)(186003)(2616005)(3846002)(2501003)(6116002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0266;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X+r+sFPjy7WCkmUKS815ZrtInrCZfXmv7mVhM4/fHgQk6IiiDaufV1SjQoxf3MOT5znSf7qWkSHQ/TPLw0AqtlWpXgd8bsZk2CZ6Qoiu8U8B6NqCiGJTHv/Y2JAc78xEMwiESj4LQDpOh6vWh3WH3Q3aDZj3A+IDMD/uaiEJwnzvpjJ7ZxtVY95mkkaLTL2GlLXIPA28RIEDmiAF5/F/kbDXRW7iiwjiC2ynn9kCtPmg0y/DibNDTdynks/79iAeeEL7GGdzt3kfrLmxRjv1ATr1VH2ThPzmomkTUu6jbvWkWTgHn5q5SA08mz7D0wuF2oRY+bhmR68TIfUyBWgkrZIJB5sshZR1rlrU9TGaWlpoTljlAqNTLoeJB45vG1LzgGvxooGxlvakINETO6vkbIgEQ27t3CeQZjb0+F5k4Sk=
Content-ID: <C5A79E499403C845AD9118F05B50E179@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3f99c0-1d7d-4202-6d34-08d6ef60a8f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 18:06:15.5902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwHM2PuJSpUbSQYvexQlmBtJdqy6DVb7HL2rTnv/bLQ=;
 b=SDzRU5zI42yuojADdp4Z0N8g9MvSZvVvZU5E8/uG6TTFKfihfUeQ9rlsAXn+1IF3TBe1EB77WEwoLH4mmuzKuEtSCGBWH9DpF6cKjsm9XnMZ/bLHN6Cxobsiv31jxnZyqgLOwe+brpTAEDlxejlsFVPzZyN7TDz8jr9F0al+GnU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

VGhhdCdzIGtpbmQgb2YgaGFjayBiZWNhdXNlIGRtYTMyIHpvbmUgaXMgbm90IG5lZWRlZCwgaXQg
aGFzIGJhZCBlZmZlY3QgDQp0byB0cmlnZ2VyIHVubmVjZXNzYXJ5IGV2aWN0aW9uIGZvciBLRkRU
ZXN0LkJpZ0J1ZlN0cmVzc1Rlc3QuIEJ1dCANCnR0bV9ib19nbG9iYWxfaW5pdC0+dHRtX21lbV9n
bG9iYWxfaW5pdCBhbHdheXMgY3JlYXRlIGRtYTMyIHpvbmUgd2l0aG91dCANCmFjY2VwdGluZyBh
bnkgcGFyYW1ldGVyLg0KDQpUbyBhdm9pZCB0dG1fbWVtX2dsb2JhbF9hbGxvY19wYWdlIGFjY291
bnQgdG8gZG1hMzIgem9uZSwgYW5vdGhlciBvcHRpb24gDQppcyB0byBhZGQgYSBuZXcgZmxhZyB0
byB0dG1fb3BlcmF0aW9uX2N0eC0+ZmxhZ3MsIHRoYXQgbG9va3Mgbm90IGdvb2QgDQplaXRoZXIu
DQoNClRoYW5rcywNClBoaWxpcA0KDQpPbiAyMDE5LTA2LTEyIDE6MjMgcC5tLiwgS3VlaGxpbmcs
IEZlbGl4IHdyb3RlOg0KPiBUVE0gaXRzZWxmIGhhcyBzb21lIGxvZ2ljIGZvciBuZWVkX2RtYTMy
IGFuZCBUVE1fUEFHRV9GTEFHX0RNQTMyLiBJDQo+IGJlbGlldmUgdGhhdCBzaG91bGQgYWxyZWFk
eSBoYW5kbGUgdGhpcy4gbmVlZF9kbWEzMiBpcyBwYXNzZWQgZnJvbQ0KPiBhbWRncHUgdG8gdHRt
X2JvX2RldmljZV9pbml0IHRvIGJkZXYtPm5lZWRfZG1hMzIuIHR0bV90dF9jcmVhdGUNCj4gdHJh
bnNsYXRlcyB0aGF0IHRvIHBhZ2VfZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19ETUEzMiBhbmQgcGFz
c2VzIHRoYXQgdG8NCj4gYmRldi0+ZHJpdmVyLT50dG1fdHRfY3JlYXRlLiBUaGUgdHdvIHBhZ2Ug
YWxsb2NhdG9ycyBpbiB0dG1fcGFnZV9hbGxvYy5jDQo+IGFuZCB0dG1fcGFnZV9hbGxvY19kbWEu
YyBjaGVjayB0dG0tPnBhZ2VfZmxhZ3MuIElzIHRoYXQgY2hhaW4gYnJva2VuDQo+IHNvbWV3aGVy
ZT8gT3ZlcnJpZGluZyBnbG9iLT5tZW1fZ2xvYi0+bnVtX3pvbmVzIGZyb20gYW1kZ3B1IHNlZW1z
IHRvIGJlDQo+IGEgYml0IG9mIGEgaGFjay4NCj4gDQo+IFJlZ2FyZHMsDQo+ICAgwqAgRmVsaXgN
Cj4gDQo+IE9uIDIwMTktMDYtMTIgODoxMywgWWFuZywgUGhpbGlwIHdyb3RlOg0KPj4gVFRNIGNy
ZWF0ZSB0d28gem9uZXMsIGtlcm5lbCB6b25lIGFuZCBkbWEzMiB6b25lIGZvciBzeXN0ZW0gbWVt
b3J5LiBJZg0KPj4gc3lzdGVtIG1lbW9yeSBhZGRyZXNzIGFsbG9jYXRlZCBpcyBiZWxvdyA0R0Is
IHRoaXMgYWNjb3VudCB0byBkbWEzMiB6b25lDQo+PiBhbmQgd2lsbCBleGhhdXN0IGRtYTMyIHpv
bmUgYW5kIHRyaWdnZXIgdW5uZXNzc2FyeSBUVE0gZXZpY3Rpb24uDQo+Pg0KPj4gUGF0Y2ggImRy
bS90dG06IEFjY291bnQgZm9yIGtlcm5lbCBhbGxvY2F0aW9ucyBpbiBrZXJuZWwgem9uZSBvbmx5
IiBvbmx5DQo+PiBoYW5kbGUgdGhlIGFsbG9jYXRpb24gZm9yIGFjY19zaXplLCB0aGUgc3lzdGVt
IG1lbW9yeSBwYWdlIGFsbG9jYXRpb24gaXMNCj4+IHRocm91Z2ggdHRtX21lbV9nbG9iYWxfYWxs
b2NfcGFnZSB3aGljaCBzdGlsbCBhY2NvdW50IHRvIGRtYTMyIHpvbmUgaWYNCj4+IHBhZ2UgaXMg
YmVsb3cgNEdCLg0KPj4NCj4+IENoYW5nZS1JZDogSTI4OWI4NWQ4OTFiOGY2NGExNDIyYzQyYjFl
YWIzOTgwOThhYjdlZjcNCj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFu
Z0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgfCA0ICsrKysNCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+PiBpbmRleCAy
Nzc4ZmY2M2Q5N2QuLjc5YmI5ZGZlNjE3YiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jDQo+PiBAQCAtMTY4Niw2ICsxNjg2LDEwIEBAIGludCBhbWRncHVf
dHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgICAJfQ0KPj4gICAgCWFk
ZXYtPm1tYW4uaW5pdGlhbGl6ZWQgPSB0cnVlOw0KPj4gICAgDQo+PiArCS8qIE9ubHkga2VybmVs
IHpvbmUgKG5vIGRtYTMyIHpvbmUpIGlmIGRldmljZSBkb2VzIG5vdCByZXF1aXJlIGRtYTMyICov
DQo+PiArCWlmICghYWRldi0+bmVlZF9kbWEzMikNCj4+ICsJCWFkZXYtPm1tYW4uYmRldi5nbG9i
LT5tZW1fZ2xvYi0+bnVtX3pvbmVzID0gMTsNCj4+ICsNCj4+ICAgIAkvKiBXZSBvcHQgdG8gYXZv
aWQgT09NIG9uIHN5c3RlbSBwYWdlcyBhbGxvY2F0aW9ucyAqLw0KPj4gICAgCWFkZXYtPm1tYW4u
YmRldi5ub19yZXRyeSA9IHRydWU7DQo+PiAgICANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
