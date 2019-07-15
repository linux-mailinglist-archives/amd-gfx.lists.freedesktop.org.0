Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED969DCF
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BA389CE3;
	Mon, 15 Jul 2019 21:21:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E2089CB9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:52 +0000 (UTC)
Received: from MN2PR12CA0029.namprd12.prod.outlook.com (2603:10b6:208:a8::42)
 by CH2PR12MB3927.namprd12.prod.outlook.com (2603:10b6:610:2d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Mon, 15 Jul
 2019 21:21:51 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MN2PR12CA0029.outlook.office365.com
 (2603:10b6:208:a8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:32 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 58/87] drm/amd/display: Cache the use_pitch_c conditional
Date: Mon, 15 Jul 2019 17:20:20 -0400
Message-ID: <20190715212049.4584-59-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(54906003)(2870700001)(316002)(68736007)(1076003)(6666004)(356004)(86362001)(4326008)(49486002)(48376002)(478600001)(5660300002)(36756003)(50466002)(26005)(6916009)(70586007)(51416003)(14444005)(186003)(2616005)(126002)(8936002)(486006)(81166006)(11346002)(81156014)(2906002)(426003)(8676002)(76176011)(446003)(476003)(50226002)(336012)(2351001)(47776003)(2876002)(305945005)(53936002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3927; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dec6aa3-2915-446f-1dea-08d7096a735b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3927; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3927C3B7EBFB930DBAD6121782CF0@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wpkqLlTUT3Cjv2VPlCo71MtNJ06tLN3MrWMJnb1s3WD6LOPMD2VNLFGIENDfWL26sMYBskMIr6Kz5JFjrRFGCLv7bRet7AHHHU+tfnm+kqklLuo30VMy76st5Fa7env7q1yYmFcjeFHLWNP/BZCWZM0UfAgfKm6fPifalr1HMl9UolPV33eLIBmtu1MqLgjhwGBMDpkOY3Fwdp9qtqN22DC6yGKtLHRbAvdANfQZ/MPuVl+C/SDsytOLcYtA87+lAeChzhJcTcbdRA0SrP/GdROJa8Ne6S6I9r359xg9Vz4//LBR7D8RnT6Orm9zvWFrjMLgMpxNNXhFppemMVIBVa0MNPdvnSIyf3iWASBCoS7GwHlwRj6TlXO5NkC5Vs6emrsF0Kus6rcLeVGM0umrIbZHhlca9hct5TAIxIvNhVc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:50.0917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dec6aa3-2915-446f-1dea-08d7096a735b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1Mye5MF7lAH766aex8swuaOJQ6XbfyLIh2JghR/BNQ=;
 b=kKOPygv0AJOIf39OwoXiJdangOzVoMaflEtmiyzDhHuY6ERQCWpjkYFZQ182OX214rOPuyxFHAipJBeiIinzX/NNSPzl0UnWpzP97FV12zszKmEw5ZlMcMIfbmetZI6dmhoBUvYsLTz8p+0r2Bv9SVRofXCoQ/CWEVQjFlcntPU=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Eric Bernstein <eric.bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKRm9yIGNsYXJpdHks
IHNhdmUgdGhlIHVzZV9waXRjaF9jIGxvZ2ljIHRvIGEgYm9vbAoKU2lnbmVkLW9mZi1ieTogSWx5
YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBCZXJu
c3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHVicC5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHVicC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2h1YnAuYwppbmRleCAwMmU4YzBjNmEyMzMuLmExNjdmODY3Y2I3MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVicC5jCkBA
IC00MDIsMTEgKzQwMiwxNCBAQCB2b2lkIGh1YnAyX3Byb2dyYW1fc2l6ZSgKIHsKIAlzdHJ1Y3Qg
ZGNuMjBfaHVicCAqaHVicDIgPSBUT19EQ04yMF9IVUJQKGh1YnApOwogCXVpbnQzMl90IHBpdGNo
LCBtZXRhX3BpdGNoLCBwaXRjaF9jLCBtZXRhX3BpdGNoX2M7CisJYm9vbCB1c2VfcGl0Y2hfYyA9
IGZhbHNlOwogCiAJLyogUHJvZ3JhbSBkYXRhIGFuZCBtZXRhIHN1cmZhY2UgcGl0Y2ggKGNhbGN1
bGF0aW9uIGZyb20gYWRkcmxpYikKIAkgKiA0NDQgb3IgNDIwIGx1bWEKIAkgKi8KLQlpZiAoZm9y
bWF0ID49IFNVUkZBQ0VfUElYRUxfRk9STUFUX1ZJREVPX0JFR0lOICYmIGZvcm1hdCA8IFNVUkZB
Q0VfUElYRUxfRk9STUFUX1NVQlNBTVBMRV9FTkQpIHsKKwl1c2VfcGl0Y2hfYyA9IGZvcm1hdCA+
PSBTVVJGQUNFX1BJWEVMX0ZPUk1BVF9WSURFT19CRUdJTgorCQkmJiBmb3JtYXQgPCBTVVJGQUNF
X1BJWEVMX0ZPUk1BVF9TVUJTQU1QTEVfRU5EOworCWlmICh1c2VfcGl0Y2hfYykgewogCQlBU1NF
UlQocGxhbmVfc2l6ZS0+dmlkZW8uY2hyb21hX3BpdGNoICE9IDApOwogCQkvKiBDaHJvbWEgcGl0
Y2ggemVybyBjYW4gY2F1c2Ugc3lzdGVtIGhhbmchICovCiAKQEAgLTQyOSw3ICs0MzIsOCBAQCB2
b2lkIGh1YnAyX3Byb2dyYW1fc2l6ZSgKIAlSRUdfVVBEQVRFXzIoRENTVVJGX1NVUkZBQ0VfUElU
Q0gsCiAJCQlQSVRDSCwgcGl0Y2gsIE1FVEFfUElUQ0gsIG1ldGFfcGl0Y2gpOwogCi0JaWYgKGZv
cm1hdCA+PSBTVVJGQUNFX1BJWEVMX0ZPUk1BVF9WSURFT19CRUdJTikKKwl1c2VfcGl0Y2hfYyA9
IGZvcm1hdCA+PSBTVVJGQUNFX1BJWEVMX0ZPUk1BVF9WSURFT19CRUdJTjsKKwlpZiAodXNlX3Bp
dGNoX2MpCiAJCVJFR19VUERBVEVfMihEQ1NVUkZfU1VSRkFDRV9QSVRDSF9DLAogCQkJUElUQ0hf
QywgcGl0Y2hfYywgTUVUQV9QSVRDSF9DLCBtZXRhX3BpdGNoX2MpOwogfQotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
