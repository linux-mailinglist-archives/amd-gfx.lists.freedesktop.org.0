Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0CB079C
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9DF6EB7E;
	Thu, 12 Sep 2019 04:12:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33DB6E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 03:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haXAX6VZk4B65XnCtVHeZiBrgnxUw1kWrEf8VUYZUVPknMhf1IbDMOd9puEe+wpJlMj4bvLokWGNYKyB1VN3I1KakxsBIdWsG4ZfmmD/UYZQxT46k2K72I11VyywSeiJekTGGHpEHGuk7zHlSL6dnA5whiVdtPkS+mmKDw0ROgBfcxsyp2jHoeBuO2pMSg57wqtr/q972dXwHSyw0jqA23RKnlQv2ZZxva2NEADNxWwiFJsoXxb7WePl9zdEWLIuvCWEBccMJx6ekx9y67lc44g/mlStRcxnxAvYOVxNhZPO52ndYnBvWP4kNCDGPf1BO3e8uJjerD1gw70V1ggwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsnvRnwg+TVTU0xzruAHjgwRyrycWJw8nhlfF/0p03E=;
 b=OZ04bNe3QiN5EJMScc4Qdpcsq0HVbEJ4Y3T/rQhvLF66f09nOyTXEWAaj8TvBU4gdwI60VqFLDX+ZudtPWYRByq4PvGVNmaWXFQgUN7QID7LGOFZ5J+b8z8lfasn11thYZO4Sxh+5dPHUavD0t/QbFKQ583Ys8jSv+idzaAbBliaaBbBKtpxR6mxhUemiSzoEMkOdOoYlYH3CFQ9miKEFcho6N+HfIvfoFSECt97m2HraNrqpEHy1oYi6UqxLUFW7w22DoUDfuU9fBb2BN92hxPakLOlCW9guLaX9cHc/1AKPL+1Obix3xM0bzPamjL4v15CEqhvNbx/9nn1Gdw9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) by
 MN2PR12MB3168.namprd12.prod.outlook.com (20.179.81.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Thu, 12 Sep 2019 03:45:49 +0000
Received: from MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5]) by MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5%4]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 03:45:49 +0000
From: <jianzh@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Navi10/12 VF doesn't support SMU
Thread-Topic: [PATCH] drm/amdgpu: Navi10/12 VF doesn't support SMU
Thread-Index: AQHVaRyQIBYp6rkFskGIMadpDLUH0w==
Date: Thu, 12 Sep 2019 03:45:49 +0000
Message-ID: <20190912034527.15762-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::20) To MN2PR12MB3056.namprd12.prod.outlook.com
 (2603:10b6:208:ca::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7809fb2c-a88f-41aa-9354-08d73733b35b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3168; 
x-ms-traffictypediagnostic: MN2PR12MB3168:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31689E34CAC4EBE717303395E1B00@MN2PR12MB3168.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(189003)(199004)(81156014)(2906002)(102836004)(81166006)(256004)(8676002)(6506007)(386003)(26005)(5640700003)(54906003)(8936002)(316002)(7736002)(52116002)(305945005)(66946007)(66476007)(66556008)(64756008)(66446008)(186003)(14454004)(6486002)(1076003)(2501003)(6436002)(5660300002)(476003)(2616005)(486006)(25786009)(66066001)(36756003)(50226002)(478600001)(4326008)(6916009)(71190400001)(2351001)(71200400001)(6512007)(3846002)(6116002)(99286004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3168;
 H:MN2PR12MB3056.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z+8jyr7Kl1V9mNJwuf0YYKkWSbmX+D+Erkng3sqYVd+NVPyC+NQChZQTgmEvohZueEEauf2nruLOiS86hHgYMe8tq521jaIopl0Uvt8Xsgcb8B0XfN6TQYhhNEkAB22O9v9vv8IVVSyrpdynBHHZcQKDaf8GXKX53PlttiABWkaUrZt/l4pFKceFHzM3bEYTCyqpG+ot1k7NOubrLctrz6gWMEdb+3LRyWs5UUU3PWUEhuWE51ZGFStlDzrPfaWkvwiCI6qAnfO+bDskBpAdLLCBREIwxanZPVHCylB+8ub3w1ZU30x9I4v4AgG9C7g/ujNnLCu+df96NUhrOdQxlOdne63CwenBPiuOA7E7/sBTZx0L1sfGaRjRsdQHRYjQLCOCkb38nMftGgFPLMDvQ1swY8hCWbhzOmBh3YEzb+Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7809fb2c-a88f-41aa-9354-08d73733b35b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 03:45:49.0775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBAZzWfiC/lI1ntLAO3nOL41Woa9cINU0Nb6aXUuU+j3LwGrWj31Ynjrq1DyusiK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsnvRnwg+TVTU0xzruAHjgwRyrycWJw8nhlfF/0p03E=;
 b=xxzdnD2h5pzOMhoPTZnGBA3+xuMCk41g7JPqK0TicQA/fR7nYPU+dltvJWc0O98TFtxIoPOXemysQjpIY5t2z7P8oUD0olPx18K/SIRbqN+LMOTEB4+xavrzLNQdjl4U/SIaxhoM89+jMjMIgTRnwZXyAewJK4yM5R337HYsE/c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jiange.Zhao@amd.com; 
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Zhao,
 Jiange" <Jiange.Zhao@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+CgpJbiBTUklPViBjYXNlLCBT
TVUgYW5kIHBvd2VycGxheSBhcmUgaGFuZGxlZCBpbiBIVi4KClZGIHNob3VsZG4ndCBoYXZlIGNv
bnRyb2wgb3ZlciBTTVUgYW5kIHBvd2VycGxheS4KClNpZ25lZC1vZmYtYnk6IEppYW5nZSBaaGFv
IDxKaWFuZ2UuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDRjMjQ2NzJiZTEyYS4uZmIwOTdh
YTA4OWRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTQzOCw3ICs0MzgsNyBAQCBpbnQg
bnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X2Rl
dmljZV9pcF9ibG9ja19hZGQoYWRldiwgJm5hdmkxMF9paF9pcF9ibG9jayk7CiAJCWFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZwc3BfdjExXzBfaXBfYmxvY2spOwogCQlpZiAoYWRl
di0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCAmJgotCQkgICAgaXNf
c3VwcG9ydF9zd19zbXUoYWRldikpCisJCSAgICBpc19zdXBwb3J0X3N3X3NtdShhZGV2KSAmJiAh
YW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJnNtdV92MTFfMF9pcF9ibG9jayk7CiAJCWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNw
bGF5IHx8IGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZkY2VfdmlydHVhbF9pcF9ibG9jayk7CkBAIC00NDksNyArNDQ5LDcgQEAgaW50
IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwogCQlhbWRncHVf
ZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8wX2lwX2Jsb2NrKTsKIAkJaWYgKGFk
ZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9ESVJFQ1QgJiYKLQkJICAg
IGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQorCQkgICAgaXNfc3VwcG9ydF9zd19zbXUoYWRldikg
JiYgIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRk
KGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmdmNuX3YyXzBfaXBfYmxvY2spOwogCQlpZiAoYWRldi0+ZW5hYmxlX21lcykKQEAg
LTQ2MSw3ICs0NjEsNyBAQCBpbnQgbnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJm5hdmkxMF9paF9p
cF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZwc3BfdjExXzBf
aXBfYmxvY2spOwogCQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19M
T0FEX1BTUCAmJgotCQkgICAgaXNfc3VwcG9ydF9zd19zbXUoYWRldikpCisJCSAgICBpc19zdXBw
b3J0X3N3X3NtdShhZGV2KSAmJiAhYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQogCQkJYW1kZ3B1X2Rl
dmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9pcF9ibG9jayk7CiAJCWlmIChhZGV2
LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2VfdmlydHVhbF9pcF9ibG9jayk7CkBA
IC00NzIsNyArNDcyLDcgQEAgaW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBf
aXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8w
X2lwX2Jsb2NrKTsKIAkJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldf
TE9BRF9ESVJFQ1QgJiYKLQkJICAgIGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQorCQkgICAgaXNf
c3VwcG9ydF9zd19zbXUoYWRldikgJiYgIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJCWFtZGdw
dV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOwogCQlhbWRn
cHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmNuX3YyXzBfaXBfYmxvY2spOwogCQlicmVh
azsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
