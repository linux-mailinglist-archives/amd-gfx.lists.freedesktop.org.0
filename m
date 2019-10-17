Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2325CDB72D
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F316EA6E;
	Thu, 17 Oct 2019 19:15:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730079.outbound.protection.outlook.com [40.107.73.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84056EA37
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4qTE3YF+TtgShZRrh/sdoKHJA9gQLs5vPavSgBip06vTdHayiOiWvMu4wHXxKffGgLdjtWxX70WiwAXOxO7V+yDh+JYuirrDkySAFUiYWbiKKnn5jK+3vg4edVl31C2odYI0DoiPdcCj5hrZqvj6JSsarKlsOUC1N+telt5gK3XfZ6FSDvo/K6lumEeOdVhPvcuIF8FxsMoGcKj2XmcPj+ZRUpWIh597+Z8gF4pMsWDuM3oXf8ly+0E3V5bGRsint8X2yvTmzJ0S8dv5DeA8qUqCk/xAp2PFcShe8tXY4UfvTEx8moVlY4xgC5wJeEXkRdXotEzufMn1BzoMfO3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H57VIP/ggxYIH70RmmNOccb13ubPcOgYq1EoVF3lHk4=;
 b=d8F8cVIs5QpAFEMdVUNRum7xQ3gUc2BcAEMes9FOJNLuLeveS3mu58lYZ/UN/JQXsC4vmzjQbuwQoXj/AaKiNSdFew9dmB/o31G4vnwN2l8LIxLfVTQIlJXuryfv0jHpJa9pVoNINMcIZNpXgUQRP23uM0YjGTdsZMsB/rK8eAR+1KQcWwc/lohNphJmoi+naBqnvdeXLA7uzEr2eyZeMLVmXQFqqDbM/O+Sj91u9+gujDJ7/Zd7jP2S/VqoPw4K1O4jx8Wi39qL1uOVzFGsEU8rfNV2KZyy5Lt6vXgwl37Kk/4I/2MVy7huZ6/ijUIUK4OLkK2RnnrpKun3CHYiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0069.namprd12.prod.outlook.com (2603:10b6:3:103::31)
 by MN2PR12MB2894.namprd12.prod.outlook.com (2603:10b6:208:10a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Thu, 17 Oct
 2019 19:15:36 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0069.outlook.office365.com
 (2603:10b6:3:103::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:35 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:33 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/37] drm/amd/display: 3.2.55
Date: Thu, 17 Oct 2019 15:12:59 -0400
Message-ID: <20191017191329.11857-8-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(428003)(189003)(199004)(5660300002)(54906003)(36756003)(6666004)(356004)(4326008)(26005)(47776003)(1076003)(478600001)(316002)(48376002)(4744005)(50466002)(86362001)(76176011)(51416003)(2906002)(70206006)(2876002)(2870700001)(2351001)(70586007)(476003)(81166006)(486006)(14444005)(6916009)(81156014)(126002)(50226002)(336012)(8676002)(2616005)(186003)(446003)(8936002)(11346002)(426003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18fceb0-c817-4a55-c3ed-08d753366387
X-MS-TrafficTypeDiagnostic: MN2PR12MB2894:
X-Microsoft-Antispam-PRVS: <MN2PR12MB28943ADFDDFFF225F520165E826D0@MN2PR12MB2894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhfKgFouBDVGd/FnD0fG43Fq/jO9vWeJUf8zUUtYoCnig8MMahuZPQZ/CoQwL5YcSoI869cO2ObN1VHwlhv9If9V0bnnpClHdxPvqf++FP6nEQmxggg022g6Z6pFk7LE6WyVP1A9b2DMtjXW9ZgBpP60Lg2yg5dWObYIyFsOVfiI4RpF3/uVaWhG7iCly5PszZ2oheJU4FBAio/US+9LwaCEiws6ecxrZf8ciBiw15H6wBRMQ0M294qfoReBv0MwyP7CXQFw54LEUJygfWuGTR3MdFzCriUa5Bp8g5W5QCxESL2WWGIUOsu05RNGP86sfRBqKV3BAob0d7iyUKmA4oKN+xxC1Irw3OFoVpBwbYbiulImGE7bdXHJqyBXzyIdm/fyEMf+gQD3OIBXV9NK2KdbcQQvXjz7dWz9nyQiJOU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:35.7744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18fceb0-c817-4a55-c3ed-08d753366387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H57VIP/ggxYIH70RmmNOccb13ubPcOgYq1EoVF3lHk4=;
 b=alvTLbgIOyDisLkQfTlnrGQQ8hfyFz3fC1we++B0yhn/T7UMXs7cLBrf0H82sd8+6HB5EOQh/ep23S/yBFs4oY7Z2TbSjLatfBwPR6aV0zR6ygB6gD7rTuyAo5vAZ2jJ9YeRnx9iRU61uV6gCNs4/wKJkakyuEYPXZ2HYSMS5Qs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCAyZTFkMzQ4ODI2ODQuLmE4NmRhZDM4MDhiNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNTQiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjU1IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
