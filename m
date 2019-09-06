Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4DAB482
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 11:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BECF6E1F9;
	Fri,  6 Sep 2019 09:00:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5186E204
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 09:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWe0Al8cpyHnz5o4klX9QkXgWnMDyQjQhsu7ccwcbMKhV2aQdw+d4s8KQI955NA7m1sMvr2F6iYUAqEajy1rYQa/ynQpoHNckohpeZLAWGJ6Isaf/bMWHyxxFdnZzfHL0BbBjxCAXo/74D/bSUzvM4+UGNBAPYX36If8vXSurssXBF3uRPIXxM2WyObX6ikn4ywV937ggDMWrY5fZKOkkHk2NuLFi1VbiVu4+dBmjLiYTzYeeLWOeYCZs9kFxTVz8RuVlHxFLuxsMLmYbBCweGnENlzR4+NW5s57dZJHtO0gYN3r4lnl7GUZyoRQzA7mVNXpz59hovlE7B37/RinYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8kOJOcmByREHavROou3D9YLln6wdUKQx4qeyMDVYFs=;
 b=X6qHX6x6SfEa0/fwQpJoDGaBrNX1BkobRcJCbtnhnxKT0aqAp8SFpn18lujuPQc5266yVeSUiqn6oNSq4LzdWMbsIeIgC+HBi+qBOWoFWgN3I5RvC3BY0G0dgZtNkNi0brMgo6rT4AG6KGWVoMj7LCyTC7qSy9w3Vj1V0mAb0pUrIKQPBBymI+xvkNYeungX2e9zO4M0++fLFA6b/ldP5Pv3GwEJGMJtw0wSQWiUDtj7FxxwN1m/2OkTRoP1XuFgBvV5PhRR/lFain1Zkfd9GyzPFiXwXL+CtNK8CO2EwSPXsMGkC00aTFVJkp1Lp2sjitGORlEQ1gD1afvvDlEt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3709.namprd12.prod.outlook.com (10.255.236.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Fri, 6 Sep 2019 09:00:36 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 09:00:36 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Index: AQHVZJGMrpXuX/yuEUC9LfVtCgX06Q==
Date: Fri, 6 Sep 2019 09:00:36 +0000
Message-ID: <20190906090011.20271-3-tao.zhou1@amd.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
In-Reply-To: <20190906090011.20271-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e617c8de-9cf4-40a0-8249-08d732a8ae61
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3709; 
x-ms-traffictypediagnostic: MN2PR12MB3709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB370991C45826E087809A65C3B0BA0@MN2PR12MB3709.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(199004)(189003)(256004)(26005)(110136005)(386003)(102836004)(6506007)(6436002)(2501003)(36756003)(186003)(6116002)(6486002)(3846002)(2906002)(486006)(66066001)(476003)(316002)(86362001)(2616005)(11346002)(446003)(66476007)(76176011)(64756008)(50226002)(81166006)(81156014)(25786009)(99286004)(5660300002)(6512007)(66556008)(8676002)(52116002)(66946007)(6636002)(8936002)(53936002)(1076003)(478600001)(14454004)(305945005)(71190400001)(71200400001)(4326008)(66446008)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3709;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Rhh6QxSK55/K9hN3VdcQbSJe5cQSxxVrPHWfsdcgY5VlyuHCG+f3+GMTI2l0AuDZhA4N76804DbbNzpGPIwte3Wr5q1jlz5Lq+0pC0vIFDV4jBBQzcn5lwWquNtqyf31eWkFKSZNdEpkf0zOIS8MIU3epiPprUzqQAPgGe/Bl6DWngIEzGHtCnRkJOx83rSZG5JnQTmxihL14UMzqh2UL40aDnyWbwLK7Y+Qs+wzcrRejEYgoXgFhCAlot09a5sviq1e5nU1ke1oiyXpPLGwO7DELMcy94SBDbLAoMdD1xK2Cf48EeAICxVsGNH+W61xQkEABNMvwas0VoWxTfDBb1B87rFgkSWFBluAJrYEhPhkliEDV92DcWdZDGPvoi67bFNGuvvbg7aEBIewKbvzS7lMBwFKrwFsKmMNLmJxrNQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e617c8de-9cf4-40a0-8249-08d732a8ae61
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 09:00:36.1682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NiGQBLm809MSpgt++XrJqoHDLE/LD1G2zLZoYnG58kQroSpaq8s93VwqXkf5fqYN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8kOJOcmByREHavROou3D9YLln6wdUKQx4qeyMDVYFs=;
 b=m4fXWBWl9TP7ehR5Ze1smLE6b9ePM7WKR0t1YdM5GxhS38n5ZzKLc29UKGqYG/kD7ODUbjiuwGI3OfhlnsTziiYtnYlHecGr0RV/SZNFu23GdHQ1V5fmNFqJnUYekJ0p9LC/hsanpQn77Emj0hCDAVLC0pUBkPgRhUvI4ozAhKo=
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhpcyBpbnRlcmZhY2UgaXMgcmVsYXRlZCB0byBzcGVjaWZpYyB2ZXJzaW9uIG9mIHVtYywgZGlz
dGluZ3Vpc2ggaXQKZnJvbSByYXNfbGF0ZV9pbml0CgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8
dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgg
fCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jICAgfCAyICstCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMKaW5kZXggNTY4M2M1MTcxMGFhLi5iMWM3ZjY0
M2YxOTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMKQEAgLTYzLDgg
KzYzLDggQEAgaW50IGFtZGdwdV91bWNfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pCiAJfQogCiAJLyogcmFzIGluaXQgb2Ygc3BlY2lm
aWMgdW1jIHZlcnNpb24gKi8KLQlpZiAoYWRldi0+dW1jLmZ1bmNzICYmIGFkZXYtPnVtYy5mdW5j
cy0+cmFzX2luaXQpCi0JCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQoYWRldik7CisJaWYgKGFk
ZXYtPnVtYy5mdW5jcyAmJiBhZGV2LT51bWMuZnVuY3MtPnJhc19hc2ljX2luaXQpCisJCWFkZXYt
PnVtYy5mdW5jcy0+cmFzX2FzaWNfaW5pdChhZGV2KTsKIAogCXJldHVybiAwOwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKaW5kZXggNmYyMmM5NzA0NTU1Li5hNWU0ZGYy
NDQwYmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKQEAgLTU0LDcg
KzU0LDcgQEAKIAlhZGV2LT51bWMuZnVuY3MtPmRpc2FibGVfdW1jX2luZGV4X21vZGUoYWRldik7
CiAKIHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHsKLQl2b2lkICgqcmFzX2luaXQpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKKwl2b2lkICgqcmFzX2FzaWNfaW5pdCkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOwogCWludCAoKnJhc19sYXRlX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbyk7CiAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9j
b3VudCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCXZvaWQgKnJhc19lcnJvcl9z
dGF0dXMpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKaW5kZXggNGNkYjVjMDRj
ZDE3Li45MmYzYjE0OGUxODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3VtY192Nl8xLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwpA
QCAtMjcyLDcgKzI3Miw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogfQogCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB1
bWNfdjZfMV9mdW5jcyA9IHsKLQkucmFzX2luaXQgPSB1bWNfdjZfMV9yYXNfaW5pdCwKKwkucmFz
X2FzaWNfaW5pdCA9IHVtY192Nl8xX3Jhc19pbml0LAogCS5yYXNfbGF0ZV9pbml0ID0gYW1kZ3B1
X3VtY19yYXNfbGF0ZV9pbml0LAogCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSB1bWNfdjZfMV9x
dWVyeV9yYXNfZXJyb3JfY291bnQsCiAJLnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzID0gdW1jX3Y2
XzFfcXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
