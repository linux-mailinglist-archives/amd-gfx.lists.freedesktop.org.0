Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66E8702C
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 05:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E056E7F3;
	Fri,  9 Aug 2019 03:29:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780084.outbound.protection.outlook.com [40.107.78.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5776E7F3
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 03:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIoyQNBJbTewXT1EwZZtcdDCyWuldb28Geyt53PZB4KYtTPqbRzZWb6QIQGx3PU/Jqc0PktlzUGzQQAeRRaIO8IcNt4e6MlKqbFRiTQoYxri4a4++p4uvPS+ZZGqcS4JEV6PaZOTgrLvV8/hWwU6nRYUwtTPRtDQGl4QhZtNhlHwNPm15I18PqflCzZpIaTnA5vU1cReogURXmLL/smZ5q/4ycUA5w3bsFDTPv7hFgMbmpaBRziZQVC69lM0Bo5fES9wP+OLn6BvDX2YoGNMh+g1ep0elbbCkAcIHbWwJENiGJSvsoXOMURmrttjAjzfHxqCJV01sgqdliXULkAvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waIYD/7E1DQgnao2wTFj1DQ9UHeNjZv47yNSm6rc8iQ=;
 b=SroH1D+l1ZLxBmtzJ2D0MBvep34mOP71hA0VdmVdwCwhixJqvoYB8XCmPvQaFNffbVmyLZyAe18WapZgwWawOL4BngKi6H8yJuSCrrZsJfNxxmdYzp6xrIACiLdUfIJyXZ5XbsyOWee6HZqfctL0fd0Vk2OrKlMBHLURnMJTqRez6I1n3UEHop4zxVqcNQup2uwkO9EopjQKZrPX3OOPHCGLkBkNERaIzgNHHmgMFiMSXPKOhAdtkw3B9LFbWPKXsf6Fd+iF1tdCHB5ffti1pJXjcKBva+YxyuIIH/5dvkB52udMP1hlq17BZXZcXdMa7tEunhOA2MLWwPdfLpz6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3104.namprd12.prod.outlook.com (20.178.243.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 03:29:18 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:29:18 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/9] drm/amdgpu: enable gfx clock gating for Arcturus
Thread-Topic: [PATCH 2/9] drm/amdgpu: enable gfx clock gating for Arcturus
Thread-Index: AQHVTdMjjUsgNm5jPUWB+4Cx1ZMFRabyKY+w
Date: Fri, 9 Aug 2019 03:29:18 +0000
Message-ID: <MN2PR12MB35986B58645E06FB6BACD9018ED60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
 <1565259714-30357-2-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-2-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92a21087-d847-4d2d-75ae-08d71c79c33a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3104; 
x-ms-traffictypediagnostic: MN2PR12MB3104:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3104B3B44B50AB7F226F9CE58ED60@MN2PR12MB3104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(13464003)(6246003)(316002)(6306002)(305945005)(11346002)(2906002)(52536014)(486006)(55016002)(478600001)(2501003)(7696005)(7736002)(3846002)(8676002)(6116002)(25786009)(66066001)(446003)(66556008)(71190400001)(71200400001)(74316002)(5660300002)(4326008)(66476007)(81166006)(81156014)(229853002)(256004)(14444005)(86362001)(8936002)(186003)(26005)(476003)(53546011)(6506007)(66446008)(53936002)(66946007)(76176011)(102836004)(6436002)(33656002)(110136005)(14454004)(966005)(99286004)(76116006)(9686003)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Q/qG5BN/Q67pqhkKxpsvtGgddEHMlmtO5MD//Gvm2Nql+1kiDKCFQSwA2D8Xwx1k94KCCV2OwEdaPGdEhX/5ouLQ/0/1d28A88c/jMO8tapDrsMDo9QcN5v1UJxNu0JLc1rcIPUWoK1ocLNjTZi2XQUk7Blt6Ax/ixTQxGGewCpIO8Mi2BGGlWvz9tClGciYenaLVSmMW0l7MgDV5i2RuqZSfZoyUGxhWstm4kFIe8sDjItLI1ov1M6t8b9KDWPASfWL9gHwLIUqj2d77yvW/Ed7tSs3lh9rWVh+NylMdX2Fl8S63nKNHMeQBeQdVRXBS2jREfQocih+LR7XDKMQPGdo5bumr0G3XXQB+Gdms/3+UgtIlaFjMEP/lMXXrz/vejD3vdOfi6eSYuRvGvqs6Uxi04P61XPKYXYSS1+HOM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a21087-d847-4d2d-75ae-08d71c79c33a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:29:18.6594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDmnGfKblf9FxzyHCx+j6YenLge4qbJCF24LOCTUDSqgwHhaB8x/h2Iszld0NlrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waIYD/7E1DQgnao2wTFj1DQ9UHeNjZv47yNSm6rc8iQ=;
 b=HTw4FyPnKc5vZgy0lV9EE64VQUDSu3udbj8uDOHAuSxsujrTiBjl11qMsE9/y3Xt7zS82ZZGlHzIH7eWbqcEp6hlQ110tvEcHTpIFaaokKXkBM6WY8CkHukJryl1eyUZlnhiyTmUfunr3lWmpb8+W1lbpad3dpL26r4dc50cKCs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IFttYWlsdG86YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmIE9mIExlIE1hDQpTZW50OiBUaHVy
c2RheSwgQXVndXN0IDA4LCAyMDE5IDY6MjIgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IE1hLCBMZSA8TGUuTWFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAyLzld
IGRybS9hbWRncHU6IGVuYWJsZSBnZnggY2xvY2sgZ2F0aW5nIGZvciBBcmN0dXJ1cw0KDQpbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCkluaXQgZ2Z4IE1HQ0cvTFMsIENHQ0cvTFMsIENQX0xT
IGZsYWcuDQoNCkNoYW5nZS1JZDogSTg4ZGI3NmQxYjhmMmIyY2VjY2UxMDg0NmE0ZDIyZWVjNjM4
ZWVhOGENClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPg0KLS0tDQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDYgKysrKystDQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMNCmluZGV4IDE1ZjYzNTYuLjAwNzU4YmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jDQpAQCAtMTAxMyw3ICsxMDEzLDExIEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vh
cmx5X2luaXQodm9pZCAqaGFuZGxlKQ0KICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICBj
YXNlIENISVBfQVJDVFVSVVM6DQogICAgICAgICAgICAgICAgYWRldi0+YXNpY19mdW5jcyA9ICZ2
ZWdhMjBfYXNpY19mdW5jczsNCi0gICAgICAgICAgICAgICBhZGV2LT5jZ19mbGFncyA9IDA7DQor
ICAgICAgICAgICAgICAgYWRldi0+Y2dfZmxhZ3MgPSBBTURfQ0dfU1VQUE9SVF9HRlhfTUdDRyB8
DQorICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9HRlhfTUdMUyB8DQorICAg
ICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9HRlhfQ0dDRyB8DQorICAgICAgICAg
ICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9HRlhfQ0dMUyB8DQorICAgICAgICAgICAgICAg
ICAgICAgICBBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFM7DQogICAgICAgICAgICAgICAgYWRldi0+
cGdfZmxhZ3MgPSAwOw0KICAgICAgICAgICAgICAgIGFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFk
ZXYtPnJldl9pZCArIDB4MzI7DQogICAgICAgICAgICAgICAgYnJlYWs7DQotLQ0KMi43LjQNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZngg
bWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
