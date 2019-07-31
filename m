Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F387CEF3
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 22:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EFE6E2F7;
	Wed, 31 Jul 2019 20:42:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF6C6E2F7
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 20:42:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM5i2fCmSI3LsatyiuPujrjGjd0EUP5gK3I+F0E2h6+GYU0h9khVp7WNEDY8Otd6M7nyT1NW5MH+koixjFqV5K6uWGJu9dQRHsuPBiHIG0mqLKKElPKuJNI6ZhBTVhB6rkByEQKOUi/k8Y+2fKk3wbR3bXuN0FMLa+1CQELhXjBbrjxxF9v5TYblj8tbsOZCLAZGrKKRFcbhLIB0Su42GyFuVTExAj6nigK/PjRoa803+q6s5PaHBlV62nSJVoqwML+888sTYjGH+/wlh0xCxU/xa3kYsuhLwHFGcLYdeYfmNjvWETPhQWIyqdg2ksFLywgRxbnLqmHT53o8MRSDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HcihUTecfwonUuXLcwOOoBi0hdzKkXp1U1khyZbIo4=;
 b=FO2iac4KVIOUQ6zx1iYxJz7rNhBtowebZTDwZ5L3BNG5TToyu0FE+jVoWdC/RHB7n3tZKnwRrWiPSLV02HRBIOLQsC8OGAc8DaG7R7tZz/TjvJ3Nqw/O3GTB2ghEx/X5vWcAJPWBDDOMnQ9yh2/OL+XQHDrpvFSiab0szmiiN8/3k02nJi/E3EhDPNsdTAiy7kv1bath4kG3VLVEpyBA/HzP0Xw1wwwsvxvfh6JwnQI1ArRUzPaC9Cs5Zi1Ir1wFBmFzFIomnR4o6j4k00CV8jO9Dd6WqJjnpcQXS3r9/5fDryY4HgRptY7lThgu/cH7mBGTPR7bXY9ep/wWS9MLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4234.namprd12.prod.outlook.com (10.141.184.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 20:42:55 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 20:42:55 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: enable KFD support for navi14
Thread-Topic: [PATCH 2/2] drm/amdkfd: enable KFD support for navi14
Thread-Index: AQHVQ+aiLZ2XpzZYdkuSO46vxDxbKKbkKlqAgAEO5YA=
Date: Wed, 31 Jul 2019 20:42:55 +0000
Message-ID: <6c654816-aebc-ef14-026d-1434d4785ea0@amd.com>
References: <20190726191615.20351-1-alexander.deucher@amd.com>
 <20190726191615.20351-2-alexander.deucher@amd.com>
 <BN8PR12MB36028EED9EBC681BC042564689DF0@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36028EED9EBC681BC042564689DF0@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aa8dc78-7354-41eb-ce63-08d715f7aa0c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4234; 
x-ms-traffictypediagnostic: DM6PR12MB4234:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB4234ECBC78EBADBB66F449F092DF0@DM6PR12MB4234.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(189003)(199004)(6486002)(229853002)(6116002)(3846002)(66066001)(65956001)(65806001)(2906002)(64126003)(36756003)(110136005)(52116002)(68736007)(65826007)(486006)(53936002)(316002)(58126008)(6436002)(11346002)(476003)(99286004)(446003)(2616005)(6512007)(6306002)(966005)(26005)(25786009)(7736002)(8936002)(102836004)(71190400001)(71200400001)(76176011)(14454004)(2501003)(186003)(8676002)(81166006)(81156014)(31686004)(478600001)(6246003)(305945005)(86362001)(5660300002)(66476007)(66556008)(64756008)(66446008)(256004)(66946007)(4326008)(31696002)(386003)(6506007)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4234;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UD9e9XwfoGIlOv+IAnjp6RohhZqLLvNt1fY6VD1RzP4rhPjrxpMHZH+diDK40Yy/sd7thd/Xdf3dNFZ7ROLhQpIe/7pV/yhVXKsQOcXRjjalkqqCvdxk0OaJekgYKxXm2Mo1GdzMFvHM+tOg66pd320tSZhihkpmj8wYICyLZ3L3tEU8e6OhVihpNVL6aq0p/t0sCB/aN+8L8MpEI60MNu4IIP+laqOXc43JJukycazfZEQFwslfxnotQA86aiK9dAzMnPzGBvLCnCl5f1fbgWMeER9tUsS9WFBc0Byz4Aar0nhnr3RaOZ5X5H39IhCSIhLUP6UWOOy+H8j1bs44foyaGTqBhAJ5FAAZmXVHYTuIz+4zsDkPcTFLIOmRkxqC3Kp304iwwWpPDh6NPuOERJjf9eudUpCprZze2njmVMA=
Content-ID: <18BD16143099F94097E11E7E954019C3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa8dc78-7354-41eb-ce63-08d715f7aa0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 20:42:55.2014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HcihUTecfwonUuXLcwOOoBi0hdzKkXp1U1khyZbIo4=;
 b=sx7q3WjRIdfi454Lqhn+hrKm4i4SPcZde8fATZsay1PXnXl0396PnN7sdJ9YGZr4Dt9DoRHPe5K7hB1XQYn4cE4f2vufXpjrx5GS6H9qseeH+3WI+TQTtkgOrsabM2W88/KEaxJ0qZSG92lnLP3K32poZQaQJ7gc76i/RF9iXNA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA3LTMxIDEyOjMzIGEubS4sIFl1YW4sIFhpYW9qaWUgd3JvdGU6DQo+IFJldmll
d2VkLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPg0KPg0KPiBCUiwNCj4g
WGlhb2ppZQ0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9u
IGJlaGFsZiBvZiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gU2VudDog
U2F0dXJkYXksIEp1bHkgMjcsIDIwMTkgMzoxNiBBTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlcg0KPiBTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBkcm0vYW1ka2ZkOiBlbmFibGUgS0ZEIHN1cHBvcnQgZm9yIG5hdmkxNA0KPg0KPiBTYW1l
IGFzIG5hdmkxMC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPg0KU29ycnksIEkganVzdCBnb3QgYmFjayBmcm9tIHZhY2F0aW9uLiBU
aGlzIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBGZWxpeCANCkt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPg0KDQpCdXQgZm9yIHRoaXMgdG8gZG8gYW55dGhpbmcgdXNlZnVsLCB3ZSdsbCBh
bHNvIG5lZWQgdG8gYWRkIHRoZSBOYXZpMTQgDQpkZXZpY2UgSURzIGFuZCBzb21lIEFTSUMgaW5m
byB0byBLRkQuIE90aGVyd2lzZSB5b3UnbGwgcHJvYmFibHkgaGl0IHRoaXMgDQpkZXZfd2FybiBp
biBrZmRfZGV2aWNlLmM6IGxvb2t1cF9kZXZpY2VfaW5mbzoNCg0KIMKgwqDCoMKgwqDCoMKgIGRl
dl93YXJuKGtmZF9kZXZpY2UsICJESUQgJTA0eCBpcyBtaXNzaW5nIGluIHN1cHBvcnRlZF9kZXZp
Y2VzXG4iLA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpZCk7DQoNClJlZ2Fy
ZHMsDQogwqAgRmVsaXgNCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmQuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+IGlu
ZGV4IGYwNTJjNzBlNDY1OS4uOTdmN2M1MjM1Y2M5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+IEBAIC05MSw2ICs5MSw3IEBAIHZvaWQgYW1k
Z3B1X2FtZGtmZF9kZXZpY2VfcHJvYmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAg
ICAgICAgICAgICAgICAga2ZkMmtnZCA9IGFtZGdwdV9hbWRrZmRfYXJjdHVydXNfZ2V0X2Z1bmN0
aW9ucygpOw0KPiAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgICBjYXNlIENISVBf
TkFWSTEwOg0KPiArICAgICAgIGNhc2UgQ0hJUF9OQVZJMTQ6DQo+ICAgICAgICAgICAgICAgICAg
a2ZkMmtnZCA9IGFtZGdwdV9hbWRrZmRfZ2Z4XzEwXzBfZ2V0X2Z1bmN0aW9ucygpOw0KPiAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgICBkZWZhdWx0Og0KPiAtLQ0KPiAyLjIwLjEN
Cj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
