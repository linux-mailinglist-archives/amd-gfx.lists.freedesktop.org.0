Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE502567D0
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 13:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479986E391;
	Wed, 26 Jun 2019 11:40:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BCC6E391
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 11:40:32 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 11:40:31 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::2c36:7d1c:2e3f:55fd]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::2c36:7d1c:2e3f:55fd%3]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 11:40:31 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/powerplay:clean up the residual mutex for
 smu_hw_init
Thread-Topic: [PATCH v2] drm/amd/powerplay:clean up the residual mutex for
 smu_hw_init
Thread-Index: AQHVLA0RDhG6ZQEElEqQX4YpYV0mWqatz8gA
Date: Wed, 26 Jun 2019 11:40:31 +0000
Message-ID: <7b8da7a5-4f72-90f5-8558-f06635475fc8@amd.com>
References: <1561448595-32319-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1561448595-32319-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0062.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::26) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f329ffbf-5f5f-4b35-a565-08d6fa2b17ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3309; 
x-ms-traffictypediagnostic: MN2PR12MB3309:
x-microsoft-antispam-prvs: <MN2PR12MB33099F6897A4AA3CAC723C2AA2E20@MN2PR12MB3309.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(6436002)(31686004)(25786009)(72206003)(53936002)(14454004)(6246003)(2501003)(14444005)(7736002)(305945005)(256004)(99286004)(52116002)(3846002)(68736007)(66066001)(5660300002)(76176011)(6116002)(2906002)(478600001)(71190400001)(31696002)(486006)(53546011)(386003)(4326008)(71200400001)(8936002)(73956011)(316002)(66946007)(11346002)(2616005)(102836004)(6512007)(66556008)(66476007)(66446008)(64756008)(476003)(229853002)(186003)(446003)(26005)(36756003)(6486002)(6506007)(54906003)(81166006)(110136005)(81156014)(8676002)(4744005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3309;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Uas/asdW/EdSCyuyHnQRF38B6d2hk7QAlG31m3y/ow9rRwRoX+/P1jNGPcz9wDqGIs/198ZVfA8HZhNUsph7PAu81QBeb89dt+Rxq0ENidnAbjAxBOsH92AWRh+jrv0gHjSMMw7W/PCcd6/vO6KEp8ghMmXuiwqVX9HOM3DSu8fXoVL7SUcAD53uPa9KrQ/P5ToBEtUNw5xVib9hC0ffCXU/5L6U8nAd4UXu2DftplJzuWfMTpWACwB5Q4D6V/DhTCXyiuZuBaKB4HT+0Nl1l/ikXqYmQjz4xC4kJEtOdDDfGqQW2Mx8LSkW/tPm5BC+rjUEodBTMH+rWoY+KanBujjMxO4TrFkwpnLtaMgO+ri+VGhXXHhGeXJwuTPfQOP9rFTTKV34RjVeO7k4tcQ59z0fTv/3Kq6g4MLgSbVzxUY=
Content-ID: <C379D156B010B644843834C9E01EBA0A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f329ffbf-5f5f-4b35-a565-08d6fa2b17ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 11:40:31.1486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3309
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoK59Ooz5J8OASG+bJK24CE5qQd2CXQrwZI8PwGmkro=;
 b=LuShjCSt1jRDXvglbIckgtCmL7kb3/7exqF4F6mtSZTtrXZmc4iucciWU4VhV/5C8t70LF2tckB6wxyBrKvtCwdXY2U3z8ji7IsbNnonhI4BpjncOma9/HPc022XK++9iH9QUVmcAbRsn40YrLCF4mTsXttKXHFu+pPX9Ahg50s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCg0KT24gNi8y
NS8xOSAzOjQzIFBNLCBQcmlrZSBMaWFuZyB3cm90ZToNCj4gVGhlIG11dGV4IGZvciBwcm9jdGlu
ZyBTTVUgZHVyaW5nIGh3X2luaXQgd2FzIHJlbW92ZWQgYXMgc3lzdGVtDQo+IHdpbGwgYmUgZGVh
ZGxvY2sgd2hlbiBzbXVfcG9wdWxhdGVfdW1kX3N0YXRlX2NsayB0cnkgZ2V0IFNNVSBtdXRleC4N
Cj4gVGhlcmVmb3JlIG5lZWQgcmVtb3ZlIHRoZSByZXNpZHVhbCBtdXRleCBmcm9tIGZhaWxlZCBw
YXRoLg0KPg0KPiBDaGFuZ2UtSWQ6IElkODAxOWMwMWI5NDk2YzA2N2VmZGE0ODE3YTQ2OTgzZTRk
YTNiNmU0DQo+IFNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29t
Pg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMg
fCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IGluZGV4IGY2MWVjYmYuLmZlODNj
NWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMN
Cj4gQEAgLTEwNDQsNyArMTA0NCw2IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFu
ZGxlKQ0KPiAgIAlyZXR1cm4gMDsNCj4gICANCj4gICBmYWlsZWQ6DQo+IC0JbXV0ZXhfdW5sb2Nr
KCZzbXUtPm11dGV4KTsNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
