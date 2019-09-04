Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B1A8F46
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 21:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E170A89444;
	Wed,  4 Sep 2019 19:35:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E08689444
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 19:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqWfPzKT+UXP78rie7y8n8iaBVgqmIeuDSXJduZE3CF6erD7mYszLNOXoeWaqc1K7zvK7RcfSQO3bPFIeyRkOgjXnb6d/UZvzRKRM9Lr5R4k+FlK9rcemhKTgnsAmxcmnUmOzyNYhnXBn63zTf9AoBtDT9kocRvV3rYFerxYTec+UKJlOun1pV0T+wxEmLGWVAmM5S+5ZqOdnEeaTy57NzE/e5cTIwNIHNCp/Rr2Hmh9F2qazxhqpXP+zgVUY26AISrT1Vz6afrVrRVm1DDGDNheREV646sC6UlhY7yNsMqE2rE7bVqUW1GykpAml92LT9FOmHhq4ZKHndur3Ex+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKmWbQ02xBiVXvtWbXRauBLzaIE+Pkqu1djrg9YOUeM=;
 b=QoxgTlfji1VQsWHbBehBrvdvbREHyVxTDw1PKEFZwPcyF+8XeFvh2lK55njSSyZcj5PylwUVWkZAFlmIODsYuXOgJkHFHCj5jUVJrTcwnyUwWkZfmgp81A/Bp+P90cn8PI7+Pdh9KdeNEFgU7XR44HGmqe9p97LKEw43a5s10DRuqEehGTD+U5YAKEmjD/XLSXKQe+KmZXtWlQyaLjtBaxjiEj3tjKjxv2ZXiWzVw2WKocqy6SifRfCd8jlN/L+JdhZdze/Rfppr9wslN8khI7SUknHGO1U27pwU55DdztKCgeL8/2U1txCyxpJq4zYGmU/z1ResKSoMv5m1k9i07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3499.namprd12.prod.outlook.com (20.178.199.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Wed, 4 Sep 2019 19:35:20 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 19:35:20 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 01/10] drm/amdkfd: add renoir cache info for CRAT
Thread-Topic: [PATCH 01/10] drm/amdkfd: add renoir cache info for CRAT
Thread-Index: AQHVYzgwKEGRYqK5+EqSSTE49RvUKacb6VMA
Date: Wed, 4 Sep 2019 19:35:20 +0000
Message-ID: <6fe2ad6f-24fb-db4b-7b75-3149f0c0257a@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
 <20190904154803.5102-2-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-2-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::41) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3d399d6-2d95-4510-9622-08d7316f05c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3499; 
