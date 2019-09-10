Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F31AE65E
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 11:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D786E073;
	Tue, 10 Sep 2019 09:12:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA656E073
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 09:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HY0c14c8HuM4qwbMjVOd2h9/XyBeGRYUPj5LrcKnGaqcXHrptZCQ0Kx2xr/mzcH5JzWi3MO9r0KUYZv2SgbtMisH8MMvu96MlPo+58f+i4XWJcgornUThp5k51dAlS6MeABsK99fbXcSn3E/p+u//7SHY/ehsPtWn1EUT6DleIkDaPcpfGQYdkqC49bgM/2AdKsiSowpp5XsfkVyQw0BEpYwTA9eVpLUfp7cruShkyeDGonhe5YruaLQPflCn8CrX9uEmv9Y8+/AZjqsY0LNNVFMNQ7pex2AD0XctXKOtvJHzw3rh6Wt8R5u4YcVRvJIblI8joO/oOX989CLXZUtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OztBXJaPdbbYI5XZh+yrZMPuSM7kIEYurj30zNdBM58=;
 b=NXNvjjGptYpUb4yC245bQt+N9kyWaDS0i1iW9UnQBdUWGM1j6kqQAtecRGohsGQ+O/NUmxMkP6ZwSyCFw8AZJ5RousL7tftzXiNEW8yiHwhHZvSbU/bYGTSGEDD5q/Lf326aLv3pnOwvCdyIIZnZWfx04S7PAp3Me4sbgC/oPTKQIKPIJK5ieycNwK3W5FH/ZegDxyPq8WK5sZmVJSqDFQkbKaonjKBlZumw0Hu0Fnb3RD7sqUOziH6nP7c+uXiRQmDuyr3XD9cwMsHUrpRa5N1wlRwEAvZmnyyy4aRH/Sh+0rKAdlsp4HiIWPXWD8ntYA9D/yGSVEWuIGSxwHQUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 09:12:02 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 09:12:02 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH] drm/amdgpu: remove duplicated header file include
Thread-Topic: [PATCH] drm/amdgpu: remove duplicated header file include
Thread-Index: AQHVZ7PfY0xwzgtYBkm4EOWpU+AATackn06Q
Date: Tue, 10 Sep 2019 09:12:02 +0000
Message-ID: <MN2PR12MB3054AB1F67953B25EDFA2009B0B60@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190910084333.10538-1-guchun.chen@amd.com>
In-Reply-To: <20190910084333.10538-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c42bbac9-e75d-486d-54a3-08d735cef161
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3389B82903CD238F8794C75EB0B60@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(189003)(199004)(13464003)(55016002)(6246003)(7696005)(86362001)(11346002)(446003)(74316002)(476003)(486006)(2501003)(7736002)(6506007)(53546011)(110136005)(14454004)(99286004)(52536014)(305945005)(478600001)(33656002)(81166006)(81156014)(8936002)(8676002)(26005)(102836004)(9686003)(186003)(2906002)(316002)(76176011)(25786009)(6636002)(256004)(14444005)(229853002)(66946007)(66476007)(66556008)(76116006)(64756008)(66446008)(6116002)(5660300002)(71200400001)(4744005)(71190400001)(53936002)(3846002)(6436002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eekvQdtXURsd0WY+wUOXuuWfbeBsdMNg4hxOWqfhKST5sjvwHfx+jq3hlr82DYJOMRHQCSJuowVKAoZk9rqh/SmsKMpSjuLz1PMdDrvT4FwpfKm3XKvw6acIFlIksyiXQtHkOntKljYvgiUBcPstqo5XxLoxYVo3+88VJ3pHXi82OUlIGtoHr1dRdNxBeRPdv6Q5BLKJsKQrOGConvjYM4kwrR5jcYIZ6ArKzcLDys0Nse28uZhwAd9E7fmX6+gc1CoQ3Gq5iN7L1bU9/Go9AAUUp0dIFn9k+0Fl/FqyNsAi9vxXYy2hLbyCwMN7GyS5xoEgPCKMqrPIPyFMSvO8wo86vhtCMf+Y+BUf5/bEbyckpI3m4pkaUMek3+WD/60Nydfdbqw3kBTfRgsG2JC7sH1k4BzjA3EGDlK1d+O0xwU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42bbac9-e75d-486d-54a3-08d735cef161
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 09:12:02.4248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jv+z/Dw8VPPc19/9TPMTPT9cFTaWHfj4qiVRVWcFDrxbKhOXc4MhB0WD74sPKCwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OztBXJaPdbbYI5XZh+yrZMPuSM7kIEYurj30zNdBM58=;
 b=E+821gkXNXN9NY/4OwTtHNuqNl84Ohx5GMRmRyHHAbxY+oOLreZw21vDQd8Yj69GWht0sKZYRAi6ISybXOi9Ff7s8jCzrTTgxrep0WIba49iQBaQpXDWq9ke83knWmeFpnExGhxzIndKOdCtZx2OA3qqNZIDEWOeYqJF78VjmXg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

UmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5j
b20+DQo+IFNlbnQ6IDIwMTnlubQ55pyIMTDml6UgMTY6NDQNCj4gVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+Ow0KPiBHcm9kem92c2t5LCBBbmRyZXkg
PEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+IENjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5D
aGVuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVtb3ZlIGR1cGxp
Y2F0ZWQgaGVhZGVyIGZpbGUgaW5jbHVkZQ0KPiANCj4gYW1kZ3B1X3Jhcy5oIGlzIGFscmVhZHkg
aW5jbHVkZWQuDQo+IA0KPiBGaXhlczogYjE3MThkYSAoZG1yL2FtZGdwdTogQXZvaWQgSFcgR1BV
IHJlc2V0IGZvciBSQVMuKQ0KPiANCj4gQ2hhbmdlLUlkOiBJNGNmMWViNTM5M2Q4MGM0MmI0MjZk
YzFkZGZjNjk2ZTQ4NmEwMmM2Zg0KPiBTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVu
LmNoZW5AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlv
X3Y3XzQuYyB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jDQo+IGluZGV4IGJmYTkxOTE5MGZi
NC4uMmQxNzFiZjA3YWQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9uYmlvX3Y3XzQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3
XzQuYw0KPiBAQCAtMzAsNyArMzAsNiBAQA0KPiAgI2luY2x1ZGUgIm5iaW8vbmJpb183XzRfMF9z
bW4uaCINCj4gICNpbmNsdWRlICJpdnNyY2lkL25iaW8vaXJxc3Jjc19uYmlmXzdfNC5oIg0KPiAg
I2luY2x1ZGUgPHVhcGkvbGludXgva2ZkX2lvY3RsLmg+DQo+IC0jaW5jbHVkZSAiYW1kZ3B1X3Jh
cy5oIg0KPiANCj4gICNkZWZpbmUgc21uTkJJRl9NR0NHX0NUUkxfTENMSwkweDEwMTNhMjFjDQo+
IA0KPiAtLQ0KPiAyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
