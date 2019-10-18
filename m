Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788ADCD30
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811B36EB82;
	Fri, 18 Oct 2019 17:59:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85766EB82
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/69c3giUxnQruyp0mFggJRQvn7qhYEzeOrJr993J4hhqW6ZpsGHGMHFjUQY0/uN9X7kRXpCUNe76qWVx1LaKG6A5LS3ksBOHFpITL08mtkxWqhl0Sf0sxQu0zB3OfW17uucVVfUyfOA+eDHammx23shs5FEWXzmR4Y+Ix53+mxdl1TddeDWwA7HUr/02o0u6xZ4SYHd2OjeRqktzLuwx89gZphDNcQcE1GwiU/+CnlgMQE7OckXUtRsQd+77aWtBzZmsXjf+Y4dAlGxjs+VPOToEs6r78SqCF6hGEnCOnw63L9Fdlc3YGYpd0U0FIF11snBrvRO4oMDJHPI3t0E5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75GxQSprIfRH+W5VM8uugCYpW+bZexH2CYjxUVv4wxM=;
 b=FgEKITFjxcpNwBAJpEkE1F14AJouHg+t9aaXpSKumvYk2OUHgJSFxmUrJXlrUuA5A3TFYanJHQwoYdytA2zjMCnbxdDWqVdNLh5Thvh4iksCkDIRngr71sUOcNNAxK0+Mrme3bka6ebomf4NYXm0bhbDjzbYkcNVnLsK1SFi/6976NIsMboVQAOhQSeaZUXd1DIVBMmcoFg0YYQBfBgFeexbE6D/xp63e6qwWmthp5gocvfF4pc5PqnLpok5xLWVQtNc09es0r+lSqE5nK/BmvXB8yrSzdCm03nojC0zqTCHvrtZ59/h8paf7/UKBU1ySNAcvkBGzHscONCAgvR53Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4054.namprd12.prod.outlook.com (20.180.6.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Fri, 18 Oct 2019 17:59:42 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 17:59:42 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu: fix compiler warnings for df perfmons"
Thread-Topic: [PATCH] Revert "drm/amdgpu: fix compiler warnings for df
 perfmons"
Thread-Index: AQHVhd3RRgRdmGWV90e+bVCOmvsgFQ==
Date: Fri, 18 Oct 2019 17:59:42 +0000
Message-ID: <20191018175928.25307-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 811bef2d-41cf-4f84-c310-08d753f4f3b6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4054:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4054D9E9411EB29534FF59AE856C0@CH2PR12MB4054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:80;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(189003)(199004)(25786009)(6486002)(2351001)(478600001)(99286004)(1076003)(102836004)(316002)(14454004)(81166006)(256004)(86362001)(8676002)(8936002)(81156014)(36756003)(14444005)(50226002)(71190400001)(6506007)(5640700003)(386003)(486006)(26005)(6512007)(66556008)(6916009)(66476007)(2906002)(3846002)(66066001)(66946007)(2501003)(4326008)(6436002)(186003)(5660300002)(6116002)(7736002)(52116002)(64756008)(476003)(305945005)(54906003)(2616005)(66446008)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4054;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wlF/PwgQhCg4hTE1Be46C3LuABmIknVOugwK3DAWt8DhOuwcY/1sKcKxThjAVYZ/audkmJ0OlX98oqpXoRwQ/qPCIXCjpXDDQ5FyA7EZ8/fPKACJPEqSRl0FWAx5T+2/HX/CIXg6mYtpfYZs34jcMwoCg99sHTgr3K2I1tDaNZ7Rx3PqKc0bhJzD/lp2zczgmhKGm8vSfSfTIadYAernwYwwcavCEtYgnS8wf1APXSSgaMxedl/EBC91X9KeDdYRMFkCfgNsppQrp8pi5LcAvejp5NmEXpj3PKPFQddykMhjMc7a0U3aEynebr5XVdiB5P4/j1rnNgJ8h8+3HM2TgoXQ+O6xx+aOcFEtDWBFMNoS+IWO72DBrYcnEoFLyfnH+T8M4aDklPce4WvQno16H1rHgErujLP60h8NnEJZ6Gc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811bef2d-41cf-4f84-c310-08d753f4f3b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:59:42.4299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTY+RyORuSS9LrIo70/YGoo/dkrSDc4NPlsIMD4q62o74kkQHD64Rhpe8ZXSgsrC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75GxQSprIfRH+W5VM8uugCYpW+bZexH2CYjxUVv4wxM=;
 b=V77N31L6ayjPavSh44piUht7aCtNVk5f0v7xV/ZBcuEjcsux6QQ6kOcsuZ4QOu+DSGMNumYXdQut63cFXj4u7GnltQINIR6EwNuXWXem6b6SHnUFhCr+F9CXcHKIiWYcFDXkUWOBr2SjQx2yZ2YafLZNJjeTgk+F6r4e0/J6sOA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA3ZGQyZWIzMWZjZDU2NDU3NGU4ZWZlYTZiZjIzY2Y1MDRmOWUy
ZmQ3LgoKcmV2ZXJ0IGZpeCBvZiBjb21waWxlciB3YXJuaW5nIG9uIGluY29tcGxldGUgZGYtY3N0
YXRlIHJhY2UgY29uZGl0aW9uCmhhbmRsaW5nIHNvbHV0aW9uIGkuZS4gc211IG1zZyBjYW5ub3Qg
YmUgc2VudCB3aXRoaW4gcGVyZmV2ZW50cwoKQ2hhbmdlLUlkOiBJYTA5ZGQyNGVmOTFlZjc1YTc5
YTIyM2Y3MmYwY2I2YTg2Y2QwODY2NwpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPEpvbmF0
aGFuLktpbUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKaW5kZXggZTFjZjdlOWM2MTZhLi5m
NDAzYzYyYzk0NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3Yz
XzYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKQEAgLTkzLDcg
KzkzLDcgQEAgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqZGZfdjNfNl9hdHRyX2dyb3Vw
c1tdID0gewogCQlOVUxMCiB9OwogCi1zdGF0aWMgaW50IGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGFsbG93KQorc3RhdGljIGRmX3YzXzZfc2V0
X2RmX2NzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGFsbG93KQogewogCWlu
dCByID0gMDsKIApAQCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcG1jX2dl
dF9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgIHVpbnQ2NF90IGNvbmZp
ZywKIAkJCQkgIHVpbnQ2NF90ICpjb3VudCkKIHsKLQl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhp
X2Jhc2VfYWRkciwgbG9fdmFsID0gMCwgaGlfdmFsID0gMDsKKwl1aW50MzJfdCBsb19iYXNlX2Fk
ZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsLCBoaV92YWw7CiAJKmNvdW50ID0gMDsKIAogCXN3aXRj
aCAoYWRldi0+YXNpY190eXBlKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
