Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6812879FB
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 14:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E386EDFC;
	Fri,  9 Aug 2019 12:31:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA216EDFC
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 12:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPmdlnSSa4BW/P82hwiQpQ+3vWMVN14J0FDJIus+XVqQ9qVoDcquHxij3rmnrGIDLqj6nAwLlD6+EBGDVziSRqzJKk2/hgfRiN5a+/EFRgf7qCQmIKFcFbT8iHkteS5UYuNDZwWPZA3K5nvql8J7qATD/N+Yx6XrIfUBacMhmDBlmDjqWn+yfF3SSavY59jPgFZD0Rg3XyZLDJobiWrBjx9Z/jcIQ2QPT62mBEG4P3WFH7rngo/2L8bAvLXRDem9SxrH0iReNXOCOURsUJboPr084QE7gq1nofXV+nPJaZD9WQJ/Qbn+vpqZh4OQoxuxeO5F+9oTdc5G2mdnHWGA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygLje7iGjkjvutQ8bWYmy6DX0lSZqYZjGRnpOLaLVms=;
 b=csxSZRUoQezVXBZSjEXxolHFJxjUejfdPWUpqwDIwWPwy2uhPNr4Iop6llvAJfk8xIHUIctsyh6cxZbjYdn9HT3zB7Z6/Xvl4rlCFvtGfPGIKY+jclsqszqXPQIGQC6xP/Lde7andjKLdodt6lOoIKaOtVPAEZ8tolM4e4XXM5IFLLMlP6yAw1eCQ+dHkiSvUuHyv3PmO6TNzs1Rnb9R6IHzEWBiDM+A/V9l1n1vgKmCrI/aBJ/u/oPtTE10jHO8Hmy80//rAwWhivvcdxdxhDS5UFkYiWwi1SOj4bWUdkAhkTMO1Q5zPlMmmugFrIOYABMoACc09RFNnJuXu8eO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2519.namprd12.prod.outlook.com (52.132.141.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 12:31:21 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 12:31:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 4/5] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVTlhbNx5L6PBwCES2C6piVhXYjabyv/uA
Date: Fri, 9 Aug 2019 12:31:21 +0000
Message-ID: <88fad585-ad1b-bca9-7079-d79896def19c@amd.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
 <1565316926-19516-4-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565316926-19516-4-git-send-email-Oak.Zeng@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d46a936e-b051-439c-c0a9-08d71cc57c30
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2519; 
x-ms-traffictypediagnostic: DM5PR12MB2519:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB25191A0D090F81703F04733783D60@DM5PR12MB2519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(199004)(189003)(58126008)(54906003)(46003)(8676002)(25786009)(110136005)(186003)(6506007)(6246003)(386003)(102836004)(14454004)(478600001)(71200400001)(71190400001)(14444005)(256004)(486006)(11346002)(5660300002)(64126003)(31686004)(6486002)(2501003)(6436002)(446003)(65826007)(229853002)(4326008)(86362001)(476003)(66946007)(66556008)(66476007)(2616005)(6512007)(64756008)(66446008)(2906002)(4744005)(305945005)(7736002)(36756003)(31696002)(53936002)(6116002)(52116002)(76176011)(65956001)(81156014)(65806001)(81166006)(99286004)(316002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2519;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +/UQj66paHfIGUhZWdVgOgX/W4+7RHRqOZNIkroCiXJh3KzLboHK3dz0uGpMaw8CnajK/aKZOlQ8rf1C4f2EM2tV6xpwDJa5IzMatBUSPtxg63AFO3UI2cDYOq2/Qng8MY3y2M3n8UfI0JSOFgzCNQzpRE6waLv5xri+bzz0PlrclRNj5dw0BDgzQ0hVejwmQWqsFupx7buxnFHQMYkaOEKXkjFsTiTFJ+7MT+T7WEU14zYF09d0glPkc5xMgEjIpBx1PXsmtWHlaw0cLNW3OcIJrmpycxot7ggfA+GN5vYoB5nqDHjh9MBvwzSkqODsOTJodNmYfvdgzOZphjieoP3Mttz511jbTC9S+o5/40FFOR/k9gxHKmJ4246V3gPikrj7gDTnQrvSnlRm6DDaibjDwbsiLTxZn8vpOMPkiIY=
Content-ID: <1EBDE40D59DCFA4A8BD6D1CE8116CC6B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46a936e-b051-439c-c0a9-08d71cc57c30
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 12:31:21.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k1O5oqQDsEg/cvdSZzBagAnuJlUQshulTwv5uTDIkmU0P0wtvZ9lC0K6S7s/EtA/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygLje7iGjkjvutQ8bWYmy6DX0lSZqYZjGRnpOLaLVms=;
 b=0mlgd+Qs2NSPfRhkytNgVVyPiivdGi0X4ctCZsXpE0g59IvieHzKrZQhKE9coACHIR9cRlq79XHEv4QiDF7L1vIrATOnErzArhpndyYlvJ3sZvVYYmr4FEY70OhQyK5n2g/oCbono1TOxH0sslFIxfrjGO4J7kD/7fhT6ai0qlY=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDkuMDguMTkgdW0gMDQ6MTUgc2NocmllYiBaZW5nLCBPYWs6DQo+IFNldCBzbm9vcGVkIFBU
RSBmbGFnIGFjY29yZGluZyB0byBtYXBwaW5nIGZsYWcuIFdyaXRlIHJlcXVlc3QgdG8gYQ0KPiBw
YWdlIHdpdGggc25vb3BlZCBiaXQgc2V0LCB3aWxsIHNlbmQgb3V0IGludmFsaWRhdGUgcHJvYmUg
cmVxdWVzdA0KPiB0byBUQ0Mgb2YgdGhlIHJlbW90ZSBHUFUgd2hlcmUgdGhlIHZyYW0gcGFnZSBy
ZXNpZGVzLg0KPg0KPiBDaGFuZ2UtSWQ6IEk3OTlmNjhlYzdhNWExYWJmMzIwNzVmNWVmMzEwNTE2
NDFhMGIzNzM2DQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysN
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBpbmRleCBkNzA5OTAyLi44ZmFlYWQzIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gQEAgLTU5OSw2ICs1OTksOSBAQCBz
dGF0aWMgdWludDY0X3QgZ21jX3Y5XzBfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCj4gICAJaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfUFJUKQ0KPiAgIAkJ
cHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9QUlQ7DQo+ICAgDQo+ICsJaWYgKGZsYWdzICYgQU1ER1BV
X1ZNX1BBR0VfSU5WQUxJREFURV9QUk9CRSkNCj4gKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9T
Tk9PUEVEOw0KPiArDQoNClN0aWxsIGEgTkFLLCB3ZSBhYnNvbHV0ZWx5IG5lZWQgYSBjaGVjayBo
ZXJlIHRoYXQgdGhpcyBpcyBvbmx5IHNldCB3aGVuIA0KdGhlIEJPIGlzIGluIFhHTUkuDQoNCkNo
cmlzdGlhbi4NCg0KPiAgIAlyZXR1cm4gcHRlX2ZsYWc7DQo+ICAgfQ0KPiAgIA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
