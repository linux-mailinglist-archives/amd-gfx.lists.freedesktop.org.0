Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E38FBBE
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 09:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A70C6EAEE;
	Fri, 16 Aug 2019 07:10:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680051.outbound.protection.outlook.com [40.107.68.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8879F6EAEE
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2aBjFR+0KOtMu8nJ0emfyzyAU7ROMbQvIUipTRW2RP0R8OjYcqyOt7LUXgR/rR3MWHeMVsh52N66L3hh4dDfojCPzsutB3ltghGCLCJOBpe+5XZ6qR8CaQRtQT8QWrg0WiiXbiPlxSYk/e5viQ6f04AaQmORTgrVl52rXJKJu+84JNS6o56QZD/VSrPbCblj1P10EwssVeBNoWVH7VZsogb4neYZrdjEnaASbX4qu9BepEuIrp4dY1f+X3V/Lo28d2XmlIKLKSgp5oeLdTy4WCeP1VMpTf8QFJVeu5gRxBEcwegj+Gx+ncYMZbBbdLIuImH6mqW+782QnYZ1gRcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjpG+RH7TIbNGxo383D5KMGdJSwbD7YEZXzz7JGITJ0=;
 b=gqx+nF3nNRYo4zhr9Uo4IE4wN/9vSDPK7CZUKo49kPbYlpXOIT3IZzMD//4C/CsFx5jgl4V2rl56UUEGpkkOTZnJ2DByDTnwBRn7jcaZHFYxYBNJBwUggs3W6t4nNqT9Lmnr+haU9w0a5lIE0jTH87MSy3fe16swJ2yttw+OzEee6BDMHdTnU/9drguPfTJTvVWu/WjxbPUHGGbIk+FK6pM4u7cy0iJG0NXIbN1+jv2b2C2ElRugw22cYF1/cLFwkhEY8MJ3/CeEIrBXBdECiVE9z/mACNHu+jJTIdlyrozJDHmVENENU2fS7IFZVFuh34GwY4kM97ofwdPh4Ci53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0024.namprd12.prod.outlook.com (2603:10b6:4:1::34) by
 BN7PR12MB2705.namprd12.prod.outlook.com (2603:10b6:408:25::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Fri, 16 Aug 2019 07:10:28 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM5PR12CA0024.outlook.office365.com
 (2603:10b6:4:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 07:10:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 07:10:28 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Fri, 16 Aug 2019 02:10:26 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: correct return type of
 amdgpu_ras_query_error_count
Date: Fri, 16 Aug 2019 15:10:13 +0800
Message-ID: <20190816071013.21034-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(428003)(199004)(189003)(126002)(110136005)(7696005)(81156014)(51416003)(486006)(2616005)(44832011)(16586007)(36756003)(478600001)(316002)(14444005)(47776003)(426003)(476003)(81166006)(6636002)(336012)(4326008)(50226002)(53416004)(8936002)(26005)(70206006)(70586007)(1076003)(53936002)(5660300002)(186003)(86362001)(48376002)(2201001)(6666004)(50466002)(305945005)(8676002)(356004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cfff662-e1b6-4f1e-b67b-08d72218d162
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2705BEA0D430932B27AD5169F1AF0@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: L3Q8fzeG2KIjwDSoMPDTW6Q6USTzhSAZ07DOrMYMon2o0U8SqK+uGamNPalIwJd3icZ6hP07qgjA/28ntw/N/bx7N1i9sE9nn+WLG/pTTQnE9KMWf9dLaytBlIbudZtaJbrpfhVG5AoAX3I6A7s0o7+860cfCiOROI+ULUDQgfzQcUTluVhoSyJksZzy7naJKpgD1S4NnxD4aEnDZOK43OwbNvcQ9DL6SX1sM3EMq8wypIvHHRj+vHRttTgQdSbYUgsvVRD0wp7ApIfB/a0cELFh6dK1EUi+xaFDAy0AqoDkreJaKrjGqs6yYKEuLBHSrLC6btI3A6Bkt12yB/u296IF8V3qrGO0W2yPFA+mE9bIcpWBZdtiWHevWpGeeVUCDYeAYxRAR4A2dHKON06V1YEsCIHvUdM3lz/LOmdX6UE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 07:10:28.1719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfff662-e1b6-4f1e-b67b-08d72218d162
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjpG+RH7TIbNGxo383D5KMGdJSwbD7YEZXzz7JGITJ0=;
 b=IxLqxqAzggIFm2FQ0FnB6Qh2/DBOTltpNEszl8peeeSbrbH+ywnuIlnVsqPDeF0xE/+2xAg2BTMVjtmMMcjcM2FVVN0YmST6+dJdIkCQnOt+m3EBewrL6FkBvrnp0C1wSYEJA5A4Z0HBZ2dw/6Lf6nB2Xu8uPRS1wFE9MbsZ0iI=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHJldHVybiB2YWx1ZSB0eXBlIG9mIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQgc2hv
dWxkIGJlCnVuc2lnbmVkIGxvbmcsIG5vdCBpbnQuCgpDaGFuZ2UtSWQ6IEkwMTE0MDZkODFiYWQ2
OWE2NTQzM2I2Mzk2MGUxNjkxYzQ5NTliYmM1ClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxn
dWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyB8IDYgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggNTBjMTNiMDJk
MjM0Li5kZjRiOWFlMzljNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMKQEAgLTY4Niw3ICs2ODYsNyBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9jdXJlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogfQogCiAvKiBnZXQgdGhlIHRvdGFsIGVycm9yIGNvdW50cyBv
biBhbGwgSVBzICovCi1pbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKK3Vuc2lnbmVkIGxvbmcgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9j
b3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJYm9vbCBpc19jZSkKIHsKIAlzdHJ1
Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKQEAgLTY5
NCw3ICs2OTQsNyBAQCBpbnQgYW1kZ3B1X3Jhc19xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAlzdHJ1Y3QgcmFzX2Vycl9kYXRhIGRhdGEgPSB7MCwgMH07CiAK
IAlpZiAoIWNvbikKLQkJcmV0dXJuIC1FSU5WQUw7CisJCXJldHVybiAwOwogCiAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeShvYmosICZjb24tPmhlYWQsIG5vZGUpIHsKIAkJc3RydWN0IHJhc19xdWVyeV9p
ZiBpbmZvID0gewpAQCAtNzAyLDcgKzcwMiw3IEBAIGludCBhbWRncHVfcmFzX3F1ZXJ5X2Vycm9y
X2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQl9OwogCiAJCWlmIChhbWRncHVf
cmFzX2Vycm9yX3F1ZXJ5KGFkZXYsICZpbmZvKSkKLQkJCXJldHVybiAtRUlOVkFMOworCQkJcmV0
dXJuIDA7CiAKIAkJZGF0YS5jZV9jb3VudCArPSBpbmZvLmNlX2NvdW50OwogCQlkYXRhLnVlX2Nv
dW50ICs9IGluZm8udWVfY291bnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmgKaW5kZXggMjc2NWYyZGJiMWU2Li4wMmE1MWUzZGZhMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmgKQEAgLTQ4NCw3ICs0ODQsNyBAQCBpbnQgYW1kZ3B1X3Jhc19y
ZXF1ZXN0X3Jlc2V0X29uX2Jvb3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiB2b2lkIGFt
ZGdwdV9yYXNfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIHZvaWQgYW1kZ3B1
X3Jhc19zdXNwZW5kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAotaW50IGFtZGdwdV9y
YXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCit1bnNpZ25l
ZCBsb25nIGFtZGdwdV9yYXNfcXVlcnlfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJCWJvb2wgaXNfY2UpOwogCiAvKiBlcnJvciBoYW5kbGluZyBmdW5jdGlvbnMgKi8K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
