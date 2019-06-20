Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5C84D1F0
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 17:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFE46E5BD;
	Thu, 20 Jun 2019 15:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780081.outbound.protection.outlook.com [40.107.78.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817B6E5BD
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 15:19:13 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3802.namprd12.prod.outlook.com (10.255.173.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 15:19:12 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 15:19:12 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: set max df perfmon to 4
Thread-Topic: [PATCH] drm/amdgpu: set max df perfmon to 4
Thread-Index: AQHVJyeVn/hUjy54fkKE1c6aLgE3kaakqLUA
Date: Thu, 20 Jun 2019 15:19:12 +0000
Message-ID: <665fe765-52a5-7ccc-dcaa-a36641c1225f@amd.com>
References: <20190620051811.118880-1-jonathan.kim@amd.com>
In-Reply-To: <20190620051811.118880-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b038bfa1-9906-434e-a2b3-08d6f592a611
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3802; 
x-ms-traffictypediagnostic: DM6PR12MB3802:
x-microsoft-antispam-prvs: <DM6PR12MB3802FF749265633B5B9EDF6592E40@DM6PR12MB3802.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(199004)(71200400001)(476003)(5660300002)(64756008)(76176011)(3846002)(6246003)(81166006)(65826007)(52116002)(14454004)(81156014)(6116002)(71190400001)(64126003)(72206003)(8676002)(256004)(86362001)(73956011)(66066001)(68736007)(66556008)(486006)(25786009)(8936002)(66946007)(53546011)(6436002)(229853002)(31686004)(65806001)(99286004)(386003)(65956001)(66476007)(66446008)(36756003)(446003)(31696002)(26005)(6506007)(11346002)(305945005)(110136005)(478600001)(2501003)(316002)(102836004)(7736002)(53936002)(6486002)(186003)(58126008)(2906002)(2616005)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3802;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GIvrT+zsRrrSGz7ESSNHK3ndfO5INrORSs/dFVfYdVnlXSbSAmcdUoZh1OcaQCA7YoqWlc1S6LNoPMq+jEY/TviiKlgfhlntmU99Nw6UUiJVv7rGzxOBb0rE36B83+hVPnTeaue5opA6pgPTOINCHj1b0AdsrzYqXTbeA7dsuZUOZdjvcrJLTulzbD2MOXvXuMWLfu8kau2nPg/zkNFO31MtyeLoCFkvzofGSkIyafcD4xh3y6JYXb3dwCtwXve1jHfgk+2nHW6RmojDI1Kj5irfYhkqrEpZLJotzhiQkXqLcD4LBpZnd99wv1FComj+nMnK9YbMZeCFy5efRoru65Cm5jlCjm8M1JHQFc1Qz958pkm3E3VQH3DuqL4VxZNSHg9QAKYRV1PhQSY6icw+6t58qPi5/Yo9woFnUK1GVlQ=
Content-ID: <03B36DC0DA1DB14C9DB349082300F0C0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b038bfa1-9906-434e-a2b3-08d6f592a611
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:19:12.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3802
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n6aW211J1KmNKEFuh43hFnF9EiJvfztSR5MJbE3fZI=;
 b=gJBofJdRSKhWK3VTAjhwxKXPXrvdCH4dAoTSBTkO4C5GiTT/+AcCm+W60ve4dkVVGDgM+s7w3n8lGS6HyuvaoJ4QsZzHJlEgk67dQu0BSkJo99LQfEwDigJuEUIDN17a/avC5OD/jBA+wijS0jThbXNEddnBllupa2QYtNn5Xt0=
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

UmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQpP
biAyMDE5LTA2LTIwIDE6MTgsIEtpbSwgSm9uYXRoYW4gd3JvdGU6DQo+IGZpeGVkIGRmIHBlcm1v
biB0byA0IGFuZCByZW1vdmUgbm90IG5lZWRlZCByZXQNCj4NCj4gQ2hhbmdlLUlkOiBJYTk4OTc2
MTI5MzdlNjUyZTdmOGEwOWMxZDIzYmIxYzBlNmYzZDhmNw0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jICB8IDEgLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+
IGluZGV4IGIyMjdjOTU2YjhhOS4uYzNlZDA5Y2QyNjc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaA0KPiBAQCAtNzMyLDcgKzczMiw3IEBAIHN0cnVjdCBhbWRfcG93ZXJw
bGF5IHsNCj4gICB9Ow0KPiAgIA0KPiAgICNkZWZpbmUgQU1ER1BVX1JFU0VUX01BR0lDX05VTSA2
NA0KPiAtI2RlZmluZSBBTURHUFVfTUFYX0RGX1BFUkZNT05TIDE2DQo+ICsjZGVmaW5lIEFNREdQ
VV9NQVhfREZfUEVSRk1PTlMgNA0KPiAgIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsNCj4gICAJc3Ry
dWN0IGRldmljZQkJCSpkZXY7DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlCQkqZGRldjsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IGluZGV4IDBhZmJjYzgwZWE2MS4uMDE0NTQ5YTMw
NDQ2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gQEAgLTEwNjcsNyAr
MTA2Nyw2IEBAIHN0YXRpYyB2b2lkIHNvYzE1X2Rvb3JiZWxsX3JhbmdlX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgc3RhdGljIGludCBzb2MxNV9jb21tb25faHdfaW5pdCh2
b2lkICpoYW5kbGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCj4gLQlpbnQgcmV0Ow0KPiAgIA0KPiAgIAkv
KiBlbmFibGUgcGNpZSBnZW4yLzMgbGluayAqLw0KPiAgIAlzb2MxNV9wY2llX2dlbjNfZW5hYmxl
KGFkZXYpOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
