Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC810C9039
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 19:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1E56E0C9;
	Wed,  2 Oct 2019 17:50:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4E96E0C9
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 17:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkHxsm6M1CgPztj/XQjrmSJW4LbiSQ/r3tmbbgNdPIoS66cLQvpdNMyOpTSj6qJYDcZE2lm9b4bNaIwrztlvdCAkhB+CuXIKR1dWtlfHMfoBz/QnfZ1NtCrrl89aPtQbTT/X6Vx36LmngJhECT1+f+yCTYXmCWqKH/mVi63SwUxK2B/cwRtB5F7/iTF/9mh8Tudg9zTV0bynvf5HU3ppsS5QcFyU4BGX1VpuwYns7gBuwY5laYhOGGz9d74zjcx9vIpOB7mPWZvpEFceyKx/khtax0nEwKLSmknunikyxKwleAugGLPjKrYToBJmE6BigO7oIi8NEe7laoDHry8/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t341dky8dFMia/f/JVxaUJjcqy1ZB2OTc/9o0C4I9Q=;
 b=jT7UrLijau8Ic0bJ2U65UEl8Qc71oAj8fxCNfqf6cAfHrRaJGtwVKqAW4SIm3CDOHu42Xm46+j9Pu0rS8NmfpHflxRMBDLqsiTP8K8O4mTPdlCr5gjN95AGGF/5c177+Pl8dwORKzoVYiQ7DjCJaRH6C+XZR4QaJGoWdbL8EqBNcwmw/ToVGQXiPYukmP3U6hsKbomhPlE5sBfqZQmLRfMwmQ7PHive2aeIJLw0DF/gwHVRHF9TT++x7fcGzowa14+SDucGLWXNminOmtW/p+tel/NQ0Wjqmt8kjKVb6XTQc+v+P/PAU0HjxN/kjh8gPvC5FCbj25Q8dO4XteizVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3328.namprd12.prod.outlook.com (20.178.240.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 17:50:23 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:50:23 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: don't increment vram lost if we are in
 hibernation
Thread-Topic: [PATCH] drm/amdgpu: don't increment vram lost if we are in
 hibernation
Thread-Index: AQHVeKH+QnHpMagM4UG0QFYNL4psy6dHomCQ
Date: Wed, 2 Oct 2019 17:50:23 +0000
Message-ID: <MN2PR12MB3309010C86756AB881265215EC9C0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20191001214829.24634-1-alexander.deucher@amd.com>
In-Reply-To: <20191001214829.24634-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [201.175.203.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b1a8566-1703-4ae9-99ba-08d747610054
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3328:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB332833ADF1171EE2E0EDC4AEEC9C0@MN2PR12MB3328.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(13464003)(199004)(189003)(3846002)(486006)(26005)(476003)(5660300002)(102836004)(6116002)(11346002)(76176011)(446003)(186003)(99286004)(14444005)(4326008)(256004)(76116006)(25786009)(52536014)(14454004)(7696005)(53546011)(6506007)(478600001)(966005)(66446008)(86362001)(2906002)(64756008)(66556008)(66476007)(110136005)(7736002)(74316002)(305945005)(33656002)(66946007)(9686003)(229853002)(55016002)(6306002)(316002)(6436002)(71200400001)(8936002)(71190400001)(8676002)(81156014)(6246003)(81166006)(2501003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3328;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5odWq6z/W56/8Xdzx99dosJzk2fR8jixzAD185MQRC9sHZvKpt7HieJ7tV6L7ISyWwz5othA+ltdXvSPhVyDPNik3LCIssIzZ/SviaBqHeC6rbS94odxy4foHq0JcCsBHS8e9k0LL+55ijGNjOn6uFqKv7xSLY1Sd3JBOIsi59SVae0ZJV698NDcSKZ/ccvwrdVAOqG7nAsq4NXjX5LAMEsNcrRoGk7MXWzsqWesFVI9bKqQm3Y35uferYvDlciEpLp6BL0HiKV7erTUX4MeZD7SbMPgfyO9Uk5shsprzv/hvln9+DSVunaeN3Z95V3EVIlt5xfIlbYBPgbQ6jykyTmbdpvwe+Yf3VrzeO/O1uXbhd9nzoJReo1lagqCKN9LzI3VVhSwKOr0sJ/HXWnfFvRmCl+e7lOH2shUAAReScwP2DclVP2FoGSklJvSdVlCIbyjAUOfo2nJd1Y311T/mg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1a8566-1703-4ae9-99ba-08d747610054
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:50:23.7239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3wn5e6D228fgfsBTqWoh48MyUkR5RCFe09qi1jLNaNHaPhGPVaFZkyJh23u+ypCS5vkQ65Y31bh52XUqkV4xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3328
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t341dky8dFMia/f/JVxaUJjcqy1ZB2OTc/9o0C4I9Q=;
 b=APadIhUC1zsZtE8k5/6wsbmzOPYgIdRtmzrNJ128nKdol56QdI6B3YlS5iHuUB+e+2dLgiLiNfEefCDVnxHPOG5aOyfoo+0RAB0qyBrncBkw4a1nytG3LRUqDeqTbW57H5pNlaBZ8ZBAEUSVUzXJLZqBNW4Vif1EUdabofYa3vE=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleCBEZXVjaGVyDQpTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDEsIDIwMTkgNTo0OCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBkb24ndCBpbmNyZW1lbnQgdnJhbSBsb3N0IGlmIHdl
IGFyZSBpbiBoaWJlcm5hdGlvbg0KDQpXZSByZXNldCB0aGUgR1BVIGFzIHBhcnQgb2Ygb3VyIGhp
YmVybmF0aW9uIHNlcXVlbmNlIHNvIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHdlIGRvbid0IG1hcmsg
dnJhbSBhcyBsb3N0IGluIHRoYXQgY2FzZS4NCg0KQnVnOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0
b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTE4NzkNClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L252LmMgICAgfCA2ICsrKystLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgfCA2ICsrKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgaW5kZXggYjNlNzc1NmZjYzRiLi4x
N2RjMDU0YTRiNmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQpAQCAtMzE5LDEwICszMTks
MTIgQEAgc3RhdGljIGludCBudl9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQ0KIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7DQogDQogCWlmIChudl9h
c2ljX3Jlc2V0X21ldGhvZChhZGV2KSA9PSBBTURfUkVTRVRfTUVUSE9EX0JBQ08pIHsNCi0JCWFt
ZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOw0KKwkJaWYgKCFhZGV2LT5pbl9zdXNwZW5kKQ0KKwkJ
CWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOw0KIAkJcmV0ID0gc211X2JhY29fcmVzZXQoc211
KTsNCiAJfSBlbHNlIHsNCi0JCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOw0KKwkJaWYgKCFh
ZGV2LT5pbl9zdXNwZW5kKQ0KKwkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOw0KIAkJcmV0
ID0gbnZfYXNpY19tb2RlMV9yZXNldChhZGV2KTsNCiAJfQ0KIA0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jDQppbmRleCBiNTI0MGI1ZGJmN2IuLjg4YTQ5YTY4YzY3ZiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMNCkBAIC01NjQsMTIgKzU2NCwxNCBAQCBzdGF0aWMgaW50IHNv
YzE1X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7DQogCXN3aXRjaCAo
c29jMTVfYXNpY19yZXNldF9tZXRob2QoYWRldikpIHsNCiAJCWNhc2UgQU1EX1JFU0VUX01FVEhP
RF9CQUNPOg0KLQkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOw0KKwkJCWlmICghYWRldi0+
aW5fc3VzcGVuZCkNCisJCQkJYW1kZ3B1X2luY192cmFtX2xvc3QoYWRldik7DQogCQkJcmV0dXJu
IHNvYzE1X2FzaWNfYmFjb19yZXNldChhZGV2KTsNCiAJCWNhc2UgQU1EX1JFU0VUX01FVEhPRF9N
T0RFMjoNCiAJCQlyZXR1cm4gc29jMTVfbW9kZTJfcmVzZXQoYWRldik7DQogCQlkZWZhdWx0Og0K
LQkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOw0KKwkJCWlmICghYWRldi0+aW5fc3VzcGVu
ZCkNCisJCQkJYW1kZ3B1X2luY192cmFtX2xvc3QoYWRldik7DQogCQkJcmV0dXJuIHNvYzE1X2Fz
aWNfbW9kZTFfcmVzZXQoYWRldik7DQogCX0NCiB9DQotLQ0KMi4yMC4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
