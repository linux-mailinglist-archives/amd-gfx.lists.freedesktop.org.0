Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C288FCB259
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 01:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABCA6EA97;
	Thu,  3 Oct 2019 23:39:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8996EA97
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 23:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyaZexXgp1MqmaD6bFiGWIDb1HBbFG2rWg4F7iHqnECMtmIShpLIcW3wIBCPdPhYY6k4L8jQ2CH4bW8rLI4h89w8GIR6s4bOSwrIBtBehRP1mX4MO+ahAtZDA4PAvzAuEKdUdtHNOKPwLnalObTWbGLDVjMiQ5p3D5in1Nm+pA5HeFjp7Wu9xriWpJwxF0bl/0wSs9PvQsEXn9aTcDkG8r6KPGUxo3cHNHcaL1x1k1fedciVBgRwqjdifWUjygKIdUCxewYRI1BsrZLshwM6fKZ+gzgRORZzurzFrbPc/TXefoKPdaulQZqPoXbWvNg9b7y7t1O8RRhOH9dHWzBXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMkDICAPyFd8bO+HNnGEje9o8nvf/e+fV2VTXiV6j6I=;
 b=CUJ3vmpv6yn4BQ42C1Byu3huW4FVDcQszPlCe769PtwgoJeTXa7BT0x1/HI5+HnZSrMm2mI1j/LAZ0CY2PzLBFrv2j72Sjj1C0hwRsXs3L01jfwAbeWjz/StD3MfZCiKaIT22jXnU2DJCKhurZAiyfPvdPbYnfnoOLCiX52e96l0kz3YUeltr2b309GFhqZgTjeSa+t0GPmoVLTY7inXTAsDkhYYMF8bgDxoyqyjCUkRKA/xcdfU2VVrD63fie7gOytvlqrQyzefPI80EO7SH7u0pvZpVUZclSrflDGyno5DH5HDRB02jo2EZaW7rSR616gdcWqz6GqILJ6hfCcx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB3943.namprd12.prod.outlook.com (52.132.246.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 23:39:14 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::a426:f52a:fb94:e138]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::a426:f52a:fb94:e138%2]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 23:39:14 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Use the ALIGN() macro
Thread-Topic: [PATCH] drm/amdgpu: Use the ALIGN() macro
Thread-Index: AQHVekPDqEe14BkCoUKlLFla0wlkfQ==
Date: Thu, 3 Oct 2019 23:39:14 +0000
Message-ID: <20191003233902.1982-1-luben.tuikov@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::15) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0.385.gbc12974a89
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 522b6480-0535-4b82-78bd-08d7485ae622
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB3943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB394395CE173D6B4AC77A571C999F0@CH2PR12MB3943.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(486006)(5660300002)(6512007)(6486002)(1076003)(4326008)(6436002)(86362001)(5640700003)(256004)(71200400001)(2351001)(8676002)(305945005)(81156014)(81166006)(102836004)(7736002)(386003)(6506007)(50226002)(66446008)(54906003)(71190400001)(36756003)(8936002)(478600001)(2906002)(99286004)(64756008)(26005)(66556008)(66946007)(66066001)(66476007)(2501003)(316002)(2616005)(476003)(25786009)(6116002)(14454004)(6916009)(186003)(3846002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3943;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FBTlGUmWKs2n79PoZcORkP0Y6PuUHfE+qx0IQBVrxdxEDTboXAeMKYfYumou3LSxC0NZHh7QzTHpy9cMM3gDqcvz5zjnENj8aUYVtyv4A4pQc2V1NYg86PPHbixBYqk4Bm+RMJjzjTlE1ox5nVru7Lv9hWyhj73aN9Q1TfSlFr3g0gtpicaAPD2Vf+VYUMyuiB/bHB8yXgXV8H8ewl8retXe+SMAONT4reH0B5DAtBX8v/wqJ5z+JAwaUXjV3E8KxP+SQ/djzh6WnuYYzoT0WR7dpADwHbuxQoHeX1shxXEiNdF+XUzqVPr/W/RYXVL1Vh96SCetnI5Rb+oR3T/vaCMzGxd+ab6XkIMtQt2jqIG9Jba15e0R4sIeseAcpPFphShbSNd7SynQZ4+iKXUzbzDr+ZanoK/hfOaac3MAr2I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522b6480-0535-4b82-78bd-08d7485ae622
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 23:39:14.4882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8dq5rWiot4sxPWcM+grlHB/9VLfu2lhrgPKBLfxvaNdUOTvIbkcrdyqci3vGyjw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3943
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMkDICAPyFd8bO+HNnGEje9o8nvf/e+fV2VTXiV6j6I=;
 b=neDFagjsDgrNnAzIwQBianOosPgSs5nUMfiX96UhpoFRNvo5zwLRHp4b1P5QUS5iuEaihBOwPTZARtINRUxs+VAB5QmAtRcL1/KvXpOmzHxHSx4O1R2Ouv6bpXsoXiwhxmmlAniDvBtrPQ53thGsDbwN6E/gP8lddHxOmWXE42Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBBTElHTigpIG1hY3JvIHRvIHNldCAibnVtX2R3IiB0byBhCm11bHRpcGxlIG9mIDgs
IGkuZS4gbG93ZXIgMyBiaXRzIGNsZWFyZWQuCgpTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3Yg
PGx1YmVuLnR1aWtvdkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDExICsrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YwppbmRleCA2OGM1NDFlMTExODkuLjczYzYyOGJjNmE1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtMTkyMywxMCArMTkyMyw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X21hcF9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkqYWRkciArPSAo
dTY0KXdpbmRvdyAqIEFNREdQVV9HVFRfTUFYX1RSQU5TRkVSX1NJWkUgKgogCQlBTURHUFVfR1BV
X1BBR0VfU0laRTsKIAotCW51bV9kdyA9IGFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzLT5jb3B5X251
bV9kdzsKLQl3aGlsZSAobnVtX2R3ICYgMHg3KQotCQludW1fZHcrKzsKLQorCW51bV9kdyA9IEFM
SUdOKGFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzLT5jb3B5X251bV9kdywgOCk7CiAJbnVtX2J5dGVz
ID0gbnVtX3BhZ2VzICogODsKIAogCXIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIoYWRldiwg
bnVtX2R3ICogNCArIG51bV9ieXRlcywgJmpvYik7CkBAIC0xOTg2LDExICsxOTgzLDcgQEAgaW50
IGFtZGdwdV9jb3B5X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQ2NF90IHNy
Y19vZmZzZXQsCiAKIAltYXhfYnl0ZXMgPSBhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9t
YXhfYnl0ZXM7CiAJbnVtX2xvb3BzID0gRElWX1JPVU5EX1VQKGJ5dGVfY291bnQsIG1heF9ieXRl
cyk7Ci0JbnVtX2R3ID0gbnVtX2xvb3BzICogYWRldi0+bW1hbi5idWZmZXJfZnVuY3MtPmNvcHlf
bnVtX2R3OwotCi0JLyogZm9yIElCIHBhZGRpbmcgKi8KLQl3aGlsZSAobnVtX2R3ICYgMHg3KQot
CQludW1fZHcrKzsKKwludW1fZHcgPSBBTElHTihudW1fbG9vcHMgKiBhZGV2LT5tbWFuLmJ1ZmZl
cl9mdW5jcy0+Y29weV9udW1fZHcsIDgpOwogCiAJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9p
YihhZGV2LCBudW1fZHcgKiA0LCAmam9iKTsKIAlpZiAocikKLS0gCjIuMjMuMC4xNjkuZzhhM2E2
ODE3ZTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
