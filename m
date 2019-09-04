Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A500A90F2
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 21:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078889415;
	Wed,  4 Sep 2019 19:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680071.outbound.protection.outlook.com [40.107.68.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4B89415
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 19:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWSms7DArCqc/WK2jGoJo9tofXIlI195n80aSjyQcg4APzoQZEjjVPE4nSXDRDYcC2kMCKDqkvegRgKrhwGgGJypG39a4Ce0kEA2D2k2e+JbS1FmJmWmTmhYcjkjIcaf4Y5TCxoTbktWV42fwQveJzkL3rIccIzmaRXMDGRWk4nPYXcf1VdJP3v2aobUMyNc8nCiqf2SOvsOMa2sGUotZnY/WuSFh7vGsFvBdLFpZbPgEc6FIGnDBDsXgdcA7BhBlGKDHuDJHsSBDqkXwb3mbNvrrFOPV5wSIyzH1Ox8uvletV3OInKQF+ceR6X3EoPL78/d1PKTtZQmuxkluMutzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PnmPmxq/iuyeKo6pQbZyz9MXQP0HBYKG2JQAySrYUs=;
 b=W2/MzUhLNKN3Q78LWsaRJ8R5I+2q0d3yk36ra71JPaaAZ9Fvub8qqsyXhtarIO6VtL5Hhz/7/u5lWhZ+1Udsrmz0OmqTlkv3yKcfiJp1r3gbs0eXWNvuU2QP4mwfzcLk4gDbFVvVHyBW3C+ePSyAy3RXBRsS1nj5Qbuf0wqoYeUFUl9mrTJlyYRUZn14CTlz1UhFK8n9qQby1wWjh5djtd/9n8jz4tnL/ei34AV2NcmIJAzG8HiYz2j5yRgNlpr2ujctKzMVXbCYpte519exiN03PjnAZHcY0VPJVhx0ZTY+tD3MfxnK6E+MVTeaXx2D4XRniTKnPIEcGYUmnYg+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3499.namprd12.prod.outlook.com (20.178.199.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Wed, 4 Sep 2019 19:38:31 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 19:38:31 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 02/10] drm/amdkfd: add renoir kfd device info
Thread-Topic: [PATCH 02/10] drm/amdkfd: add renoir kfd device info
Thread-Index: AQHVYzgxTQ2Ec34z+0yrFX18dC6Dz6cb6jgA
Date: Wed, 4 Sep 2019 19:38:31 +0000
Message-ID: <d0c57dac-d5c6-de6c-be9f-d70cbe0f3d96@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
 <20190904154803.5102-3-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-3-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::49) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce9c9dc0-6dd7-4203-2ffd-08d7316f779d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3499; 
