Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B7BDAE3
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 11:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5656EB57;
	Wed, 25 Sep 2019 09:25:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790073.outbound.protection.outlook.com [40.107.79.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E7A6EB57
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 09:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5uhmNfIeZiQU+cDjLdpj1iVPvhYq8qHrMcFy0v2yh926diOPRP1zZxObaG86V4qWRg+YzljSai6uRkJIsg5zlCFfzhT6UaI05KIUFDcTT39ETFVzvn7JSPJdw6eU7Ef+PyZNIvDwR4H7EtX8i3j5wjKn96qd2lRCS9gZEgdRcZ8eckYiwd1mUod2XqUUt816JwpVoUmyJUjVq65ZtFWrMDha2BlsdrKq36/ktIQKpFPTmZdYGv1oZFkxuXLeWvGFxNW780PqFFwfxNmfRgolk+vXYB3r2lUqJWLr55rbSVQUlc52heBYqOrf4oR7hBifBRcb7tDIeu0449y7O1EwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIu+4gZf3hj/5Zvord8YbBARVJhXtyu941Rx8AlnUmM=;
 b=YrdfiSNJWeqxf9IN/m5i0d+wB38UoEnw4EGrE7/hG113aac+jz8Va7TQLHV5Kfl6eIhkvbOCDcL5DlbsItZyx7nrA83/v6/KZovm2BSSCdXMhe8F5jfak3WdUVsxLI4PkL0z6GEcK9YzI4cpT593wH54S/WQ7DdEu9vFRvNpch6gon7Ksbc2vNPrDo55CSbjruuUBhS/pDx1uQ1asjLAc8vq6xItAwejFwVFBUJ6RE+6AbmRRYulXfAkddyBHf1FOwg86hGdgmi6q0tfmwyD5acQjkDxZGXqH+LVANwhT+yDVMPOTC2BGfkjyoElsS7zefnV/JSOy0iinHZ0rUg5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3454.namprd12.prod.outlook.com (20.178.242.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Wed, 25 Sep 2019 09:25:13 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 09:25:13 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: restrict hotplug error message
Thread-Topic: [PATCH] drm/amdgpu: restrict hotplug error message
Thread-Index: AQHVbuyBWgYnWOb8cku4UowiTW6t1Kc8KFFg
Date: Wed, 25 Sep 2019 09:25:13 +0000
Message-ID: <MN2PR12MB29754104C4EA174CE2949FBC8F870@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190919131649.8406-1-christian.koenig@amd.com>
In-Reply-To: <20190919131649.8406-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffc6fea5-cc38-4e66-0690-08d7419a44f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3454; 
x-ms-traffictypediagnostic: MN2PR12MB3454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3454FA74D2E31A9F40D719218F870@MN2PR12MB3454.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(13464003)(199004)(189003)(14444005)(6436002)(229853002)(66574012)(66476007)(305945005)(52536014)(66556008)(486006)(55016002)(15650500001)(2906002)(7736002)(66446008)(76116006)(74316002)(256004)(476003)(6246003)(446003)(66066001)(66946007)(71200400001)(71190400001)(9686003)(64756008)(186003)(6116002)(33656002)(4326008)(81156014)(2501003)(478600001)(81166006)(26005)(5660300002)(11346002)(25786009)(86362001)(3846002)(6506007)(102836004)(110136005)(316002)(14454004)(76176011)(7696005)(8676002)(8936002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3454;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XioiDFhBgAxnosZmuQvReyVaos+Le3rK/qqJn9o/qtnEYFkW2aoUFQM0u9uQK2aRwITikqmEdbKuo7N2m3TrERy/6hCHBxPapICc3oY+xwRVTZ/KBtgP2W4peHXVZfqBwLJ4MFG8luRzYRBcCqX3HncB6KQ2G2oEg4EkYv7DxrZw7Y2iLRe4nGo03vAZe9URw0jO3rirCS23cTaWWR/pFMGz/MCuRqjK6nlAUAlQlxb9jaIXohISsejR0CIMkWM1GCBKyC1L6RsE2ZQFPx4xZRvXVvHqE4i6AhCYfx9Tp25GJHGds7k9Yuy90PdQWXOiEC3PXTvFlsrwPlAG3efZKafIqSbt8ZduSyms9uUNDqu3tpSPpn38YTZK57xaWcFEgdS+Fi5awnSvWptcAGYVvwlUDsuR62IY32Niycxf6fo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc6fea5-cc38-4e66-0690-08d7419a44f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 09:25:13.1561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xelc9Y2xfvmeLiFSgcwzvlkAK1UfhpEP1Cyjnu2uTGN4FkVxDkfy3zf9fqpbwltr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIu+4gZf3hj/5Zvord8YbBARVJhXtyu941Rx8AlnUmM=;
 b=stFAvAPfq2hyv5hj9Ba/CF+7kKa4fIRDHfpytiAcGdcAv8enBcku0SAIhM6EeIlo569ltp2J1Xrg0/MuHEUpLz1v1zmCvUZkydlKUZo+ntd05c5dnKRsqmOxdm4PZVDzrtnDiDdm2S7bmuPQ7HqHG/qqbRJgc6Io8Wst3yDl9vM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCg0KPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWlj
aHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+U2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOSwgMjAx
OSA5OjE3IFBNDQo+VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IERlbmcs
IEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+OyBaaGFuZywgSmFjayAoSmlhbikNCj48SmFjay5a
aGFuZzFAYW1kLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHJlc3RyaWN0IGhv
dHBsdWcgZXJyb3IgbWVzc2FnZQ0KPg0KPldlIHNob3VsZCBwcmludCB0aGUgZXJyb3Igb25seSB3
aGVuIHdlIGFyZSBob3RwbHVnZ2VkIGFuZCBjcmFzaCBiYXNpY2FsbHkgYWxsDQo+dXNlcnNwYWNl
IGFwcGxpY2F0aW9ucy4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYyB8IDUgKysrKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYw0KPmluZGV4IDY5NzhkMTdhNDA2Yi4uNWNiODA4Y2I4MTA4IDEwMDY0NA0KPi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPkBAIC0xMDk4LDcgKzEwOTgsMTAgQEAgYW1k
Z3B1X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpICB7DQo+IAlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOw0KPg0KPi0JRFJNX0VSUk9SKCJEZXZp
Y2UgcmVtb3ZhbCBpcyBjdXJyZW50bHkgbm90IHN1cHBvcnRlZCBvdXRzaWRlIG9mDQo+ZmJjb25c
biIpOw0KPisjaWZkZWYgTU9EVUxFDQo+KwlpZiAoVEhJU19NT0RVTEUtPnN0YXRlICE9IE1PRFVM
RV9TVEFURV9HT0lORykgI2VuZGlmDQo+KwkJRFJNX0VSUk9SKCJIb3RwbHVnIHJlbW92YWwgaXMg
bm90IHN1cHBvcnRlZFxuIik7DQo+IAlkcm1fZGV2X3VucGx1ZyhkZXYpOw0KPiAJZHJtX2Rldl9w
dXQoZGV2KTsNCj4gCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsNCj4tLQ0KPjIuMTQuMQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
