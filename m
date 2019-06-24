Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE450A8F
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 14:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC98C89AD2;
	Mon, 24 Jun 2019 12:17:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710082.outbound.protection.outlook.com [40.107.71.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0720089AD2
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 12:17:08 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1274.namprd12.prod.outlook.com (10.168.239.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 12:17:06 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 12:17:06 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable gfxoff on navi10
Thread-Topic: [PATCH] drm/amdgpu: disable gfxoff on navi10
Thread-Index: AQHVKoaaWXLtLGPFmkuYC1W5nfRxFqaquFNA
Date: Mon, 24 Jun 2019 12:17:05 +0000
Message-ID: <DM5PR12MB141865B4B5F481A4C5D87E17FCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1561378554-10083-1-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1561378554-10083-1-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5de3a08c-e0e7-4cc2-8b7a-08d6f89ddf5d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1274; 
x-ms-traffictypediagnostic: DM5PR12MB1274:
x-microsoft-antispam-prvs: <DM5PR12MB127497763BFA2EB393D6040BFCE00@DM5PR12MB1274.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(13464003)(6246003)(4326008)(478600001)(72206003)(33656002)(14454004)(3846002)(81166006)(74316002)(9686003)(305945005)(6116002)(55016002)(7736002)(8676002)(81156014)(229853002)(8936002)(76116006)(6436002)(66476007)(66556008)(64756008)(66446008)(73956011)(66946007)(71190400001)(71200400001)(86362001)(52536014)(53936002)(256004)(5660300002)(26005)(186003)(110136005)(2501003)(76176011)(316002)(102836004)(99286004)(476003)(2906002)(68736007)(7696005)(486006)(25786009)(11346002)(446003)(53546011)(6506007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1274;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nlrVYKYib/84rw2wJRDlJiu2XzCBqT/YUOW2nHKi3gNna+HSMAaEU4DFle//FFcljSggGlOO0/chdFumgBJF/raKEywpnbrbjpRfRGYXCeV2byB2GNgjKdDr4lnyKhLn0704rs8MIxcodNHMVho0FfmkJvV769Vv3zjjql0lIzqswGfsXPInX5Rz0iJ5yIWZ2HVwrus3OiTROBricqb/rI+A2nu4XfmXwa2k+E/zUZcfj4kNRjF+29huModC++QMtupF9zCshoQA5Cxs+SMngOpoutNQt425hgEsEc6ut7th1yMZbJh8Ag0N3b9ABGf6Zk3waxnQ61/28IERtZdO1K12AZCDjk/xRH1DRaKyFcQDWWvPWPPVp5SEtSNvrZPlaHX+CFlAObYUkwkPCo8cYAM6tyS9YEvGk5Yp33Ipkwc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de3a08c-e0e7-4cc2-8b7a-08d6f89ddf5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 12:17:05.9036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciEwBw5dslr2cCkzWcJu9pn7mLGJLr7SqJyOVpA+vaw=;
 b=BlsUOWYxfzR7HiDt1XdrUFaVbrHh2V7rwuxIHSkeQlX8vAlmVZe7wp/ZUIXhd5UYTbT8UdxqVxXCXr/1yPSjeZvAiYWM0pkGDBDabEVbeCEBKJxMJr+uPAlpQyQSPwNkfMQQbzj1l7gW3Od9RI3LpBXOaqTQcwB/fb4RNIRe19c=
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
Cc: "Yin, Tianci \(Rico\)" <Tianci.Yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUaWFuY2kg
WWluIDx0aWFuY2kueWluQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDbmnIgyNOaXpSAyMDoxNg0K
VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWmhhbmcsIEhhd2tpbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT47IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQu
Y29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBkaXNhYmxlIGdmeG9mZiBvbiBuYXZp
MTANCg0KRnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4NCg0KVGhlIGdmeG9mZiBi
cmluZ3MgdW5zdGFiaWxpdHksIGRpc2FibGUgaXQgYnkgZGVmYXVsdA0KDQpDaGFuZ2UtSWQ6IEk0
M2JkYWIwZjkzZDY0ZjdlMjA3Zjk2MTU3NjY1YTJiYjIzMmY2OTU2DQpTaWduZWQtb2ZmLWJ5OiB0
aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMgfCA0ICstLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
DQppbmRleCAwMDkwY2JhLi4xNmIyYmNjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jDQpAQCAtNDQ3LDkgKzQ0Nyw3IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9jaGVj
a19nZnhvZmZfZmxhZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgIHsNCiAJc3dpdGNoIChh
ZGV2LT5hc2ljX3R5cGUpIHsNCiAJY2FzZSBDSElQX05BVkkxMDoNCi0JCWlmICgoYWRldi0+Z2Z4
LnJsY19md192ZXJzaW9uIDwgODUpIHx8DQotCQkJKGFkZXYtPnBtLmZ3X3ZlcnNpb24gPCAweDAw
MkEwQzAwKSkNCi0JCQlhZGV2LT5wbS5wcF9mZWF0dXJlICY9IH5QUF9HRlhPRkZfTUFTSzsNCisJ
CWFkZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOw0KIAkJYnJlYWs7DQogCWRl
ZmF1bHQ6DQogCQlicmVhazsNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
