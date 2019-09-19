Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30538B747F
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067B6F449;
	Thu, 19 Sep 2019 07:58:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFE26F449
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfRZW0DN7ltoz8n4Eb6d8u9JOpw6+pR0N8SuziL5qeMNqjkdeqg5eO2LnUHmuaNn9Ya/ekgfW5BtE9ugRuq/yTkgt+pwyirWjHGAz1wRzkNN5WuudDl8Ft1t5choxpOpOWKeQgOfx/yyTOkgcg79uPZBwFdIBk/6kw+CDhDQsCbTCZ37F426EvO2fyvL75NzArQ5jYOSplZgg3UvH1yB6qtu1087gOjIA3oOLHHRhxI09aEH8PzqitJkM/as3DKAvFlgdaE7AAI+ZEnbzeAPjg0DqvJZvpMYu9ERYKngbEHXatEgvYBK+RPoLEh2W629Nut1k7aEjEjk3ZsY+KX5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3C5UlvZ/A/ih4AopZ1AGLTXKYfrADk1bARhItBb3Pw=;
 b=Wq3mSsroTNHd0bfyPSg5C2cEeFtYhlHrBB6eQ+YBxXQNY5M2JN/B/r2/5W4J+N9MLddOUTEwvEaFFVmu6WJKemPuErYS72eyw+4cDLrfOEGptA7n9ycjyo1zEOsUcpjgcA5BHGTflsj3+fRYEKnuXAkA+X725XuJpW7FP6SG5mXFoc7sK5aiyyQ9qOaXtF0AzDt7LeDqNiaowsHoG+DiSDSn1vL7tCifvQYCWCjVyWWiqeoNl4j7xiBu793Me7P4SMMZzj4iARRVmWThTjSSOx3sj5F9Qxw7yZ4/7Le3YGYym5LUeeQqh821D4cTbKk6fcBy84AtfMWb3uchb0oerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0044.namprd12.prod.outlook.com (2603:10b6:0:56::12) by
 MN2PR12MB3038.namprd12.prod.outlook.com (2603:10b6:208:cb::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:58:50 +0000
Received: from CO1NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0044.outlook.office365.com
 (2603:10b6:0:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 07:58:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT014.mail.protection.outlook.com (10.152.80.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 07:58:49 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 02:58:48 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Thu, 19 Sep 2019 15:58:42 +0800
Message-ID: <1568879922-19715-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568876935-18731-2-git-send-email-zhexi.zhang@amd.com>
References: <1568876935-18731-2-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(428003)(189003)(199004)(6916009)(11346002)(53416004)(47776003)(5660300002)(476003)(2351001)(305945005)(26005)(356004)(6666004)(4326008)(8936002)(8676002)(426003)(446003)(336012)(2616005)(186003)(16586007)(316002)(81156014)(81166006)(7696005)(478600001)(70586007)(51416003)(50466002)(2906002)(70206006)(486006)(14444005)(86362001)(76176011)(36756003)(48376002)(50226002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3038; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e951002-1979-44cd-0eff-08d73cd734e2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MN2PR12MB3038; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3038:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3038C58902AC1754B87508B2EF890@MN2PR12MB3038.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JhmYSLRbVg3b0JqT2LAe/mrYefu+4vjz12pj1sj8wMAEJ0E9d4DqIl84LjOQboGOBYO2fkrkKpYtz9ap1D1IXWWp81mVppskgr73RMEMuGlD8+Qy4Okx13bPkxrHRWuMu3o19T2iVQlnbpOiHbV2rKJcOGS5iRIc5FSH/UX+Dv5ysp88yeERuzU5MUCecNCs640RXPeZV0tCGQimQRAAtXwKctcHrv4SDzqHQ0zVgS3EN5MTmXDs/46dyqYdlJsUBFjomAydVP+/3GcQSokYbTHerxTsnd037zl+uVG+zEKIwAZfWVOfqSkblZ9jw/SpIK/AbvVwOV25g6FBgg8MWIxUsnyaOe/XwI3zDQf9I8ObyRhsfT4uecUuRVP87slNyk+KJpaOjGNMNvjWfv/xTj/tesFOuT2tAAb55NHNtQA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 07:58:49.6424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e951002-1979-44cd-0eff-08d73cd734e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3038
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3C5UlvZ/A/ih4AopZ1AGLTXKYfrADk1bARhItBb3Pw=;
 b=unIeuN6VccgFTzwW/D5b29B3kAOkSm8f11qKFQX2Up27XtjNn2r31mfYS/vkbhiWWOq7tLsMyEQzXx0BvyoT9+kTs9VwhzlA/DDXPm2wDQ7FpuVi8tAibi2MSfx5HQPbWtHLJbtC4/v/wkrXuNY9df3ZUnLXbogRUz7VVsUlGSY=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBzaWduYWwsIGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0
IGhhcmR3YXJlIGhhbmcKYmVjYXVzZSBpdHMgdGltZW91dCB2YWx1ZSBpcyBzZXQgdG8gYmUgaW5m
aW5pdGUgYnkgZGVmYXVsdC4KCkluIFNSLUlPViBhbmQgcGFzc3Rocm91Z2ggbW9kZSwgaWYgdXNl
ciBkb2VzIG5vdCBkZWNsYXJlIGN1c3RvbWUgdGltZW91dAp2YWx1ZSBmb3IgY29tcHV0ZSByaW5n
LCB0aGVuIHVzZSBnZnggcmluZyB0aW1lb3V0IHZhbHVlIGFzIGRlZmF1bHQuIFNvCnRoYXQgd2hl
biB0aGVyZSBpcyBhIHR1cmUgaGFyZHdhcmUgaGFuZywgY29tcHV0ZSByaW5nIGNhbiBkZXRlY3Qg
aXQuCgpDaGFuZ2UtSWQ6IEk3OTRlYzA4NjhjNmMwYWFkNDA3NzQ5NDU3MjYwZWNmZWUwNjE3YzEw
ClNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4aS56aGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIHwgIDUgKy0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICAgIHwgMTAgKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKaW5kZXggY2JjYWE3Yy4uOTYzYjZkMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKQEAgLTQ2OCwxMCAr
NDY4LDcgQEAgaW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfaW5pdF9yaW5nKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywKIAkJCSAqIEZvciBzcmlvdiBjYXNlLCBhbHdheXMgdXNlIHRoZSB0aW1lb3V0
CiAJCQkgKiBhcyBnZnggcmluZwogCQkJICovCi0JCQlpZiAoIWFtZGdwdV9zcmlvdl92ZihyaW5n
LT5hZGV2KSkKLQkJCQl0aW1lb3V0ID0gYWRldi0+Y29tcHV0ZV90aW1lb3V0OwotCQkJZWxzZQot
CQkJCXRpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsKKwkJCXRpbWVvdXQgPSBhZGV2LT5jb21w
dXRlX3RpbWVvdXQ7CiAJCQlicmVhazsKIAkJY2FzZSBBTURHUFVfUklOR19UWVBFX1NETUE6CiAJ
CQl0aW1lb3V0ID0gYWRldi0+c2RtYV90aW1lb3V0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKaW5kZXggN2M3ZTlmNS4uNmNkNTU0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
CkBAIC02ODcsNiArNjg3LDE2IEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCWFkZXYtPnJldl9pZCA9IHNvYzE1X2dldF9yZXZfaWQoYWRldik7
CiAJYWRldi0+bmJpby5mdW5jcy0+ZGV0ZWN0X2h3X3ZpcnQoYWRldik7CiAKKwkvKgorCSAqIElm
IHJ1bm5pbmcgdW5kZXIgU1ItSU9WIG9yIHBhc3N0aHJvdWdoIG1vZGUgYW5kIHVzZXIgZGlkIG5v
dCBzZXQKKwkgKiBjdXN0b20gdmFsdWUgZm9yIGNvbXB1dGUgcmluZyB0aW1lb3V0LCBzZXQgdGlt
ZW91dCB0byBiZSB0aGUgc2FtZQorCSAqIGFzIGdmeCByaW5nIHRpbWVvdXQgdG8gYXZvaWQgY29t
cHV0ZSByaW5nIGNhbm5vdCBkZXRlY3QgYW4gdHJ1ZQorCSAqIGhhbmcuCisJICovCisJaWYgKChh
bWRncHVfc3Jpb3ZfdmYoYWRldikgfHwgYW1kZ3B1X3Bhc3N0aHJvdWdoKGFkZXYpKSAmJgorCQko
YWRldi0+Y29tcHV0ZV90aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSkKKwkJYWRldi0+
Y29tcHV0ZV90aW1lb3V0ID0gYWRldi0+Z2Z4X3RpbWVvdXQ7CisKIAlpZiAoYW1kZ3B1X3NyaW92
X3ZmKGFkZXYpKQogCQlhZGV2LT52aXJ0Lm9wcyA9ICZ4Z3B1X2FpX3ZpcnRfb3BzOwogCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
