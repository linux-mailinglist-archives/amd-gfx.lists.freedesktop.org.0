Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C1D8AC8
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 10:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB886E8F5;
	Wed, 16 Oct 2019 08:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760041.outbound.protection.outlook.com [40.107.76.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D2A6E8F5
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 08:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnM5MSmMMYP/TQ1lpJ2ACdsZXm+9KPSQx0h5E3GUl23jC7wqA1FgKWaIkpuYp942jucML60znPb9P1X+q9z+wbgm2iXfw48GLNMEKaSBbB7RCC//jlThFirBbecdu+wsYYn5BdyAd5kLvuux3RqmVYjSeOuKtkhXz0cgk3VANxFgqNLILT310Uy41Ggs3vH1BDsRdVKdcFF57gJXCDLqULXifz5ptseB+b3/CadOj1Ym9mjZauSt3dT90Qj2+DlsNwSbMN8hZJtzNWGgJuK5lzk/hzugpLM58AD8Jo0S98a/ZdN8dm0LnzBGTrxKkkVqMLisf9Pn6s4vP6/9BfSeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xd2UUbK+iPFbkzV7IXphibDZoI4i/CGOnzQKaaUONzg=;
 b=evL4MJP3Opd17iL/qrRcyEb+L74RycsCwaOluD6mZZD6pNNxd9GNbln7ZO37Q5X48+ThDOeIlebn8bXiFma2HpmrJaxwOmur2jTugX1FCNvxiUMMRAqNZQef2iRRyOGfC/vCtn/amHeGR0wjItNmOLH8JNp48bscPuICpOLgOL+FDEG8F5+E/EA2DEU60b/CWnN5aOtEZWTxLAfkdkuKOVfXKX+Z2iKTd4nxgN9sEsRn/WgN046S+Vs0bivEXn3dY/jl1emlbKjQ5nhBsfdOD9qrVCJ+qME5J8566iD932urlaXA+2hPVMTCHgN8tymw7xx/EJsSAx3V/Kp9gpVUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3069.namprd12.prod.outlook.com (20.178.241.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Wed, 16 Oct 2019 08:24:20 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3%5]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 08:24:20 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/powerplay: implement interface
 pp_power_profile_mode
Thread-Topic: [PATCH] drm/amdgpu/powerplay: implement interface
 pp_power_profile_mode
Thread-Index: AQHVg/sb7yrg+xOrbkSyVUPY/J9tsg==
Date: Wed, 16 Oct 2019 08:24:20 +0000
Message-ID: <1571214251-410-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0180.apcprd02.prod.outlook.com
 (2603:1096:201:21::16) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dbd8a90-f557-41f0-e720-08d752123e35
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3069A8EC3258BA04E6CBA928FB920@MN2PR12MB3069.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(8676002)(2351001)(305945005)(71200400001)(2501003)(6916009)(71190400001)(50226002)(66556008)(64756008)(3846002)(66476007)(66946007)(6116002)(4326008)(81166006)(66066001)(81156014)(86362001)(25786009)(5660300002)(478600001)(36756003)(8936002)(7736002)(14454004)(6436002)(186003)(476003)(486006)(2906002)(2616005)(99286004)(5640700003)(256004)(316002)(6506007)(26005)(66446008)(6512007)(386003)(52116002)(54906003)(102836004)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3069;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vrSE4qoRw57SsoQaO6GRHr3AtzAqxFastLMEHtgLJmS8BNgdQ4daO3jkGtiQir/sFWw3wvUQIozjKtGJiRP8arqgrwd38kTxDwdBelUKnV48m1luQweqpRJ5M4JGihAXf9jHxCg65k0fK1hy+PhQtz1d1H/qDIrrOPHlhX3TOXlHQFc2+woCtTQindgl483qFkAQa5ybAAHKoRZL7c5CCO/nl6MbHF3f0kiBLcW/tgJ7LvLUhsPhaaEdnvh3pj9fMxqOdR6FX2nKp0MNoPF+DFj8JZRii/8i6+bHwPCZPhL6xCJ2h+zIGy6CCFrrDORY4lmzn113D0PvHm6cOLL80CNZtBSwkidi9tEPnr53omFbcQPQJGdoPFCtDJtoBYq3nEIKjtjHN8XPgbNmzeEFrgs/P/035wQg+/Jti24iSQc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbd8a90-f557-41f0-e720-08d752123e35
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 08:24:20.5761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1mERQy7U0Q6zw+4Yvfg1cn+D1WeHAJRNW54Lh18Kxu2vomfkcmW5F5k+7Bdtftya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xd2UUbK+iPFbkzV7IXphibDZoI4i/CGOnzQKaaUONzg=;
 b=jssW/6WOOBJ1xqqNXGVM1wwzxsyLP4+JLdVLOMkyjfHj6VCiUuiWddVvxYsyOZg+1U6jic6CIQHXBQUXvN2yGwP4p33/YH+yhDUHkT5/N9Q7qPAOuSNMzs5nDGekZYT3w8u71YLsP3TX3HIea6Lc18wNj2XaL2t4SQS6vUzieU0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW1wbGVtZW50IGdldF9wb3dlcl9wcm9maWxlX21vZGUgZm9yIGdldHRpbmcgcG93ZXIgcHJvZmls
ZSBtb2RlIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8
IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9y
ZW5vaXJfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMK
aW5kZXggZmEzMTRjMi4uOTUzZTM0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvcmVub2lyX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3Jlbm9pcl9wcHQuYwpAQCAtNjQwLDYgKzY0MCwzOSBAQCBzdGF0aWMgaW50IHJlbm9pcl9zZXRf
d2F0ZXJtYXJrc190YWJsZSgKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IHJlbm9pcl9n
ZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkJCQkgICBj
aGFyICpidWYpCit7CisJc3RhdGljIGNvbnN0IGNoYXIgKnByb2ZpbGVfbmFtZVtdID0geworCQkJ
CQkiQk9PVFVQX0RFRkFVTFQiLAorCQkJCQkiM0RfRlVMTF9TQ1JFRU4iLAorCQkJCQkiUE9XRVJf
U0FWSU5HIiwKKwkJCQkJIlZJREVPIiwKKwkJCQkJIlZSIiwKKwkJCQkJIkNPTVBVVEUiLAorCQkJ
CQkiQ1VTVE9NIn07CisJdWludDMyX3QgaSwgc2l6ZSA9IDA7CisJaW50MTZfdCB3b3JrbG9hZF90
eXBlID0gMDsKKworCWlmICghc211LT5wbV9lbmFibGVkIHx8ICFidWYpCisJCXJldHVybiAtRUlO
VkFMOworCisJZm9yIChpID0gMDsgaSA8PSBQUF9TTUNfUE9XRVJfUFJPRklMRV9DVVNUT007IGkr
KykgeworCQkvKgorCQkgKiBDb252IFBQX1NNQ19QT1dFUl9QUk9GSUxFKiB0byBXT1JLTE9BRF9Q
UExJQl8qX0JJVAorCQkgKiBOb3QgYWxsIHByb2ZpbGUgbW9kZXMgYXJlIHN1cHBvcnRlZCBvbiBh
cmN0dXJ1cy4KKwkJICovCisJCXdvcmtsb2FkX3R5cGUgPSBzbXVfd29ya2xvYWRfZ2V0X3R5cGUo
c211LCBpKTsKKwkJaWYgKHdvcmtsb2FkX3R5cGUgPCAwKQorCQkJY29udGludWU7CisKKwkJc2l6
ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlMmQgJTE0cyVzXG4iLAorCQkJaSwgcHJvZmlsZV9u
YW1lW2ldLCAoaSA9PSBzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSkgPyAiKiIgOiAiICIpOworCX0K
KworCXJldHVybiBzaXplOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3Mg
cmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSByZW5vaXJfZ2V0X3Nt
dV9tc2dfaW5kZXgsCiAJLmdldF9zbXVfdGFibGVfaW5kZXggPSByZW5vaXJfZ2V0X3NtdV90YWJs
ZV9pbmRleCwKQEAgLTY1OCw2ICs2OTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVf
ZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuc2V0X3BlcmZvcm1hbmNlX2xldmVsID0gcmVu
b2lyX3NldF9wZXJmb3JtYW5jZV9sZXZlbCwKIAkuZ2V0X2RwbV9jbG9ja190YWJsZSA9IHJlbm9p
cl9nZXRfZHBtX2Nsb2NrX3RhYmxlLAogCS5zZXRfd2F0ZXJtYXJrc190YWJsZSA9IHJlbm9pcl9z
ZXRfd2F0ZXJtYXJrc190YWJsZSwKKwkuZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSA9IHJlbm9pcl9n
ZXRfcG93ZXJfcHJvZmlsZV9tb2RlLAogfTsKIAogdm9pZCByZW5vaXJfc2V0X3BwdF9mdW5jcyhz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
