Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACD9A9891
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 04:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0E89CCB;
	Thu,  5 Sep 2019 02:50:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730041.outbound.protection.outlook.com [40.107.73.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4108289CC4
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 02:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVP0RoVmFcHGpEsfgvZaYUAqZC0GzUVsjOk69d1+50IQcFrl2Po9hySDIt4DOeLyQTWdk1utr44hCPC/Lq8KoxH/tuBMmGMNurMehaa4lw31x25vqX1vHEp4a7sljI+fY1TXNTALELwcMpRyoIx2H4cIlQy/4zOC/RTWy1Nr0Q0inkSYowPnciIyC/sFqbZgRMz/4eH6LlrhIdFmRbP1Eg5C/IPQmnAzNhMPvVHByElKF8REbuzpiUDn77yOw/DKFzB8/mLJa2RBGfjxH7a/lb67zOaVGkWWsROwGSLX7B9PDEv23HCox2cVsy2Yf/tppBhAVNB3YUQ4oZ8mhDNfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zo7+5kSR2Og2fuv+B/jN+9K8yrkZhyG/lejr24za44=;
 b=gjR71OOJM4h6p+jAfhQYPeE/SZ0wF7Ukp1MUWOtPOVrlzgKItAk45ootKo1fieR/CnpX8PDwWRTY/ZnFNKsGO1jM7PgmnYxxE65IG7WI6B1GryBWZRhBZS9LDpetCRJt/3FQqZBJdPot4HLP21+82L02yEnAjm/D060J5nU8t3xMxDqh48eNlM20rVEeYLoQ7OKaYQucHXUtwRpciGUEtNNxTrU4ixKSkKldA3aSK69NR6YIeWM6ZP3MQdUxb/pjnt0n0Tz7SNiwBGGaxSR8wO3ewKruP0fgfsqgYhPB4Rkt8BQLeu+tYFa+OnY4JlOx0y9I0mk31MTlZtd4DLEytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0062.namprd12.prod.outlook.com (2603:10b6:802:20::33)
 by DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 5 Sep
 2019 02:50:35 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by SN1PR12CA0062.outlook.office365.com
 (2603:10b6:802:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.17 via Frontend
 Transport; Thu, 5 Sep 2019 02:50:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Thu, 5 Sep 2019 02:50:35 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 4 Sep 2019 21:50:32 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: Remove clock gating restore.
Date: Wed, 4 Sep 2019 22:50:17 -0400
Message-ID: <1567651818-7911-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(428003)(199004)(189003)(16586007)(8936002)(26005)(44832011)(186003)(51416003)(7696005)(2351001)(76176011)(126002)(476003)(426003)(2616005)(446003)(11346002)(486006)(86362001)(336012)(6916009)(316002)(53416004)(50226002)(53936002)(4326008)(305945005)(478600001)(2906002)(70586007)(70206006)(50466002)(5660300002)(48376002)(14444005)(6666004)(356004)(36756003)(8676002)(47776003)(54906003)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2491; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35f3e3cb-99ed-411c-c169-08d731abd387
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB2491; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2491B40598ADBE1B92620A3FEABB0@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2R9wglXewxSFHDuZ6QKCRHbtzaNgTJwBcIGs0BIiLWSyFa0eN5Cpb0csy2ZEsYBC67UOvoRjgFQ6kdYkuXWap80FUxOWtG4XW56JAHOY6yp7WbbhNvn5FltPbhOAcQkJQ2WIGGKhj+5p4RaIpdqToxQ+Eb+ILpi7l/+KQ+wvxWILL5GqITix5AFSjDGxIrZFbpksTuHq06pj6UDDq+O+2rMpzMoz6GtZJ6w+HnmvK7WVUV+UpneodYZ3G1YbFjJxLzbOtvKP3XVnKuj/33P/M1Esq0/Dkov/NX3tXoFkCVVDdrBaTUSwcipmP+mwxhfzcRhj8rGPy7GIenhtmM23e3krQ3vaONKP0MBJWSsVVYcWtRd+PY7A4jHwyg2ZDuWXOw3TjTnzhFORHVMNwz5e4rdJBRGQL9GuAc524moa86o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 02:50:35.2611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f3e3cb-99ed-411c-c169-08d731abd387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zo7+5kSR2Og2fuv+B/jN+9K8yrkZhyG/lejr24za44=;
 b=cUh2OBu1h2A1JsZL+uzxO5O3t6I3lUyKL0/sQZVYDPZlU9+vrix3Bhkid97kLnuFUIb0ByUyOOJE73afoODmTvYvqVB+6evqMkTGIDVnT1JiCqtGuMGfveg3OcqpJtxOQU+2B1iYDErIpzxSg5NUhanerW0YpyaMgH4r6gu5iRE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Cristian.Saceleanu@amd.com, Tao.Zhou1@amd.com, alexdeucher@gmail.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVzdG9yaW5nIGNsb2NrIGdhdGluZyBicmVhayBTTVUgb3BlYXJ0aW9uIGFmdGVyd2FyZHMsIGF2
b2lkCnRoaXMgdW50aWwgdGhpcyBmdXJ0aGVyIGludmlzdGlnYXRlZCB3aXRoIFNNVS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYyB8IDEwICsrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMKaW5kZXggN2QwZDRjNS4u
OTUyNjZmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8w
X2kyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYwpA
QCAtNDkxLDcgKzQ5MSwxNSBAQCBzdGF0aWMgdm9pZCBzbXVfdjExXzBfaTJjX2Zpbmkoc3RydWN0
IGkyY19hZGFwdGVyICpjb250cm9sKQogCX0KIAogCS8qIFJlc3RvcmUgY2xvY2sgZ2F0aW5nICov
Ci0Jc211X3YxMV8wX2kyY19zZXRfY2xvY2tfZ2F0aW5nKGNvbnRyb2wsIHRydWUpOworCisJLyoK
KwkgKlRPRE8gUmVlbmFibGluZyBjbG9jayBnYXRpbmcgc2VlbXMgdG8gYnJlYWsgc3Vic2VxdWVu
dCBTTVUgb3BlcmF0aW9uCisJICpvbiB0aGUgSTJDIGJ1cy4gTXkgZ3Vlc3MgaXMgdGhhdCBTTVUg
ZG9lc24ndCBkaXNhYmxlIGNsb2NrIGdhdGluZyBsaWtlCisJICp3ZSBkbyBoZXJlIGJlZm9yZSB3
b3JraW5nIHdpdGggdGhlIGJ1cy4gU28gZm9yIG5vdyBqdXN0IGRvbid0IHJlc3RvcmUKKwkgKml0
IGJ1dCBsYXRlciB3b3JrIHdpdGggU01VIHRvIHNlZSBpZiB0aGV5IGhhdmUgdGhpcyBpc3N1ZSBh
bmQgY2FuCisJICp1cGRhdGUgdGhlaXIgY29kZSBhcHByb3ByaWF0ZWx5CisJICovCisJLyogc211
X3YxMV8wX2kyY19zZXRfY2xvY2tfZ2F0aW5nKGNvbnRyb2wsIHRydWUpOyAqLwogCiB9CiAKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
