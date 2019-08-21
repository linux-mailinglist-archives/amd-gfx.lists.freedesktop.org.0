Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BB29752F
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 10:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45036E2F5;
	Wed, 21 Aug 2019 08:41:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700066.outbound.protection.outlook.com [40.107.70.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB21F6E2F5
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 08:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcO3L9TEG3lk2nldZ3WF+9feV0sE1WVa8NibCCtWTnvJWKXcBkJkaheCxf6doEXKnyoNeutQdEhAzyytmgPVDr9yCcEtsmHAkRpR2Z3edM4fD8JYS+wcbwj6IzJ6MO6ft9CK/9Zd2xt4N/DH22Pwl4Wfbuqouqk1Uyx+Qr8QiBuuk5mmK6/r04Osg8s6NyCgeRUsT1Np4gsNwRy7JHcMWFYI5ACNxb3qud6h7ch1QR9K9qGWM8YZx+cRUlrqzInoKuPJfvesgyxpZbJtvAU5QYTjBV9LKMF9bkKxzS7qkj02WZzyRy1yKEdhdTUDw+Ia4U89/Csnhog+Xh1RXTChVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uwYu7QJj668TK8iXvfI3eRxd2PoS+hrNx6A1Lrc8uA=;
 b=faijBVWOaLLwPlmBMAGWgxIQBNgHGQzkSxAGFsKVl27msnZFV68T/zM/1cncX2Da1jgcOZMaqCd2Bzp/gXEQgmBsrcy4kYKPP+URbXz66EJVRatx3Ck2WcSTEDKE9SFAeKSRKRonxDw5zVH2qAGLUGwV7Ccmnd3E6yziNNz0zdALUTLYwU3rKWCQThSyO57NaJIz+Fx6444KsbO9f71LcvFxBE2bsYdubawHJV8kD1K/33C7NLpMwcYskSLkaF6bUubrD3wQzSutlsseKl6WLJjxzU0YbmlOo+5AM3CQF3V7jRxRgR0eKntccvxjxC9SlS8NBAVlMxyKHxbAmynzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:405:70::20)
 by BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 08:41:55 +0000
