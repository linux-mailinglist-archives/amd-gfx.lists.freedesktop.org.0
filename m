Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38EC908A
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447836E905;
	Wed,  2 Oct 2019 18:16:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32D6E196
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJTDDFZKRJQUBpZiYj+MZv3bzOXVsk/CCrbI4EXaZz5rz3KlYmoG2k3Cr7gKdMAMwc3HKWUQC2Nys2CDN+g50UawRHFbzE4uyfoIcRHaVM8UlX2YYZFMCkXIfjacUgDDtDTD+3SLR9nXAY9iKeZFuzmj3o2gW2u1IzBT0t7AGlBAGfgu3ij2uzcV/eOMbP3JOe2vW8Cne+ErRr/YtoiNBzNZ1xUzHEm9CEqgHGqfcBAESOtYuAB1nvYzvUGXLSBTjeAWXGa6zBzLvrTwfnINLpyUnYfQ9Rg3evHEanjfBc5daKBmgeBqN8KP56eNiMi9hjknCoYpKOs9Jyo3+YU24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ57Zd4Z33IVert/OEkP6UKh4cLoAVo3QsND9jnVn54=;
 b=XO3/06ci7kRp9hhoDn+aTVFv0g6FUscH2L+HoZYUj894x7D1xUw4i7lX6f/MmUjyvcvBbMoxGVqXCJzUrJtdrw1Uq+CvYyjFFn41oZ7aK4r1QFwFZshWSO5LaBK5sCqLk2VSW/fhHUQuyuSTUryGiN5y6hmx/JFy4sA62N25FpC5KP97oiKJDjghn7Ov6Dwpo6nETmfRj63j0+QHsb0gSdZiCY173UcnHr1ICf9JQYQNRz3EKpelaYu6S96+ZYZAWiCNOPux/5gqRfWnk9acx07Jml+ARMUq7zQDbw3D7XP6zrseVL1vLex4N0zMCTUuNLDB+qwl6AM6QlPEpaKx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1cc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:43 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:43 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:41 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/38] drm/amd/display: Add output bitrate to DML calculations
