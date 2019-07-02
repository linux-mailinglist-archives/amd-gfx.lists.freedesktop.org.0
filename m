Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7193D5D696
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 21:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E326E032;
	Tue,  2 Jul 2019 19:08:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22B6E032
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 19:08:24 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4026.namprd12.prod.outlook.com (10.255.175.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 19:08:21 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:08:21 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Topic: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Index: AQHVJ510MSBuJg2pPEm3H7nb3OJCdKak6/4wgAADFYCAEtS4AA==
Date: Tue, 2 Jul 2019 19:08:21 +0000
Message-ID: <62b7d07c-6f5d-c00f-3d92-5796eb0317a8@amd.com>
References: <20190620192155.20226-1-Felix.Kuehling@amd.com>
 <BL0PR12MB2580EA675A1B1F9AE6EC4B3F80E40@BL0PR12MB2580.namprd12.prod.outlook.com>
 <2d78acdf-7d6c-d0c5-8fe0-ff26dc7ce3cb@amd.com>
In-Reply-To: <2d78acdf-7d6c-d0c5-8fe0-ff26dc7ce3cb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a9f9721-b7b4-41ef-83b3-08d6ff20a667
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4026; 
x-ms-traffictypediagnostic: DM6PR12MB4026:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB40261F2B459FF071F955922792F80@DM6PR12MB4026.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(189003)(199004)(13464003)(31686004)(58126008)(316002)(36756003)(14454004)(65826007)(99286004)(6512007)(186003)(229853002)(966005)(53936002)(6246003)(52116002)(478600001)(2501003)(65806001)(110136005)(72206003)(65956001)(6486002)(6436002)(25786009)(66066001)(26005)(5660300002)(11346002)(3846002)(8676002)(305945005)(81156014)(66556008)(66476007)(66446008)(102836004)(86362001)(66946007)(6306002)(53546011)(31696002)(14444005)(2906002)(476003)(64756008)(446003)(6116002)(71200400001)(2616005)(73956011)(486006)(76176011)(256004)(64126003)(71190400001)(6506007)(7736002)(68736007)(386003)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4026;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HOrcruLdQy6Xk8TkcZ/NuTc7No5DK2KB3O0++WP2j3m280MlR56DWzFV+wGTOox71qeXU2esmQexbLJPHY6aeQg6zCxc4ej6I36QtAPJ9poj4NtHZNx7KOyAC77icMohnPMQDz5IWenXgrQxyVT28VS64kZP8NsISLOVS6CTHyA5rSZHKdzn/rbN2gg3gwsl3ZF7p3BOFkzuF1iV+SAob5smPaHhY9PKUgiQsiHARdTTfpjAo9ITpgriw86g6f+5t5LHAc/+Nro4ZqE9hG+DG+bheTAICn9qv3c4/uCWErtvLC/hrk34uLGGdD6aBpXKPlY+unetF5kUvnhCsDRWz3L1OCY5k20wqsrN8at1QA8RvINHeYvJrri0UfEXO41zN3HZl7BDgzjNoioBkKbqh3bm+53hGJDiMYZzs1vH5mw=
Content-ID: <9994C553DFD6D943B56EB8FE2C5845A7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9f9721-b7b4-41ef-83b3-08d6ff20a667
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:08:21.8330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8VVJV48qCYqFlyOmHuprD4iRQyOnF0eFoLCeFttWHo=;
 b=P/Nb3huRXZy/b0QNp9kPi/C88KAn4bB0LP8l0anqDruQ6SrqZw/7+HQU+1aB9z/p4tXuhHiryoRbuGVCPLdNZpJ3T6Pt5YGtGA34getEBoB1VcQFC8vmG4Kq9hES7LNQsG7rHW8XRtSLKY6YonLfn6FYVtnRWQu/jWUBdRKOU58=
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

UGluZy4NCg0KT2FrLCBjYW4gSSBnZXQgeW91ciBSZXZpZXdlZC1ieSBmb3IgdGhpcyBwYXRjaCBz
ZXJpZXM/DQoNClRoYW5rLA0KIMKgIEZlbGl4DQoNCk9uIDIwMTktMDYtMjAgMzozNCBwLm0uLCBL
dWVobGluZywgRmVsaXggd3JvdGU6DQo+IFllcy4gTUVDIGZpcm13YXJlIHZlcnNpb24gIzQyNSBz
aG91bGQgaGF2ZSB0aGUgbmVjZXNzYXJ5IGNoYW5nZS4NCj4NCj4gUmVnYXJkcywNCj4gICDCoCBG
ZWxpeA0KPg0KPiBPbiAyMDE5LTA2LTIwIDM6MjMgcC5tLiwgWmVuZywgT2FrIHdyb3RlOg0KPj4g
SGkgRmVsaXgsDQo+Pg0KPj4gRG9lcyB0aGlzIHJlcXVpcmUgYSBNRUMgZmlybXdhcmUgY2hhbmdl
Pw0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBPYWsNCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mIEt1ZWhsaW5nLCBGZWxpeA0KPj4gU2VudDogVGh1cnNkYXksIEp1
bmUgMjAsIDIwMTkgMzoyMiBQTQ0KPj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+PiBDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4gU3Vi
amVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGtmZDogQWRkIGNoYWluZWRfcnVubGlzdF9pZGxlX2Rp
c2FibGUgZmxhZyB0byBwbTRfbWVzX3J1bmxpc3QNCj4+DQo+PiBOZXcgZmxhZyB0byBkaXNhYmxl
IGFuIGlkbGUgcnVubGlzdCBvcHRpbWl6YXRpb24gdGhhdCBpcyBjYXVzaW5nIHNvZnQgaGFuZ3Mg
d2l0aCBzb21lIGRpZmZ1bHQtdG8tcmVwcm9kdWNlIGN1c3RvbWVyIHdvcmtsb2Fkcy4gVGhpcyB3
aWxsIHNlcnZlIGFzIGEgd29ya2Fyb3VuZCB1bnRpbCB0aGUgcHJvYmxlbSBjYW4gYmUgcmVwcm9k
dWNlZCBhbmQgdGhlIHJvb3QtY2F1c2UgZGV0ZXJtaW5lZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmggfCAyICstDQo+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJz
X2FpLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaA0K
Pj4gaW5kZXggNDlhYjY2YjcwM2ZhLi5lM2UyMTQwNGNmYTAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaA0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgNCj4+IEBAIC0xMjAs
NyArMTIwLDcgQEAgc3RydWN0IHBtNF9tZXNfcnVubGlzdCB7DQo+PiAgICAJCQl1aW50MzJfdCBp
Yl9zaXplOjIwOw0KPj4gICAgCQkJdWludDMyX3QgY2hhaW46MTsNCj4+ICAgIAkJCXVpbnQzMl90
IG9mZmxvYWRfcG9sbGluZzoxOw0KPj4gLQkJCXVpbnQzMl90IHJlc2VydmVkMjoxOw0KPj4gKwkJ
CXVpbnQzMl90IGNoYWluZWRfcnVubGlzdF9pZGxlX2Rpc2FibGU6MTsNCj4+ICAgIAkJCXVpbnQz
Ml90IHZhbGlkOjE7DQo+PiAgICAJCQl1aW50MzJfdCBwcm9jZXNzX2NudDo0Ow0KPj4gICAgCQkJ
dWludDMyX3QgcmVzZXJ2ZWQzOjQ7DQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBs
aXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