x-ms-traffictypediagnostic: DM6PR12MB3499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3499119B4B5A867A7B7A913892B80@DM6PR12MB3499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(189003)(199004)(8936002)(66556008)(64756008)(31686004)(66446008)(2906002)(66476007)(305945005)(66946007)(7736002)(6116002)(5660300002)(446003)(6512007)(3846002)(52116002)(31696002)(65956001)(14444005)(2616005)(6486002)(65806001)(486006)(11346002)(476003)(256004)(14454004)(2501003)(86362001)(36756003)(386003)(6506007)(53546011)(229853002)(25786009)(478600001)(81156014)(186003)(76176011)(81166006)(110136005)(4326008)(54906003)(71190400001)(71200400001)(6436002)(99286004)(26005)(316002)(8676002)(58126008)(53936002)(6246003)(66066001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3499;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yy/2aU+6GQ+6XzIPnQWpll2dA3YO1xBI+RcJWjs47YxZFWQEdxqGhNek1u9uwgHqdN7QrHFVp+kHk2a0mg1n7R5l7ivQatzZZReWhSY0d+mpuqf3hWyae7+tSnAEDO4KR95+yPaAyRlBZxx+5GgPMuVcKRml1LhWzvM6LJhyjOy9rGbfC5vh8rsJ/H9zRk7AcI6YEzzhKjLwgMqC7RSop7ZSqfAbjRxaZ78JLkbxT/6OBdalbj/bMF1nEqnDC8W2jhIhR6bg5bGJIym+JmNaGWM3HqcQ5Qif3Cg8uubr3Y9xijcH5jQrH1WTjcjqAQk9e3eph+sBM2ov4HsNG53o4NWgW4+sri14vJlNGOcVXNyZLrJkN1CEZGyckA0mB5Hbr26nLz3p1pGIEpIFrpMBSMRHGCFYhdMC1JnsHbMsYNA=
Content-ID: <5FA2E177E07E9F47A78D251452C5765C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d399d6-2d95-4510-9622-08d7316f05c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 19:35:20.5012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MKifxISpkT1Rw8D9ZYKOsHEy8JLCbNpyRY2wSvtf8iuV/WSDQ440K+4dZ6ReHDJbQSoCDv/ghh+6V1s9LMNAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKmWbQ02xBiVXvtWbXRauBLzaIE+Pkqu1djrg9YOUeM=;
 b=T8hC8b4UAp/Nz1jjLu6BJ2mmoJp5hejMO2+ghK6rJSUedKr+i+8oiz79KYNKtvnLdrhSwXpqwawyHeGq6LnvHd32dvLiEoV4HMDIfRfwD+y6utfTZb+oJ5b6xsSKUwgzKcb3+S8jdnc+pW1Y+zMzzrCtYZxXR+0uFHrvU1ObQ6A=
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

T24gMjAxOS0wOS0wNCAxMTo0OCBhLm0uLCBIdWFuZywgUmF5IHdyb3RlOg0KPiBSZW5vaXIncyBj
YWNoZSBpbmZvIHNob3VsZCBiZSB0aGUgc2FtZSB3aXRoIHJhdmVuIGFuZCBjYXJyaXpvJ3MuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgfCA0ICsrKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2NyYXQuYw0KPiBpbmRleCBhODRjODEwLi4yYTQyOGM5IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMNCj4gQEAgLTEzOCw2ICsxMzgsNyBAQCBzdGF0aWMg
c3RydWN0IGtmZF9ncHVfY2FjaGVfaW5mbyBjYXJyaXpvX2NhY2hlX2luZm9bXSA9IHsNCj4gICAv
KiBUT0RPIC0gY2hlY2sgJiB1cGRhdGUgVmVnYTEwIGNhY2hlIGRldGFpbHMgKi8NCj4gICAjZGVm
aW5lIHZlZ2ExMF9jYWNoZV9pbmZvIGNhcnJpem9fY2FjaGVfaW5mbw0KPiAgICNkZWZpbmUgcmF2
ZW5fY2FjaGVfaW5mbyBjYXJyaXpvX2NhY2hlX2luZm8NCj4gKyNkZWZpbmUgcmVub2lyX2NhY2hl
X2luZm8gY2Fycml6b19jYWNoZV9pbmZvDQo+ICAgLyogVE9ETyAtIGNoZWNrICYgdXBkYXRlIE5h
dmkxMCBjYWNoZSBkZXRhaWxzICovDQo+ICAgI2RlZmluZSBuYXZpMTBfY2FjaGVfaW5mbyBjYXJy
aXpvX2NhY2hlX2luZm8NCj4gICANCj4gQEAgLTY2OCw2ICs2NjksOSBAQCBzdGF0aWMgaW50IGtm
ZF9maWxsX2dwdV9jYWNoZV9pbmZvKHN0cnVjdCBrZmRfZGV2ICprZGV2LA0KPiAgIAljYXNlIENI
SVBfUkFWRU46DQo+ICAgCQlwY2FjaGVfaW5mbyA9IHJhdmVuX2NhY2hlX2luZm87DQo+ICAgCQlu
dW1fb2ZfY2FjaGVfdHlwZXMgPSBBUlJBWV9TSVpFKHJhdmVuX2NhY2hlX2luZm8pOw0KPiArCWNh
c2UgQ0hJUF9SRU5PSVI6DQo+ICsJCXBjYWNoZV9pbmZvID0gcmVub2lyX2NhY2hlX2luZm87DQo+
ICsJCW51bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUocmVub2lyX2NhY2hlX2luZm8pOw0K
DQpJIGp1c3Qgbm90aWNlZCwgdGhlcmUgYXJlIGJyZWFrOyBzdGF0ZW1lbnRzIG1pc3NpbmcgaGVy
ZS4gV2hpY2ggYnJhbmNoIA0KYXJlIHlvdXIgY2hhbmdlcyBiYXNlZCBvbj8gQXQgbGVhc3QgdGhl
IHN1cnJvdW5kaW5nIGNvZGUgbG9va3MgT0sgb24gDQphbWQtc3RhZ2luZy1kcm0tbmV4dCwgYnV0
IHNlZW1zIHRvIGJlIG1pc3NpbmcgYSBicmVhayBzdGF0ZW1lbnQgYXQgbGVhc3QgDQppbiB0aGUg
UmF2ZW4gY2FzZSBoZXJlLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiAgIAljYXNlIENI
SVBfTkFWSTEwOg0KPiAgIAkJcGNhY2hlX2luZm8gPSBuYXZpMTBfY2FjaGVfaW5mbzsNCj4gICAJ
CW51bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUobmF2aTEwX2NhY2hlX2luZm8pOw0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
