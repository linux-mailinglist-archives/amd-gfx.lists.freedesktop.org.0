Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F7669C3
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 11:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA8A6E332;
	Fri, 12 Jul 2019 09:15:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729F16E330
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 09:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqOjvMiyZSQqoL2kohYXKRAhLwadKWgCtSURgrdD4GjXHcZlToV8fsMT6qHj4QUZF+Eqsae+q5pqxspE2+PtbiHs92K2ZLIvsKZkC8NsSCRQU7I1DAALtr6AOTmXcC6M6wZ4S4Zyai+NGRl9nRVua9QHnga0GxNGNEpIx2o7eqBEpUJiAO47gWiUnZ49bETOBEhdlNBXQUtwJlFst35VhCn9fP3BwQlhnp2bN/OwUsYDOo0Lwm7HdM2odkxKPq3iVRMEQFYV/ZNah2U/nv9hfH4YJ7MK4QCZ+2Y6epvORcxWcaepCcEnKXB/EwZmuGr8Fmt6981lp8hCUZBWV2hxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn1ZI21D70WMqAEKDSsv2cOkgWmX8KN5SPyz//SHFFE=;
 b=WvPffkObzvVQ8QnZU9DW8ioX/eZeWGycOEDqS5nw9/FWcrnPXLbQu+EprL+gNZX2IdaNTgaOdFl2fAlFILf/ZKBILpgqrOqLVwDdJRNTzMMGxek5xXugdpY4YMXPCdfWrjXDVH98/uYC/QjzESE93svTmRv46cP7ZsCQgeOmaGjodA6BEhD2b+UriqveJraBsFatgX1iLmc5Oxm4HHbYCXp5dXAXrUoZ0qAG8+lZrfRMNPoXM3yL2WoNUoFINg322PW7A9jGY2W8SDNtMmpBZXttF58uz5F+J6bbif831coV0alwePPxfiDs7dhXP5dAEoXTknw04clyXTGkNpsSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3102.namprd12.prod.outlook.com (20.178.241.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 09:15:14 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 09:15:14 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/powerplay: fix save dpm level error for smu
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: fix save dpm level error for smu
Thread-Index: AQHVOJJQW4hOMfpRLEq0FkNKIT+jkg==
Date: Fri, 12 Jul 2019 09:15:14 +0000
Message-ID: <20190712091454.13478-3-kevin1.wang@amd.com>
References: <20190712091454.13478-1-kevin1.wang@amd.com>
In-Reply-To: <20190712091454.13478-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::33) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6819f3e-6c44-41ff-0df8-08d706a97299
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3102; 
x-ms-traffictypediagnostic: MN2PR12MB3102:
x-microsoft-antispam-prvs: <MN2PR12MB31022D7E2BF6BC827F078448A2F20@MN2PR12MB3102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(478600001)(76176011)(2351001)(2501003)(6486002)(6436002)(5640700003)(4326008)(71200400001)(71190400001)(5660300002)(81156014)(8676002)(81166006)(99286004)(6512007)(52116002)(102836004)(53936002)(256004)(6506007)(14444005)(386003)(25786009)(1076003)(2616005)(11346002)(446003)(486006)(476003)(54906003)(6916009)(26005)(66066001)(8936002)(2906002)(86362001)(186003)(3846002)(305945005)(7736002)(6116002)(36756003)(316002)(66476007)(66446008)(64756008)(66556008)(66946007)(50226002)(68736007)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3102;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GR7MH8ib0LB+NoTsDQ9/jAcXIo71/XJ4Nj2IvPQBs1W36EQiR9E4ZEVZINo9tdpc2D/jqL7zFeoMz8cytyjoMWtHYq1lxWOG/hRS1fwq7NU2/D38ViWRyThZehwqZADJzzghV4Kt4FlGiAQKTinlTTKihTqx+QT+V/l0vwhYAZxEE3m7DANuqSYOxZ+UR+IVRc9QrLSPArZ1cKYqnqk+ZX7Oc9aY3xbeqUM4yhZM6SiU9+dIUgpgbAxwvPLY/eZbaA5la7ffTg2G/hN2HARhMgLW+cPbZzZ7pmbNgwT/xxQnCpqRqvktmpdQfGt6FG6D+RPdsZs961HNTFd+ILwGTZmLvsxhVxCYKDqkdubkEvGsbe8qqS4bFKTvkshfZxr7qWjzr6NPECKbJxODph1j9bgzBGHycMC937lM0Dxqorc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6819f3e-6c44-41ff-0df8-08d706a97299
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:15:14.1215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn1ZI21D70WMqAEKDSsv2cOkgWmX8KN5SPyz//SHFFE=;
 b=nIDtfSKt+icRF6vuKQRbc0Hyz8XemEswHTLuEJxxkrnR90WbkW8M7F6RA8wSEnfaOcsePYPdkr4pL+JICDADmFp/EpJdBFqdbuWl0mh+pVK6WgGuWwrwv1VNqMgaiEBTFn7YBZzFaII3fEG4U3oSPiKssKofJ0MGMzcXk6pYF6Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIHNhdmUgZHBtIGxldmVsIHNob3VsZCBiZSBzYXZlIHByZXZpb3VzIGRwbSBwcm9maWxlIGxl
dmVsLApzaG91bGQgbm90IG1vZGlmaWVkIGJ5IGdldCBkcG0gbGV2ZWwgZnVuY3Rpb24uCmVnOiBk
ZWZhdWx0IGF1dG8KMS4gYXV0byAtPiBzdGFuZGFyZCA9PT4gZHBtX2xldmVsID0gc3RhbmRhcmQs
IHNhdmVfZHBtID0gYXV0by4KMi4gc3RhbmRhcmQgLT4gYXV0byA9PT4gZHBtX2xldmVsID0gYXV0
bywgc2F2ZV9kcG0gPSBzdGFuZGFyZC4KCkNoYW5nZS1JZDogSWI2NzY2ZTU3Y2MxODdkZjRmMGM4
OWNjNjhkY2VlN2VmZDc3NTI5ZmQKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndh
bmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4
IGJlOTBhZTU5ZGZhOC4uNGFiZWRmNzJhMTVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0xNDI4LDE3ICsxNDI4LDE2IEBAIGludCBzbXVfaGFuZGxl
X3Rhc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVs
IHNtdV9nZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7CiAJ
c3RydWN0IHNtdV9kcG1fY29udGV4dCAqc211X2RwbV9jdHggPSAmKHNtdS0+c211X2RwbSk7CisJ
ZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbDsKIAogCWlmICghc211X2RwbV9jdHgtPmRw
bV9jb250ZXh0KQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCW11dGV4X2xvY2soJihzbXUtPm11dGV4
KSk7Ci0JaWYgKHNtdV9kcG1fY3R4LT5kcG1fbGV2ZWwgIT0gc211X2RwbV9jdHgtPnNhdmVkX2Rw
bV9sZXZlbCkgewotCQlzbXVfZHBtX2N0eC0+c2F2ZWRfZHBtX2xldmVsID0gc211X2RwbV9jdHgt
PmRwbV9sZXZlbDsKLQl9CisJbGV2ZWwgPSBzbXVfZHBtX2N0eC0+ZHBtX2xldmVsOwogCW11dGV4
X3VubG9jaygmKHNtdS0+bXV0ZXgpKTsKIAotCXJldHVybiBzbXVfZHBtX2N0eC0+ZHBtX2xldmVs
OworCXJldHVybiBsZXZlbDsKIH0KIAogaW50IHNtdV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCkK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
