Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC792B47EA
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 09:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F64B6E32E;
	Tue, 17 Sep 2019 07:12:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690063.outbound.protection.outlook.com [40.107.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BEC6E32E
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 07:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL7VF0oVQCuDm9vAfqsupLk85zPovuJqegzZQeszS5He/zsuu0wWwGGwxk6YsSH2bajb/5i6zpLYoX26LqaigXgFp4zUMIaLg2lwvmD4JRNNdfxffLVYH0JN7oG+s0Uf7M0erizdTmBbs5/t4Xh/T/GTj19e98g4XZgZVXIsnF+O0/bE62NpkaRNF/k+aMc3ppojZX2KvdNMYEzOaaJduD0NEhzJ4LJcc5OhoS/zEaBO4EmGdGauckrMe3OMwR/lyhYyuzgiI0Bv3Z1eI+gFxgwvpcG47SRinvRK4ozJ39bXicImdeqcHuMnHuwoS5BEwNSzm72CfEz1NUZJJPCFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wZZgAe105MO1Je2U71+FjACRSnpgMtjf4N8o5WDeyw=;
 b=dMPQaMTutKfWJ3HySjJ0tvmUHckh9kE92DYkKxUDZHQ8I8+s+qyVwTmWsDSelcBS0oKLZI/8hRKieyqepG14xsmKuNnbGiwFmKePLdur5w8ABnfXxRN2u5LFDLpKjZ+KOxQTZnHLkNQzY5aVOwGyRfO4Z9mKRwSQvJQ41gyIylQhsG8f4n5S+jkTqXy8m+n/F4NkpWH5tB1h3+DajjpBAmGV/tkcK2VnDJA4LiquSraBh3askRgYvQCk2G+O4iaFDzz9NjeDbgSWBKI/bkFZAr+/5kGshdE/q923fMCvNI/2lEUVIi1xeYNhSsRhmeca8p3de3rMLyyFtMVEdmtDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) by
 MN2PR12MB4272.namprd12.prod.outlook.com (52.135.51.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Tue, 17 Sep 2019 07:12:49 +0000
Received: from MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5]) by MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5%4]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 07:12:49 +0000
From: <jianzh@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
Thread-Index: AQHVbSdQTFsxws0uXkSNk2l8pWGdYQ==
Date: Tue, 17 Sep 2019 07:12:49 +0000
Message-ID: <20190917071222.6132-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::31) To MN2PR12MB3056.namprd12.prod.outlook.com
 (2603:10b6:208:ca::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d491aa7-ae36-4d92-5897-08d73b3e7290
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4272; 
x-ms-traffictypediagnostic: MN2PR12MB4272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42728AF8395C2D7B480AEA69E18F0@MN2PR12MB4272.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(189003)(199004)(52116002)(256004)(6916009)(6116002)(3846002)(5640700003)(2616005)(6436002)(476003)(6512007)(386003)(6506007)(102836004)(25786009)(486006)(6486002)(26005)(2501003)(2906002)(186003)(4326008)(1076003)(66556008)(64756008)(66446008)(66476007)(66946007)(36756003)(478600001)(66066001)(50226002)(14454004)(71190400001)(71200400001)(4744005)(5660300002)(54906003)(305945005)(7736002)(316002)(99286004)(8936002)(2351001)(8676002)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4272;
 H:MN2PR12MB3056.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bv37mNoC4JhwUZda5ZoeVX4F7gtYzAtcLV+Kr1medyIPcydOlL6G++GAmGsswmCqWi9Wror2LJQybvD86xcQo6mirZBnrScTdcqHEgsJ1EgC7wajnEsafFFtDpaPxpUmu4id293HvayU7+6BsBCLp7wIDhYsF02vhP6fv63mcizqgMmXWTBVyZgQPdlL7lZ0ZaZAwRqGBFKqnajbigMyxeNHoz4pwtUgm72Cj3+4kTX5dmqo3Sz9gws0w+x7v1Fpd6jLvTNvSAtemIrzwrO9AwPt9pAez8qShRRKqdC0ixj3TgohvWGTf4ECpVOF6SbHI8UpyCGeGOK9sHKPGQNM8uXBo7/VsKE5w2mNwy/0xBISRq+sHpMct547KxCCdDlE6npVJ99ZsroR1mn4DDdIguifvxLZFgVuURGUR9VZrJQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d491aa7-ae36-4d92-5897-08d73b3e7290
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 07:12:49.7275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pEwL8RdZ0uDdyAVw9uyE4rjWJpB/8dmnfnOSuPo0QDK3YMwCh0ZKrsPShlWCk2s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wZZgAe105MO1Je2U71+FjACRSnpgMtjf4N8o5WDeyw=;
 b=lJq+SDPm6NFy0+oTnomvzrO9yguo1pgZ2qh4HNZBqHLxU/vJheqTB8HYEM1nKi3CSsVorUQtKZLQ0QGDGs/BXpHiWe3JynZR3h2WPWHY/EKNOrmZ2iVBabJ8sX1qjxW0LUG9BIkwFVuJLBbx6ld9TJNp6SMS0Xp5fmmAGMZrKJY=
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

RnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+CgpBZGQgTmF2aTEyIFBDSSBp
ZCBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKaW5kZXggNDIwODg4ZTk0MWRmLi5iNTJjNzI1NWU1ZTQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEwMzQsNiArMTAzNCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAogCS8qIE5hdmkx
MiAqLwogCXsweDEwMDIsIDB4NzM2MCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJ
UF9OQVZJMTJ9LAorCXsweDEwMDIsIDB4NzM2MiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgQ0hJUF9OQVZJMTJ9LAogCiAJezAsIDAsIDB9CiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
