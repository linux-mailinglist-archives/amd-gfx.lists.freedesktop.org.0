Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE16D0E3
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 17:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E444C89FDD;
	Thu, 18 Jul 2019 15:17:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E156689FDD
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 15:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpnD1TTAkkA2q1Skl7pk1QsMucO1jwmUYkjD267zn5BUwYkoGaAookR8wpkU/tE+mTt/iXIQ52MzrpDY0V57a1HsRfB21zj319FkeNRRcSMDZMEwuC8uZs+Z6vXQaIYDDYE/F9MEqgjSncFIkMClaprGmUiMidODDgr5rhkSDfwDpaHbqWEtHtSxUxx107XIp4KMx4DD5hQmI/8SFW2+L4jA/0V0Yqf7jBhFb+ProL5J2r0uZ3s+xDQd6MU18MKOOl8tZCrTWT/RruiInjZHmfQcCVdYx6JFZ4xwtMqDXWcGb8eb33moV9k3lB5Ls0KqNT47w+OYyVT5wXMDDfKn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id3kmdwKhSYMD91Ci5chdisWD7eNenCKxdn8ZB2x/7o=;
 b=gCbewCce4lW3F+fjUEgQ2Ld/NUCkE5denIjoCLh36ehFs8XnQfpfgaevAgZTuUn1iKOgoJpn68PVVN1JfI3kuY7ofAT3T8o38NmU1B0yYQJ7gH9Md9MkueY1wgRnZYGLO8YKyznvX6Z/7MxEKHwPx0BNPl4r7dsFHNesVrHsx4EUUYydbimFIn/wowC70Rkp0U5//E4fU4xRdQFq9W41A/SItzQGUWbNN9yFwrsr4VlW+CNHabwKoEUQONKiWpIjA2YNTYXYFBHivQKsbY+oy1AGg3e+x4ug0InMhrK8rSZjaedQ2xCK0z3wCKtncVTnq7fg4Dnt2V1ObO2HPUz1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3435.namprd12.prod.outlook.com (20.178.198.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Thu, 18 Jul 2019 15:17:15 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::2532:fffd:e1e1:3bdc]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::2532:fffd:e1e1:3bdc%6]) with mapi id 15.20.2073.015; Thu, 18 Jul 2019
 15:17:15 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Add DID for Navi12
Thread-Topic: [PATCH] drm/amdkfd: Add DID for Navi12
Thread-Index: AQHVPXvhwFs/WK7XeUqmQmjH1hPjog==
Date: Thu, 18 Jul 2019 15:17:14 +0000
Message-ID: <1563463027-1201-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abe1f1b2-d157-40e4-c7e6-08d70b9303c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3435; 
x-ms-traffictypediagnostic: DM6PR12MB3435:
x-microsoft-antispam-prvs: <DM6PR12MB3435FDA608A39AEFFA910A91F4C80@DM6PR12MB3435.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(199004)(189003)(2906002)(2501003)(66556008)(66476007)(66446008)(64756008)(256004)(25786009)(4744005)(52116002)(5660300002)(66946007)(102836004)(6506007)(386003)(478600001)(26005)(186003)(486006)(4326008)(71190400001)(71200400001)(2616005)(476003)(99286004)(6436002)(8936002)(6486002)(7736002)(6916009)(53936002)(68736007)(2351001)(81166006)(3846002)(86362001)(81156014)(14454004)(5640700003)(50226002)(36756003)(316002)(66066001)(8676002)(6116002)(305945005)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3435;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4QFkx5zO7jr9jA8D9x74JysE6WB/uP/ooAc5iHOjMZHvmvEOFwf2N05hQxkLrZJUU+fLswt70aop4kDndznOhaVj4aDIgDb8dONXYChSVQf/OFj9hNqc3yFBZCv0H+Vq3/WteKQdEYzX0eb3VQ7lCLTGpqQi6DLYtxi/TGhsEWtr9KinNY+9MA8zn/5+7alo7dQkIMSlpvZu8v13qeXfS0kW15d9CTmOb3/kwwxImhiTcGLza6GzWPXBqmevYkCNk9hTdFtikKPFKeZzk2dFGXTVvOPQiAkEyfgLWr02kKEfwioAIYqv4kERD/yiK7YPeY8h30WBl1Y6FaPFi8cxsq5Tx7JOjwhYG03ETBpGj2CUar+YRvV1wUhi8hS8xhQA6okaAgcQP1yn9ckhJFaopek2sPdQVywSSB4MTzGT3TY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe1f1b2-d157-40e4-c7e6-08d70b9303c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:17:15.1111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShaoyunL@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3435
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id3kmdwKhSYMD91Ci5chdisWD7eNenCKxdn8ZB2x/7o=;
 b=uOJiMPtv/hwWUvcVsxIhxvSSZVWZHjC2TeNH+6Ki0mXs21KRFbkarmJM1Wl6RFbeyu4Rurv2A/+QnN8pd+n6aC1UkVQY1jIATmlbluBBiLssPflBmFW572u4DRq2VlpJbXIi5zoOk1LyUerH0/DILdTOfhk+1ExUnxga7c1nlxQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGRldmljZSBpZCBmb3IgS0ZECgpDaGFuZ2UtSWQ6IEk0NGU4ZTg4NGQwZGM4NjIwOWRlN2Mw
YjZmNDc4NGQwNmVlMzcxMDc5ClNpZ25lZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jCmluZGV4IDI1MTQyNjMuLmNiNmJkM2EgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTQ1OCw2ICs0NTgsOSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0ZWRfZGV2aWNlc1tdID0gewogCXsgMHg3MzE4
LCAmbmF2aTEwX2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLwogCXsgMHg3MzFhLCAmbmF2aTEw
X2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLwogCXsgMHg3MzFmLCAmbmF2aTEwX2RldmljZV9p
bmZvIH0sCS8qIE5hdmkxMCAqLworCS8qIE5hdmkxMiAqLworCXsgMHg3MzYwLCAmbmF2aTEwX2Rl
dmljZV9pbmZvIH0sCS8qIE5hdmkxMiAqLworCXsgMHg2OWIwLCAmbmF2aTEwX2RldmljZV9pbmZv
IH0sCS8qIE5hdmkxMiAqLwogfTsKIAogc3RhdGljIGludCBrZmRfZ3R0X3NhX2luaXQoc3RydWN0
IGtmZF9kZXYgKmtmZCwgdW5zaWduZWQgaW50IGJ1Zl9zaXplLAotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
