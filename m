Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19542D5E
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 19:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954F7894B7;
	Wed, 12 Jun 2019 17:23:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F790894B7
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 17:23:43 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3129.namprd12.prod.outlook.com (20.178.31.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 17:23:40 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 17:23:40 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yang,
 Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYRMIA
Date: Wed, 12 Jun 2019 17:23:40 +0000
Message-ID: <30020639-13d8-05dc-a6e4-bef8a8618f87@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
In-Reply-To: <20190612151250.816-1-Philip.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.53.123]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65127904-df0b-4ffe-0885-08d6ef5ab60f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3129; 
x-ms-traffictypediagnostic: DM6PR12MB3129:
x-microsoft-antispam-prvs: <DM6PR12MB31298AEAF2E67207C2FBE19892EC0@DM6PR12MB3129.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(2501003)(3846002)(36756003)(110136005)(65956001)(66066001)(446003)(73956011)(66946007)(58126008)(65806001)(86362001)(229853002)(66476007)(64756008)(66556008)(52116002)(31696002)(316002)(99286004)(76176011)(5660300002)(66446008)(6512007)(14444005)(11346002)(256004)(102836004)(7736002)(305945005)(6246003)(6506007)(476003)(386003)(53546011)(2616005)(478600001)(26005)(14454004)(486006)(6486002)(53936002)(186003)(8936002)(72206003)(71190400001)(8676002)(81166006)(25786009)(31686004)(81156014)(64126003)(71200400001)(65826007)(2906002)(6636002)(6116002)(6436002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3129;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +9S3rhr3on01vPYcNep5q47612zyCzg+6ilkMnTxp2k+1Wyi2fnhkLUbh8Mlf58zhUqBaXP7ArqRju8WksPpw04aBnu8//yzoUDYhjtr/eToTMgoab3e1kU6qFD1FdVhiG9l/8rcMYRuJkaR7+7396jhorp2gnE9usMmGAQ2MCyByLVHOX08ANMKO2VQp/nUW+BuPaXLmii2e/2CthGrqVSF26PxOgTadrJkrReO+LGipZlyfnQLzpfNlRoMqTRqQ1G0HG4VtYdn75siMpgTG9Z6hmkvkb4HQyiWfSE9iXBRViCXLgCUvW6iobF3zLviEhsgOMkwVxMRzJ+ndxap+s6DZpHpXsQy7iVzOGXKjfonTYfaiF9kfRQZPnAS1Xwn9Ij4cAbjyHp2ZkPScn74PVbHTK5+sveEKerWePKYc/0=
Content-ID: <6DAF36B3C2DD2C43857CB90BD632D600@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65127904-df0b-4ffe-0885-08d6ef5ab60f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 17:23:40.3005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMYzLCg6cUpKY1EHolMleA2BWkT5/g/plQxWKugcOFI=;
 b=18YUZN0SsW2NyYyldY+OldKHZPpEpIUlYxrFaPEzwbosr6NhzhhtA0vpQEZBI3KE3izSai6fejeehCO85+AbxwNes3WiTJ5e4gbiSs5AvdNS5KqgXTe5fpvSm1IXJVEc/+Tny7/oZo99/RDJ9Gyk2OORL3NjPRqqtpoIMn4SgB8=
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

VFRNIGl0c2VsZiBoYXMgc29tZSBsb2dpYyBmb3IgbmVlZF9kbWEzMiBhbmQgVFRNX1BBR0VfRkxB
R19ETUEzMi4gSSANCmJlbGlldmUgdGhhdCBzaG91bGQgYWxyZWFkeSBoYW5kbGUgdGhpcy4gbmVl
ZF9kbWEzMiBpcyBwYXNzZWQgZnJvbSANCmFtZGdwdSB0byB0dG1fYm9fZGV2aWNlX2luaXQgdG8g
YmRldi0+bmVlZF9kbWEzMi4gdHRtX3R0X2NyZWF0ZSANCnRyYW5zbGF0ZXMgdGhhdCB0byBwYWdl
X2ZsYWdzIHw9IFRUTV9QQUdFX0ZMQUdfRE1BMzIgYW5kIHBhc3NlcyB0aGF0IHRvIA0KYmRldi0+
ZHJpdmVyLT50dG1fdHRfY3JlYXRlLiBUaGUgdHdvIHBhZ2UgYWxsb2NhdG9ycyBpbiB0dG1fcGFn
ZV9hbGxvYy5jIA0KYW5kIHR0bV9wYWdlX2FsbG9jX2RtYS5jIGNoZWNrIHR0bS0+cGFnZV9mbGFn
cy4gSXMgdGhhdCBjaGFpbiBicm9rZW4gDQpzb21ld2hlcmU/IE92ZXJyaWRpbmcgZ2xvYi0+bWVt
X2dsb2ItPm51bV96b25lcyBmcm9tIGFtZGdwdSBzZWVtcyB0byBiZSANCmEgYml0IG9mIGEgaGFj
ay4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQpPbiAyMDE5LTA2LTEyIDg6MTMsIFlhbmcsIFBo
aWxpcCB3cm90ZToNCj4gVFRNIGNyZWF0ZSB0d28gem9uZXMsIGtlcm5lbCB6b25lIGFuZCBkbWEz
MiB6b25lIGZvciBzeXN0ZW0gbWVtb3J5LiBJZg0KPiBzeXN0ZW0gbWVtb3J5IGFkZHJlc3MgYWxs
b2NhdGVkIGlzIGJlbG93IDRHQiwgdGhpcyBhY2NvdW50IHRvIGRtYTMyIHpvbmUNCj4gYW5kIHdp
bGwgZXhoYXVzdCBkbWEzMiB6b25lIGFuZCB0cmlnZ2VyIHVubmVzc3NhcnkgVFRNIGV2aWN0aW9u
Lg0KPg0KPiBQYXRjaCAiZHJtL3R0bTogQWNjb3VudCBmb3Iga2VybmVsIGFsbG9jYXRpb25zIGlu
IGtlcm5lbCB6b25lIG9ubHkiIG9ubHkNCj4gaGFuZGxlIHRoZSBhbGxvY2F0aW9uIGZvciBhY2Nf
c2l6ZSwgdGhlIHN5c3RlbSBtZW1vcnkgcGFnZSBhbGxvY2F0aW9uIGlzDQo+IHRocm91Z2ggdHRt
X21lbV9nbG9iYWxfYWxsb2NfcGFnZSB3aGljaCBzdGlsbCBhY2NvdW50IHRvIGRtYTMyIHpvbmUg
aWYNCj4gcGFnZSBpcyBiZWxvdyA0R0IuDQo+DQo+IENoYW5nZS1JZDogSTI4OWI4NWQ4OTFiOGY2
NGExNDIyYzQyYjFlYWIzOTgwOThhYjdlZjcNCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcg
PFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBpbmRl
eCAyNzc4ZmY2M2Q5N2QuLjc5YmI5ZGZlNjE3YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBAQCAtMTY4Niw2ICsxNjg2LDEwIEBAIGludCBhbWRncHVf
dHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgCX0NCj4gICAJYWRldi0+
bW1hbi5pbml0aWFsaXplZCA9IHRydWU7DQo+ICAgDQo+ICsJLyogT25seSBrZXJuZWwgem9uZSAo
bm8gZG1hMzIgem9uZSkgaWYgZGV2aWNlIGRvZXMgbm90IHJlcXVpcmUgZG1hMzIgKi8NCj4gKwlp
ZiAoIWFkZXYtPm5lZWRfZG1hMzIpDQo+ICsJCWFkZXYtPm1tYW4uYmRldi5nbG9iLT5tZW1fZ2xv
Yi0+bnVtX3pvbmVzID0gMTsNCj4gKw0KPiAgIAkvKiBXZSBvcHQgdG8gYXZvaWQgT09NIG9uIHN5
c3RlbSBwYWdlcyBhbGxvY2F0aW9ucyAqLw0KPiAgIAlhZGV2LT5tbWFuLmJkZXYubm9fcmV0cnkg
PSB0cnVlOw0KPiAgIA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
