Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9FA96B5
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 00:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CDC89CB2;
	Wed,  4 Sep 2019 22:48:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F389CB2
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 22:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0V9tamvqabeGASRHYN/9/jfcxyK8kF8nivkE7a0TuJ3lhkfOcevP5lgaRy3O0vDhlauJAGR4Dd7EFQ2SBL1KtBgtQz40tN9QPqRvKPgWYpK4JeoUBANqhCa5xUn7MQfwumJX73r3Lm9NmCvBxQvNJTZQewqsNP/139KHKJUfSlVRA37tcSpzicgzDJ+aAh1dkBrpiew0SZtqm1zhwwEZf8x9Yq/w4ePC4mGvhfyJcHLSdtFP6d4Jjx9Uvp2Lv9Tz4i8cVYdtuiRUYovueqQc8K8xTRLsx/Aprs4wnfvtXWQm2CIkHnDVmOJqbs934wu8cDM+GGyvRZqQW/Yxm0rFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lktt1fBZcOyM7L9a6z+tn/6bMc+a+8XFR4qBkydPZOk=;
 b=B6Nu07wxNDwNe3jz72UW1Y0eHp4MRJcKiUAtKQnInsLbnxyniFAqSK9fHVPVeaPpoDkumo5hKC+1GhzzynP3f6kiBuo5GaR3i3hvXBgXKTV7ClNaktm6nkI8n6aNDJxhvtVnf04BjCajcGg9xfFJfhrQ1hLMD1VUmaATq9mF07gDsNX33NKQ7hsmxSqPpatgYMkYaBGyYac07cCTKf5FyggbkRTG4IzLJ9N6gKX9lPd7iaOIs36qvHSMAnLR+8Hd0gyJRTeWRWFYLjBOaz3qsIVN+RDOXNtu0OYIEalb61tccFGX7/0LuXUl/39S/FexGl7zoS6gPqO4wtfkPwr2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2825.namprd12.prod.outlook.com (20.177.221.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 22:48:44 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:48:44 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/amdgpu: allow direct submission of PDE updates.
Thread-Topic: [PATCH 4/9] drm/amdgpu: allow direct submission of PDE updates.
Thread-Index: AQHVYzHQ0/Q9LAKOFkGmHvS7WP/QbKccH2qA
Date: Wed, 4 Sep 2019 22:48:44 +0000
Message-ID: <871e7831-bc07-7bd9-618e-c2b60fab7417@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <20190904150230.13885-5-christian.koenig@amd.com>
In-Reply-To: <20190904150230.13885-5-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b6f4a1a-2006-4d55-a180-08d7318a0a05
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2825; 
x-ms-traffictypediagnostic: DM6PR12MB2825:
x-microsoft-antispam-prvs: <DM6PR12MB282552B8AAD4CCA0B5A7A96292B80@DM6PR12MB2825.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(199004)(189003)(71200400001)(31696002)(6486002)(8676002)(186003)(110136005)(81166006)(81156014)(65806001)(65956001)(66066001)(53546011)(6506007)(386003)(66574012)(26005)(6512007)(446003)(86362001)(8936002)(14444005)(36756003)(31686004)(52116002)(6246003)(58126008)(256004)(478600001)(66556008)(66476007)(486006)(71190400001)(66446008)(53936002)(229853002)(5660300002)(11346002)(2616005)(64756008)(316002)(476003)(2906002)(14454004)(99286004)(15650500001)(7736002)(76176011)(6116002)(3846002)(6436002)(102836004)(25786009)(2501003)(305945005)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2825;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +xc/m31Kt/jYVjF0+nwMRG+44u1PxZc+X0C04L+wM0eyllBeEduFP/P9sbaBW5b4vHvOJmHp6wWDaWl+zVKkZjJqF9GYsWw2dM5TWgiNPtNy5Ou4RM5wR5fRek6BTiuzc+SEgyjXfdc6qF/QgWvHQy0j0e5b72cjjB82yOOhftDiqypEVJOStv7eiD2tpGt4yQH9bH68t/Cbysq+9kTGlGCOX/Sarkr3OjW5MBSSOADwydL/wGMBN/V/CoAUnZY4X78HqTYw0GZERu+RbRqVUj2ju2N9Ir4aCPQnkCrqp4gpujM58ngXURRDSnrQyS+VMlTKe6ipq/5vL7hLGJeZlOuuDZ2pCJnWJImJ235Q4EncoGuVPK0ovRUpeN3IGU7DPka+vFvkMYt1PZH2igsSfgHpC5ePd9wE124vsSwjiac=
x-ms-exchange-transport-forked: True
Content-ID: <0620CED527EA974588AC466C1432E929@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6f4a1a-2006-4d55-a180-08d7318a0a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:48:44.1602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuLbrBZ12YqPgV7PO+Fq//t9bTKYO8etV7Fe54zGAz3Y2WgO0TaZKduq/rVjbeZwWBYxQp+9wsvaQ7RfJdWKQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2825
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lktt1fBZcOyM7L9a6z+tn/6bMc+a+8XFR4qBkydPZOk=;
 b=tbYUtfJPwhHFV/nZ0t3bxTPbt0bUlJqTBv/0tx8opeq9bodv/IQTOIVTW4NxgYNAQbAW4gRws42rYdx4uZNjn0zmHbZzG2Z7ggQOzxrxK31bihN6E1z8O5sjInP5gjSfjRhMVA5gcAOmwXHb7Sq4nqRQ4JzeAztow+hyOAHB1es=
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

T24gMjAxOS0wOS0wNCAxMTowMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBGb3Ig
aGFuZGxpbmcgUERFIHVwZGF0ZXMgZGlyZWN0bHkgaW4gdGhlIGZhdWx0IGhhbmRsZXIuDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jIHwgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5j
ICAgICAgICAgICB8IDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgICAgICAgICAgfCAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMgICAgICAgICAgIHwgOCArKysrKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5oICAgICAgICAgICB8IDQgKystLQ0KPiAgIDUgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCBiMGYwZTA2
MGRlZDYuLmQzOTQyZDkzMDZjNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBAQCAtMzQzLDcgKzM0Myw3IEBAIHN0YXRp
YyBpbnQgdm1fdXBkYXRlX3BkcyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgc3RydWN0IGFtZGdwdV9z
eW5jICpzeW5jKQ0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1f
YWRldihwZC0+dGJvLmJkZXYpOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAtCXJldCA9IGFtZGdw
dV92bV91cGRhdGVfZGlyZWN0b3JpZXMoYWRldiwgdm0pOw0KPiArCXJldCA9IGFtZGdwdV92bV91
cGRhdGVfcGRlcyhhZGV2LCB2bSwgZmFsc2UpOw0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJu
IHJldDsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4gaW5k
ZXggNTFmM2RiMDhiOGViLi5iZDZiODg4Mjc0NDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jcy5jDQo+IEBAIC04NDUsNyArODQ1LDcgQEAgc3RhdGljIGludCBhbWRn
cHVfY3Nfdm1faGFuZGxpbmcoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnApDQo+ICAgCWlmIChy
KQ0KPiAgIAkJcmV0dXJuIHI7DQo+ICAgDQo+IC0JciA9IGFtZGdwdV92bV91cGRhdGVfZGlyZWN0
b3JpZXMoYWRldiwgdm0pOw0KPiArCXIgPSBhbWRncHVfdm1fdXBkYXRlX3BkZXMoYWRldiwgdm0s
IGZhbHNlKTsNCj4gICAJaWYgKHIpDQo+ICAgCQlyZXR1cm4gcjsNCj4gICANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPiBpbmRleCBlN2FmMzVjNzA4MGQuLmE2MjFl
NjI5ZDg3NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0K
PiBAQCAtNTIxLDcgKzUyMSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9nZW1fdmFfdXBkYXRlX3Zt
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCWdvdG8gZXJyb3I7DQo+ICAgCX0N
Cj4gICANCj4gLQlyID0gYW1kZ3B1X3ZtX3VwZGF0ZV9kaXJlY3RvcmllcyhhZGV2LCB2bSk7DQo+
ICsJciA9IGFtZGdwdV92bV91cGRhdGVfcGRlcyhhZGV2LCB2bSwgZmFsc2UpOw0KPiAgIA0KPiAg
IGVycm9yOg0KPiAgIAlpZiAociAmJiByICE9IC1FUkVTVEFSVFNZUykNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gaW5kZXggZmMxMDNhOWYyMGM1Li5iNmM4OWJhOTI4
MWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IEBAIC0x
MjIxLDE4ICsxMjIxLDE5IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92bV9pbnZhbGlkYXRlX3Bkcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICB9DQo+ICAgDQo+ICAgLyoNCj4gLSAqIGFt
ZGdwdV92bV91cGRhdGVfZGlyZWN0b3JpZXMgLSBtYWtlIHN1cmUgdGhhdCBhbGwgZGlyZWN0b3Jp
ZXMgYXJlIHZhbGlkDQo+ICsgKiBhbWRncHVfdm1fdXBkYXRlXyAtIG1ha2Ugc3VyZSB0aGF0IGFs
bCBkaXJlY3RvcmllcyBhcmUgdmFsaWQNCg0KVHlwby4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0K
DQoNCj4gICAgKg0KPiAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXINCj4gICAgKiBA
dm06IHJlcXVlc3RlZCB2bQ0KPiArICogQGRpcmVjdDogc3VibWl0IGRpcmVjdGx5IHRvIHRoZSBw
YWdpbmcgcXVldWUNCj4gICAgKg0KPiAgICAqIE1ha2VzIHN1cmUgYWxsIGRpcmVjdG9yaWVzIGFy
ZSB1cCB0byBkYXRlLg0KPiAgICAqDQo+ICAgICogUmV0dXJuczoNCj4gICAgKiAwIGZvciBzdWNj
ZXNzLCBlcnJvciBmb3IgZmFpbHVyZS4NCj4gICAgKi8NCj4gLWludCBhbWRncHVfdm1fdXBkYXRl
X2RpcmVjdG9yaWVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAtCQkJCSBzdHJ1Y3Qg
YW1kZ3B1X3ZtICp2bSkNCj4gK2ludCBhbWRncHVfdm1fdXBkYXRlX3BkZXMoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkgIHN0cnVjdCBhbWRncHVfdm0gKnZtLCBib29sIGRpcmVj
dCkNCj4gICB7DQo+ICAgCXN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyBwYXJhbXM7DQo+
ICAgCWludCByOw0KPiBAQCAtMTI0Myw2ICsxMjQ0LDcgQEAgaW50IGFtZGdwdV92bV91cGRhdGVf
ZGlyZWN0b3JpZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCW1lbXNldCgmcGFy
YW1zLCAwLCBzaXplb2YocGFyYW1zKSk7DQo+ICAgCXBhcmFtcy5hZGV2ID0gYWRldjsNCj4gICAJ
cGFyYW1zLnZtID0gdm07DQo+ICsJcGFyYW1zLmRpcmVjdCA9IGRpcmVjdDsNCj4gICANCj4gICAJ
ciA9IHZtLT51cGRhdGVfZnVuY3MtPnByZXBhcmUoJnBhcmFtcywgQU1ER1BVX0ZFTkNFX09XTkVS
X1ZNLCBOVUxMKTsNCj4gICAJaWYgKHIpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5oDQo+IGluZGV4IDU0ZGNkMGJjY2UxYS4uMGE5N2RjODM5ZjNiIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiBAQCAtMzY2LDggKzM2Niw4IEBAIGlu
dCBhbWRncHVfdm1fdmFsaWRhdGVfcHRfYm9zKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwNCj4gICAJCQkgICAgICBpbnQgKCpjYWxsYmFjaykodm9pZCAq
cCwgc3RydWN0IGFtZGdwdV9ibyAqYm8pLA0KPiAgIAkJCSAgICAgIHZvaWQgKnBhcmFtKTsNCj4g
ICBpbnQgYW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFt
ZGdwdV9qb2IgKmpvYiwgYm9vbCBuZWVkX3BpcGVfc3luYyk7DQo+IC1pbnQgYW1kZ3B1X3ZtX3Vw
ZGF0ZV9kaXJlY3RvcmllcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gLQkJCQkgc3Ry
dWN0IGFtZGdwdV92bSAqdm0pOw0KPiAraW50IGFtZGdwdV92bV91cGRhdGVfcGRlcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCSAgc3RydWN0IGFtZGdwdV92bSAqdm0sIGJvb2wg
ZGlyZWN0KTsNCj4gICBpbnQgYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KPiAgIAkJCSAgc3RydWN0IGFtZGdwdV92bSAqdm0sDQo+ICAgCQkJICBzdHJ1
Y3QgZG1hX2ZlbmNlICoqZmVuY2UpOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
