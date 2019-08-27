Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFC9F1E9
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 19:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB5489BA1;
	Tue, 27 Aug 2019 17:54:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800058.outbound.protection.outlook.com [40.107.80.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF0789BA1
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 17:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx/4jvmAcTYNdicwZOo5DbuCEJ3AYvcTPrcNzG5xdOi1tmlMPCvDikl15co68LGjU98JdxnP+dN4QV6rxrlFc2rhGJ02wKtaWdqiqOS302YUsBrhu9zpys/KPENcen7NCQLRA5UwNHcidGclIBjqPKRREf94sRWrvRnWzH8VB6QV/RB01hPqbzRDbu4HLOpUZByCVKc2sAqo66TsxW94iVt/AgrbVk1mjAxaIMmEftQaOclS9sDdUpCpNf0lNgdUMwPe2dRaEaYSzmho+3j6/MH5L7e91RfXbuKt6DGJiRXFdqlnvnv2oOEBLs0IqJ6RqG5PTiYz1aGzcU2VrRTSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j91QGYvZsKSI1MCNVh0HWAVMe0q29iF8QqwUc6QP+bY=;
 b=eQ1MJ63Kvg/S4UjvTdC7kto9TmWLOWNxtSG0HmRh1eeoBdJvqdGXjM7GNJeJpvfSh+TGbTYLg94azsBipnwvKHC3E4lsa0G+7pRzMKbHSIsRHbafTVkknz23tEYaW/Fh+fxD+R7NE6ssvwpOww9Micp3nW+3X9MLuSiWMQBs+Ms1d07AzX1+vs7oeSCtGZTMapEdmp18EFe5qa63TcUJE5XNe6uQOP/1lohWmZvrqfWwG6D3+PYBH8mgJj12D34ItTKuMuEF4HWhdhUOLwjR1isGb8gomILWpCrW3ctYDyrTL9yCCTEiV7KEogF0rI8pkjey1IcMBUPu/HHD4cGx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4223.namprd12.prod.outlook.com (52.135.48.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 17:53:58 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 17:53:58 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix commit 4ef9d7d
Thread-Topic: [PATCH] drm/amdgpu: fix commit 4ef9d7d
Thread-Index: AQHVXOzbhTgRRZ3RhkedZAwtsXlroqcPRt+g
Date: Tue, 27 Aug 2019 17:53:58 +0000
Message-ID: <MN2PR12MB3309B0EA6F55CF3EABAF93CEECA00@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1566920009-8378-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1566920009-8378-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.56.12.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41560a68-d48a-442b-352a-08d72b178951
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4223; 
x-ms-traffictypediagnostic: MN2PR12MB4223:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42236FE971791BED00BEF9E0ECA00@MN2PR12MB4223.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:194;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(13464003)(189003)(26005)(476003)(25786009)(102836004)(446003)(966005)(110136005)(2906002)(486006)(6246003)(66476007)(316002)(76176011)(256004)(53546011)(7736002)(4326008)(11346002)(99286004)(14444005)(14454004)(229853002)(52536014)(74316002)(305945005)(6116002)(64756008)(66946007)(66556008)(55016002)(66066001)(71200400001)(53936002)(478600001)(71190400001)(8676002)(5660300002)(81166006)(81156014)(86362001)(9686003)(2501003)(7696005)(66446008)(8936002)(33656002)(76116006)(6306002)(6436002)(6506007)(186003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4223;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zVdi/WfvcNjkY2OESuNiezfQQ04j40Rmf8MCG+KVHW1v9ZGOhMMUeBhPgykj9Ckc9MCuMjWb0dAkIz+eL34glwDqj3TpU+RJPwdZuL0OvK3vGon7/E/5YlE4x5XEjmyqINxGqucqLElcR8XeqpmDyagiUkt9C5wjcKMMTYC5+B5AMU0hVAhdr1GNOxrFhCblASiKuL6hDfs0UC7p+tEXv/ytLnGREK9ZeF7LgIlcqItxSTB9gpbAUTa2KSZvZwPwbTyIVGM+e+jvmGHWLZWYUNWiyMRQWdtMNDtiP5qqhLNyBlF4HqA0C5zGJ376TtH+UczngfaSN9Ofeb9eqNyLFQvFlLR3IeSQhhbljpCnsbp5zjysdHR0fqdo+/QC723RYG2VePH7U2rhp9avrkmjqWePF8Ps3c9jI5USpR9yWbI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41560a68-d48a-442b-352a-08d72b178951
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 17:53:58.3117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bDaabKzO4LQo1dZRXLxBJHa4K3cgVNa8YPRgJPdt1SpjT/DlxyRyIspM+/rI+ES3rG21s6VEYJ+1a4S+uA4ADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j91QGYvZsKSI1MCNVh0HWAVMe0q29iF8QqwUc6QP+bY=;
 b=x9fT3FXEyLmyUW8X8B5AueYdg3e62Xb4WQk3eNTv+AKXCEIgf5mGpIdRk9MnbHXJu8F1TDsTwvODDeztfePHIDCFwxZbKYTnzrBZdZMMXjAYG1uySLDykAFdTkJI4cuAIu0b1e0BtYiu5QBVM5MqcgWewB1Ry6kLvD7UIkF5QBI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWFyb24gTGl1DQpTZW50OiBUdWVzZGF5LCBBdWd1
c3QgMjcsIDIwMTkgMTI6MzMgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Q2M6IExpdSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1OiBmaXggY29tbWl0IDRlZjlkN2QNCg0KRm9yIHBpY2Fzc28oYWRldi0+cGRldi0+ZGV2
aWNlID09IDB4MTVkOCkmcmF2ZW4yKGFkZXYtPnJldl9pZCA+PSAweDgpLCBmaXJtd2FyZSBpcyBz
dWZmaWNpZW50IHRvIHN1cHBvcnQgZ2Z4b2ZmLg0KSW4gY29tbWl0IDRlZjlkN2RjMmRiMTY2Y2Jl
ODNmZTQ2MjEzODVmMDM0YzkzNDdmZDIsIGZvciBwaWNhc3NvJnJhdmVuMiwgcmV0dXJuIGRpcmVj
dGx5IGFuZCBjYXVzZSBnZnhvZmYgZGlzYWJsZWQuDQoNClNpZ25lZC1vZmYtYnk6IEFhcm9uIExp
dSA8YWFyb24ubGl1QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jIHwgMTQgKysrKysrKy0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMNCmluZGV4IDI3NjJhZTQuLmZkNzk0N2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jDQpAQCAtMTAyNywxNCArMTAyNywxNCBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9j
aGVja19pZl9uZWVkX2dmeG9mZihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJY2FzZSBD
SElQX1ZFR0EyMDoNCiAJCWJyZWFrOw0KIAljYXNlIENISVBfUkFWRU46DQotCQlpZiAoYWRldi0+
cmV2X2lkID49IDB4OCB8fCBhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHgxNWQ4KQ0KLQkJCWJyZWFr
Ow0KLQkJaWYgKChhZGV2LT5nZngucmxjX2Z3X3ZlcnNpb24gIT0gMTA2ICYmDQotCQkgICAgIGFk
ZXYtPmdmeC5ybGNfZndfdmVyc2lvbiA8IDUzMSkgfHwNCi0JCSAgICAoYWRldi0+Z2Z4LnJsY19m
d192ZXJzaW9uID09IDUzODE1KSB8fA0KLQkJICAgIChhZGV2LT5nZngucmxjX2ZlYXR1cmVfdmVy
c2lvbiA8IDEpIHx8DQotCQkgICAgIWFkZXYtPmdmeC5ybGMuaXNfcmxjX3YyXzEpDQorCQlpZiAo
IShhZGV2LT5yZXZfaWQgPj0gMHg4IHx8IGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDE1ZDgpDQor
CQkJJiYoKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiAhPSAxMDYgJiYNCisJCQkgICAgIGFkZXYt
PmdmeC5ybGNfZndfdmVyc2lvbiA8IDUzMSkgfHwNCisJCQkgICAgKGFkZXYtPmdmeC5ybGNfZndf
dmVyc2lvbiA9PSA1MzgxNSkgfHwNCisJCQkgICAgKGFkZXYtPmdmeC5ybGNfZmVhdHVyZV92ZXJz
aW9uIDwgMSkgfHwNCisJCQkgICAgIWFkZXYtPmdmeC5ybGMuaXNfcmxjX3YyXzEpKQ0KIAkJCWFk
ZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOw0KKw0KIAkJaWYgKGFkZXYtPnBt
LnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykNCiAJCQlhZGV2LT5wZ19mbGFncyB8PSBBTURf
UEdfU1VQUE9SVF9HRlhfUEcgfA0KIAkJCQlBTURfUEdfU1VQUE9SVF9DUCB8DQotLQ0KMi43LjQN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1n
ZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
