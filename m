Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE23198E2
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 09:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B26F89B70;
	Fri, 10 May 2019 07:19:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710059.outbound.protection.outlook.com [40.107.71.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7589B70
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 07:19:30 +0000 (UTC)
Received: from DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) by
 DM6PR12MB3338.namprd12.prod.outlook.com (20.178.31.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Fri, 10 May 2019 07:19:29 +0000
Received: from DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::6425:a766:7a85:436c]) by DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::6425:a766:7a85:436c%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 07:19:29 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Topic: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Index: AQHVBwCBOnzmYyYee0WGkzqcROAC1aZj8yGA
Date: Fri, 10 May 2019 07:19:29 +0000
Message-ID: <DM6PR12MB3305DCE921FE18B7C909C3C5840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
References: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf6a110b-ceff-4755-fc2f-08d6d517d750
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3338; 
x-ms-traffictypediagnostic: DM6PR12MB3338:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3338BCDF11A44A405E89F509840C0@DM6PR12MB3338.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:317;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(366004)(199004)(13464003)(189003)(6506007)(6436002)(229853002)(66066001)(305945005)(64756008)(66946007)(66446008)(7736002)(53546011)(81166006)(486006)(81156014)(110136005)(26005)(11346002)(25786009)(186003)(446003)(8936002)(74316002)(7696005)(33656002)(76176011)(102836004)(2501003)(68736007)(71190400001)(71200400001)(476003)(8676002)(2906002)(76116006)(52536014)(53936002)(3846002)(6246003)(316002)(86362001)(66556008)(6306002)(9686003)(5660300002)(66476007)(6116002)(256004)(478600001)(72206003)(966005)(14444005)(73956011)(14454004)(55016002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3338;
 H:DM6PR12MB3305.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RlIcF3oWZjeSAS+BNzF9QxDH9m+G8HnpA6AbBWLst/VpwZGaDClvjGPeggnUUd12XuAXjCGMI3kkGOxOyD8csFyDKrPrZyduuGfW3Nbaa2Igm49Af3XpBJtD5Mkwom0VHjMr5RyE57ZdIH+PBaW3ijBjpwRAm9CbzXsObQLEkJQyVJN9bL427JGFvfyl78hHJsahFXjU6algYRY/KQ2avnjDUCFkTUhaNvrnZnTbMvpqQ/o7uzonXJe8Geh/bVOuSJS7cEomKfnOQj3+JEN3W5A+fOmrLlRiqZ5FGCpXzBKHnXRiSQp8Hd67x2WUCr1qusD9chwFme6c29o1z5JYHGJ4qrX0ChMi4VkSE5q/fGtxwneBQzmaNQHkYghCMWwI5gai9BkH89z5o5Bw7ayro1Y29W4Js8GLEJGWNFiIrVc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6a110b-ceff-4755-fc2f-08d6d517d750
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 07:19:29.2256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3338
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss1+HiHQ5RBRdbBWdfm2vs0ljDa8gdRsiaKbkNr17Ms=;
 b=diA2zxzftL8iB8PxMmjUDAZrR4Sy8OXJJQvpCV3ecZfAGdrR5/XdwIKWPVcx8rh+hD1aLTuiuXpQQ3hxd+mBeZGfh5gfITjCRaRGvK/5gvC1PyIwX+duA1UoyZSIz6R9k4bDcMak1RQxGgR/YOuefjXV0KT7Z75UV46Y6qT3zhA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

SGkgQ2hyaXN0aWFuLCANCg0KV2hhdCBhYm91dCB0aGlzIG9uZSwgbm8gdGltZXIgbG9naWMgY2hh
bmdlIG9uIHNjaGVkdWxlciBwYXJ0LCBvbmx5IHRoZSBkdXBsaWNhdGVkIHRtbyByZXBvcnQgaXMg
bXV0ZWQgDQoNCi9Nb25rDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
TW9uayBMaXUNClNlbnQ6IEZyaWRheSwgTWF5IDEwLCAyMDE5IDM6MTggUE0NClRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT4N
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogYXZvaWQgZHVwbGljYXRlZCB0bW8gcmVwb3J0
IG9uIHNhbWUgam9iDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KU2lnbmVkLW9mZi1i
eTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAgMyArLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfam9iLmMgICAgfCAxMiArKysrKysrKysrKy0NCiBpbmNsdWRlL2RybS9ncHVf
c2NoZWR1bGVyLmggICAgICAgICAgICAgICAgfCAgMSArDQogMyBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jDQppbmRleCBkNjI4NmVkLi5mMWRjMGJhIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCkBAIC0zMzU2LDggKzMzNTYsNyBA
QCBib29sIGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQ0KICAgICAgICByZXR1cm4gdHJ1ZTsNCg0KIGRpc2FibGVkOg0KLSAgICAgICAg
ICAgICAgIERSTV9JTkZPKCJHUFUgcmVjb3ZlcnkgZGlzYWJsZWQuXG4iKTsNCi0gICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7DQorICAgICAgIHJldHVybiBmYWxzZTsNCiB9DQoNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KaW5kZXggMTM5Nzk0Mi4uY2E2MjI1MyAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQpAQCAtMzMsNiArMzMs
NyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9i
ICpzX2pvYikNCiAgICAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gdG9fYW1kZ3B1X3Jp
bmcoc19qb2ItPnNjaGVkKTsNCiAgICAgICAgc3RydWN0IGFtZGdwdV9qb2IgKmpvYiA9IHRvX2Ft
ZGdwdV9qb2Ioc19qb2IpOw0KICAgICAgICBzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0aTsNCisg
ICAgICAgYm9vbCByZWNvdmVyOw0KDQogICAgICAgIG1lbXNldCgmdGksIDAsIHNpemVvZihzdHJ1
Y3QgYW1kZ3B1X3Rhc2tfaW5mbykpOw0KDQpAQCAtNDIsNiArNDMsMTEgQEAgc3RhdGljIHZvaWQg
YW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpDQogICAgICAg
ICAgICAgICAgcmV0dXJuOw0KICAgICAgICB9DQoNCisgICAgICAgcmVjb3ZlciA9IGFtZGdwdV9k
ZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHJpbmctPmFkZXYpOw0KKyAgICAgICBpZiAoc19qb2It
PnNjaGVkLT5sYXN0X3Rtb19pZCA9PSBzX2pvYi0+aWQpDQorICAgICAgICAgICAgICAgZ290byBz
a2lwX3JlcG9ydDsNCisNCisgICAgICAgc19qb2ItPnNjaGVkLT5sYXN0X3Rtb19pZCA9IHNfam9i
LT5pZDsNCiAgICAgICAgYW1kZ3B1X3ZtX2dldF90YXNrX2luZm8ocmluZy0+YWRldiwgam9iLT5w
YXNpZCwgJnRpKTsNCiAgICAgICAgRFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIHNpZ25hbGVk
IHNlcT0ldSwgZW1pdHRlZCBzZXE9JXVcbiIsDQogICAgICAgICAgICAgICAgICBqb2ItPmJhc2Uu
c2NoZWQtPm5hbWUsIGF0b21pY19yZWFkKCZyaW5nLT5mZW5jZV9kcnYubGFzdF9zZXEpLA0KQEAg
LTQ5LDcgKzU1LDExIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRy
bV9zY2hlZF9qb2IgKnNfam9iKQ0KICAgICAgICBEUk1fRVJST1IoIlByb2Nlc3MgaW5mb3JtYXRp
b246IHByb2Nlc3MgJXMgcGlkICVkIHRocmVhZCAlcyBwaWQgJWRcbiIsDQogICAgICAgICAgICAg
ICAgICB0aS5wcm9jZXNzX25hbWUsIHRpLnRnaWQsIHRpLnRhc2tfbmFtZSwgdGkucGlkKTsNCg0K
LSAgICAgICBpZiAoYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldikp
DQorICAgICAgIGlmICghcmVjb3ZlcikNCisgICAgICAgICAgICAgICBEUk1fSU5GTygiR1BVIHJl
Y292ZXJ5IGRpc2FibGVkLlxuIik7DQorDQorc2tpcF9yZXBvcnQ6DQorICAgICAgIGlmIChyZWNv
dmVyKQ0KICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIocmluZy0+YWRl
diwgam9iKTsgIH0NCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBi
L2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBpbmRleCA5YzJhOTU3Li4xOTQ0ZDI3IDEwMDY0
NA0KLS0tIGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oDQorKysgYi9pbmNsdWRlL2RybS9n
cHVfc2NoZWR1bGVyLmgNCkBAIC0yODIsNiArMjgyLDcgQEAgc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyIHsNCiAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYW5nX2xpbWl0
Ow0KICAgICAgICBhdG9taWNfdCAgICAgICAgICAgICAgICAgICAgICAgIG51bV9qb2JzOw0KICAg
ICAgICBib29sICAgICAgICAgICAgICAgICAgICByZWFkeTsNCisgICAgICAgdWludDY0X3QgbGFz
dF90bW9faWQ7DQogfTsNCg0KIGludCBkcm1fc2NoZWRfaW5pdChzdHJ1Y3QgZHJtX2dwdV9zY2hl
ZHVsZXIgKnNjaGVkLA0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
