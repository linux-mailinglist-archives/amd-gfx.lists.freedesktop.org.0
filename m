Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A496AF16C
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA1F6E959;
	Tue, 10 Sep 2019 19:04:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41D6E95A
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXM6t1VfCqRwjtR3BPcGdachw9hamaLeHKU97b3ExbQBUxDZiBtXVRDqtBRl38ZBOqS3WZnAP+wgdNOEyAc0mzLqJD4nlhzhNEpTzu2FcEHYh4X4fQtnzlni7XY6afoR3McM2hHsl6aDYu2O29yzPV+8lmQPDN2AzIentAbArBYqOUufzqUc56tcltCDPgt7qacQZLw8jJ7AOF/My7jzFNe/nYR/iN2Jwm0qWrVNa/zUQqzAsi0t+JWklsOXyc52kyrB8t8Bh8HXzG6kwLBEP1S+2wfV0MiVNV2KWEjukbJUekGE7jtDXPlwid2IykcQ0gQLy1dfbs3xAJ/kbTGsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoCaeV1HKuxsTXOAR4D3YCr4yTMmh0LI1WlYJMJUK0g=;
 b=FjeCO6YJjnPFUhR8UwXw9iLWOj7f84L3n4JiJ/r5q8xKp4N/hBhotmt9so9kR4Wsn8Pu+F30Yqie/RJatAySpkfX3bNGqTkFzLKu1VepCStEjR1Tnl5bepHaeb34cUIPh094zJYDOypMB3gLnxm0ssf1CmtWOmicxQFV69MmIlkzRhs39tSVcEAhOaKtsf32cjaV1cmHpMSfiAQIZfHe614vNuaQHG0krHvGHaYCoidImBcw/3OyXzDQdsuM4dSNqdSJ1vh6BgbGGj/GMbZGWdmTZjowbjaXoePmcIzOxkF4MoHsiUM9lCGLPiPNW0zC9zCAUEGMq8e4UdrApThOHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0004.namprd12.prod.outlook.com (2603:10b6:403:2::14)
 by DM6PR12MB3467.namprd12.prod.outlook.com (2603:10b6:5:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:04:38 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN4PR12CA0004.outlook.office365.com
 (2603:10b6:403:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:38 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:34 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/20] drm/amd/display: Initialize HDCP work queue
Date: Tue, 10 Sep 2019 15:04:17 -0400
Message-ID: <20190910190422.794-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(70586007)(8676002)(4326008)(81156014)(1076003)(478600001)(2906002)(76176011)(86362001)(7696005)(5660300002)(11346002)(6666004)(47776003)(70206006)(336012)(8936002)(53936002)(126002)(51416003)(48376002)(81166006)(356004)(36756003)(50226002)(2351001)(426003)(6916009)(53416004)(186003)(50466002)(305945005)(446003)(26005)(14444005)(316002)(2616005)(16586007)(476003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3467; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 731159e2-cd89-4985-09cf-08d73621ba71
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB3467; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3467:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3467E8EFECBC288DC0723032F9B60@DM6PR12MB3467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Uf1lYfJPTPFxzcZnEGk9swaMangrgEHM7tb4gVUzs0vvaou8SyqF9AnFH0nNFymnhGQmEq7J1Yx2TJBBfz7luR/mkRzIrwl3gh396XXMgQvL8niU2P/NjHG5muTL0buEKJvbUGT54mQf3tuPXCj/sKbuYMz+0Ywt08LdLhYDND2niBsJxvMDYi3MB+AE2vloxD9oH8cg80Ht+slZ5im6n0XpITIkF8hGCYI+fqJEqxOvbBh7Z6plILUcgPj2tcv98JjH37fY+lyKbVAMzmcC70UFvZiYp8AEPa14eu8xMrr2mkOWPLzxKRhy2eVf0mcuzwWcCyBQNTwpKeCZzF+1nzhS+svbE7YHG8rro+tt7Hnr9L4m+eQTxT4tt8Q4lz/KB1MU/jMaV8XJFr6IJuzWSfv6TCpmvdwQyt2v7ekmTHg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:38.3894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 731159e2-cd89-4985-09cf-08d73621ba71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoCaeV1HKuxsTXOAR4D3YCr4yTMmh0LI1WlYJMJUK0g=;
 b=Yl2Tym7KeGd80JJvGrmqDC6Fq4bTY452JJlPy1vh33JjElr+sIMuUxDAJuNXQ68x0POTLHLuBwOoJb1qoow3M+Iw2RrMkB55tIYJ2ZBTMrA9ulhXcGsH2XWovxaqDrt23k2Az3HMI2CueRMKo+ZVnuEIFG7q3MnWrFcT5Lc53H4=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgbmVlZCB0aGlzIHRvIGVuYWJsZSBIRENQIG9uIGxpbnV4LCBhcyB3ZSBuZWVkIGV2
ZW50cyB0byBpbnRlcmFjdAp3aXRoIHRoZSBoZGNwIG1vZHVsZQoKW0hvd10KQWRkIHdvcmsgcXVl
dWUgdG8gZGlzcGxheSBtYW5hZ2VyIGFuZCBoYW5kbGUgdGhlIGNyZWF0aW9uIGFuZCBkZXN0cnVj
dGlvbgpvZiB0aGUgcXVldWUKClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgIDMgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCmluZGV4IGMxMDMxMTIxZWU4YS4uMmNjOTVhYjBiNjQ1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAg
LTM3LDYgKzM3LDkgQEAKICNpbmNsdWRlICJhbWRncHVfdWNvZGUuaCIKICNpbmNsdWRlICJhdG9t
LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERD
UAorI2luY2x1ZGUgImFtZGdwdV9kbV9oZGNwLmgiCisjZW5kaWYKICNpbmNsdWRlICJhbWRncHVf
cG0uaCIKIAogI2luY2x1ZGUgImFtZF9zaGFyZWQuaCIKQEAgLTY0NCwxMSArNjQ3LDE4IEBAIHZv
aWQgYW1kZ3B1X2RtX2F1ZGlvX2VsZF9ub3RpZnkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IGludCBwaW4pCiBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogewogCXN0cnVjdCBkY19pbml0X2RhdGEgaW5pdF9kYXRhOworI2lmZGVmIENPTkZJ
R19EUk1fQU1EX0RDX0hEQ1AKKwlzdHJ1Y3QgZGNfY2FsbGJhY2tfaW5pdCBpbml0X3BhcmFtczsK
KyNlbmRpZgorCiAJYWRldi0+ZG0uZGRldiA9IGFkZXYtPmRkZXY7CiAJYWRldi0+ZG0uYWRldiA9
IGFkZXY7CiAKIAkvKiBaZXJvIGFsbCB0aGUgZmllbGRzICovCiAJbWVtc2V0KCZpbml0X2RhdGEs
IDAsIHNpemVvZihpbml0X2RhdGEpKTsKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCisJ
bWVtc2V0KCZpbml0X3BhcmFtcywgMCwgc2l6ZW9mKGluaXRfcGFyYW1zKSk7CisjZW5kaWYKIAog
CW11dGV4X2luaXQoJmFkZXYtPmRtLmRjX2xvY2spOwogCW11dGV4X2luaXQoJmFkZXYtPmRtLmF1
ZGlvX2xvY2spOwpAQCAtNzIxLDYgKzczMSwxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJYW1kZ3B1X2RtX2luaXRfY29sb3JfbW9k
KCk7CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCisJYWRldi0+ZG0uaGRjcF93b3Jr
cXVldWUgPSBoZGNwX2NyZWF0ZV93b3JrcXVldWUoJmFkZXYtPnBzcCwgJmluaXRfcGFyYW1zLmNw
X3BzcCwgYWRldi0+ZG0uZGMpOworCisJaWYgKCFhZGV2LT5kbS5oZGNwX3dvcmtxdWV1ZSkKKwkJ
RFJNX0VSUk9SKCJhbWRncHU6IGZhaWxlZCB0byBpbml0aWFsaXplIGhkY3Bfd29ya3F1ZXVlLlxu
Iik7CisJZWxzZQorCQlEUk1fREVCVUdfRFJJVkVSKCJhbWRncHU6IGhkY3Bfd29ya3F1ZXVlIGlu
aXQgZG9uZSAlcC5cbiIsIGFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlKTsKKworCWRjX2luaXRfY2Fs
bGJhY2tzKGFkZXYtPmRtLmRjLCAmaW5pdF9wYXJhbXMpOworI2VuZGlmCiAJaWYgKGFtZGdwdV9k
bV9pbml0aWFsaXplX2RybV9kZXZpY2UoYWRldikpIHsKIAkJRFJNX0VSUk9SKAogCQkiYW1kZ3B1
OiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBzdyBmb3IgZGlzcGxheSBzdXBwb3J0LlxuIik7CkBAIC03
NjIsNiArNzgyLDE2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9maW5pKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCiAJYW1kZ3B1X2RtX2Rlc3Ryb3lfZHJtX2RldmljZSgmYWRldi0+ZG0p
OwogCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERDUAorCWlmIChhZGV2LT5kbS5oZGNwX3dv
cmtxdWV1ZSkgeworCQloZGNwX2Rlc3Ryb3koYWRldi0+ZG0uaGRjcF93b3JrcXVldWUpOworCQlh
ZGV2LT5kbS5oZGNwX3dvcmtxdWV1ZSA9IE5VTEw7CisJfQorCisJaWYgKGFkZXYtPmRtLmRjKQor
CQlkY19kZWluaXRfY2FsbGJhY2tzKGFkZXYtPmRtLmRjKTsKKyNlbmRpZgorCiAJLyogREMgRGVz
dHJveSBUT0RPOiBSZXBsYWNlIGRlc3Ryb3kgREFMICovCiAJaWYgKGFkZXYtPmRtLmRjKQogCQlk
Y19kZXN0cm95KCZhZGV2LT5kbS5kYyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAppbmRleCBjYmQ2NjA4ZjU4ZTYuLjdhMzRlY2ExMmRh
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5oCkBAIC0yMjIsNiArMjIyLDkgQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIg
ewogCXN0cnVjdCBhbWRncHVfZG1fYmFja2xpZ2h0X2NhcHMgYmFja2xpZ2h0X2NhcHM7CiAKIAlz
dHJ1Y3QgbW9kX2ZyZWVzeW5jICpmcmVlc3luY19tb2R1bGU7CisjaWZkZWYgQ09ORklHX0RSTV9B
TURfRENfSERDUAorCXN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3JrcXVldWU7CisjZW5k
aWYKIAogCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpjYWNoZWRfc3RhdGU7CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
