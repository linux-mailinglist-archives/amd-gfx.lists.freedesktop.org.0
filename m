Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D985AAE5CE
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 10:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9A46E885;
	Tue, 10 Sep 2019 08:43:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760042.outbound.protection.outlook.com [40.107.76.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AE36E885
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 08:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8cH9wfdgxmJyEqlDsX4A0M3XsoXudEB2rwng745xuKBp8TosXgj6k0I39Nu6lpdMNX6gTZ4XMTueRS/6aZ46qE7e/Fi76zcou+ySG76XZwdMBVl6561vL/Ctxt5PQvG4hRK418umVULqleOK5isEDnvVsL9kqksPwTS5Am11njR18aNG359hHOEsGHUJ3ujaWu1vm2uqFPLQKDigsREt+dXr5XTk17I633gKDIsuwFzwO/vD1EtMd2CSjjC3sgcwHDKb/iE77FTVHDfMMuKQq9ZlVdKLTZluLFnDvtcQObL5G8BvXVnmArZ5NotI5JNZc7GKop3i4n7MO1aa4RK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDtLwrki4uCY8l9DMCtSN9nra8eg9HtnFj/H4X8MV2Q=;
 b=LpEasDr1oW1XcVM6iDk3qtIKw0ihqa8IaDvfIUn04Z0Gajw9ndqK6nmwEbZ1PVonzxGwqXTIL+vOd99D6w5xjj9+kcO4eAzNkiH9KXQbjFls8pkrRaJR5M+bMeg+af499mE8edD7gN22hOj/Do+ouiT35CNPoh0MNDvqivlDHr3nZifh9Z/2cO674CjARWBcBtFwmDv/vj5vb3bFjF8S6ZziejQjhyxFRcj5I3MabzPuKohU/wvA29eM3WHSAy8ced8Rlei5yticgiPymXUqD3IGmJ9QdrrynoV6v1ovl39vxTOXbr6g9JwrvR1nCl8rtupWok/KfIOBxQl/3mS7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2918.namprd12.prod.outlook.com (20.179.91.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 08:43:51 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 08:43:51 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH] drm/amdgpu: remove duplicated header file include
Thread-Topic: [PATCH] drm/amdgpu: remove duplicated header file include
Thread-Index: AQHVZ7PfY0xwzgtYBkm4EOWpU+AATQ==
Date: Tue, 10 Sep 2019 08:43:51 +0000
Message-ID: <20190910084333.10538-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a38ada72-d6b5-47b3-861d-08d735cb0178
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2918; 
x-ms-traffictypediagnostic: BYAPR12MB2918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2918C580D716247640CBA23FF1B60@BYAPR12MB2918.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(189003)(199004)(25786009)(478600001)(14454004)(4744005)(305945005)(1076003)(5660300002)(486006)(53936002)(66066001)(6506007)(386003)(99286004)(102836004)(26005)(3846002)(316002)(256004)(110136005)(6116002)(14444005)(36756003)(81166006)(2906002)(71190400001)(4326008)(50226002)(2501003)(8936002)(2616005)(476003)(81156014)(8676002)(71200400001)(52116002)(6512007)(6486002)(6436002)(66946007)(66446008)(64756008)(66556008)(66476007)(7736002)(86362001)(186003)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2918;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ludD+706m3MBdWqxv3582/kSR7AYhzUqjVvM9mtSf2aM+1r+syoSciIqaCg2+SNNEySO6+/EcBgK0dbPlWkvDL7MJdINpxNBogohzm8X59iONnYGubyY+6cwrUUnaBoZQltjant0WXYhPrDfdokX2Rhp2oBQo+88w22O3Y989EvMHsY/npPdZ4jPBDqRrvhEkNAbSGbYW96iJhp6ej5PFe21q1rTxm5MyVYrmPc1JjrfRhwB7o36T93LbmEHa80p1cqz5TS7WwqFuZaZzaASMW70zPFX1kNwIJFYclkIb5uwHATfnm4H+U5BKsZhf5hJPK/A3A/PFV0lBO1tKQPzzzw3a+OX7nrZ8FmozI4+rLaAB3ZLWJgs8iW/BoV/qX6Zn8CkhmcbUqfpiCXiiewLkjCS4kvsM/dtPKc0DRD/jA0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38ada72-d6b5-47b3-861d-08d735cb0178
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 08:43:51.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPTY1HuAz1ApTBJWSmZjkNWXbwH9Zi12/H05vbqZDVYyFFLGTfer29zrmaTXKs8W9wsMhqW3VoOS4yMv2KUnfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2918
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDtLwrki4uCY8l9DMCtSN9nra8eg9HtnFj/H4X8MV2Q=;
 b=Do9iR1OjrUGZC1JuVJoO0rfbftszB824XlDpKEfZUXvZA2e7jlDbFlmbWuAMoVqozp/2OrY2Fl5JkpymRmyC4Y61vQwncK7jflfpYoBJJo8QWjPUyYbZUjLtyKNt/guOhhYyMSiA6OQjalUj726v/wQzqJ5YoR5BRvr4r6X0SMk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3Jhcy5oIGlzIGFscmVhZHkgaW5jbHVkZWQuCgpGaXhlczogYjE3MThkYSAoZG1yL2Ft
ZGdwdTogQXZvaWQgSFcgR1BVIHJlc2V0IGZvciBSQVMuKQoKQ2hhbmdlLUlkOiBJNGNmMWViNTM5
M2Q4MGM0MmI0MjZkYzFkZGZjNjk2ZTQ4NmEwMmM2ZgpTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hl
biA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
YmlvX3Y3XzQuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jCmluZGV4IGJmYTkxOTE5MGZiNC4uMmQxNzFiZjA3
YWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwpAQCAtMzAsNyArMzAs
NiBAQAogI2luY2x1ZGUgIm5iaW8vbmJpb183XzRfMF9zbW4uaCIKICNpbmNsdWRlICJpdnNyY2lk
L25iaW8vaXJxc3Jjc19uYmlmXzdfNC5oIgogI2luY2x1ZGUgPHVhcGkvbGludXgva2ZkX2lvY3Rs
Lmg+Ci0jaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIgogCiAjZGVmaW5lIHNtbk5CSUZfTUdDR19DVFJM
X0xDTEsJMHgxMDEzYTIxYwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
