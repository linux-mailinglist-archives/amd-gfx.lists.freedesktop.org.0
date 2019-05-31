Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85631584
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 21:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86D8893A4;
	Fri, 31 May 2019 19:42:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC05893A4
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 19:42:51 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2889.namprd12.prod.outlook.com (20.179.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Fri, 31 May 2019 19:42:49 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 19:42:49 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Topic: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Index: AQHVFvW7FwLiVzA03k2ytJmujZXksaaEQkeAgAE8UICAACWJgA==
Date: Fri, 31 May 2019 19:42:49 +0000
Message-ID: <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
 <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
In-Reply-To: <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f0c4073-b3b2-41f9-7af2-08d6e60029b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2889; 
x-ms-traffictypediagnostic: DM6PR12MB2889:
x-microsoft-antispam-prvs: <DM6PR12MB288974C60B2E2FEBD1FC39B592190@DM6PR12MB2889.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(26005)(110136005)(6506007)(31696002)(86362001)(71200400001)(66476007)(6486002)(316002)(99286004)(66556008)(186003)(25786009)(66446008)(478600001)(256004)(7736002)(68736007)(14444005)(65806001)(65956001)(66066001)(52116002)(53546011)(2616005)(486006)(476003)(76176011)(11346002)(71190400001)(386003)(72206003)(14454004)(2501003)(36756003)(446003)(5660300002)(58126008)(102836004)(64756008)(66946007)(64126003)(53936002)(73956011)(81156014)(2906002)(305945005)(229853002)(81166006)(65826007)(6116002)(3846002)(6512007)(31686004)(6436002)(8936002)(6246003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2889;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U4ZspGna6KEUSu4RblnbmJWLcTRVRuh7dXSBvbgK4SlAv5IoVfGSxja/p4zUtimNC8xg4lTrwOFCMK8e/ITllJ1hDWwoZAlXTwGR4BIVvmR9ZJ5XSsxGtb4gGltykBUW0JaocNu4qRRyFNOj0rYukVrJ5GSGKyMjl6EcAFSpbndUz3vsE9d4KWSckgJqC0gP2ufY92bc/Xf/F3f7yx3KxlXheewmMTv3Ea6SSkffZgV/TSRAyZz8PoimoxXFJmpCUYPO72aTKeSH/XW0NZTjgEhUxxnaS94WUQNpFppugj81WpkJCYpeGiV1Itj0loqTBK5HQ9IqhRwNxIjw8r43Ko8yAW19DvRKRG1JKjB79OXxibm3jkMitUNf1lH2TGf3Ra2E76lgxcBbDsFf0NlOmZpV4jLR086Hv9JRsoA/ZA8=
Content-ID: <E14BEEB7AAC34442A8A44CA799B1172C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0c4073-b3b2-41f9-7af2-08d6e60029b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 19:42:49.5680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2889
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIoQwbDgxeqW3LgANERP+M/yuhNvtLnmI330NbSKNfY=;
 b=RMINWmS5O2h7adIIOSkgsPBQb6Q8rVQlPubqnnKWLJpEohj73PpDsAJ1lJCDoSaYGtpyhIkI1DU5j5u2nFEfxUvRvGJmGFabBRncMVSH11Qk0wBwY8QbO/toi7oP3x9RNoDpSzTmawiChOef3D9cJpeUlNGm5s75+06dAZEpUvc=
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

T24gMjAxOS0wNS0zMSAxOjI4IHAubS4sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4NCj4gT24gMjAx
OS0wNS0zMCA2OjM2IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+PiAgICAgDQo+Pj4g
ICAgICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpDQo+Pj4gLQlpZiAo
Z3R0LT5yYW5nZXMgJiYNCj4+PiAtCSAgICB0dG0tPnBhZ2VzWzBdID09IGhtbV9wZm5fdG9fcGFn
ZSgmZ3R0LT5yYW5nZXNbMF0sDQo+Pj4gLQkJCQkJICAgICBndHQtPnJhbmdlc1swXS5wZm5zWzBd
KSkNCj4+PiArCWlmIChndHQtPnJhbmdlICYmDQo+Pj4gKwkgICAgdHRtLT5wYWdlc1swXSA9PSBo
bW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5nZSwNCj4+PiArCQkJCQkJICAgICAgZ3R0
LT5yYW5nZS0+cGZuc1swXSkpDQo+PiBJIHRoaW5rIGp1c3QgY2hlY2tpbmcgZ3R0LT5yYW5nZSBo
ZXJlIGlzIGVub3VnaC4gSWYgZ3R0LT5yYW5nZSBpcyBub3QNCj4+IE5VTEwgaGVyZSwgd2UncmUg
bGVha2luZyBtZW1vcnkuDQo+Pg0KPiBJZiBqdXN0IGNoZWNraW5nIGd0dC0+cmFuZ2UsIHRoZXJl
IGlzIGEgZmFsc2Ugd2FybmluZyBpbiBhbWRncHVfdGVzdA0KPiB1c2VycHRyIGNhc2UgaW4gYW1k
Z3B1X2NzX2xpc3RfdmFsaWRhdGUgcGF0aC4gSWYgdXNlcnB0ciBpcyBpbnZhbGlkYXRlZCwNCj4g
dGhlbiB0dG0tPnBhZ2VzWzBdIGlzIG91dGRhdGVkIHBhZ2VzLCBsb2JqLT51c2VyX3BhZ2VzIGlz
IG5ldyBwYWdlcywgaXQNCj4gZ29lcyB0byB0dG1fdHRfdW5iaW5kIGZpcnN0IHRvIHVucGluIG9s
ZCBwYWdlcyAodGhpcyBjYXVzZXMgZmFsc2UNCj4gd2FybmluZykgdGhlbiBjYWxsIGFtZGdwdV90
dG1fdHRfc2V0X3VzZXJfcGFnZXMuDQoNCkJ1dCBkb2Vzbid0IHRoYXQgbWVhbiB3ZSdyZSBsZWFr
aW5nIHRoZSBndHQtPnJhbmdlIHNvbWV3aGVyZT8NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoN
Cj4NCj4gSSB3aWxsIHN1Ym1pdCBwYXRjaCB2MiwgdG8gYWRkIHJldHJ5IGlmIGhtbV9yYW5nZV9m
YXVsdCByZXR1cm5zIC1FQUdBSU4uDQo+IHVzZSBremFsbG9jIHRvIGFsbG9jYXRlIHNtYWxsIHNp
emUgcmFuZ2UuDQo+DQo+IFRoYW5rcywNCj4gUGhpbGlwDQo+DQo+PiBSZWdhcmRzLA0KPj4gICAg
wqAgRmVsaXgNCj4+DQo+Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
