Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF7BDB07
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 11:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AFE6EB5D;
	Wed, 25 Sep 2019 09:31:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A69B6EB5D
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 09:31:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgHGt9gwmZkLsHMl0iHDjc/TU/QY0NmDnVI7PhxzCL6bBWJrgYaSBeDL466DyJT/1GLzZ1vXgflMZwMB0tmFoGbcCZsGDsQuq262FioOxNFCN2doIazIRb53yiZOLM6BcivpSnk7zYgaNBfxdiQmrOuWefytk8hoIRbI4ySlFvxRkzXyWpd562F2QWt27DZ15Q/7shMchg7SfPsEfVY1H2flo+f7gZjXLUlRCOall3qFtWT033fAsEao2G+V3F/GFMJm2KDYy4hg00p4tqpZEXkKh32HSdVnR7u+Dj31n3Fyo5DtSUBCSb1++1t/AcfpVYUunu8qQUE1C2SSmdAdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rl4Y7xHztlfJZMnN6bDAaCTEsNSasVDQZRst/M14Fs=;
 b=kC9FDaCunBu2sqz/0Y8BxBQpMJexXiqlQTN5J4SlMNa48YkoRDsb6KgUCgyiiShQkeQDKVKd2ezErzB38xTxapaWN9NXdqm7K7z80FfyFsYjgwNkwU8em7UA2bfmsNddPHqfV3CTmrr719IeOMl9vtKHtQepsvcZASP1rBoZfDNvKYyBncqHbbRZzCEWIk488kFV2GPB+Mi6azmt8kl2j83GJX/rViP58LLWPuHqFbieGGIKTZFLZE0a93teXib3rzs3kuWo4B66Jp7saCrlkpsckuDjZlXJ9gqO6/ocVMep4hliWRaiLJAx+lT6v9h4NDgn4kCv91GiEiV9JbNxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 09:31:44 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 09:31:44 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
