Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5AB1090
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 16:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C489F6ED7E;
	Thu, 12 Sep 2019 14:02:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88E76ED7E
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 14:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bn8dkJYp0lE6OBKdUbXwwDjI08RBTuYriD8w22l0JQ9HcyCNHf07cNsoRFEj4b2xfeffr96LwvYIyUvga62SRiMFMgKm8PsCI3X3jsD4n6RW0Z4A7bdT+bbxi7clCCXGUeivZz5jxGASU4s6RJKSdBS1KrtyKGOx2wZ7LD9eShx9kYImG+AYHo9MscVrhssvs7LJ3hSD6seb9yFKIskmIYg0ZbbX6H1KX8RhyeXj52sz5ITYenE3XVzAjm+IEjt1z8GRG17a4hKiEVvE87mdLDM1q3khYy2NxiKuo69yrei8zG2QXNijSCLuXblStqaaZLU1HgzoF1ghFErBSwQg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIawEYwYMlhxDteBvNZN7U48AcQPnN57l/QuDrxCBQ4=;
 b=iF5XHOhYZWqRWrm2Kz3RDeJNsEz0fElEog9Hgt+bKJ+OWHLah8umZOnrs/Ow4rl5O4NH7Tk9u5r/KdtL3g37hiO5v1rBwrpXlyqRzIEjT1+++NeBev3xumdKJRHxeUhFC+zpkyCa6DQPIL1bO51tjvKyeqd3GLktXNPvQvzUWtgpocwi6zrRSsXQnc+ctjSUG0dj/q843KqGA+ClRu4EmpfTveiIZ0L4MREJ0Yl2fNy+xSZOlBLg1pKzYKojCpnpxOk2ADe+y3IY1KTpwHYtH48GcJO+0cf7VpCXgIUeQMLCIFYCpPD11mKkRSB43yh6sEIh8VSAdRJHdRi574wLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3822.namprd12.prod.outlook.com (10.255.237.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 14:02:18 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2%2]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 14:02:18 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: resvert "disable bulk moves for now"
Thread-Topic: [PATCH] drm/amdgpu: resvert "disable bulk moves for now"
Thread-Index: AQHVaVMJSR8RAX/qXkO3L0QEqdfU7acoEqsA
Date: Thu, 12 Sep 2019 14:02:17 +0000
Message-ID: <f0b19f35-5852-8cbe-2256-e769169d8884@amd.com>
References: <20190912101535.71686-1-christian.koenig@amd.com>
In-Reply-To: <20190912101535.71686-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1623680e-33dd-4592-561b-08d73789d243
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3822; 
x-ms-traffictypediagnostic: MN2PR12MB3822:
x-microsoft-antispam-prvs: <MN2PR12MB3822A5E521C85C96C136D257B4B00@MN2PR12MB3822.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:393;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(189003)(199004)(486006)(6116002)(3846002)(31686004)(4744005)(2501003)(229853002)(66066001)(5660300002)(53936002)(71190400001)(25786009)(6246003)(31696002)(110136005)(316002)(99286004)(71200400001)(66574012)(14454004)(2906002)(66556008)(66476007)(11346002)(66446008)(446003)(6512007)(8936002)(14444005)(476003)(36756003)(2616005)(305945005)(64756008)(7736002)(66946007)(52116002)(478600001)(6486002)(6436002)(81156014)(6506007)(186003)(26005)(256004)(8676002)(76176011)(102836004)(81166006)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3822;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LW/pFkAJ6xZV9LmUAsxxW9rokhlgCC/lxb18rdu0c1A9jVgpqIaNhLDL8dAN0+hxBFIqEp9q+JBJMdnVD6Scap+Tu1Vm5oNGnAvsALjNBoI4Byat/zegoP47YzFH3kzG/mOpp8noCyGJTdHJhOOJRIRfbCa0zcofscqN/OE4DCkb/JP2WZkbxZa3xVkqQDnuV8f6f5AKYIDCjTOpr2RuHRj/3XmxB9tNcv9KWjLy8NG5ELwXkDUcOP830H3oeaRgxSdOcI72aPH0Mx/eNULJBz7EjnFhoc7FR7zhBeklvqpW69c9LIzaUyZNvJSuMIKrb/Tfp+CPwJvhxfVGurGe3ytakK9/rwyzTAufelqX3SGZ8lZ7rlvhqI6Wficgh3DRcmeiRpBvIaQ0gLhGgjrrqJXO7pdhEEZRnayA0R9Csl4=
x-ms-exchange-transport-forked: True
Content-ID: <7E47B364020F0B48BED8E3FB7EA6A548@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1623680e-33dd-4592-561b-08d73789d243
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 14:02:17.6908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vi6dBi10cMHJmUhylPnV7U3cnBnSOMyYk9M8mbtO7qtXm5rJw5pVSFzAVLDjb8P+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3822
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIawEYwYMlhxDteBvNZN7U48AcQPnN57l/QuDrxCBQ4=;
 b=yW0CVQ1+yZPEuLMZABe31FiGY0CZ5QfMwPxZmOuvlW2fEjK2KyNv4UBDaHsZAV29iwEdtaPx8Fp+dq32uez79li/yYHupSAzNUMNpMUZb1Npidg3d6xazARNpFECp35B3MxbcKWtbGWLsvsfwDfK6THpBQbbdbjssv2peja5v24=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

UkIgb24gaXQgdG8gZ28gYWhlYWQuDQoNCi1EYXZpZA0KDQrlnKggMjAxOS85LzEyIDE4OjE1LCBD
aHJpc3RpYW4gS8O2bmlnIOWGmemBkzoNCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBhMjEzYzJjN2Uy
MzVjZmMwZTBhMTYxYTU1OGY3ZmRmMmZiM2E2MjRhLg0KPg0KPiBUaGUgY2hhbmdlcyB0byBmaXgg
dGhpcyBzaG91bGQgaGF2ZSBsYW5kZWQgaW4gNS4xLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiAtLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYw0KPiBpbmRleCA0ODM0OWU0ZjA3MDEuLmZkM2ZiYWE3M2ZhMyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gQEAgLTYwMywxNCArNjAzLDEyIEBAIHZv
aWQgYW1kZ3B1X3ZtX21vdmVfdG9fbHJ1X3RhaWwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
DQo+ICAgCXN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iID0gYWRldi0+bW1hbi5iZGV2Lmdsb2I7
DQo+ICAgCXN0cnVjdCBhbWRncHVfdm1fYm9fYmFzZSAqYm9fYmFzZTsNCj4gICANCj4gLSNpZiAw
DQo+ICAgCWlmICh2bS0+YnVsa19tb3ZlYWJsZSkgew0KPiAgIAkJc3Bpbl9sb2NrKCZnbG9iLT5s
cnVfbG9jayk7DQo+ICAgCQl0dG1fYm9fYnVsa19tb3ZlX2xydV90YWlsKCZ2bS0+bHJ1X2J1bGtf
bW92ZSk7DQo+ICAgCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPiAgIAkJcmV0dXJu
Ow0KPiAgIAl9DQo+IC0jZW5kaWYNCj4gICANCj4gICAJbWVtc2V0KCZ2bS0+bHJ1X2J1bGtfbW92
ZSwgMCwgc2l6ZW9mKHZtLT5scnVfYnVsa19tb3ZlKSk7DQo+ICAgDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
