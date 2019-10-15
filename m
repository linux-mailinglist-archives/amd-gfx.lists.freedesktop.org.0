Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0790D8346
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 00:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A056E8A0;
	Tue, 15 Oct 2019 22:08:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E41F6E89C
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 22:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYMdhwE/csLBEN5w2Ol8dej43I7HNf4Dj/5PqmatcZALlXXorewgpXR+vw0Lg23G9zLCgVdtXkQgM+Do+h4fi3ULmHArEua09bwrNNKw2te81BcfLHHSR6794JWTbhyEG6O3COMiqHrh6d/euOdx0NY+ZbFMhGifF8s+lY3hjVQftywrvdNvDA/zTw3ru8/YDKNwK/jQD9Ipq5OzVR2A5/4m/TSUDC4u59pYmIUKOC9bweEohUtnf1ZB/6/LgTBRDGcA+meic87bPDcoH++i1K7AXPaNeeDFtNohR17Y/clIVx+j8e8ptpoZfBY23sIKmRI6Yo0Es6v7Bsrd5KCsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS2AbH15CYGS7ElsR3ryiMBfoaEG18mrFGkL0u2qHxc=;
 b=UsPbFUAYy6OCuYKQLTxLTorcX6yXdj+RSo8jhHNDDaA4Om9CnVCz/sBkxXZLKOHGCP8ha3iYOeTONFM3TuVomPSVzYf8w/al9kkT/gDUCjYNRSPhd1G9TiVdGDodeIeg8FpYozjpeIwsMwqQ8r0kbdsmmKaBADIFuQ6HuVZCjyctuGsMppWPiz24FLrOLOGdN6E87n1oL7M0YkqfmZcyovoM2rzVZBZPgIpHYkjlPT8+2NMn42i0X7he7P7hV9YyIEqFva2NnOK1oJbcrX4g6K3nsVajuxMC6IMsFnLe7rt4JlieSuhk2pAsrUhxtlHexGsPk7EfAD1WM7NTsp6tEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1800.namprd12.prod.outlook.com (10.175.63.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 22:08:07 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Tue, 15 Oct
 2019 22:08:07 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu/uvd:Add uvd enc session bo
Thread-Topic: [PATCH 1/3] drm/amdgpu/uvd:Add uvd enc session bo
Thread-Index: AQHVg6UGdSzLp4ZMgEmSSROLX4V/hA==
Date: Tue, 15 Oct 2019 22:08:07 +0000
Message-ID: <1571177279-9435-2-git-send-email-James.Zhu@amd.com>
References: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed958e24-622f-48e4-4059-08d751bc28a8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1800E11AE789E5359DE2D5FBE4930@CY4PR12MB1800.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(8936002)(36756003)(5640700003)(446003)(81166006)(6512007)(81156014)(11346002)(4326008)(2501003)(71200400001)(71190400001)(99286004)(66066001)(2616005)(486006)(14454004)(256004)(86362001)(8676002)(50226002)(476003)(316002)(25786009)(186003)(478600001)(2351001)(2906002)(6436002)(26005)(6916009)(102836004)(6116002)(6506007)(386003)(5660300002)(64756008)(66946007)(66476007)(305945005)(52116002)(3846002)(76176011)(66446008)(4744005)(6486002)(7736002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1800;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvgcvwcsfvQSWQyPNkhC/9S4Oq0k6zf1g8GigCJcnLZvW0ibjtOj96BhYOEEoc7mDPk9+EVijXaWCDmZM6YUREzSsTTGuwUUfnOzzqm1tHuUKCukMpxVcuP1a1kJaotPCKw+N3p4NJzDDNASD6sXtJ0P0vPvzDFII/Msxr2Z2pbbXl8r534DQFo2CFswbIKFQglQwZx9vft5RnqpLk/lzIU+x67jNBRqo61e4KBNsjx5a9vpU1h1dhdBBcLv1pMM7nMWbqsBaTOZl4qypC4FcE8MS/2/Udq7L2aLIAQQ9sISUfowI1UODyos4Xp6QpDi67TgqEff31fzaBXkx+yAkVaHZ8AJSEbtdNvR2oBoaxz1/jNyREAYwMjuE+KgBPFf/3HmOfJuzeFCsGDvipi9/aBe3Vf26+jOzezOeQov+7k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed958e24-622f-48e4-4059-08d751bc28a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 22:08:07.7339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOKyUQXTUNvWMUa2TvCFfaWwQ8Pbvks+R5JYiQOQP6lqWLtm36paAsuiP5vAsDpF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS2AbH15CYGS7ElsR3ryiMBfoaEG18mrFGkL0u2qHxc=;
 b=GRPXt5j7ILv2nuLZ+242VZlcXQfrUO5q2skZCo4jBZrsI91MKuf5hRONh4EuEWQVnbUYOW8aSlLymeL6x9qObmDTdewb4lrrQzCNNUOjLJcnO8yrDOnYZsQ5aaEva38dzCRuH4vHKR6Gsy0j8X2S3YYcjj4DcGeOiZYhyJkyfXQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHV2ZCBlbmMgc2Vzc2lvbiBibyBmb3IgdXZkIGVuY29kZSBJQiB0ZXN0LgoKU2lnbmVkLW9m
Zi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdXZkLmggfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dXZkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmgKaW5kZXggNWVi
NjMyOC4uMWUzOWM4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3V2ZC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuaApA
QCAtNjcsNiArNjcsMTAgQEAgc3RydWN0IGFtZGdwdV91dmQgewogCXVuc2lnbmVkCQloYXJ2ZXN0
X2NvbmZpZzsKIAkvKiBzdG9yZSBpbWFnZSB3aWR0aCB0byBhZGp1c3QgbmIgbWVtb3J5IHN0YXRl
ICovCiAJdW5zaWduZWQJCWRlY29kZV9pbWFnZV93aWR0aDsKKworCXN0cnVjdCBhbWRncHVfYm8g
KmVuY19zZXNzaW9uX2JvOworCXZvaWQJCQkgKmVuY19zZXNzaW9uX2NwdV9hZGRyOworCXVpbnQ2
NF90CQkgIGVuY19zZXNzaW9uX2dwdV9hZGRyOwogfTsKIAogaW50IGFtZGdwdV91dmRfc3dfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
