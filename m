Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54689BC069
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 04:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD456E9E3;
	Tue, 24 Sep 2019 02:51:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379AC6E9E3
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 02:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny00PShhtiDG0G4sX9epjbKOwoFLm2pjAsdLsX1ydp+1JZiUGpkLH0gG5fWdXQdLKsOhXGS+G6uoLVhQk82spjA4KDV5NsoP1uhpygihjFXm76TbNGAbDmMpAQXpQM6oWQcuoTaUdjbNMf1v7NOtMJTED2b//3pfdBjDTQ4Pe07e0W1iXmBN4wUxVjF/eB8TuB3a5YyysIqwfF9oW70u3tli3lOoDAYOkfGmQrhjLmFrA2ClVaY/lCZslGyBYNrfUq9CDiWwmbwXJ6zIYQFGaiV0Dl6Y7g9TbxqSPuiSLbl0iPurk6rS6R/JmF9E+VYmcX+shlfXYKZ3Q+tN2k9l3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxMevuOHrlSasnLUzF+YzNhgSepJW5IuWtFPDfptCZ4=;
 b=CFnH72RQX+1hhtiQgsoZBZBf0ByMepeyX6rfACCfnrSuJUSO62n0DiSZrW6CpJ52LpdHYP5xrZBrspd3dwYhc021Ya9JFep6EXNAIZKaACHjnE28oM9ThjGYhKUfspJZHwpyLBEE8f+hW6U0BjWmDP5bqhjxe5eitSn4+1gnAqLdiKcd1oYoXoEVgvNZIQLp98Z6bVJGe3zcs0u9stOXZ0n5gu70VnsrNDZxCzjQemPiU6cDDSWJqy2fLnWEBjYaBXUjFoIY2D7EvoQ0nrca5VTvZQDUIyTxiiXHC+jhu7vsJKta6KFxWOQB0q6MuaGKcN4eCAQQy7jIOXAkABhyBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3070.namprd12.prod.outlook.com (20.178.240.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 02:51:01 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 02:51:01 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/5] drm/amd/powerplay: add interface for getting workload
 type
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: add interface for getting
 workload type
Thread-Index: AQHVcervl1k11S1kykqqjjySYSJ5Uac6IeGw
Date: Tue, 24 Sep 2019 02:51:01 +0000
Message-ID: <MN2PR12MB3344F124284A7BCCC1052DECE4840@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
 <1569228167-3120-3-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-3-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c47fd7ca-dc72-42c3-a748-08d7409a090e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3070; 