Received: from CO1NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by BN6PR12CA0034.outlook.office365.com
 (2603:10b6:405:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 08:41:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT046.mail.protection.outlook.com (10.152.81.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 08:41:55 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 03:41:53 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level related
 settings
Date: Wed, 21 Aug 2019 16:41:42 +0800
Message-ID: <20190821084143.25713-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(50226002)(70586007)(2616005)(70206006)(53936002)(476003)(305945005)(186003)(6916009)(50466002)(26005)(48376002)(44832011)(126002)(36756003)(4326008)(356004)(6666004)(7696005)(51416003)(2906002)(316002)(5660300002)(426003)(47776003)(486006)(1076003)(336012)(2351001)(86362001)(2870700001)(81166006)(8936002)(8676002)(53416004)(478600001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2708; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6768f6f-25de-4e24-3a5c-08d726136bf0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2708; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27087EF53DE87E6AE08FAF19E4AA0@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QFo7rjgsx/dV9oE+sJAPRFg9fW2hcCbuPIyfiAPgQ7UqBPtBPk4OLfYp91qMiTMDHe66rx5NSlxinhdgkURtszzcGh4bR8WccsEF1mVmS5gPtUAFjhYSgIDd14wsBqOwZMsMWte83OXQ93f7H2c+2cjW9YnJhLa9ZhEXH6h/hUK17h6IWfEFPuy4wHAAGSasyLbuj1/un7KsLihnOjI5fI0f2zLySFeo/1YRaws0olGrudc5QTOVkOGARdxJfWS4GRyfxPolBxeN+/rtlTZK1qqhtATI/xYUDkfAt4ZKHqTp8LJ/8MsNn80XnXskBMG9Tp1VeIfVwVLTjbseORYtrUe9lGqHshVgMhOpMI2XofOO5T93fbhAtsY1vwamXWfKw/GaaLHIi8BnfJU9ly0SCmqGOsgAtnc7m/9p2NqmOJc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 08:41:55.1272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6768f6f-25de-4e24-3a5c-08d726136bf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uwYu7QJj668TK8iXvfI3eRxd2PoS+hrNx6A1Lrc8uA=;
 b=wI5xBHnxeiVZtMGG/JHQTbtCkOjqrCDhfgnHskAddL5BHkVV9xQ7bMbR+7XUkJQ+h7lVWJKIaa9XizStX/BxMFq4a9+QhOklJWYsPu3H+pblLy4kXoNxtDKDnpFurzz6lz6cvPvdiweurdUCjkw0e/7nOYOPvFhODgYKuaFNOLY=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q29ycmVjdCB0aGUgc2V0dGluZ3MgZm9yIGF1dG8gbW9kZSBhbmQgc2tpcCB0aGUgdW5uZWNlc3Nh
cnkKc2V0dGluZ3MgZm9yIGRjZWZjbGsgYW5kIGZjbGsuCgpDaGFuZ2UtSWQ6IEk3ZTZjYTc1Y2U4
NmI0ZDVjZDQ0OTIwYTlmYmM3MWI2ZjM2ZWEzYzQ5ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8
ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ey
MF9od21nci5jICAgIHwgNjAgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDU0
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwppbmRleCAwNTE2YzI5NGIzNzcuLmNj
NTJkNWM4Y2NmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTIwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTIwX2h3bWdyLmMKQEAgLTIzNDksMTIgKzIzNDksMTYgQEAgc3RhdGljIGludCB2ZWdh
MjBfZm9yY2VfZHBtX2hpZ2hlc3Qoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAkJZGF0YS0+ZHBt
X3RhYmxlLnNvY190YWJsZS5kcG1fc3RhdGUuc29mdF9tYXhfbGV2ZWwgPQogCQlkYXRhLT5kcG1f
dGFibGUuc29jX3RhYmxlLmRwbV9sZXZlbHNbc29mdF9sZXZlbF0udmFsdWU7CiAKLQlyZXQgPSB2
ZWdhMjBfdXBsb2FkX2RwbV9taW5fbGV2ZWwoaHdtZ3IsIDB4RkZGRkZGRkYpOworCXJldCA9IHZl
Z2EyMF91cGxvYWRfZHBtX21pbl9sZXZlbChod21nciwgRkVBVFVSRV9EUE1fR0ZYQ0xLX01BU0sg
fAorCQkJCQkJIEZFQVRVUkVfRFBNX1VDTEtfTUFTSyB8CisJCQkJCQkgRkVBVFVSRV9EUE1fU09D
Q0xLX01BU0spOwogCVBQX0FTU0VSVF9XSVRIX0NPREUoIXJldCwKIAkJCSJGYWlsZWQgdG8gdXBs
b2FkIGJvb3QgbGV2ZWwgdG8gaGlnaGVzdCEiLAogCQkJcmV0dXJuIHJldCk7CiAKLQlyZXQgPSB2
ZWdhMjBfdXBsb2FkX2RwbV9tYXhfbGV2ZWwoaHdtZ3IsIDB4RkZGRkZGRkYpOworCXJldCA9IHZl
Z2EyMF91cGxvYWRfZHBtX21heF9sZXZlbChod21nciwgRkVBVFVSRV9EUE1fR0ZYQ0xLX01BU0sg
fAorCQkJCQkJIEZFQVRVUkVfRFBNX1VDTEtfTUFTSyB8CisJCQkJCQkgRkVBVFVSRV9EUE1fU09D
Q0xLX01BU0spOwogCVBQX0FTU0VSVF9XSVRIX0NPREUoIXJldCwKIAkJCSJGYWlsZWQgdG8gdXBs
b2FkIGRwbSBtYXggbGV2ZWwgdG8gaGlnaGVzdCEiLAogCQkJcmV0dXJuIHJldCk7CkBAIC0yMzg3
LDEyICsyMzkxLDE2IEBAIHN0YXRpYyBpbnQgdmVnYTIwX2ZvcmNlX2RwbV9sb3dlc3Qoc3RydWN0
IHBwX2h3bWdyICpod21ncikKIAkJZGF0YS0+ZHBtX3RhYmxlLnNvY190YWJsZS5kcG1fc3RhdGUu
c29mdF9tYXhfbGV2ZWwgPQogCQlkYXRhLT5kcG1fdGFibGUuc29jX3RhYmxlLmRwbV9sZXZlbHNb
c29mdF9sZXZlbF0udmFsdWU7CiAKLQlyZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9taW5fbGV2ZWwo
aHdtZ3IsIDB4RkZGRkZGRkYpOworCXJldCA9IHZlZ2EyMF91cGxvYWRfZHBtX21pbl9sZXZlbCho
d21nciwgRkVBVFVSRV9EUE1fR0ZYQ0xLX01BU0sgfAorCQkJCQkJIEZFQVRVUkVfRFBNX1VDTEtf
TUFTSyB8CisJCQkJCQkgRkVBVFVSRV9EUE1fU09DQ0xLX01BU0spOwogCVBQX0FTU0VSVF9XSVRI
X0NPREUoIXJldCwKIAkJCSJGYWlsZWQgdG8gdXBsb2FkIGJvb3QgbGV2ZWwgdG8gaGlnaGVzdCEi
LAogCQkJcmV0dXJuIHJldCk7CiAKLQlyZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9tYXhfbGV2ZWwo
aHdtZ3IsIDB4RkZGRkZGRkYpOworCXJldCA9IHZlZ2EyMF91cGxvYWRfZHBtX21heF9sZXZlbCho
d21nciwgRkVBVFVSRV9EUE1fR0ZYQ0xLX01BU0sgfAorCQkJCQkJIEZFQVRVUkVfRFBNX1VDTEtf
TUFTSyB8CisJCQkJCQkgRkVBVFVSRV9EUE1fU09DQ0xLX01BU0spOwogCVBQX0FTU0VSVF9XSVRI
X0NPREUoIXJldCwKIAkJCSJGYWlsZWQgdG8gdXBsb2FkIGRwbSBtYXggbGV2ZWwgdG8gaGlnaGVz
dCEiLAogCQkJcmV0dXJuIHJldCk7CkBAIC0yNDAzLDE0ICsyNDExLDU0IEBAIHN0YXRpYyBpbnQg
dmVnYTIwX2ZvcmNlX2RwbV9sb3dlc3Qoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAogc3RhdGlj
IGludCB2ZWdhMjBfdW5mb3JjZV9kcG1fbGV2ZWxzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB7
CisJc3RydWN0IHZlZ2EyMF9od21nciAqZGF0YSA9CisJCQkoc3RydWN0IHZlZ2EyMF9od21nciAq
KShod21nci0+YmFja2VuZCk7CisJdWludDMyX3Qgc29mdF9taW5fbGV2ZWwsIHNvZnRfbWF4X2xl
dmVsOwogCWludCByZXQgPSAwOwogCi0JcmV0ID0gdmVnYTIwX3VwbG9hZF9kcG1fbWluX2xldmVs
KGh3bWdyLCAweEZGRkZGRkZGKTsKKwkvKiBnZnhjbGsgc29mdCBtaW4vbWF4IHNldHRpbmdzICov
CisJc29mdF9taW5fbGV2ZWwgPQorCQl2ZWdhMjBfZmluZF9sb3dlc3RfZHBtX2xldmVsKCYoZGF0
YS0+ZHBtX3RhYmxlLmdmeF90YWJsZSkpOworCXNvZnRfbWF4X2xldmVsID0KKwkJdmVnYTIwX2Zp
bmRfaGlnaGVzdF9kcG1fbGV2ZWwoJihkYXRhLT5kcG1fdGFibGUuZ2Z4X3RhYmxlKSk7CisKKwlk
YXRhLT5kcG1fdGFibGUuZ2Z4X3RhYmxlLmRwbV9zdGF0ZS5zb2Z0X21pbl9sZXZlbCA9CisJCWRh
dGEtPmRwbV90YWJsZS5nZnhfdGFibGUuZHBtX2xldmVsc1tzb2Z0X21pbl9sZXZlbF0udmFsdWU7
CisJZGF0YS0+ZHBtX3RhYmxlLmdmeF90YWJsZS5kcG1fc3RhdGUuc29mdF9tYXhfbGV2ZWwgPQor
CQlkYXRhLT5kcG1fdGFibGUuZ2Z4X3RhYmxlLmRwbV9sZXZlbHNbc29mdF9tYXhfbGV2ZWxdLnZh
bHVlOworCisJLyogdWNsayBzb2Z0IG1pbi9tYXggc2V0dGluZ3MgKi8KKwlzb2Z0X21pbl9sZXZl
bCA9CisJCXZlZ2EyMF9maW5kX2xvd2VzdF9kcG1fbGV2ZWwoJihkYXRhLT5kcG1fdGFibGUubWVt
X3RhYmxlKSk7CisJc29mdF9tYXhfbGV2ZWwgPQorCQl2ZWdhMjBfZmluZF9oaWdoZXN0X2RwbV9s
ZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5tZW1fdGFibGUpKTsKKworCWRhdGEtPmRwbV90YWJsZS5t
ZW1fdGFibGUuZHBtX3N0YXRlLnNvZnRfbWluX2xldmVsID0KKwkJZGF0YS0+ZHBtX3RhYmxlLm1l
bV90YWJsZS5kcG1fbGV2ZWxzW3NvZnRfbWluX2xldmVsXS52YWx1ZTsKKwlkYXRhLT5kcG1fdGFi
bGUubWVtX3RhYmxlLmRwbV9zdGF0ZS5zb2Z0X21heF9sZXZlbCA9CisJCWRhdGEtPmRwbV90YWJs
ZS5tZW1fdGFibGUuZHBtX2xldmVsc1tzb2Z0X21heF9sZXZlbF0udmFsdWU7CisKKwkvKiBzb2Nj
bGsgc29mdCBtaW4vbWF4IHNldHRpbmdzICovCisJc29mdF9taW5fbGV2ZWwgPQorCQl2ZWdhMjBf
ZmluZF9sb3dlc3RfZHBtX2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLnNvY190YWJsZSkpOworCXNv
ZnRfbWF4X2xldmVsID0KKwkJdmVnYTIwX2ZpbmRfaGlnaGVzdF9kcG1fbGV2ZWwoJihkYXRhLT5k
cG1fdGFibGUuc29jX3RhYmxlKSk7CisKKwlkYXRhLT5kcG1fdGFibGUuc29jX3RhYmxlLmRwbV9z
dGF0ZS5zb2Z0X21pbl9sZXZlbCA9CisJCWRhdGEtPmRwbV90YWJsZS5zb2NfdGFibGUuZHBtX2xl
dmVsc1tzb2Z0X21pbl9sZXZlbF0udmFsdWU7CisJZGF0YS0+ZHBtX3RhYmxlLnNvY190YWJsZS5k
cG1fc3RhdGUuc29mdF9tYXhfbGV2ZWwgPQorCQlkYXRhLT5kcG1fdGFibGUuc29jX3RhYmxlLmRw
bV9sZXZlbHNbc29mdF9tYXhfbGV2ZWxdLnZhbHVlOworCisJcmV0ID0gdmVnYTIwX3VwbG9hZF9k
cG1fbWluX2xldmVsKGh3bWdyLCBGRUFUVVJFX0RQTV9HRlhDTEtfTUFTSyB8CisJCQkJCQkgRkVB
VFVSRV9EUE1fVUNMS19NQVNLIHwKKwkJCQkJCSBGRUFUVVJFX0RQTV9TT0NDTEtfTUFTSyk7CiAJ
UFBfQVNTRVJUX1dJVEhfQ09ERSghcmV0LAogCQkJIkZhaWxlZCB0byB1cGxvYWQgRFBNIEJvb3R1
cCBMZXZlbHMhIiwKIAkJCXJldHVybiByZXQpOwogCi0JcmV0ID0gdmVnYTIwX3VwbG9hZF9kcG1f
bWF4X2xldmVsKGh3bWdyLCAweEZGRkZGRkZGKTsKKwlyZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9t
YXhfbGV2ZWwoaHdtZ3IsIEZFQVRVUkVfRFBNX0dGWENMS19NQVNLIHwKKwkJCQkJCSBGRUFUVVJF
X0RQTV9VQ0xLX01BU0sgfAorCQkJCQkJIEZFQVRVUkVfRFBNX1NPQ0NMS19NQVNLKTsKIAlQUF9B
U1NFUlRfV0lUSF9DT0RFKCFyZXQsCiAJCQkiRmFpbGVkIHRvIHVwbG9hZCBEUE0gTWF4IExldmVs
cyEiLAogCQkJcmV0dXJuIHJldCk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
