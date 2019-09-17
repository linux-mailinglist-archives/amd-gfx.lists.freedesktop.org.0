Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482CFB4787
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033E6E153;
	Tue, 17 Sep 2019 06:32:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A626E153
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL6K27MtNbs3KMcymja2jWo12kvI8l5AqZJBamImni6eHYTtpno1E60m/UL8s6J9ds++btN5x/kKCkmwTwRyxtwS6GPtBLUl6uR0+5Ejbec4MeDxttZv/cSLn6L+3+q1R3eMvjSLOc+rZ0vyi0HDHQiLTfxytMu9CWwQnvOqjBCqYRF3HEgc53WlXkdNG3MD0lh+qofrCAF+dohzhOVR2nGEyQhV50Kc9hvMtzUJyCeOlQFnlioJbVRaFMYafZuVOldaAjbwd8QgbUgKePSi0/mkDhd3IFulwmIbaLKUx2gOAyrwdeujFlbKylkq6yVqJYUrXwd7Ot8EQSSvrVQ73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6enBCz0AOcBuUXTJ66XKUUk1FJo5rQul0wZq1KVkF98=;
 b=BlFOs4oOyFX30FskyNoF0we0kxVu4Gb4sbv/Lo+cE+hC1vSMumZP8RVOeeJqelKhDI8PvHLkURaO8O2JctzXrQxuxVbAVuxj39FL4SEetTsr1gndoBHlHdcET/fdHYsevdc6+xGN0P4HorknBfwycIbXztJBGZ00aOW/+eqYcl9Lc7LDazSRoB5vi9BKUgGsSsf4u94M3Bw2zT8dxfJVuSLGR0Hjgnsslf3XU71aU5BVBMrFgjHc390Z4ZBPCApOVxShdADvwPA9hO9kwrM1lTGuSOfQc/Bo16fhAVJn9gQ3A6v1iuXevCGdDOVSO/fh+TIw178DuI4HkD2qz5/DGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0138.namprd12.prod.outlook.com (2603:10b6:0:51::34) by
 BY5PR12MB3921.namprd12.prod.outlook.com (2603:10b6:a03:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Tue, 17 Sep
 2019 06:31:55 +0000
Received: from BY2NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0138.outlook.office365.com
 (2603:10b6:0:51::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Tue, 17 Sep 2019 06:31:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT021.mail.protection.outlook.com (10.152.84.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Tue, 17 Sep 2019 06:31:54 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 17 Sep 2019 01:31:54 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] SWDEV-195825 drm/amd/amdgpu:[Gibraltar][V320] tdr-1 test
 failed after 2 rounds
Date: Tue, 17 Sep 2019 14:31:45 +0800
Message-ID: <1568701906-31759-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(428003)(199004)(189003)(14444005)(36756003)(86362001)(70586007)(16586007)(50466002)(50226002)(81156014)(8676002)(81166006)(8936002)(5660300002)(316002)(478600001)(70206006)(2906002)(47776003)(51416003)(126002)(6916009)(356004)(2351001)(6666004)(305945005)(186003)(486006)(26005)(7696005)(476003)(48376002)(4326008)(2616005)(426003)(336012)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dcf1893-2844-4ca9-06d9-08d73b38bbbe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB3921; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3921:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3921A4C23258D83309F309DCEF8F0@BY5PR12MB3921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 01630974C0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: n/dWkqdMJtXm9Y68uOFZp8SaNpKvnuPD33fDuN3pfR3EQEBJOoGN6rDYIvjNv4dToVsT4aZOt6GVgHtcVO0VF6qVTfuPg2043p5rIs7lRyDz/mqIjvDomeR7anNU6BM7jWlPh2TCltE4kYbb/zzlXxJbYu9L2E6dxVyt7QmqbKRjgb2UHLpAsNDfD1whzCz1HAcLx+b2ObmbYJ/I2b88LKCC42ilmIuI62dRPgDAPJn+Yo8Wu1ZV84XG7H5Cvj36bTvTYnwK23qgWkxmHJXWBRNLua9ydWXpv7kJMAo5O3rEBTSnzpUEQb93kZIPc3xoGGsavcHWMao/XwQzffiRLU0HhG9hVUjSVc1a/L7mgzGJP2EP2/U29cTNa14cYQIvuUI8JsPJgzqL/CaBpTMqVi8qIep9MOj5WleEy5OKLHo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2019 06:31:54.8609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcf1893-2844-4ca9-06d9-08d73b38bbbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6enBCz0AOcBuUXTJ66XKUUk1FJo5rQul0wZq1KVkF98=;
 b=kppJ3XO7fRFRRbMTedlZUBW/N0LyBSrzXpBQo51Teapuu3NV894gskKjm1gU0eYuBzZWJGyIUxAP+hpCPFoc9XVo8FGlH47BZclfHtgnpO9jvnoecpNdZignbwqmp4VqLBF2Y8ycnFmO1DRxTq26u4Vt3pSIovXN9kXP/zl480I=
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

SXNzdWU6CnF1YXJrIGRpZG4ndCB0cmlnZ2VyIFREUiBjb3JyZWN0bHkgb24gY29tcHV0ZSByaW5n
CgpSb290IGNhdXNlOgpEZWZhdWx0IHRpbWVvdXQgdmFsdWUgZm9yIGNvbXB1dGUgcmluZyBpcyBp
bmZpbml0ZQoKU29sdXRpb246CkluIFNSLUlPViBhbmQgcGFzc3Rocm91Z2ggbW9kZSwgaWYgY29t
cHV0ZSByaW5nIHRpbWVvdXQKaXMgc2V0LCB0aGVuIHVzZSB1c2VyIHNldCB2YWx1ZTsgaWYgbm90
IHNldCwgdGhlbiB1c2UKc2FtZSB2YWx1ZSBhcyBnZnggcmluZyB0aW1lb3V0LgoKU2lnbmVkLW9m
Zi1ieTogSmVzc2UgWmhhbmcgPHpoZXhpLnpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggN2M3ZTlm
NS4uNDE1NWNjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC02ODcsNiArNjg3
LDE2IEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCWFkZXYtPnJldl9pZCA9IHNvYzE1X2dldF9yZXZfaWQoYWRldik7CiAJYWRldi0+bmJpby5m
dW5jcy0+ZGV0ZWN0X2h3X3ZpcnQoYWRldik7CiAKKwkvKgorCSAqIElmIHJ1bm5pbmcgdW5kZXIg
U1ItSU9WIG9yIHBhc3N0aHJvdWdoIG1vZGUgYW5kIHVzZXIgZGlkIG5vdCBzZXQKKwkgKiBjdXN0
b20gdmFsdWUgZm9yIGNvbXB1dGUgcmluZyB0aW1lb3V0LCBzZXQgdGltZW91dCB0byBiZSB0aGUg
c2FtZQorCSAqIGFzIGdmeCByaW5nIHRpbWVvdXQgdG8gYXZvaWQgY29tcHV0ZSByaW5nIGNhbm5v
dCBkZXRlY3QgYW4gdHJ1ZQorCSAqIGhhbmcuCisJICovCisJaWYgKChhbWRncHVfc3Jpb3ZfdmYo
YWRldikgfHwgYW1kZ3B1X3Bhc3N0aHJvdWdoKGFkZXYpKSAmJgorCQlhZGV2LT5jb21wdXRlX3Rp
bWVvdXQgPT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQpCisJCWFkZXYtPmNvbXB1dGVfdGltZW91dCA9
IGFkZXYtPmdmeF90aW1lb3V0OworCiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJYWRl
di0+dmlydC5vcHMgPSAmeGdwdV9haV92aXJ0X29wczsKIAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