Thread-Topic: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
Thread-Index: AQHVcs8ZKRxb/rd4+Uq0uYJDZ+KqBKc8IOLA
Date: Wed, 25 Sep 2019 09:31:44 +0000
Message-ID: <MN2PR12MB29750C8C515A2924B3454E488F870@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190924115624.10949-1-christian.koenig@amd.com>
In-Reply-To: <20190924115624.10949-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3325d4d4-56b1-492c-e18c-08d7419b2def
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2896; 
x-ms-traffictypediagnostic: MN2PR12MB2896:
x-microsoft-antispam-prvs: <MN2PR12MB2896F5988581D28FF672E4168F870@MN2PR12MB2896.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(189003)(13464003)(199004)(3846002)(6506007)(66066001)(8936002)(6116002)(26005)(7696005)(186003)(25786009)(86362001)(102836004)(99286004)(14444005)(476003)(33656002)(76176011)(486006)(81166006)(11346002)(446003)(316002)(66946007)(64756008)(110136005)(81156014)(76116006)(2501003)(8676002)(66446008)(478600001)(256004)(2906002)(66574012)(66476007)(66556008)(229853002)(6246003)(14454004)(52536014)(55016002)(9686003)(6436002)(5660300002)(71190400001)(71200400001)(305945005)(7736002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2896;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HDWW8Be5FMHRKT60PbBCWnvXN7y/9amVAjZIdg/GwEYMDU1ar0R1ZjtxnfnKo7Ts4GGxxz+zQu+qZUNXw9LbTlrwaYQAusqt9iXW/92BsRQmpxa7MmZPliuH6OSW2HXt/GXRlOkSB/EwqFoSzJoAxHv1YA6Zi70NLmQmkfFlLdmB2kUzlC/O6C5T3KOCImPtqiJee+CINriGuhxlYgy3y6OwucOj3D1s6J1H6sHzDIJdmtTsuBJWbPSoWPISaG1FTY72vrdZ09BM+iQSy5mnfzaltDVH6k3P0/QkM04EHloQKhuEteqmzSA3u5Eee06Ug0msQRjZUKPu9x2ycBp5OVfA4JaED2mR6KRAVdDueyJuJ7idD47IfvZb0FKdwlpwcI01Bckx2fVC6akdRMZnEoGCeaeQZiGytWoGDnt/cic=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3325d4d4-56b1-492c-e18c-08d7419b2def
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 09:31:44.1077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3HvO49UGxPN3FViiGeax8RYHjASPyxroVf0QRnlHEgIAgcxqEb75OOAqDpAfk3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2896
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rl4Y7xHztlfJZMnN6bDAaCTEsNSasVDQZRst/M14Fs=;
 b=OuQtqDQiqi0bKFUjKaT77VUnRLjopE+ByipvABCdgyNos+hser6Xm5yRDFH0b4vVzOpkkJ1OptRLokBYPxkvV0c9LVhwBgu8gWF4xfBvmta2vO9jQtLOiMkNRqCDPEgiugfe2BhpoLotAJkSyY/qAX3zkGU5+JNjNoiKOl1dyEo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCg0KPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWlj
aHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+U2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDI0LCAyMDE5
IDc6NTYgUE0NCj5UbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT47IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogW1BBVENIXSBkcm03YW1kZ3B1OiBvbmNl
IG1vcmUgZml4IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0DQo+DQo+V2hlbiBDUFUgYWNjZXNz
IGlzIG5lZWRlZCB3ZSBzaG91bGQgdGVsbCB0aGF0IHRvDQo+YW1kZ3B1X2JvX2NyZWF0ZV9yZXNl
cnZlZCgpIG9yIG90aGVyd2lzZSB0aGUgYWNjZXNzIGlzIGRlbmllZCBsYXRlciBvbi4NCj4NCj5T
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDkg
KysrKysrLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYw0KPmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+
aW5kZXggMTJkMmFkY2RmMTRlLi5mMTBiNjE3NWUyMGMgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jDQo+QEAgLTM2OSw3ICszNjksNyBAQCBpbnQgYW1k
Z3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoc3RydWN0DQo+YW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
CXNpemUgPSBBTElHTihzaXplLCBQQUdFX1NJWkUpOw0KPg0KPiAJciA9IGFtZGdwdV9ib19jcmVh
dGVfcmVzZXJ2ZWQoYWRldiwgc2l6ZSwgUEFHRV9TSVpFLCBkb21haW4sDQo+Ym9fcHRyLA0KPi0J
CQkJICAgICAgTlVMTCwgTlVMTCk7DQo+KwkJCQkgICAgICBOVUxMLCBjcHVfYWRkcik7DQo+IAlp
ZiAocikNCj4gCQlyZXR1cm4gcjsNCj4NCj5AQCAtMzc3LDEyICszNzcsMTUgQEAgaW50IGFtZGdw
dV9ib19jcmVhdGVfa2VybmVsX2F0KHN0cnVjdA0KPmFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IAkg
KiBSZW1vdmUgdGhlIG9yaWdpbmFsIG1lbSBub2RlIGFuZCBjcmVhdGUgYSBuZXcgb25lIGF0IHRo
ZQ0KPnJlcXVlc3QNCj4gCSAqIHBvc2l0aW9uLg0KPiAJICovDQo+KwlpZiAoY3B1X2FkZHIpDQo+
KwkJYW1kZ3B1X2JvX2t1bm1hcCgqYm9fcHRyKTsNCj4rDQo+Kwl0dG1fYm9fbWVtX3B1dCgmKCpi
b19wdHIpLT50Ym8sICYoKmJvX3B0ciktPnRiby5tZW0pOw0KPisNCj4gCWZvciAoaSA9IDA7IGkg
PCAoKmJvX3B0ciktPnBsYWNlbWVudC5udW1fcGxhY2VtZW50OyArK2kpIHsNCj4gCQkoKmJvX3B0
ciktPnBsYWNlbWVudHNbaV0uZnBmbiA9IG9mZnNldCA+PiBQQUdFX1NISUZUOw0KPiAJCSgqYm9f
cHRyKS0+cGxhY2VtZW50c1tpXS5scGZuID0gKG9mZnNldCArIHNpemUpID4+IFBBR0VfU0hJRlQ7
DQo+IAl9DQo+LQ0KPi0JdHRtX2JvX21lbV9wdXQoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIp
LT50Ym8ubWVtKTsNCj4gCXIgPSB0dG1fYm9fbWVtX3NwYWNlKCYoKmJvX3B0ciktPnRibywgJigq
Ym9fcHRyKS0+cGxhY2VtZW50LA0KPiAJCQkgICAgICYoKmJvX3B0ciktPnRiby5tZW0sICZjdHgp
Ow0KPiAJaWYgKHIpDQo+LS0NCj4yLjE0LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