x-ms-traffictypediagnostic: MN2PR12MB3070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3070D69D1128D08475204558E4840@MN2PR12MB3070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(199004)(189003)(13464003)(316002)(26005)(14454004)(66446008)(186003)(25786009)(478600001)(86362001)(11346002)(76116006)(5660300002)(6506007)(53546011)(4326008)(52536014)(446003)(66946007)(102836004)(76176011)(7696005)(256004)(14444005)(99286004)(6246003)(3846002)(8676002)(81156014)(6116002)(486006)(66066001)(71190400001)(66556008)(55016002)(66476007)(71200400001)(9686003)(476003)(8936002)(81166006)(74316002)(305945005)(7736002)(6436002)(2906002)(229853002)(33656002)(54906003)(64756008)(110136005)(2501003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3070;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ChAv0PqxdHZDDqKQkbZt1lUapAIPRmd7X5qlgfVBKXd0jqC2eKck0AMpRfyo1GE9YeElm7RP+n44ulZBOULT8et4ZVOQ5p3lbUBJH1FtXeJL2nVPzCovNlIJTEYGhTGj/ZLY4kZfpTKeHIGmWWPM5CwjL//2n0DDEe9VvYz+DK+w118BKZgDs2zyXnHz5a014q0MPQoNYX2NFraddwGLi6SdqoyihzgCF97sU08+x7jxlp9pte1WTFBcrKowZfansF//15Ak4KAMnKJRB5dXdJgT8oFPHmw8SEyZT8JbfAjsIXu5ZCC1N74i14yPeh5pdl9y3JPbKsy7P36gSNrD7mNDeuDFWNejRygzWrjICSYPxMH2ygLaD0LvsBK4AsUt0oXztEbBf0aMpts1VQxal0VZbCqGrxf2qJksFi4N9vg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47fd7ca-dc72-42c3-a748-08d7409a090e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 02:51:01.5542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0mTW8i7U63TN3JLVbu16nL/pMpr+YLIY/4b/esecHwW/X9d3d8JGcjSMhoe+zAs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxMevuOHrlSasnLUzF+YzNhgSepJW5IuWtFPDfptCZ4=;
 b=BzrTY7p1RzHeG6mwGdGzdZhoU73FKxOudoFz8osGZDjK7xpjNwIXmTru2ICgZXUCYjgSGR8cIZMg8yDk+esjS5YmffeWxjVeQJzbw67NV+Io5KGgdhvOO67w7wZBNRvIKGN/EKY52yBBneuAZHnHlKPx7JXyT4hxrKUDTFdMs/0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2ggMS0gMyBhcmUgcmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBMaWFuZywgUHJpa2UgPFByaWtlLkxp
YW5nQGFtZC5jb20+IApTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSA0OjQzIFBNClRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogUXVhbiwgRXZhbiA8RXZhbi5RdWFu
QGFtZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IEh1YW5nLCBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgYXJyb24ubGl1QGFtZC5jb207IExpYW5nLCBQcmlrZSA8
UHJpa2UuTGlhbmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDMvNV0gZHJtL2FtZC9wb3dlcnBs
YXk6IGFkZCBpbnRlcmZhY2UgZm9yIGdldHRpbmcgd29ya2xvYWQgdHlwZQoKVGhlIHdvcmtsb2Fk
IHR5cGUgd2FzIGdvdCBmcm9tIHRoZSBpbnB1dCBvZiBwb3dlciBwcm9maWxlIG1vZGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgfCAyOSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggNGJiN2UxYy4uZjg3YWE1
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMzY0
LDYgKzM2NCwzNCBAQCBzdGF0aWMgaW50IHJlbm9pcl91bmZvcmNlX2RwbV9sZXZlbHMoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUpIHsKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IHJlbm9p
cl9nZXRfd29ya2xvYWRfdHlwZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgCitw
cm9maWxlKSB7CisKKwl1aW50MzJfdCAgcHBsaWJfd29ya2xvYWQgPSAwOworCisJc3dpdGNoIChw
cm9maWxlKSB7CisJY2FzZSBQUF9TTUNfUE9XRVJfUFJPRklMRV9GVUxMU0NSRUVOM0Q6CisJCXBw
bGliX3dvcmtsb2FkID0gV09SS0xPQURfUFBMSUJfRlVMTF9TQ1JFRU5fM0RfQklUOworCQlicmVh
azsKKwljYXNlIFBQX1NNQ19QT1dFUl9QUk9GSUxFX0NVU1RPTToKKwkJcHBsaWJfd29ya2xvYWQg
PSBXT1JLTE9BRF9QUExJQl9DT1VOVDsKKwkJYnJlYWs7CisJY2FzZSBQUF9TTUNfUE9XRVJfUFJP
RklMRV9WSURFTzoKKwkJcHBsaWJfd29ya2xvYWQgPSBXT1JLTE9BRF9QUExJQl9WSURFT19CSVQ7
CisJCWJyZWFrOworCWNhc2UgUFBfU01DX1BPV0VSX1BST0ZJTEVfVlI6CisJCXBwbGliX3dvcmts
b2FkID0gV09SS0xPQURfUFBMSUJfVlJfQklUOworCQlicmVhazsKKwljYXNlIFBQX1NNQ19QT1dF
Ul9QUk9GSUxFX0NPTVBVVEU6CisJCXBwbGliX3dvcmtsb2FkID0gV09SS0xPQURfUFBMSUJfQ09N
UFVURV9CSVQ7CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCXJldHVybiAtRUlOVkFMOworCX0KKwor
CXJldHVybiBwcGxpYl93b3JrbG9hZDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxl
X2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmdldF9zbXVfbXNnX2luZGV4ID0gcmVub2ly
X2dldF9zbXVfbXNnX2luZGV4LAogCS5nZXRfc211X3RhYmxlX2luZGV4ID0gcmVub2lyX2dldF9z
bXVfdGFibGVfaW5kZXgsIEBAIC0zNzUsNiArNDAzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
cHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmRwbV9zZXRfdXZkX2VuYWJsZSA9
IHJlbm9pcl9kcG1fc2V0X3V2ZF9lbmFibGUsCiAJLmZvcmNlX2RwbV9saW1pdF92YWx1ZSA9IHJl
bm9pcl9mb3JjZV9kcG1fbGltaXRfdmFsdWUsCiAJLnVuZm9yY2VfZHBtX2xldmVscyA9IHJlbm9p
cl91bmZvcmNlX2RwbV9sZXZlbHMsCisJLmdldF93b3JrbG9hZF90eXBlID0gcmVub2lyX2dldF93
b3JrbG9hZF90eXBlLAogfTsKIAogdm9pZCByZW5vaXJfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSkKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
