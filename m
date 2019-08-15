Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C38ED20
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 15:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61106E9AD;
	Thu, 15 Aug 2019 13:41:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710063.outbound.protection.outlook.com [40.107.71.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4C6E9AD
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 13:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGGy0ryxD17+qaVDakAy02eiHBidYv00bKQCOxgz4l5jxK9qdv83SHI9wQHobX1Lh21uxiBLNEDSH/AfAaAS3+GulY9g49udFkz6itiWd2QGkFXjeelsfYN7mjLUp7P6eBkF80FSMUGuST/vdm+EFy9gDdQipMCvcFDmkub45zqzhQfcEZlsFCGpPwGI7q1ovdTo9jE6VrtrxRPx8VrS1dTbmSw+7CcKqoGkyIg9c9P/8iHzE3gRiwV2OYo4sf1D+lz6HYJRfWrF1cnCM5nIpiDg9jADsnXt+RARjbShCiHqYegdbRz+o7D03SZ821I4Lpk2YZiCqm7bcEEO5O0kQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqKMRfEbV06VfMUMstfbycS+KGDX92IAE3Klb3W4YSw=;
 b=WZ/pVt8/fQwrK388ydOjrTbrrkTZGiV9r1anLNeCtUneUYYSbCNq+yIYvzkXhrnTjPfVpktMusNV37v964llkgbVlFGVbYFwbeEt7a3BxlVgBJsW4nCj27yt7eGnvh+yRfcmTH/rCI7FU7Rew9vJld1fPG9htcKh6bV9NckhdKSWqmjPc52wgNKxft9vbaHszg7yVZpGAVpRzls6FOpXAqt3qnmNLmKK+lGgur0FvD1oVMMJ2gc8/K4hbi3mCOWR/N6kpG2VX69GrDHs6tupdgUaf39JwdkIaFDgXtT+07r6QNsUoZeZuaPp+o3g3M9FODxXAEHvHW08XVg6okgbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1529.namprd12.prod.outlook.com (10.172.33.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 15 Aug 2019 13:41:11 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 13:41:11 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: remove special autoload handling for navi12
Thread-Topic: [PATCH] drm/amdgpu: remove special autoload handling for navi12
Thread-Index: AQHVU0WKYwQOfjwhGk+k2TAEZVPvyqb8N4vw
Date: Thu, 15 Aug 2019 13:41:11 +0000
Message-ID: <DM5PR12MB14184452E39FBBA65124E57EFCAC0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190815084320.20015-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190815084320.20015-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4653318-b1b7-4513-ae1b-08d721863c4c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1529; 
x-ms-traffictypediagnostic: DM5PR12MB1529:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB15292B226A6B15465B4482E3FCAC0@DM5PR12MB1529.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(13464003)(199004)(66446008)(66476007)(52536014)(66946007)(478600001)(5660300002)(3846002)(6116002)(66556008)(316002)(64756008)(74316002)(14454004)(8676002)(110136005)(186003)(99286004)(229853002)(6506007)(102836004)(81156014)(7736002)(76176011)(76116006)(256004)(55016002)(486006)(53546011)(446003)(26005)(305945005)(66066001)(71190400001)(8936002)(53936002)(71200400001)(14444005)(4326008)(2501003)(476003)(25786009)(7696005)(86362001)(6246003)(2906002)(6436002)(11346002)(9686003)(33656002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1529;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HlBNTPpeRRAS/3SSZgmaDVcvxWr5iulpGH/g6nHz9M3X50ff4BEb0JpH/O80+zNdkBRr4AFtWzgtdk1EAyIavQNCFts3kwtucjCS8aySD2JxnjKx9oHh8/AC1cdNjntOJ5FfCFouhEjmtCOStwz1Vpm+5u+Zgf6ryTy2keUCxHrCa5VbLIFoC/EYfcmz4Ws5sE0YKuN8zkbs6NgzoK4LIKCUWYOyspt+crJ5Wbhlv5VX6od8FX5iRhIVLMqtZN2f/65wODMlMyoxx7ijqqzpe0q4ZLsijPFlj/4HqRWAUzkAlTrsYkToS4hGQPHgnxgimx598XolySnv1eUQw8jOw8UA1qz4+vweAgSK24Hzear21P6lkOEbsNKxpkKZ8/X+c0z1hblet41pPckrb+amGKtdTy2ysHzCtLYCQyAzDhU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4653318-b1b7-4513-ae1b-08d721863c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:41:11.5147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSCgiiDgTeNx3Km7PcYImQPfRkj4G9SV3JqQUtknVMvN2H3AsnD6iRF6kdxaAryKIuCd+dyV8UMbc4K8+Cr19w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqKMRfEbV06VfMUMstfbycS+KGDX92IAE3Klb3W4YSw=;
 b=eyjxee1lXHVaeBuQbp9r42fGNGFsLSH6esJVeyYqi9Yr5fPZyk3/42r8OAK14b6FipZ2eGTSebp24s0tWbDXQ2iiETDkV8qVPq4Hrl+cg9fLwe/7wPgBhaZR3X64ZMVg2QH73oZV1zqlk0j+fKHG3vHIruE8abZ6PjHYU3woiwE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBZdWFuLCBY
aWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDE15pelIDE2
OjQ0DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSGF3a2lu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+
OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogcmVtb3ZlIHNwZWNpYWwgYXV0b2xvYWQgaGFuZGxpbmcgZm9yIG5hdmkxMg0K
DQpzL3IgbGlzdCBpbiBybGMgZmlybXdhcmUgaXMgcmVhZHksIHNvIHJlbW92ZSB0aGUgc3BlY2lh
bCBhdXRvbG9hZCBoYW5kbGluZw0KDQpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9q
aWUueXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jIHwgMyArLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCmluZGV4IGFh
YTRjZGY4YmNhZS4uNGIyZDJmZDcyZGM2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMNCkBAIC0xMDMzLDggKzEwMzMsNyBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19s
b2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQ0KIAkJCXJldHVybiByZXQ7DQogDQogCQkvKiBT
dGFydCBybGMgYXV0b2xvYWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFsbCB0aGUgZ2Z4IGZpcm13YXJl
ICovDQotCQlpZiAodWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9S
RV9MSVNUX1NSTV9NRU0gfHwNCi0JCSAgICAoYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEy
ICYmIHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfUkxDX0cpKSB7DQorCQlpZiAo
dWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX1NSTV9N
RU0pIHsNCiAJCQlyZXQgPSBwc3BfcmxjX2F1dG9sb2FkKHBzcCk7DQogCQkJaWYgKHJldCkgew0K
IAkJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBzdGFydCBybGMgYXV0b2xvYWRcbiIpOw0KLS0gDQoy
LjIwLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