x-ms-traffictypediagnostic: DM6PR12MB3499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34993948AB08374F83DF1A8E92B80@DM6PR12MB3499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(189003)(199004)(8936002)(66556008)(64756008)(31686004)(66446008)(2906002)(66476007)(305945005)(66946007)(7736002)(6116002)(5660300002)(446003)(6512007)(3846002)(52116002)(31696002)(65956001)(2616005)(6486002)(65806001)(486006)(11346002)(476003)(256004)(14454004)(2501003)(86362001)(36756003)(386003)(6506007)(53546011)(229853002)(25786009)(478600001)(81156014)(186003)(76176011)(81166006)(110136005)(4326008)(54906003)(71190400001)(71200400001)(6436002)(99286004)(26005)(316002)(8676002)(58126008)(53936002)(6246003)(66066001)(102836004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3499;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i6V6+B653mm7jj2JWgwTiSScphYx1qtKJMqrhHLWbL4OehYBOYKiAOSUVp5PiQllyDj0BFJyhNd7JAJyFW4rISnBseeEar1fKOlBS2lE0c44ayd2tAYD8EBjAMP3XpSosRh1FdQFqqQD4mzuJcAC2HG7jr2FDp/yrY9OFkTNd5uMv7MR6c7OOu/gI5HAJrVY1UqTOpsBfq87UNOsAuAvNc+c5FTbMDndbK76Rbothx1IjC9Jz1DzkknLDEyuz5yvMzuOHaIvG0UV7+n5rBGTNH0cjA0BtsdjHoCA0j+fbn9VandG+EynTZx7xVub6QOL5XTOtCW0HpKSHG3FtyFINxgDLziS5I4eMocOt9XNetjHrKNQY96PMOQUtkT20gu4CGUZnuCWcj4VHKTQuc43SSXhZ8C6nRF4OI2sQphIWL4=
Content-ID: <E69D984AFA3FAF4FB15581E62DA0F156@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9c9dc0-6dd7-4203-2ffd-08d7316f779d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 19:38:31.5234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAdAznDth3FM3dSDO/aI7RwDsQ9dLGoxvdvkQrqfZr2RBncnZAPY/do0DPrZp764q5xKEp/W0DnSFY3p71p+Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PnmPmxq/iuyeKo6pQbZyz9MXQP0HBYKG2JQAySrYUs=;
 b=RU1NRkYcWYKLGfnCZCSgVfAFti/Ewbaab0W7rhUyqI9U5YFcnzxOtuTX8WjRppIx6rJp89iEnayrfWQfpv/9KvIbvMj7Iyn/+crOEHJLzU8TnQIRl+o/CYody2Trys0+voDJXNPgftJ9C0blxmOYJVNp9sgsW6BTKgCS+2dhz/0=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNCAxMTo0OCBhLm0uLCBIdWFuZywgUmF5IHdyb3RlOg0KPiBUaGlzIHBhdGNo
IGluaXRzIHJlbm9pciBrZmQgZGV2aWNlIGluZm8sIHNvIHdlIHRyZWF0IHJlbm9pciBhcyAiZGdw
dSINCj4gKGJ5cGFzcyBpb21tdSB2MikuIFdpbGwgZW5hYmxlIG5lZWRzX2lvbW11X2RldmljZSB0
aWxsIHJlbm9pciBpb21tdSBpcyByZWFkeS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4NCg0KTG9va3MgZ29vZCwgYnV0IHBsZWFzZSBjb29yZGluYXRl
IHdpdGggWW9uZyB3aG8gaXMgY2hhbmdpbmcgdGhlIA0Kc3RydWN0dXJlIG9mIHRoZSBrZmQgZGV2
aWNlIGluZm8gdGFibGUuIFNlZSBoaXMgcGF0Y2ggImRybS9hbWRrZmQ6IFF1ZXJ5IA0Ka2ZkIGRl
dmljZSBpbmZvIGJ5IENISVAgaWQgaW5zdGVhZCBvZiBwY2kgZGV2aWNlIGlkIiBmb3IgZGV0YWls
cy4gDQpXaG9ldmVyIGdvZXMgaW4gc2Vjb25kIHdpbGwgbmVlZCB0byByZWJhc2UgYW5kIGZpeCB0
aGUgY29uZmxpY3QuDQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxp
bmdAYW1kLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jDQo+IGluZGV4IDI1MTQyNjMuLjFmNjU1ODUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gQEAgLTMxNyw2ICszMTcsMjMgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gdmVnYTIwX2RldmljZV9pbmZvID0gew0KPiAgIAkubnVt
X3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LA0KPiAgIH07DQo+ICAgDQo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByZW5vaXJfZGV2aWNlX2luZm8gPSB7DQo+ICsJLmFz
aWNfZmFtaWx5ID0gQ0hJUF9SRU5PSVIsDQo+ICsJLm1heF9wYXNpZF9iaXRzID0gMTYsDQo+ICsJ
Lm1heF9ub19vZl9ocWQgID0gMjQsDQo+ICsJLmRvb3JiZWxsX3NpemUgID0gOCwNCj4gKwkuaWhf
cmluZ19lbnRyeV9zaXplID0gOCAqIHNpemVvZih1aW50MzJfdCksDQo+ICsJLmV2ZW50X2ludGVy
cnVwdF9jbGFzcyA9ICZldmVudF9pbnRlcnJ1cHRfY2xhc3NfdjksDQo+ICsJLm51bV9vZl93YXRj
aF9wb2ludHMgPSA0LA0KPiArCS5tcWRfc2l6ZV9hbGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwN
Cj4gKwkuc3VwcG9ydHNfY3dzciA9IHRydWUsDQo+ICsJLm5lZWRzX2lvbW11X2RldmljZSA9IGZh
bHNlLA0KPiArCS5uZWVkc19wY2lfYXRvbWljcyA9IGZhbHNlLA0KPiArCS5udW1fc2RtYV9lbmdp
bmVzID0gMSwNCj4gKwkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0gMCwNCj4gKwkubnVtX3NkbWFf
cXVldWVzX3Blcl9lbmdpbmUgPSAyLA0KPiArfTsNCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMF9kZXZpY2VfaW5mbyA9IHsNCj4gICAJLmFzaWNfZmFt
aWx5ID0gQ0hJUF9OQVZJMTAsDQo+ICAgCS5tYXhfcGFzaWRfYml0cyA9IDE2LA0KPiBAQCAtNDUy
LDYgKzQ2OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZWlkIHN1cHBvcnRlZF9k
ZXZpY2VzW10gPSB7DQo+ICAgCXsgMHg2NmE0LCAmdmVnYTIwX2RldmljZV9pbmZvIH0sCS8qIFZl
Z2EyMCAqLw0KPiAgIAl7IDB4NjZhNywgJnZlZ2EyMF9kZXZpY2VfaW5mbyB9LAkvKiBWZWdhMjAg
Ki8NCj4gICAJeyAweDY2YWYsICZ2ZWdhMjBfZGV2aWNlX2luZm8gfSwJLyogVmVnYTIwICovDQo+
ICsJLyogUmVub2lyICovDQo+ICsJeyAweDE2MzYsICZyZW5vaXJfZGV2aWNlX2luZm8gfSwJLyog
UmVub2lyICovDQo+ICAgCS8qIE5hdmkxMCAqLw0KPiAgIAl7IDB4NzMxMCwgJm5hdmkxMF9kZXZp
Y2VfaW5mbyB9LAkvKiBOYXZpMTAgKi8NCj4gICAJeyAweDczMTIsICZuYXZpMTBfZGV2aWNlX2lu
Zm8gfSwJLyogTmF2aTEwICovDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
