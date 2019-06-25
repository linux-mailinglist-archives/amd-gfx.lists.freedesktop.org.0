Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E652461
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5448389FA0;
	Tue, 25 Jun 2019 07:27:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFCA89F73
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 07:27:30 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3853.namprd12.prod.outlook.com (10.255.237.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Tue, 25 Jun 2019 07:27:28 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 07:27:28 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay:clean up the residual mutex for
 smu_hw_init
Thread-Topic: [PATCH] drm/amd/powerplay:clean up the residual mutex for
 smu_hw_init
Thread-Index: AQHVKnCUA2RpJcgMzUScCLXj885X+6ar+Vjg
Date: Tue, 25 Jun 2019 07:27:28 +0000
Message-ID: <MN2PR12MB334421183EEF9544F64A71D9E4E30@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1561369088-28220-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1561369088-28220-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44eece8d-2452-4920-6bd8-08d6f93e9409
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3853; 
x-ms-traffictypediagnostic: MN2PR12MB3853:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3853EF2D06C73BF9D6EC910BE4E30@MN2PR12MB3853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(39860400002)(136003)(376002)(396003)(13464003)(199004)(189003)(54906003)(71200400001)(6306002)(14444005)(305945005)(71190400001)(55016002)(6246003)(256004)(66066001)(7736002)(81166006)(8936002)(8676002)(316002)(81156014)(110136005)(7696005)(6116002)(3846002)(99286004)(53936002)(4326008)(76176011)(33656002)(6506007)(25786009)(102836004)(53546011)(2906002)(74316002)(64756008)(73956011)(66946007)(66446008)(76116006)(66556008)(66476007)(72206003)(476003)(486006)(966005)(9686003)(14454004)(478600001)(446003)(68736007)(11346002)(2501003)(26005)(6436002)(86362001)(52536014)(5660300002)(229853002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3853;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1OVhkQTVZP8AItZ7Y6QXlQ0sau0M03x+PAmM4wGK6lOxrU0/yb3urPVxo2S0Da1zuXxzKs8L0XPC0JvK83IxYQ47VpD5mC+wR/Pp6H8uqGt9HqL3JI1Zr8I8VmH8fZib5ZeyLxa7S9lw6g/uvrQd/RgjCtmr9Eqi0wxx4m1IbtCS1LxgVkd1ASC+CDvMGQD1l5oKGIfjDttNd0326JHmL1QoBQOguzFyDCwSbg+1Yp12kMtk5rHR59ndtxjbij+5MY0YGtHzjYRYqG8NxjnV1hh6u7FuYwIVn4hqJSY7oIMxUN+upwoEop11VOqFusTv2SGDzLn+ypKQDCb/oOux3alfp9ymOY0YicujjG95f+qG/h2UYpfgiKQg+8utTAlmW/0GDROm6XDAu2Wv8IbWXH2u1P/AMdIELtfC3+2T1gE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eece8d-2452-4920-6bd8-08d6f93e9409
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:27:28.5118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7zBiSpD+J3IyXjUmQycbYwF2IeSF/B3mHXwOsFX7Eg=;
 b=Kg/b5EXJm/XQfmUR0sILbcGtP9ppECTsrdmeKA2m5Yrp5FPLc6c5yu6U0bSemY9YRuBl3vZr55Y6gft/ONj4qBaKg/JFiq9asRPqWas+ydJ264nX1O57Cgvw5kBwL2aHg2lAFxLZ/X+Vsbg8RqB0Yz0wqvTQSG8ZXGVf99lmeFI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcGF0Y2ggaGVhZGVyIHVwZGF0ZWQsIHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YNCj4gUHJpa2UgTGlhbmcNCj4gU2VudDogTW9uZGF5LCBKdW5lIDI0
LCAyMDE5IDU6MzggUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBMaWFuZywgUHJpa2UgPFByaWtlLkxpYW5nQGFtZC5jb20+OyBIdWFuZywgUmF5DQo+IDxSYXku
SHVhbmdAYW1kLmNvbT47IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgUXVh
biwNCj4gRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2Ft
ZC9wb3dlcnBsYXk6Y2xlYW4gdXAgdGhlIHJlc2lkdWFsIG11dGV4IGZvcg0KPiBzbXVfaHdfaW5p
dA0KPiANCj4gQ2hhbmdlLUlkOiBJMWYwNzFlNDY1Yzk3ZjcwMDQ4ZGY1YjI0NDY2YmM3ZTIyNTgz
M2M3Zg0KPiBTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAx
IC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IGluZGV4IGVkZDFkYTYuLjBiZTI4
NDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMN
Cj4gQEAgLTEwNDEsNyArMTA0MSw2IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFu
ZGxlKQ0KPiAgCXJldHVybiAwOw0KPiANCj4gIGZhaWxlZDoNCj4gLQltdXRleF91bmxvY2soJnNt
dS0+bXV0ZXgpOw0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjcuNA0KPiAN
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
