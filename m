Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B708FA955F
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 23:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDE889C80;
	Wed,  4 Sep 2019 21:43:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770083.outbound.protection.outlook.com [40.107.77.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9526289C80
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 21:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Le4PqROnzTolD1LOvJadnzjoQrClL3/U1rkyGfmI+6Q0HpG9avNGeBIu6iqSXrSJxHC1d1dTJoFR9dx1adi/OW0Bx3LMitLHMsjbKfI7RLZ15XYvzdIs7TyfSUrZ8TPrhrQdxLTlE83y4UI4AgIQWSqhjCnGJJzGrOGg3FMfvYxmX05s4PLdSDV1AI9T8uuvr62HEJvf0i8E6/46nH/us6dTPfdGDfq/JXi8MX6ex0dEEZdq7COMhVlolWr0LcBa7QN0ddd3TFfJ5AafruZ7RQ0zYJJJehRB+9ReGV5ZCtkFl/R4fo5xpKsTxoATBlc9B5jM9YdoMygejxfI84ZfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nukhtr7fKZH7nvsOkc6srdHj5M1V9Ym9/usiyKHPBh4=;
 b=FUC5B2xRWNQiIiPSiWrYBnxZSNny9vy86FIlEpcwc9JHFGY3YrWjmVf14f2YvbkMJ51+XYzYtiWtJPtMGIBoBtqr5sgtuMVD0HRugZloy0OMlR28EH5j0JBFoDLweLLeEecVJW6Nl/Oy0++ySXrYFAmbx6GELSaq0zvZWhf782fd3PLtM1tpUwdYS51CJJpktNogLiHPVnmqNslAXyVmq3Wp6Fu3f4chOgVSlRF3tPpx5/3cXQw3svWLgixdlv7tP0ES+vcVpPtkVJITNixCWEmFCK/Q/HWgTDo8zQLEqwOdtGo9b/Kzuk+fO1+Rg2wLITRCCgW7ZK6xhCjTOENNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0130.namprd12.prod.outlook.com (2603:10b6:0:51::26) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 4 Sep 2019 21:43:31 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM3PR12CA0130.outlook.office365.com
 (2603:10b6:0:51::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Wed, 4 Sep 2019 21:43:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Wed, 4 Sep 2019 21:43:31 +0000
Received: from roma-lnx-dev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 4 Sep 2019
 16:43:30 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Add stereo mux and dig programming calls for
 dcn21
Date: Wed, 4 Sep 2019 17:43:12 -0400
Message-ID: <1567633392-26602-1-git-send-email-Roman.Li@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(48376002)(47776003)(50466002)(70206006)(356004)(70586007)(36756003)(486006)(5660300002)(2616005)(476003)(126002)(426003)(336012)(478600001)(14444005)(186003)(6666004)(316002)(16586007)(81156014)(81166006)(7696005)(305945005)(53936002)(53416004)(50226002)(8936002)(2906002)(2876002)(8676002)(54906003)(86362001)(2351001)(26005)(4326008)(6916009)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4198; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4942de04-164c-4d74-f66d-08d73180edff
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB4198; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB4198:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4198DB0F40CE4ED8FD3502A589B80@CH2PR12MB4198.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-Forefront-PRVS: 0150F3F97D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eqX1NK2WqvrWQQo/jiWaFkqUeMU902nCxYEnGRcEm5tZ/UQfu5jBK2dMgFz70i2TnHZMP0K6M6l66TIR9TeMnUpQfRG70HRtTbArTPw8JA+i0zf4QujZwaGyz+uOkk/LerM2o63vbxAGC/FMe+Utw85zil+K1V3f2ZBOLv8bgIEjkLKfV7+thKbSaXzNhPT5/MWxjkEXkJMeeos55vLd5FZ7dtkcAt1YI+fd435Z7JFgXmElVUo61a1tOQ1o8SQW2JwlL6Upzl3JOCJjmfiQgWQftb3ozapE88yhfdwvsi7rlPhXMb6Bn7lwkEM8VdxxNIo7ne6s7UDaBOKKnNQAU1oNT3zLnlIOX7WPRPrXn0i34/Rm1q+VFV1dNmUaaLo1Qug26KRPUVp7zc2Cnw0GVgH0V/93TvzbF17GO7kUY5g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2019 21:43:31.2752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4942de04-164c-4d74-f66d-08d73180edff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nukhtr7fKZH7nvsOkc6srdHj5M1V9Ym9/usiyKHPBh4=;
 b=x2H0Qe2aHqHTINlWMWiOm/TGiDozPZH6nkFLsVc9srW7eYdG3D1T94mrCa5fSvk3aOR3mtkYtvG2XXkzmTEhi+3IBxIf6yMBij4Hr3lXig6Q7gOAxt/Zly74pH9wy5M8tssy5RPpgS6gcapGk/OoNm3xmda5/Mvj94C4RHBe3NA=
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
Cc: harry.wentland@amd.com, Aaron.Liu@amd.com, Roman Li <Roman.Li@amd.com>,
 Ray.Huang@amd.com, Alexander.Deucher@amd.com, Bhawanpreet.Lakha@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpbV2h5XQpUaGUgZWFybGllciBwYXRj
aCAiSG9vayB1cCBjYWxscyB0byBkbyBzdGVyZW8gbXV4IGFuZCBkaWcgcHJvZ3JhbW1pbmcuLi4i
CmRvZXNuJ3QgaW5jbHVkZSB1cGRhdGUgZm9yIGRjbjIxLgoKW0hvd10KQWxpZ24gZGNuMjEgZ3Bp
byBzZXR0aW5ncyB3aXRoIHVwZGF0ZWQgc3RlcmVvIGNvbnRyb2wgaW50ZXJmYWNlLgoKU2lnbmVk
LW9mZi1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5
L2RjL2dwaW8vZGNuMjEvaHdfZmFjdG9yeV9kY24yMS5jICAgfCAzOCArKysrKysrKysrKysrKysr
KysrKy0tCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kY24yMS9od190cmFuc2xhdGVfZGNuMjEu
YyB8ICAzICstCiAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNu
MjEvaHdfZmFjdG9yeV9kY24yMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dw
aW8vZGNuMjEvaHdfZmFjdG9yeV9kY24yMS5jCmluZGV4IDM0NDg1ZDkuLjg1NzI2NzggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIxL2h3X2ZhY3Rv
cnlfZGNuMjEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kY24y
MS9od19mYWN0b3J5X2RjbjIxLmMKQEAgLTM1LDEyICszNSwxMCBAQAogCiAjaW5jbHVkZSAiaHdf
ZmFjdG9yeV9kY24yMS5oIgogCi0KICNpbmNsdWRlICJkY24vZGNuXzJfMV8wX29mZnNldC5oIgog
I2luY2x1ZGUgImRjbi9kY25fMl8xXzBfc2hfbWFzay5oIgogI2luY2x1ZGUgInJlbm9pcl9pcF9v
ZmZzZXQuaCIKIAotCiAjaW5jbHVkZSAicmVnX2hlbHBlci5oIgogI2luY2x1ZGUgIi4uL2hwZF9y
ZWdzLmgiCiAvKiBiZWdpbiAqKioqKioqKioqKioqKioqKioqKioKQEAgLTEzNiw2ICsxMzQsMzkg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZGNfc2hfbWFzayBkZGNfbWFza1tdID0gewogCUREQ19N
QVNLX1NIX0xJU1RfRENOMihfTUFTSywgNikKIH07CiAKKyNpbmNsdWRlICIuLi9nZW5lcmljX3Jl
Z3MuaCIKKworLyogc2V0IGZpZWxkIG5hbWUgKi8KKyNkZWZpbmUgU0ZfR0VORVJJQyhyZWdfbmFt
ZSwgZmllbGRfbmFtZSwgcG9zdF9maXgpXAorCS5maWVsZF9uYW1lID0gcmVnX25hbWUgIyMgX18g
IyMgZmllbGRfbmFtZSAjIyBwb3N0X2ZpeAorCisjZGVmaW5lIGdlbmVyaWNfcmVncyhpZCkgXAor
e1wKKwlHRU5FUklDX1JFR19MSVNUKGlkKVwKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBnZW5l
cmljX3JlZ2lzdGVycyBnZW5lcmljX3JlZ3NbXSA9IHsKKwlnZW5lcmljX3JlZ3MoQSksCit9Owor
CitzdGF0aWMgY29uc3Qgc3RydWN0IGdlbmVyaWNfc2hfbWFzayBnZW5lcmljX3NoaWZ0W10gPSB7
CisJR0VORVJJQ19NQVNLX1NIX0xJU1QoX19TSElGVCwgQSksCit9OworCitzdGF0aWMgY29uc3Qg
c3RydWN0IGdlbmVyaWNfc2hfbWFzayBnZW5lcmljX21hc2tbXSA9IHsKKwlHRU5FUklDX01BU0tf
U0hfTElTVChfTUFTSywgQSksCit9OworCitzdGF0aWMgdm9pZCBkZWZpbmVfZ2VuZXJpY19yZWdp
c3RlcnMoc3RydWN0IGh3X2dwaW9fcGluICpwaW4sIHVpbnQzMl90IGVuKQoreworCXN0cnVjdCBo
d19nZW5lcmljICpnZW5lcmljID0gSFdfR0VORVJJQ19GUk9NX0JBU0UocGluKTsKKworCWdlbmVy
aWMtPnJlZ3MgPSAmZ2VuZXJpY19yZWdzW2VuXTsKKwlnZW5lcmljLT5zaGlmdHMgPSAmZ2VuZXJp
Y19zaGlmdFtlbl07CisJZ2VuZXJpYy0+bWFza3MgPSAmZ2VuZXJpY19tYXNrW2VuXTsKKwlnZW5l
cmljLT5iYXNlLnJlZ3MgPSAmZ2VuZXJpY19yZWdzW2VuXS5ncGlvOworfQorCiBzdGF0aWMgdm9p
ZCBkZWZpbmVfZGRjX3JlZ2lzdGVycygKIAkJc3RydWN0IGh3X2dwaW9fcGluICpwaW4sCiAJCXVp
bnQzMl90IGVuKQpAQCAtMTgxLDcgKzIxMiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHdfZmFj
dG9yeV9mdW5jcyBmdW5jcyA9IHsKIAkuZ2V0X2hwZF9waW4gPSBkYWxfaHdfaHBkX2dldF9waW4s
CiAJLmdldF9nZW5lcmljX3BpbiA9IGRhbF9od19nZW5lcmljX2dldF9waW4sCiAJLmRlZmluZV9o
cGRfcmVnaXN0ZXJzID0gZGVmaW5lX2hwZF9yZWdpc3RlcnMsCi0JLmRlZmluZV9kZGNfcmVnaXN0
ZXJzID0gZGVmaW5lX2RkY19yZWdpc3RlcnMKKwkuZGVmaW5lX2RkY19yZWdpc3RlcnMgPSBkZWZp
bmVfZGRjX3JlZ2lzdGVycywKKwkuZGVmaW5lX2dlbmVyaWNfcmVnaXN0ZXJzID0gZGVmaW5lX2dl
bmVyaWNfcmVnaXN0ZXJzCiB9OwogLyoKICAqIGRhbF9od19mYWN0b3J5X2RjbjEwX2luaXQKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIxL2h3X3Ry
YW5zbGF0ZV9kY24yMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNu
MjEvaHdfdHJhbnNsYXRlX2RjbjIxLmMKaW5kZXggYWQ3YzQzNy4uZmJiNThmYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNuMjEvaHdfdHJhbnNsYXRl
X2RjbjIxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZGNuMjEv
aHdfdHJhbnNsYXRlX2RjbjIxLmMKQEAgLTU4LDcgKzU4LDYgQEAKICNkZWZpbmUgU0ZfSFBEKHJl
Z19uYW1lLCBmaWVsZF9uYW1lLCBwb3N0X2ZpeClcCiAJLmZpZWxkX25hbWUgPSByZWdfbmFtZSAj
IyBfXyAjIyBmaWVsZF9uYW1lICMjIHBvc3RfZml4CiAKLQogLyogbWFjcm9zIHRvIGV4cGVuZCBy
ZWdpc3RlciBsaXN0IG1hY3JvIGRlZmluZWQgaW4gSFcgb2JqZWN0IGhlYWRlciBmaWxlCiAgKiBl
bmQgKioqKioqKioqKioqKioqKioqKioqLwogCkBAIC03MSw3ICs3MCw3IEBAIHN0YXRpYyBib29s
IG9mZnNldF90b19pZCgKIHsKIAlzd2l0Y2ggKG9mZnNldCkgewogCS8qIEdFTkVSSUMgKi8KLQlj
YXNlIFJFRyhEQ19HRU5FUklDQSk6CisJY2FzZSBSRUcoRENfR1BJT19HRU5FUklDX0EpOgogCQkq
aWQgPSBHUElPX0lEX0dFTkVSSUM7CiAJCXN3aXRjaCAobWFzaykgewogCQljYXNlIERDX0dQSU9f
R0VORVJJQ19BX19EQ19HUElPX0dFTkVSSUNBX0FfTUFTSzoKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