Date: Wed, 2 Oct 2019 14:16:12 -0400
Message-ID: <20191002181633.22805-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(428003)(199004)(189003)(76176011)(51416003)(7696005)(316002)(4326008)(16586007)(26005)(2351001)(2906002)(186003)(53416004)(426003)(486006)(50466002)(11346002)(48376002)(6916009)(50226002)(8936002)(305945005)(478600001)(81156014)(8676002)(81166006)(126002)(2616005)(446003)(476003)(336012)(70586007)(70206006)(356004)(86362001)(6666004)(1076003)(47776003)(5660300002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3962; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11094592-c957-4fd4-c96d-08d74764ad9c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3962:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3962D0EEB252851AAC7670FAF99C0@DM6PR12MB3962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGvUKK1puYQ3/HKZCAR55Mezii/G/f/9Kb7bY4/XppVLs3+LD+IBryEawJt2qom3Qtmy31/Im9xTbA6vFHvhzXvIa1HAUD+s6JATlkOIS3j7jMmEgCa0KM2xvK0CSVEDNg5qNAW+qa8sQXfnEp3+EJ3IglQMxF/3B70plhg6pbby4N7ZHROOGdDYs5x411fan2bzTJ9+529O6wQ8U/U0KsaGJsGb3WFRLD7UxrpE99swgGsidv3V12OArpYhsOjCq5e0f52v3MBbsH6PyFAsPQZ9lQoBK6qBEeDCjdcFRfI4Exl//kfNf35QgwBpvKMx2ebeG4myhMrdT+2x6MmwsxuwFGVi+COWBuGywvzuXf2/8kIImrAgXpLec+XrDy4EJ9EE4Ij9FmvN77D3/tcHx8IJFdPAh8osbEcW6ApJNpc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:43.0279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11094592-c957-4fd4-c96d-08d74764ad9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ57Zd4Z33IVert/OEkP6UKh4cLoAVo3QsND9jnVn54=;
 b=NYEuidPUvhVu0e9XmpFpuRmQXdT0vXriJmCQQc+9p1Q4K99cIeGWgAT/1Y8soKX9Uh3ICk4tbAvTlREFXJmC82ZL5Lnbl+HytG5XZirDvG95WPXkE7UhYChLkRtCmP4aisWC+BiwoXmhPPKZ4NG81VKb5YwxI/fPT8mUVZVYnFU=
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
Cc: Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KT3V0cHV0
IGJpdHJhdGUgd2FzIG1pc3Rha2VubHkgbGVmdCBvdXQsIGNhdXNpbmcgY29ycnVwdGlvbiBvbiBz
b21lCkRTQyBsb3cgcmVzb2x1dGlvbiAoc3VjaCBhcyA4MDB4NjAwKSBtb2Rlcy4KCkNoYW5nZS1J
ZDogSTQ3OTYyNjAzNzczZDEwNmE4MTBhMGIxYjgyOWRiZDQxNjhhNTNlNDcKU2lnbmVkLW9mZi1i
eTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15
dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJo
YXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jICAgICB8IDUgKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVj
dHMuaCB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9t
b2RlX3ZiYS5jICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggMTM0ODRmZmY3YWQ2Li4zYmM3ZjlhZGY4Y2Eg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jCkBAIC0xODkzLDcgKzE4OTMsNyBAQCBpbnQgZGNuMjBfcG9wdWxhdGVfZG1s
X3BpcGVzX2Zyb21fY29udGV4dCgKIAkJCWJyZWFrOwogCQljYXNlIFBJWEVMX0VOQ09ESU5HX1lD
QkNSNDIwOgogCQkJcGlwZXNbcGlwZV9jbnRdLmRvdXQub3V0cHV0X2Zvcm1hdCA9IGRtXzQyMDsK
LQkJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9icHAgPSAob3V0cHV0X2JwYyAqIDMpIC8g
MjsKKwkJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9icHAgPSAob3V0cHV0X2JwYyAqIDMu
MCkgLyAyOwogCQkJYnJlYWs7CiAJCWNhc2UgUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjI6CiAJCQlp
ZiAodHJ1ZSkgLyogdG9kbyAqLwpAQCAtMTkwNyw2ICsxOTA3LDkgQEAgaW50IGRjbjIwX3BvcHVs
YXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQoCiAJCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRw
dXRfYnBwID0gb3V0cHV0X2JwYyAqIDM7CiAJCX0KIAorCQlpZiAocmVzX2N0eC0+cGlwZV9jdHhb
aV0uc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDKQorCQkJcGlwZXNbcGlwZV9jbnRdLmRvdXQub3V0
cHV0X2JwcCA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nLmRzY19jZmcuYml0
c19wZXJfcGl4ZWwgLyAxNi4wOworCiAJCS8qIHRvZG86IGRlZmF1bHQgbWF4IGZvciBub3csIHVu
dGlsIHRoZXJlIGlzIGxvZ2ljIHJlZmxlY3RpbmcgdGhpcyBpbiBkYyovCiAJCXBpcGVzW3BpcGVf
Y250XS5kb3V0Lm91dHB1dF9icGMgPSAxMjsKIAkJLyoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaAppbmRleCBm
NGMxZWY5MDQ2YmYuLjgzZjg0Y2RkNDA1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfc3RydWN0cy5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaApAQCAtMjY5LDcg
KzI2OSw3IEBAIHN0cnVjdCB3cml0ZWJhY2tfc3QgewogCiBzdHJ1Y3QgX3Zjc19kcGlfZGlzcGxh
eV9vdXRwdXRfcGFyYW1zX3N0IHsKIAlpbnQgZHBfbGFuZXM7Ci0JaW50IG91dHB1dF9icHA7CisJ
ZG91YmxlIG91dHB1dF9icHA7CiAJaW50IGRzY19lbmFibGU7CiAJaW50IHdiX2VuYWJsZTsKIAlp
bnQgbnVtX2FjdGl2ZV93YjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmMKaW5kZXggNjVjZjRlZGRkYWZmLi4zNjJkYzZlYTk4
YWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxh
eV9tb2RlX3ZiYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlz
cGxheV9tb2RlX3ZiYS5jCkBAIC00MzQsNiArNDM0LDggQEAgc3RhdGljIHZvaWQgZmV0Y2hfcGlw
ZV9wYXJhbXMoc3RydWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGliKQogCQkJCWRzdC0+b2Rt
X2NvbWJpbmU7CiAJCW1vZGVfbGliLT52YmEuT3V0cHV0Rm9ybWF0W21vZGVfbGliLT52YmEuTnVt
YmVyT2ZBY3RpdmVQbGFuZXNdID0KIAkJCQkoZW51bSBvdXRwdXRfZm9ybWF0X2NsYXNzKSAoZG91
dC0+b3V0cHV0X2Zvcm1hdCk7CisJCW1vZGVfbGliLT52YmEuT3V0cHV0QnBwW21vZGVfbGliLT52
YmEuTnVtYmVyT2ZBY3RpdmVQbGFuZXNdID0KKwkJCQlkb3V0LT5vdXRwdXRfYnBwOwogCQltb2Rl
X2xpYi0+dmJhLk91dHB1dFttb2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzXSA9CiAJ
CQkJKGVudW0gb3V0cHV0X2VuY29kZXJfY2xhc3MpIChkb3V0LT5vdXRwdXRfdHlwZSk7CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
